-- functions for bitmap indices using PostgreSQL's built-in BIT type

CREATE FUNCTION sig_resize( sig VARBIT, bits INT ) RETURNS VARBIT AS $$
DECLARE
  len INT;
BEGIN
  len := length(sig);
  IF bits > len THEN
    RETURN sig || repeat('0', bits - len)::VARBIT;
  ELSIF bits < len THEN
    RETURN substring(sig FROM 1 FOR bits);
  END IF;
  RETURN sig;
END $$ LANGUAGE plpgsql STRICT IMMUTABLE;

CREATE FUNCTION sig_set( sig VARBIT, pos INT, val INT) RETURNS VARBIT AS $$
DECLARE
  len INT;
BEGIN
  len := length(sig);
  IF pos >= len THEN
    IF val > 0 THEN
      RETURN set_bit(sig_resize(sig, pos+1), pos, 1);
    ELSE
      RETURN sig;
    END IF;
  ELSE
    RETURN set_bit(sig, pos, val);
  END IF;
END $$ LANGUAGE plpgsql STRICT IMMUTABLE;

CREATE FUNCTION sig_set( sig VARBIT, pos INT) RETURNS VARBIT AS $$
BEGIN
  RETURN sig_set(sig, pos, 1);
END $$ LANGUAGE plpgsql STRICT IMMUTABLE;

CREATE FUNCTION sig_get( sig VARBIT, pos INT ) RETURNS INT AS $$
DECLARE
  len INT;
BEGIN
  len := length(sig);
  IF pos >= len THEN
    RETURN 0;
  ELSE
    RETURN get_bit(sig, pos);
  END IF;
END $$ LANGUAGE plpgsql STRICT IMMUTABLE;

CREATE FUNCTION sig_length( sig VARBIT ) RETURNS INT AS $$
BEGIN
  RETURN length(sig);
END $$ LANGUAGE plpgsql STRICT IMMUTABLE;

CREATE FUNCTION sig_min( sig VARBIT ) RETURNS INT AS $$
BEGIN
  RETURN position('1' in sig) - 1;
END $$ LANGUAGE plpgsql STRICT IMMUTABLE;

CREATE FUNCTION sig_and( sig1 VARBIT, sig2 VARBIT ) RETURNS VARBIT AS $$
DECLARE
  len INT;
BEGIN
  len := GREATEST(length(sig1), length(sig2));
  RETURN bitand(sig_resize(sig1, len), sig_resize(sig2, len)) ;
END $$ LANGUAGE plpgsql STRICT IMMUTABLE;

CREATE FUNCTION sig_or( sig1 VARBIT, sig2 VARBIT ) RETURNS VARBIT AS $$
DECLARE
  len INT;
BEGIN
  len := GREATEST(length(sig1), length(sig2));
  RETURN bitor(sig_resize(sig1, len), sig_resize(sig2, len)) ;
END $$ LANGUAGE plpgsql STRICT IMMUTABLE;

CREATE FUNCTION sig_xor( sig1 VARBIT, sig2 VARBIT ) RETURNS VARBIT AS $$
DECLARE
  len INT;
BEGIN
  len := GREATEST(length(sig1), length(sig2));
  RETURN bitxor(sig_resize(sig1, len), sig_resize(sig2, len)) ;
END $$ LANGUAGE plpgsql STRICT IMMUTABLE;

CREATE FUNCTION count( sig VARBIT ) RETURNS INT AS $$
BEGIN
  -- This is, by any measure, horrific. However, it's the only performant way to get PostgreSQL
  -- to count the number of set bits in a bit string.
  RETURN length(replace(sig::TEXT, '0', ''));
END $$ LANGUAGE plpgsql STRICT IMMUTABLE;

CREATE FUNCTION contains( sig VARBIT, pos INT ) RETURNS BOOL AS $$
BEGIN
  RETURN sig_get(sig, pos) = 1;
END $$ LANGUAGE plpgsql STRICT IMMUTABLE;

CREATE FUNCTION members( sig VARBIT ) RETURNS SETOF INT AS $$
BEGIN
  FOR i IN 0 .. length(sig) - 1 LOOP
    IF contains(sig, i) THEN
      RETURN NEXT i;
    END IF;
  END LOOP;
END $$ LANGUAGE plpgsql STRICT IMMUTABLE;


-- operators for faceting

CREATE OPERATOR & (
    leftarg = VARBIT,
    rightarg = VARBIT,
    procedure = sig_and,
    commutator = &
);

CREATE OPERATOR | (
    leftarg = VARBIT,
    rightarg = VARBIT,
    procedure = sig_or,
    commutator = |
);

CREATE OPERATOR + (
    leftarg = VARBIT,
    rightarg = int,
    procedure = sig_set
);


-- aggregate functions for faceting

CREATE AGGREGATE collect( VARBIT )
(
	sfunc = sig_or,
	stype = VARBIT
);

CREATE AGGREGATE filter( VARBIT )
(
   sfunc = sig_and,
   stype = VARBIT
);

CREATE AGGREGATE signature( INT )
(
	sfunc = sig_set,
  stype = VARBIT,
  initcond = '0'
);

-- TODO. code is shared with bit.sql implementation. avoid reduplication while maintaining
-- postgres extension compatibility.


-- utility functions for maintaining facet indices

-- Utility function to drop and recreate a table, given an sql select statement
--
CREATE FUNCTION recreate_table(tbl TEXT, select_expr TEXT) RETURNS VOID AS $$
BEGIN
  SET client_min_messages = warning;
  EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(tbl);
  EXECUTE 'CREATE TABLE ' || quote_ident(tbl) || ' AS ' || select_expr;
  RESET client_min_messages;
