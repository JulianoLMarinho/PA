--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: automacaoresidencial; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE automacaoresidencial WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE automacaoresidencial OWNER TO postgres;

\connect automacaoresidencial

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: casa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE casa (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    rua character varying(50) NOT NULL,
    numero integer,
    complemento character varying(255)
);


ALTER TABLE casa OWNER TO postgres;

--
-- Name: Casa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Casa_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Casa_id_seq" OWNER TO postgres;

--
-- Name: Casa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Casa_id_seq" OWNED BY casa.id;


--
-- Name: ambiente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ambiente (
    id integer NOT NULL,
    casa_id integer,
    nome character varying(255) NOT NULL,
    detalhes character varying(255)
);


ALTER TABLE ambiente OWNER TO postgres;

--
-- Name: ambiente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ambiente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ambiente_id_seq OWNER TO postgres;

--
-- Name: ambiente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ambiente_id_seq OWNED BY ambiente.id;


--
-- Name: dispositivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dispositivo (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    id_ambiente integer NOT NULL,
    arquivojs character varying(255)
);


ALTER TABLE dispositivo OWNER TO postgres;

--
-- Name: dispositivos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dispositivos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dispositivos_id_seq OWNER TO postgres;

--
-- Name: dispositivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dispositivos_id_seq OWNED BY dispositivo.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ambiente ALTER COLUMN id SET DEFAULT nextval('ambiente_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY casa ALTER COLUMN id SET DEFAULT nextval('"Casa_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dispositivo ALTER COLUMN id SET DEFAULT nextval('dispositivos_id_seq'::regclass);


--
-- Name: Casa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Casa_id_seq"', 1, true);


--
-- Data for Name: ambiente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ambiente (id, casa_id, nome, detalhes) FROM stdin;
15	1	Quarto	
17	1	Sala	Sala de Estar
28	1	Salão de Festas	TUTS TUTS TUTS TUTS
29	1	Meu Quarto	2
\.


--
-- Name: ambiente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ambiente_id_seq', 32, true);


--
-- Data for Name: casa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY casa (id, nome, rua, numero, complemento) FROM stdin;
1	Cidade Universitária	Violetas	90	UFRJ
\.


--
-- Data for Name: dispositivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dispositivo (id, nome, id_ambiente, arquivojs) FROM stdin;
16	TV	17	televisao.js
20	Televisão	15	televisao.js
17	Lâmpada 1	28	lampada.js
19	Led da Cama	29	lampada.js
15	Ar-Condicionado	15	arcondicionado.js
21	Ventilador de Teto	15	ventilador.js
22	Aparelho de Som	15	som.js
\.


--
-- Name: dispositivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dispositivos_id_seq', 22, true);


--
-- Name: Casa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY casa
    ADD CONSTRAINT "Casa_pkey" PRIMARY KEY (id);


--
-- Name: ambiente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ambiente
    ADD CONSTRAINT ambiente_pkey PRIMARY KEY (id);


--
-- Name: dispositivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dispositivo
    ADD CONSTRAINT dispositivos_pkey PRIMARY KEY (id);


--
-- Name: ambiente_casa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ambiente
    ADD CONSTRAINT ambiente_casa_id_fkey FOREIGN KEY (casa_id) REFERENCES casa(id);


--
-- Name: dispositivos_id_ambiente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dispositivo
    ADD CONSTRAINT dispositivos_id_ambiente_fkey FOREIGN KEY (id_ambiente) REFERENCES ambiente(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

