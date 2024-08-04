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
202021525	f.melo	Federico	Melo Barrero	12	t	Fede
202021113	d.fuquen	David Alejandro	Fuquen Florez	12	f	Dave
202112020	s.martinezn	Santiago	Martínez Novoa	12	t	Santi
202011140	m.ruizg	Mariana	Ruiz Giraldo	12	f	Maru
202020609	g.ardila	Gabriel Eduardo	Ardila Carrillo	12	f	Ardilla
201914782	jd.vasquezh	Juan David	Vasquez Hernández	12	f	Juanda
201922019	n.carvajalc	Nicolás	Carvajal Chaves	23	f	Nico
201913554	am.ochoat	Andrés Martín	Ochoa Toro	23	f	Andrés
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
Monday, 08:00-09:00	800	900	MONDAY
Monday, 09:00-09:30	900	930	MONDAY
Monday, 09:30-10:30	930	1030	MONDAY
Monday, 10:30-11:00	1030	1100	MONDAY
Monday, 11:00-12:00	1100	1200	MONDAY
Monday, 12:00-12:30	1200	1230	MONDAY
Monday, 12:30-13:30	1230	1330	MONDAY
Monday, 13:30-14:00	1330	1400	MONDAY
Monday, 14:00-15:00	1400	1500	MONDAY
Monday, 15:00-15:30	1500	1530	MONDAY
Monday, 15:30-16:30	1530	1630	MONDAY
Monday, 16:30-17:00	1630	1700	MONDAY
Monday, 17:00-18:00	1700	1800	MONDAY
Tuesday, 08:00-09:00	800	900	TUESDAY
Tuesday, 09:00-09:30	900	930	TUESDAY
Tuesday, 09:30-10:30	930	1030	TUESDAY
Tuesday, 10:30-11:00	1030	1100	TUESDAY
Tuesday, 11:00-12:00	1100	1200	TUESDAY
Tuesday, 12:00-12:30	1200	1230	TUESDAY
Tuesday, 12:30-13:30	1230	1330	TUESDAY
Tuesday, 13:30-14:00	1330	1400	TUESDAY
Tuesday, 14:00-15:00	1400	1500	TUESDAY
Tuesday, 15:00-15:30	1500	1530	TUESDAY
Tuesday, 15:30-16:30	1530	1630	TUESDAY
Tuesday, 16:30-17:00	1630	1700	TUESDAY
Tuesday, 17:00-18:00	1700	1800	TUESDAY
Wednesday, 08:00-09:00	800	900	WEDNESDAY
Wednesday, 09:00-09:30	900	930	WEDNESDAY
Wednesday, 09:30-10:30	930	1030	WEDNESDAY
Wednesday, 10:30-11:00	1030	1100	WEDNESDAY
Wednesday, 11:00-12:00	1100	1200	WEDNESDAY
Wednesday, 12:00-12:30	1200	1230	WEDNESDAY
Wednesday, 12:30-13:30	1230	1330	WEDNESDAY
Wednesday, 13:30-14:00	1330	1400	WEDNESDAY
Wednesday, 14:00-15:00	1400	1500	WEDNESDAY
Wednesday, 15:00-15:30	1500	1530	WEDNESDAY
Wednesday, 15:30-16:30	1530	1630	WEDNESDAY
Wednesday, 16:30-17:00	1630	1700	WEDNESDAY
Wednesday, 17:00-18:00	1700	1800	WEDNESDAY
Thursday, 08:00-09:00	800	900	THURSDAY
Thursday, 09:00-09:30	900	930	THURSDAY
Thursday, 09:30-10:30	930	1030	THURSDAY
Thursday, 10:30-11:00	1030	1100	THURSDAY
Thursday, 11:00-12:00	1100	1200	THURSDAY
Thursday, 12:00-12:30	1200	1230	THURSDAY
Thursday, 12:30-13:30	1230	1330	THURSDAY
Thursday, 13:30-14:00	1330	1400	THURSDAY
Thursday, 14:00-15:00	1400	1500	THURSDAY
Thursday, 15:00-15:30	1500	1530	THURSDAY
Thursday, 15:30-16:30	1530	1630	THURSDAY
Thursday, 16:30-17:00	1630	1700	THURSDAY
Thursday, 17:00-18:00	1700	1800	THURSDAY
Friday, 08:00-09:00	800	900	FRIDAY
Friday, 09:00-09:30	900	930	FRIDAY
Friday, 09:30-10:30	930	1030	FRIDAY
Friday, 10:30-11:00	1030	1100	FRIDAY
Friday, 11:00-12:00	1100	1200	FRIDAY
Friday, 12:00-12:30	1200	1230	FRIDAY
Friday, 12:30-13:30	1230	1330	FRIDAY
Friday, 13:30-14:00	1330	1400	FRIDAY
Friday, 14:00-15:00	1400	1500	FRIDAY
Friday, 15:00-15:30	1500	1530	FRIDAY
Friday, 15:30-16:30	1530	1630	FRIDAY
Friday, 16:30-17:00	1630	1700	FRIDAY
Friday, 17:00-18:00	1700	1800	FRIDAY
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