END;
$$ LANGUAGE plpgsql;

-- Utility function to add or update a packed id column on a table
-- 
-- If provided, the threshold indicates a percentage of acceptable wastage or "scatter" 
-- in the ids, which keeps the packing algorithm from running until absolutely needed.
-- 
-- Because ids only become scattered when model rows are deleted, this means repacking
-- will occur very infrequently.  The default threshold is 15%.
--
CREATE FUNCTION renumber_table(tbl TEXT, col TEXT) RETURNS BOOLEAN AS $$
BEGIN
  RETURN renumber_table(tbl, col, 0.15);
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION renumber_table(tbl TEXT, col TEXT, threshold REAL) RETURNS BOOLEAN AS $$
DECLARE
  seq TEXT;
  wastage REAL;
  renumber BOOLEAN;
BEGIN
  seq = tbl || '_' || col || '_seq';

  -- Drop numbered column if it already exists
  SET client_min_messages = 'WARNING';
  BEGIN
    IF signature_wastage(tbl, col) <= threshold THEN
      renumber := false;
    ELSE
      renumber := true;
      EXECUTE 'DROP INDEX IF EXISTS ' || quote_ident(tbl || '_' || col || '_ndx');
      EXECUTE 'ALTER TABLE ' || quote_ident(tbl) || ' DROP COLUMN ' || quote_ident(col);
      EXECUTE 'DROP SEQUENCE IF EXISTS ' || quote_ident(seq);
    END IF;
  EXCEPTION
    WHEN undefined_column THEN renumber := true;
  END;
  RESET client_min_messages;

  --  Create numbered column & its index
  IF renumber THEN
    EXECUTE 'CREATE SEQUENCE ' || quote_ident(seq) || ' MINVALUE 0 ';
    EXECUTE 'ALTER TABLE ' || quote_ident(tbl) || ' ADD COLUMN ' || quote_ident(col) || ' INT4 DEFAULT nextval(''' || quote_ident(seq) || ''')';
    EXECUTE 'ALTER SEQUENCE ' || quote_ident(seq) || ' OWNED BY ' || quote_ident(tbl) || '.' || quote_ident(col);
    EXECUTE 'CREATE INDEX ' || quote_ident(tbl || '_' || col || '_ndx') || ' ON ' || quote_ident(tbl) || '(' || col || ')';
  END IF;

  RETURN renumber;
END;
$$ LANGUAGE plpgsql;


-- Utility function to measure how many bits from a loosely-packed id column would be wasted,
-- if they were all collected into a bitset signature. Returns a float between 0 (no waste) 
-- and 1.0 (all waste).
--
CREATE FUNCTION signature_wastage(tbl TEXT, col TEXT) RETURNS REAL AS $$
DECLARE
  max REAL;
  count REAL;
BEGIN
  EXECUTE 'SELECT count(*) FROM ' || quote_ident(tbl)
          INTO count;
  EXECUTE 'SELECT max(' || quote_ident(col) || ') FROM ' || quote_ident(tbl)
          INTO max;
  RETURN 1.0 - (count / (COALESCE(max, 0) + 1));
END;
$$ LANGUAGE plpgsql;


-- Utility function to identify columns for a nested facet index
--
CREATE FUNCTION nest_levels(tbl TEXT) RETURNS SETOF TEXT AS $$
  SELECT quote_ident(a.attname::TEXT)
    FROM pg_attribute a LEFT JOIN pg_attrdef d ON a.attrelid = d.adrelid AND a.attnum = d.adnum
    WHERE a.attrelid = $1::regclass
      AND NOT a.attname IN ('signature', 'level')
      AND a.attnum > 0 AND NOT a.attisdropped
    ORDER BY a.attnum;
$$ LANGUAGE sql;


--Utility function to expand nesting in facet indices
--
-- Initially a facet index will include only leaves of the
-- nesting tree.  This function adds all interior nodes
-- with their respective aggregate signatures, and adds a
-- postgresql index to the nested facet value.
--
-- e.g. given the nested facet values
--  {USA,Florida}  '10'
--  {USA,Iowa}     '01'
--
-- the function interpolates
--  {USA}          '11'
--
-- N.B. expand_nesting may only be called once on a table
--      it refuses to add internal node duplicates
--
CREATE FUNCTION expand_nesting(tbl TEXT) RETURNS VOID AS $$
DECLARE
  cols  TEXT[];
  len   INT;
  aggr  TEXT;
BEGIN
  -- determine column names
  SELECT array_agg(col) INTO cols FROM nest_levels(tbl) AS col;
  len := array_length(cols, 1);
  
  -- add unique index on facet value columns
  aggr := array_to_string(cols, ', ');
  EXECUTE 'CREATE UNIQUE INDEX ' || quote_ident(tbl) || '_ndx  ON ' || quote_ident(tbl) || '(' || aggr || ')';
    
  -- expand each level in turn
  FOR i IN REVERSE (len-1)..1 LOOP
    aggr := array_to_string(cols[1:i], ', ');
    EXECUTE 'INSERT INTO ' || quote_ident(tbl) || '(' || aggr || ', level, signature)'
         || ' SELECT ' || aggr || ', ' || i || ' AS level, collect(signature)'
         || ' FROM ' || quote_ident(tbl)
         || ' GROUP BY ' || aggr;
  END LOOP;
  
  -- root node
  EXECUTE 'INSERT INTO ' || quote_ident(tbl) || '(level, signature)'
       || ' SELECT 0 AS level, collect(signature) FROM ' || quote_ident(tbl);
END;
$$ LANGUAGE plpgsql;
