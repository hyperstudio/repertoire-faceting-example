--
-- This file finishes creating tables used for USA Census 2000 data
-- 

VACUUM ANALYZE;

ALTER TABLE sub_est2008 ADD COLUMN id SERIAL;

DROP TABLE IF EXISTS city_pop_2000;

CREATE TABLE city_pop_2000 AS 
SELECT (se.state || se.county)::CHAR(5) AS fips, 
       se.place::CHAR(5) AS fips55,
       popbase_2000 AS population,
			 (sum(popbase_2000) OVER w_city - popbase_2000)::DOUBLE PRECISION /
         sum(popbase_2000) OVER w_county AS low,
       sum(popbase_2000) OVER w_city::DOUBLE PRECISION /
         sum(popbase_2000) OVER w_county AS high
FROM sub_est2008 se
JOIN citiesx020   c ON (se.place = fips55 AND se.state || se.county = fips)
WHERE sumlev = 157
WINDOW w_city AS (PARTITION BY se.state, se.county ORDER BY se.id), 
     w_county AS (PARTITION BY se.state, se.county);

CREATE INDEX city_pop_2000_fips_ndx ON city_pop_2000(fips);
