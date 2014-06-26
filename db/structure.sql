--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: facet; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA facet;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: faceting; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS faceting WITH SCHEMA facet;


--
-- Name: EXTENSION faceting; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION faceting IS 'API for faceted indexing and queries (based on custom C bitmap type)';


SET search_path = public, pg_catalog;

--
-- Name: foreach(json[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION foreach(list json[]) RETURNS SETOF json
    LANGUAGE plpgsql
    AS $$ 
DECLARE 
   i INT; 
BEGIN 
   FOR i IN 1..array_length(list, 1) LOOP 
     RETURN NEXT list[i]; 
   END LOOP; 
END; 
$$;


SET default_tablespace = '';

SET default_with_oids = false;

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
    _fulltext tsvector,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


SET search_path = facet, pg_catalog;

--
-- Name: citizens_birth_place_index; Type: MATERIALIZED VIEW; Schema: facet; Owner: -; Tablespace: 
--

CREATE MATERIALIZED VIEW citizens_birth_place_index AS
        (         SELECT NULL::text AS birth_place_1,
                    NULL::text AS birth_place_2,
                    0 AS level,
                    signature(citizens.id) AS signature,
                    now() AS updated_at
                   FROM public.citizens
        UNION
                 SELECT citizens.birth_state AS birth_place_1,
                    citizens.birth_city AS birth_place_2,
                    2 AS level,
                    signature(citizens.id) AS signature,
                    now() AS updated_at
                   FROM public.citizens
                  GROUP BY citizens.birth_state, citizens.birth_city)
UNION
         SELECT citizens.birth_state AS birth_place_1,
            NULL::text AS birth_place_2,
            1 AS level,
            signature(citizens.id) AS signature,
            now() AS updated_at
           FROM public.citizens
          GROUP BY citizens.birth_state
  WITH NO DATA;


--
-- Name: citizens_birthdate_index; Type: MATERIALIZED VIEW; Schema: facet; Owner: -; Tablespace: 
--

CREATE MATERIALIZED VIEW citizens_birthdate_index AS
        (        (         SELECT NULL::integer AS birthdate_1,
                            NULL::text AS birthdate_2,
                            NULL::integer AS birthdate_3,
                            0 AS level,
                            signature(citizens.id) AS signature,
                            now() AS updated_at
                           FROM public.citizens
                UNION
                         SELECT (date_part('year'::text, citizens.birthdate))::integer AS birthdate_1,
                            btrim(to_char(citizens.birthdate, 'Month'::text)) AS birthdate_2,
                            (date_part('day'::text, citizens.birthdate))::integer AS birthdate_3,
                            3 AS level,
                            signature(citizens.id) AS signature,
                            now() AS updated_at
                           FROM public.citizens
                          GROUP BY (date_part('year'::text, citizens.birthdate))::integer, btrim(to_char(citizens.birthdate, 'Month'::text)), (date_part('day'::text, citizens.birthdate))::integer)
        UNION
                 SELECT (date_part('year'::text, citizens.birthdate))::integer AS birthdate_1,
                    btrim(to_char(citizens.birthdate, 'Month'::text)) AS birthdate_2,
                    NULL::integer AS birthdate_3,
                    2 AS level,
                    signature(citizens.id) AS signature,
                    now() AS updated_at
                   FROM public.citizens
                  GROUP BY (date_part('year'::text, citizens.birthdate))::integer, btrim(to_char(citizens.birthdate, 'Month'::text)))
UNION
         SELECT (date_part('year'::text, citizens.birthdate))::integer AS birthdate_1,
            NULL::text AS birthdate_2,
            NULL::integer AS birthdate_3,
            1 AS level,
            signature(citizens.id) AS signature,
            now() AS updated_at
           FROM public.citizens
          GROUP BY (date_part('year'::text, citizens.birthdate))::integer
  WITH NO DATA;


--
-- Name: citizens_gender_index; Type: MATERIALIZED VIEW; Schema: facet; Owner: -; Tablespace: 
--

CREATE MATERIALIZED VIEW citizens_gender_index AS
 SELECT citizens.gender,
    signature(citizens.id) AS signature,
    now() AS updated_at
   FROM public.citizens
  GROUP BY citizens.gender
  WITH NO DATA;


--
-- Name: citizens_occupation_index; Type: MATERIALIZED VIEW; Schema: facet; Owner: -; Tablespace: 
--

CREATE MATERIALIZED VIEW citizens_occupation_index AS
 SELECT citizens.occupation,
    signature(citizens.id) AS signature,
    now() AS updated_at
   FROM public.citizens
  GROUP BY citizens.occupation
  WITH NO DATA;


SET search_path = public, pg_catalog;

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
    image_credit text,
    _packed_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


SET search_path = facet, pg_catalog;

--
-- Name: nobelists_degree_index; Type: MATERIALIZED VIEW; Schema: facet; Owner: -; Tablespace: 
--

CREATE MATERIALIZED VIEW nobelists_degree_index AS
 SELECT affiliations.degree,
    signature(nobelists._packed_id) AS signature,
    now() AS updated_at
   FROM (public.nobelists
   JOIN public.affiliations ON ((affiliations.nobelist_id = nobelists.id)))
  GROUP BY affiliations.degree
  WITH NO DATA;


--
-- Name: nobelists_discipline_index; Type: MATERIALIZED VIEW; Schema: facet; Owner: -; Tablespace: 
--

CREATE MATERIALIZED VIEW nobelists_discipline_index AS
 SELECT nobelists.discipline,
    signature(nobelists._packed_id) AS signature,
    now() AS updated_at
   FROM public.nobelists
  GROUP BY nobelists.discipline
  WITH NO DATA;


SET search_path = public, pg_catalog;

--
-- Name: affiliations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE affiliations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: affiliations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE affiliations_id_seq OWNED BY affiliations.id;


--
-- Name: citizens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE citizens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: citizens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE citizens_id_seq OWNED BY citizens.id;


--
-- Name: nobelists__packed_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nobelists__packed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nobelists__packed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nobelists__packed_id_seq OWNED BY nobelists._packed_id;


--
-- Name: nobelists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nobelists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
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

ALTER TABLE ONLY affiliations ALTER COLUMN id SET DEFAULT nextval('affiliations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY citizens ALTER COLUMN id SET DEFAULT nextval('citizens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nobelists ALTER COLUMN id SET DEFAULT nextval('nobelists_id_seq'::regclass);


--
-- Name: _packed_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nobelists ALTER COLUMN _packed_id SET DEFAULT nextval('nobelists__packed_id_seq'::regclass);


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
-- Name: index_citizens_on__fulltext; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_citizens_on__fulltext ON citizens USING gin (_fulltext);


--
-- Name: index_citizens_on_updated_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_citizens_on_updated_at ON citizens USING btree (updated_at);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20101003121341');

INSERT INTO schema_migrations (version) VALUES ('20101027115308');

INSERT INTO schema_migrations (version) VALUES ('20101028165208');

INSERT INTO schema_migrations (version) VALUES ('20140626084228');
