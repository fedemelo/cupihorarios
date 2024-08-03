--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: day; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.day AS ENUM (
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY',
    'SATURDAY',
    'SUNDAY'
);


ALTER TYPE public.day OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: assistant_availabilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assistant_availabilities (
    id character varying NOT NULL,
    assistant_code integer NOT NULL,
    time_slot_id character varying NOT NULL,
    remote_only boolean NOT NULL
);


ALTER TABLE public.assistant_availabilities OWNER TO postgres;

--
-- Name: assistants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assistants (
    code integer NOT NULL,
    login character varying NOT NULL,
    first_names character varying NOT NULL,
    last_names character varying NOT NULL,
    hired_hours double precision NOT NULL,
    is_admin boolean NOT NULL,
    nickname character varying
);


ALTER TABLE public.assistants OWNER TO postgres;

--
-- Name: assistants_code_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assistants_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assistants_code_seq OWNER TO postgres;

--
-- Name: assistants_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assistants_code_seq OWNED BY public.assistants.code;


--
-- Name: scheduled_slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scheduled_slots (
    schedule_id uuid NOT NULL,
    assistant_availability_id character varying NOT NULL,
    is_remote boolean NOT NULL
);


ALTER TABLE public.scheduled_slots OWNER TO postgres;

--
-- Name: schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedules (
    id uuid NOT NULL,
    name character varying NOT NULL,
    is_official boolean NOT NULL
);


ALTER TABLE public.schedules OWNER TO postgres;

--
-- Name: time_slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slots (
    id character varying NOT NULL,
    start_hour integer NOT NULL,
    end_hour integer NOT NULL,
    day public.day NOT NULL
);


ALTER TABLE public.time_slots OWNER TO postgres;

--
-- Name: assistants code; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistants ALTER COLUMN code SET DEFAULT nextval('public.assistants_code_seq'::regclass);


--
-- Data for Name: assistant_availabilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assistant_availabilities (id, assistant_code, time_slot_id, remote_only) FROM stdin;
\.


--
-- Data for Name: assistants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assistants (code, login, first_names, last_names, hired_hours, is_admin, nickname) FROM stdin;
\.


--
-- Data for Name: scheduled_slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scheduled_slots (schedule_id, assistant_availability_id, is_remote) FROM stdin;
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedules (id, name, is_official) FROM stdin;
\.


--
-- Data for Name: time_slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slots (id, start_hour, end_hour, day) FROM stdin;
\.


--
-- Name: assistants_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assistants_code_seq', 1, false);


--
-- Name: assistant_availabilities assistant_availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_availabilities
    ADD CONSTRAINT assistant_availabilities_pkey PRIMARY KEY (id);


--
-- Name: assistants assistants_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistants
    ADD CONSTRAINT assistants_login_key UNIQUE (login);


--
-- Name: assistants assistants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistants
    ADD CONSTRAINT assistants_pkey PRIMARY KEY (code);


--
-- Name: scheduled_slots scheduled_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheduled_slots
    ADD CONSTRAINT scheduled_slots_pkey PRIMARY KEY (schedule_id, assistant_availability_id);


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: time_slots time_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT time_slots_pkey PRIMARY KEY (id);


--
-- Name: assistant_availabilities assistant_availabilities_assistant_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_availabilities
    ADD CONSTRAINT assistant_availabilities_assistant_code_fkey FOREIGN KEY (assistant_code) REFERENCES public.assistants(code);


--
-- Name: assistant_availabilities assistant_availabilities_time_slot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_availabilities
    ADD CONSTRAINT assistant_availabilities_time_slot_id_fkey FOREIGN KEY (time_slot_id) REFERENCES public.time_slots(id) ON DELETE CASCADE;


--
-- Name: scheduled_slots scheduled_slots_assistant_availability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheduled_slots
    ADD CONSTRAINT scheduled_slots_assistant_availability_id_fkey FOREIGN KEY (assistant_availability_id) REFERENCES public.assistant_availabilities(id) ON DELETE CASCADE;


--
-- Name: scheduled_slots scheduled_slots_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheduled_slots
    ADD CONSTRAINT scheduled_slots_schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.schedules(id);


--
-- PostgreSQL database dump complete
--

