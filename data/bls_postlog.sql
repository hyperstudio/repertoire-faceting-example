--
-- This file finishes indexing the BLS CEWS data
--

--
-- Update PostgreSQL statistics post bulk-load
--

CREATE INDEX businesses_area_ndx ON businesses(area);

VACUUM ANALYZE;

--
-- Execute in a transaction for speed
--

BEGIN;

--
-- Assign a city fips (weighted by population within the county) to each entry
--
--   Later. To get a truly representative distribution we should also take the number of employees into account.
--

UPDATE businesses SET city = fips55
  FROM city_pop_2000
 WHERE fips = area
   AND low < city_rand AND high > city_rand;

ALTER TABLE businesses DROP COLUMN city_rand;

--
-- Foreign key constraints for the main table
-- 

ALTER TABLE businesses ADD CONSTRAINT businesses_size_fkey FOREIGN KEY (size) REFERENCES size(code);
ALTER TABLE businesses ADD CONSTRAINT businesses_ownership_fkey FOREIGN KEY (ownership) REFERENCES ownership(code);
ALTER TABLE businesses ADD CONSTRAINT businesses_naics_fkey FOREIGN KEY (naics) REFERENCES naics(code);

ALTER TABLE businesses ADD CONSTRAINT businesses_city_fkey FOREIGN KEY (area, city) REFERENCES citiesx020(fips, fips55);

--
-- Update business size column
--

UPDATE businesses SET size = 
  CASE WHEN employment = 0 THEN 0
    WHEN employment > 0 AND employment < 20 THEN 1
		WHEN employment >= 20 AND employment < 50 THEN 2
		WHEN employment >= 50 AND employment < 100 THEN 3
		WHEN employment >= 100 AND employment < 250 THEN 4
		WHEN employment >= 250 AND employment < 500 THEN 5
		WHEN employment >= 500 AND employment < 1000 THEN 6
		WHEN employment >= 1000 AND employment < 2000 THEN 7
		WHEN employment >= 2000 THEN 8
  END;

--
-- Full text index: not much... just city, county, state names
--

ALTER TABLE businesses ADD COLUMN _fulltext tsvector;

UPDATE businesses SET _fulltext = to_tsvector(city || ' ' || county || ' ' || state) 
  FROM citiesx020 WHERE businesses.area = citiesx020.fips AND businesses.city = citiesx020.fips55;

CREATE INDEX businesses_fulltext_ndx ON businesses USING gin(_fulltext);

--
-- Finish up
--

COMMIT;

VACUUM ANALYZE;
