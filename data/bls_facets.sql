---
--- SET UP FACET INDICES
---

--
-- Execute in a transaction for speed
--

BEGIN;

SELECT renumber_table('businesses', '_packed_id');

SELECT recreate_table('_businesses_size_facet', 
  'SELECT size.code as id, size.title AS size, signature(_packed_id) FROM businesses JOIN size ON (size = size.code) GROUP BY size.code, size.title');

SELECT recreate_table('_businesses_ownership_facet', 
  'SELECT ownership.title AS ownership, signature(_packed_id) FROM businesses JOIN ownership ON (ownership = ownership.code) GROUP BY ownership.title');
  
SELECT recreate_table('_businesses_annual_pay_facet',
  'SELECT ceil(annual_pay / 15000) * 15000 AS annual_pay, signature(_packed_id) FROM businesses GROUP BY ceil(annual_pay / 15000) * 15000');

-- Create nested facet

SELECT recreate_table('_businesses_naics_facet', $$
  SELECT display_title AS naics, collect(signature) AS signature
  FROM naics, (SELECT naics, signature(_packed_id) FROM businesses GROUP BY naics) AS items
  WHERE items.naics like naics.code || '%'
  GROUP BY naics.code, naics.display_title
$$);
-- not necessary to call expand_nesting since we did it implicitly in the join
CREATE INDEX _businesses_naics_facet_ndx ON _businesses_naics_facet(naics);


-- Unlike the other facets in the examples, the BLS business location facet uses a controlled vocabulary
-- of potential GIS features that match the items (e.g. state, county, and city boundaries in this case).

-- We construct the vocabulary in a temporary table first, then build the index of matching citizen signatures.

-- Like many GIS's, the National Atlas data often has several entries for each feature (esp. to add coastline 
-- or islands).  The controlled vocabulary prunes, merges, and simplifies geometries for use in Google Earth.  
-- We use the full geometry for spatial analysis, and the display geometry for quick rendering.

CREATE TEMPORARY TABLE businesses_area_vocabulary(id SERIAL, label TEXT, layer INTEGER);
SELECT AddGeometryColumn('businesses_area_vocabulary', 'display_geom', 4269, 'GEOMETRY', 2);
SELECT AddGeometryColumn('businesses_area_vocabulary', 'full_geom', 4269, 'GEOMETRY', 2);

INSERT INTO businesses_area_vocabulary(label, layer, display_geom, full_geom)
  SELECT state, 1, ST_SimplifyPreserveTopology(ST_Union(the_geom), 0.005), ST_Union(the_geom) 
  FROM statesp020 
  WHERE area > 0.05                          -- remove small islands
  GROUP BY state;

INSERT INTO businesses_area_vocabulary(label, layer, display_geom, full_geom)
  SELECT county, 2, ST_SimplifyPreserveTopology(ST_Union(the_geom), 0.0005), ST_Union(the_geom) 
  FROM countyp020
  WHERE county IS NOT NULL AND area > 0.02   -- remove small islands and the Great Lakes
  GROUP BY state, county;

INSERT INTO businesses_area_vocabulary(label, layer, display_geom, full_geom)
  SELECT name, 3, the_geom, the_geom 
  FROM citiesx020;

CREATE INDEX businesses_area_vocabulary_full_geom_ndx ON businesses_area_vocabulary USING gist(full_geom);


-- GIS facet tables have 6 columns:
--   <key>, label, layer-number, display geometry, full geometry, signature

-- The current facet refinement is represented by a single key, which is a checksum hash
-- of the geometry.  From the key and the full geometry index, the faceter can easily determine
-- which features in the next layer down are contained by the current feature.  So the
-- user can easily refine down nested gis layers, e.g. countries / states / counties / cities.

SELECT recreate_table('_businesses_area_facet', $$
  SELECT md5(full_geom::bytea) AS area, label, layer, display_geom, full_geom, coalesce(signature, '0'::signature) AS signature
  FROM businesses_area_vocabulary
    LEFT OUTER JOIN
    (SELECT businesses_area_vocabulary.id AS vocab_id, signature(_packed_id)
     FROM businesses JOIN citiesx020 ON (businesses.area = citiesx020.fips AND businesses.city = citiesx020.fips55),
     businesses_area_vocabulary
     WHERE ST_Within(citiesx020.the_geom, businesses_area_vocabulary.full_geom)
     GROUP BY businesses_area_vocabulary.id) AS signatures
  ON (vocab_id = businesses_area_vocabulary.id)
$$);

CREATE INDEX _businesses_area_facet_ndx ON _businesses_area_facet USING gist(full_geom);

--
-- Finish up
--

COMMIT;

VACUUM ANALYZE;