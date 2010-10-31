--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- Name: signature; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE signature;


--
-- Name: sig_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_in(cstring) RETURNS signature
    LANGUAGE c STRICT
    AS 'signature.so', 'sig_in';


--
-- Name: sig_out(signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_out(signature) RETURNS cstring
    LANGUAGE c STRICT
    AS 'signature.so', 'sig_out';


--
-- Name: signature; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE signature (
    INTERNALLENGTH = variable,
    INPUT = sig_in,
    OUTPUT = sig_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- Name: contains(signature, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION contains(signature, integer) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'contains';


--
-- Name: count(signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION count(signature) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'count';


--
-- Name: expand_nesting(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand_nesting(tbl text) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


--
-- Name: members(signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION members(signature) RETURNS SETOF integer
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'members';


--
-- Name: nest_levels(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nest_levels(tbl text) RETURNS SETOF text
    LANGUAGE sql
    AS $_$
  SELECT quote_ident(a.attname::TEXT)
    FROM pg_attribute a LEFT JOIN pg_attrdef d ON a.attrelid = d.adrelid AND a.attnum = d.adnum
    WHERE a.attrelid = $1::regclass
      AND NOT a.attname IN ('signature', 'level')
      AND a.attnum > 0 AND NOT a.attisdropped
    ORDER BY a.attnum;
$_$;


--
-- Name: recreate_table(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION recreate_table(tbl text, select_expr text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  SET client_min_messages = warning;
  EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(tbl);
  EXECUTE 'CREATE TABLE ' || quote_ident(tbl) || ' AS ' || select_expr;
  RESET client_min_messages;
END;
$$;


--
-- Name: renumber_table(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION renumber_table(tbl text, col text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN renumber_table(tbl, col, 0.15);
END;
$$;


--
-- Name: renumber_table(text, text, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION renumber_table(tbl text, col text, threshold real) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
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
$$;


--
-- Name: sig_and(signature, signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_and(signature, signature) RETURNS signature
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_and';


--
-- Name: sig_cmp(signature, signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_cmp(signature, signature) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_cmp';


--
-- Name: sig_eq(signature, signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_eq(signature, signature) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_eq';


--
-- Name: sig_get(signature, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_get(signature, integer) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_get';


--
-- Name: sig_gt(signature, signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_gt(signature, signature) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_gt';


--
-- Name: sig_gte(signature, signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_gte(signature, signature) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_gte';


--
-- Name: sig_length(signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_length(signature) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_length';


--
-- Name: sig_lt(signature, signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_lt(signature, signature) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_lt';


--
-- Name: sig_lte(signature, signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_lte(signature, signature) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_lte';


--
-- Name: sig_min(signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_min(signature) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_min';


--
-- Name: sig_or(signature, signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_or(signature, signature) RETURNS signature
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_or';


--
-- Name: sig_resize(signature, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_resize(signature, integer) RETURNS signature
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_resize';


--
-- Name: sig_set(signature, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_set(signature, integer, integer) RETURNS signature
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_set';


--
-- Name: sig_set(signature, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_set(signature, integer) RETURNS signature
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_set';


--
-- Name: sig_xor(signature); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sig_xor(signature) RETURNS signature
    LANGUAGE c IMMUTABLE STRICT
    AS 'signature.so', 'sig_xor';


--
-- Name: signature_wastage(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION signature_wastage(tbl text, col text) RETURNS real
    LANGUAGE plpgsql
    AS $$
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
$$;


--
-- Name: collect(signature); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE collect(signature) (
    SFUNC = sig_or,
    STYPE = signature
);


--
-- Name: filter(signature); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE filter(signature) (
    SFUNC = sig_and,
    STYPE = signature
);


--
-- Name: signature(integer); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE signature(integer) (
    SFUNC = public.sig_set,
    STYPE = signature,
    INITCOND = '0'
);


--
-- Name: &; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR & (
    PROCEDURE = sig_and,
    LEFTARG = signature,
    RIGHTARG = signature,
    COMMUTATOR = &
);


--
-- Name: +; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR + (
    PROCEDURE = sig_set,
    LEFTARG = signature,
    RIGHTARG = integer
);


--
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = sig_lt,
    LEFTARG = signature,
    RIGHTARG = signature,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = sig_lte,
    LEFTARG = signature,
    RIGHTARG = signature,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = sig_eq,
    LEFTARG = signature,
    RIGHTARG = signature,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = sig_gt,
    LEFTARG = signature,
    RIGHTARG = signature,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = sig_gte,
    LEFTARG = signature,
    RIGHTARG = signature,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- Name: |; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR | (
    PROCEDURE = sig_or,
    LEFTARG = signature,
    RIGHTARG = signature,
    COMMUTATOR = |
);


--
-- Name: signature_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS signature_ops
    DEFAULT FOR TYPE signature USING btree AS
    OPERATOR 1 <(signature,signature) ,
    OPERATOR 2 <=(signature,signature) ,
    OPERATOR 3 =(signature,signature) ,
    OPERATOR 4 >=(signature,signature) ,
    OPERATOR 5 >(signature,signature) ,
    FUNCTION 1 sig_cmp(signature,signature);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: affiliations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE affiliations (
    id integer NOT NULL,
    nobelist_id integer,
    detail text NOT NULL,
    degree text,
    year integer
);


--
-- Name: affiliations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE affiliations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: affiliations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE affiliations_id_seq OWNED BY affiliations.id;


--
-- Name: citizens; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE citizens (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text,
    gender text,
    occupation text,
    birth_city text,
    birth_state text,
    birthdate timestamp without time zone,
    social_security text,
    _fulltext tsvector
);


--
-- Name: citizens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE citizens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: citizens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE citizens_id_seq OWNED BY citizens.id;


--
-- Name: nobelists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nobelists (
    id integer NOT NULL,
    name text NOT NULL,
    birthdate timestamp without time zone,
    deathdate timestamp without time zone,
    birth_country text,
    birth_state text,
    birth_city text,
    url text,
    discipline text,
    shared boolean DEFAULT false,
    last_name text NOT NULL,
    nobel_year integer NOT NULL,
    deceased boolean,
    co_winner text,
    image_url text,
    image_credit text
);


--
-- Name: nobelists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nobelists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: nobelists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nobelists_id_seq OWNED BY nobelists.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE affiliations ALTER COLUMN id SET DEFAULT nextval('affiliations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE citizens ALTER COLUMN id SET DEFAULT nextval('citizens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE nobelists ALTER COLUMN id SET DEFAULT nextval('nobelists_id_seq'::regclass);


--
-- Name: affiliations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY affiliations
    ADD CONSTRAINT affiliations_pkey PRIMARY KEY (id);


--
-- Name: citizens_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY citizens
    ADD CONSTRAINT citizens_pkey PRIMARY KEY (id);


--
-- Name: nobelists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nobelists
    ADD CONSTRAINT nobelists_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20101003121341');

INSERT INTO schema_migrations (version) VALUES ('20101027115308');

INSERT INTO schema_migrations (version) VALUES ('20101027232148');