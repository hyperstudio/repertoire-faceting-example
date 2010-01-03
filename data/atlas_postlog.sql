--
-- This file finishes indexing the National Atlas GIS layers
--

--
-- Update PostgreSQL statistics post bulk-load
--

VACUUM ANALYZE;

--
-- Create indices on columns we use as foreign keys
--

ALTER TABLE citiesx020 ADD UNIQUE (fips, fips55);

CREATE UNIQUE INDEX citiesx020_fips55_ndx ON citiesx020(fips, fips55);
