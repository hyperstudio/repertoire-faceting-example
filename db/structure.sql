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
    NO MINVALUE
    NO MAXVALUE
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
    NO MINVALUE
    NO MAXVALUE
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

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20101003121341');

INSERT INTO schema_migrations (version) VALUES ('20101027115308');

INSERT INTO schema_migrations (version) VALUES ('20101028165208');
