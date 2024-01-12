--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: deaths; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deaths (
    id_deaths integer NOT NULL,
    year integer NOT NULL,
    nr integer NOT NULL,
    id_hospital integer NOT NULL,
    CONSTRAINT deaths_check CHECK (((year > 0) AND (nr > 0) AND (id_hospital > 0)))
);


ALTER TABLE public.deaths OWNER TO postgres;

--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    department_id integer NOT NULL,
    department_name character varying NOT NULL,
    id_head integer NOT NULL,
    id_hospital integer NOT NULL,
    CONSTRAINT department_check CHECK (((id_hospital > 0) AND (id_head > 0)))
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.department ALTER COLUMN department_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.department_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: disease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disease (
    id_disease integer NOT NULL,
    name character varying NOT NULL,
    descreption character varying NOT NULL,
    treatment character varying NOT NULL
);


ALTER TABLE public.disease OWNER TO postgres;

--
-- Name: disease_id_disease_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.disease ALTER COLUMN id_disease ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.disease_id_disease_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: hopital2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hopital2 (
    id_hospital integer NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    phone character varying NOT NULL,
    city character varying NOT NULL,
    country character varying NOT NULL,
    id_admin integer NOT NULL,
    CONSTRAINT hopital2_check CHECK ((id_admin > 0))
);


ALTER TABLE public.hopital2 OWNER TO postgres;

--
-- Name: hopital2_id_hospital_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.hopital2 ALTER COLUMN id_hospital ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hopital2_id_hospital_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.login OWNER TO postgres;

--
-- Name: newtable_id_deaths_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.deaths ALTER COLUMN id_deaths ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.newtable_id_deaths_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: newtable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.login ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.newtable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    cnp character varying NOT NULL,
    last_name character varying NOT NULL,
    first_name character varying NOT NULL,
    place_of_birth character varying NOT NULL,
    nationality character varying NOT NULL,
    address character varying NOT NULL,
    birth_date date NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."position" (
    id_position integer NOT NULL,
    id_staff integer NOT NULL,
    name_position character varying,
    salary integer,
    CONSTRAINT position_check CHECK (((id_staff > 0) AND (salary > 0)))
);


ALTER TABLE public."position" OWNER TO postgres;

--
-- Name: position_id_position_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."position" ALTER COLUMN id_position ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.position_id_position_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration (
    registration_id integer NOT NULL,
    registr_cnp character varying NOT NULL,
    id_hospital integer NOT NULL,
    date date NOT NULL,
    id_disease integer NOT NULL,
    id_primary_doctor integer,
    stay_id integer NOT NULL,
    personal_treatment character varying NOT NULL,
    CONSTRAINT registration_check CHECK (((id_hospital > 0) AND (id_disease > 0) AND (id_primary_doctor > 0) AND (stay_id > 0)))
);


ALTER TABLE public.registration OWNER TO postgres;

--
-- Name: registration_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.registration ALTER COLUMN registration_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.registration_registration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    id_room integer NOT NULL,
    floor integer NOT NULL,
    building character varying NOT NULL,
    nr_of_seats integer,
    hospital_id integer,
    room_name character varying,
    CONSTRAINT room_check CHECK (((floor > 0) AND (nr_of_seats > 0) AND (hospital_id > 0)))
);


ALTER TABLE public.room OWNER TO postgres;

--
-- Name: room_id_room_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.room ALTER COLUMN id_room ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.room_id_room_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id_staff integer NOT NULL,
    hire_date date NOT NULL,
    education character varying NOT NULL,
    cnp_staff character varying,
    contact character varying,
    id_hospital integer,
    CONSTRAINT staff_check CHECK ((id_hospital > 0))
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_id_staff_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.staff ALTER COLUMN id_staff ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.staff_id_staff_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stay; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stay (
    id_stay integer NOT NULL,
    id_hospital integer NOT NULL,
    check_in date NOT NULL,
    check_out date NOT NULL,
    id_room integer,
    CONSTRAINT stay_check CHECK (((id_hospital > 0) AND (id_room > 0) AND (check_in <= check_out)))
);


ALTER TABLE public.stay OWNER TO postgres;

--
-- Name: stay_id_stay_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.stay ALTER COLUMN id_stay ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.stay_id_stay_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: deaths; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deaths (id_deaths, year, nr, id_hospital) FROM stdin;
5	2014	50	1
1	2010	50	1
2	2011	70	1
3	2012	60	1
4	2013	35	1
6	2015	89	1
7	2016	23	1
8	2017	34	1
9	2018	60	1
10	2019	50	1
11	2020	200	1
12	2010	150	2
13	2011	170	2
14	2012	160	2
15	2013	135	2
16	2014	150	2
17	2015	140	2
18	2016	189	2
19	2017	120	2
20	2018	165	2
21	2019	187	2
22	2020	300	2
23	2010	50	3
24	2011	70	3
25	2012	60	3
26	2013	35	3
27	2014	50	3
28	2015	89	3
29	2016	23	3
30	2017	34	3
31	2018	60	3
32	2019	50	3
33	2020	200	3
34	2010	150	4
35	2011	170	4
36	2012	160	4
37	2013	135	4
38	2014	150	4
39	2015	140	4
40	2016	189	4
41	2017	120	4
42	2018	165	4
43	2019	187	4
44	2020	300	4
45	2010	50	5
46	2011	70	5
47	2012	60	5
48	2013	35	5
49	2014	50	5
50	2015	89	5
51	2016	23	5
52	2017	34	5
53	2018	60	5
54	2019	50	5
55	2020	200	5
56	2010	150	6
57	2011	170	6
58	2012	160	6
59	2013	135	6
60	2014	150	6
61	2015	140	6
62	2016	189	6
63	2017	120	6
64	2018	165	6
65	2019	187	6
66	2020	300	6
67	2010	150	7
68	2011	170	7
69	2012	160	7
70	2013	135	7
71	2014	150	7
72	2015	140	7
73	2016	189	7
74	2017	120	7
75	2018	165	7
76	2019	187	7
77	2020	500	7
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (department_id, department_name, id_head, id_hospital) FROM stdin;
2	Cardiology	1	1
1	Internal medicine	1	1
3	General Surgery	1	1
4	Anesthesia and intensive therapy (ATI)	1	1
5	Neurology	1	1
6	Internal medicine	5	2
7	Cardiology	5	2
8	General Surgery	5	2
9	Anesthesia and intensive therapy (ATI)	5	2
10	Neurology	5	2
11	Internal medicine	4	3
12	Cardiology	4	3
13	General Surgery	4	3
14	Anesthesia and intensive therapy (ATI)	4	3
15	Neurology	4	3
16	Internal medicine	7	4
17	Cardiology	7	4
18	General Surgery	7	4
19	Anesthesia and intensive therapy (ATI)	7	4
20	Neurology	7	4
21	Internal medicine	2	5
22	Cardiology	2	5
23	General Surgery	2	5
24	Anesthesia and intensive therapy (ATI)	2	5
25	Neurology	2	5
26	Internal medicine	6	6
27	Cardiology	6	6
28	General Surgery	6	6
29	Anesthesia and intensive therapy (ATI)	6	6
30	Neurology	6	6
31	Internal medicine	12	7
32	Cardiology	8	7
33	General Surgery	8	7
34	Anesthesia and intensive therapy (ATI)	12	7
35	Neurology	12	7
\.


--
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease (id_disease, name, descreption, treatment) FROM stdin;
1	Birth	Natural Cause	No treatment
3	Broken Arm	The Arm Bones are broken	Hand Plaster
2	Broken Wrist	The Wrist Bones are broken	Hand Plaster
4	Cut Finger	All the finger/a part of it si cut	Sew + Operation + Hand Plaster
5	Ankle Sprain	Broken/Twisted tendons	Bandage the ankle
6	Covid19	Coronavirus disease 2019 (COVID-19) is a contagious disease caused by the virus SARS-CoV-2	Isolation, Imunity Pills, Fever Pills
8	Leukemia	Leukemia is cancer of the body's blood-forming tissues, including the bone marrow and the lymphatic system.	Chemotherapy, Bone marrow transplant
7	Lung Cancer	Lung cancer begins in the lungs and may spread to lymph nodes or other organs in the body, such as the brain.	Surgery, Chemotherapy,Radiation therapy
\.


--
-- Data for Name: hopital2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hopital2 (id_hospital, name, address, phone, city, country, id_admin) FROM stdin;
1	Spitalul Judetean de Urgente Resita	Str. Fagarasului nr.18	255227830	Resita	Romania	1
6	Spitalul Municipal de Urgente Bucuresti	Str. Granger	256221552	Bucuresti	Romania	6
2	Spitalul Clinic Municipal de Urgente Timisoara	Str. Hector nr. 2A	256221553	Timisoara	Romania	5
3	Spitalul Clinic Judetean de Urgente "Pius Brinzeu" Timisoara	Bd. Liviu Rebreanu 156	256486956	Timisoara	Romania	4
4	Spitalul Municipal de Urgente Caransebes	Piata 21 dec. 1989	255511423	Caransebes	Romania	7
5	Spitalul Municipal de Urgente Resita	Str. Muncitoresc	255227831	Resita	Romania	2
7	Spitalul Clinic Judetean de Urgenta Cluj-Napoca	strada Clinicilor nr. 3-5	 +40264296296	Cluj-Napoca	Romania	8
\.


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login (id, username, password) FROM stdin;
1	postgres	MiculPrint2004!
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (cnp, last_name, first_name, place_of_birth, nationality, address, birth_date) FROM stdin;
6040303350038	Muntian	Mariana-Ionela	Timisoara	Romanian	Romania, Resita, Street Tusnad, B.1, Sc2, Ap. 19 	2004-03-03
2990810114551	Muntian	Paraschiva	Caransebes	Romanian	Romania, Resita, Street Tusnad, B.1, Sc2, Ap. 19 	1999-08-10
1760805110641	Muntian	Ioan	Caransebes	Romanian	Romania, Resita, Street Tusnad, B.1, Sc2, Ap. 19 	1976-08-05
2800804114549	Ienea	Ana	Caransebes	Romanian	Romania, Resita, Street Tusnad, B.1, Sc2, Ap. 19 	1980-08-04
1800804111234	Veresan	Mircea	Resita	Romanian	Romania, Resita, Str. Fagarasului, Nr.50	1980-08-04
2970715110030	Beg	Alina	Resita	Romanian	Romania, Resita, Str. Traian Lalescu, nr.5, Ap 20	1997-07-15
1950303350012	Bologa	Stefan	Timisoara	Romanian	Romania, Timisoara, Str. Aurel Vlaicu, nr. 5	1995-03-03
1900713120014	Koritar	Mihai	Cluj-Napoca	Romanian	Romania, Bucuresti, Str. Groza, nr 10	1990-07-13
6030817125771	Muresan	Mara	Cluj-Napoca	Romanian	Romania, Cluj-Napoca, Str Stteiului nr.1	2003-08-17
2901010120002	Popescu	Camelia	Cluj-Napoca	Romanian	Romania, Cluj-Napoca, Str. Primaverii nr.4 	1990-10-10
6040303110033	Milos	Ariana	Resita	Romanian	Romania, Resita, Str. Mihai Vieazul, Bl3, Ap 4	2004-03-03
6030910350020	Cipu	Larisa	Timisoara	Romanian	Brebu, Main Street, nr. 10	2003-09-10
2930217335005	Hergel	Gabriela	Timisoara	Romanian	Romania, Timisoara, Str. Mihai Eminescu, nr. 7	1993-02-17
6030107410028	Brinzan	Ioana-Claudia	Bucuresti	Romanian	Romania, Targu-Jiu, Str. Luncilor, Nr. 4A	2003-01-07
6040429413401	Dumitrescu	Diana	Bucuresti	Romanian	Romania, Cernavoda, Str. Malinului,Bl. DS20, Ap. 13	2004-04-29
6030404120197	Pitaru	Alexandra	Cluj-Napoca	Romanian	Romania, Liteni, Str Bucsii	2003-04-04
2600716120001	Sustrean	Roberta	Cluj-Napoca	Romanian	Romania, Cluj-Napoca, Str Rene Descrates. ,Bl. DS20, Ap. 13	1960-07-16
\.


--
-- Data for Name: position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."position" (id_position, id_staff, name_position, salary) FROM stdin;
3	2	Surgeron	40000
5	4	Neurologist	25000
6	1	Endocrinologist	38000
7	6	Cardiologist	20000
1	1	Administrator	10000
4	5	 Hematologist-oncologist	30000
8	6	Administrator	10000
9	8	Neurologist	25000
10	8	Administrator	10000
11	7	Cardiologist	20000
12	7	Administrator	10000
14	11	Medical Assistant	6000
13	10	Medical Assistant	7000
15	12	Cardiologist	38000
16	13	Receptionist	3000
\.


--
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registration (registration_id, registr_cnp, id_hospital, date, id_disease, id_primary_doctor, stay_id, personal_treatment) FROM stdin;
2	6040303350038	4	2006-10-15	2	6	2	Hand Plaster
3	6040303350038	3	2008-02-25	4	5	3	Sew + Operation + Hand Plaster
4	6040303350038	4	2012-07-05	3	6	4	Hand Plaster
5	6040303350038	1	2017-01-15	5	1	7	Bandage the ankle, ice compresses
6	6040303350038	1	2022-01-22	6	2	6	Isolation, Imunity Pills, Fever Pills
9	6040303110033	2	2023-12-22	8	5	8	Chemotherapy, Bone marrow transplant
11	6040303110033	1	2023-12-24	3	1	9	Hand Plaster
14	6040303110033	6	2010-05-05	5	6	12	Bandage the ankle
15	6040303110033	1	2004-03-03	1	1	13	None
16	6030910350020	2	2003-09-10	1	5	14	none
17	6030910350020	2	2024-01-07	3	5	15	Hand Plaster
18	1800804111234	1	1980-08-04	1	\N	16	none
13	6030107410028	6	2023-01-01	6	6	11	Isolation, Imunity Pills, Fever Pills
24	6030107410028	6	2003-01-07	1	6	10	none
25	2990810114551	4	1999-08-08	1	7	22	none
1	6040303350038	2	2004-02-25	1	4	1	none
19	2970715110030	1	1997-07-14	1	\N	17	none
20	1950303350012	2	1995-03-01	1	\N	18	none
22	2930217335005	2	1993-02-15	1	\N	20	none
23	2901010120002	7	1990-10-09	1	\N	21	none
26	1760805110641	4	1976-08-03	1	7	23	none
27	2800804114549	4	1980-08-01	1	7	24	none
31	2600716120001	7	1960-07-16	1	\N	28	none
21	1900713120014	7	1990-07-10	1	8	19	none
28	6030817125771	7	2003-08-15	1	8	25	none
29	6030404120197	7	2003-04-01	1	8	26	none
30	6040429413401	6	2004-04-27	1	6	27	none
33	6030910350020	7	2024-01-01	8	8	29	Chemotherapy, Bone marrow transplant
34	2990810114551	7	2024-01-01	6	8	30	Isolation, Imunity Pills, Fever Pills
35	6040429413401	7	2024-01-08	3	12	31	Hand Plaster
36	6030910350020	4	2010-05-13	3	7	32	Hand Plaster
37	6030404120197	7	2023-12-31	7	12	33	Radiation therapy
38	2970715110030	7	2023-12-30	4	8	34	Sew + Operation + Hand Plaster
39	2901010120002	7	2023-12-29	8	12	36	Chemotherapy, Bone marrow transplant
40	2930217335005	7	2023-12-20	6	12	37	Isolation, Imunity Pills, Fever Pills
41	6030910350020	7	2022-02-01	6	8	38	Isolation, Imunity Pills, Fever Pills
47	6030910350020	7	2024-01-08	5	12	46	ceva
48	6040303350038	7	2024-01-12	7	12	47	ceva
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room (id_room, floor, building, nr_of_seats, hospital_id, room_name) FROM stdin;
4	1	A	2	1	1
1	1	A	3	1	2
2	1	A	5	1	3
3	1	A	5	1	4
5	2	A	4	1	5
6	1	A	2	2	1
7	1	A	3	2	2
8	1	A	5	2	3
9	1	A	5	2	4
10	2	A	4	2	5
11	1	A	2	3	1
12	1	A	3	3	2
13	1	A	5	3	3
14	1	A	5	3	4
15	2	A	4	3	5
16	1	A	2	4	1
17	1	A	3	4	2
18	1	A	5	4	3
19	1	A	5	4	4
20	2	A	4	4	5
21	1	A	2	5	1
22	1	A	3	5	2
23	1	A	5	5	3
24	1	A	5	5	4
25	2	A	4	5	5
26	1	A	2	6	1
27	1	A	3	6	2
28	1	A	5	6	3
29	1	A	5	6	4
30	2	A	4	6	5
31	1	A	2	7	1
32	1	A	3	7	2
33	1	A	5	7	3
34	1	A	5	7	4
35	2	A	4	7	5
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id_staff, hire_date, education, cnp_staff, contact, id_hospital) FROM stdin;
1	1999-10-10	Iuliu Hațieganu University of Medicine and Pharmacy 	1800804111234	0725825123	1
2	1990-05-05	Iuliu Hațieganu University of Medicine and Pharmacy 	2970715110030	0725825999	5
4	2001-09-03	Victor Babes University of Medicine and Pharmacy	1950303350012	0721825700	3
5	1985-04-04	Carol Davila University of Medicine and Pharmacy 	1900713120014	0711825009	2
6	2000-07-12	Carol Davila University of Medicine and Pharmacy 	2930217335005	0725956922	6
7	2018-10-10	Iuliu Hațieganu University of Medicine and Pharmacy 	2901010120002	0721825701	4
8	1989-07-16	Iuliu Hațieganu University of Medicine and Pharmacy 	2600716120001	0771956988	7
10	2010-09-09	Scoala Postliceala de Asistenti Generali "Carol Davila"	2800804114549	0771956989	7
11	2023-12-12	Iuliu Hațieganu University of Medicine and Pharmacy 	6030817125771	0725665999	7
12	2023-12-01	Iuliu Hațieganu University of Medicine and Pharmacy 	6030910350020	0711242525	7
13	2022-05-04	Babes-Bolyai University of Cluj-Napoca	6030107410028	0711242524	7
\.


--
-- Data for Name: stay; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stay (id_stay, id_hospital, check_in, check_out, id_room) FROM stdin;
3	5	2008-02-25	2008-03-08	2
4	3	2012-07-05	2012-07-05	2
6	2	2017-01-15	2017-01-15	2
7	2	2022-01-22	2022-01-22	2
2	3	2006-10-15	2006-10-15	2
8	2	2023-12-22	2024-02-02	4
9	1	2023-12-24	2023-12-24	4
11	6	2024-01-01	2024-02-01	28
12	6	2010-05-05	2010-05-05	27
13	1	2004-03-03	2004-03-08	4
14	2	2003-09-10	2003-09-13	6
15	2	2024-01-07	2024-01-15	7
17	1	1997-07-14	1997-07-20	2
16	1	1980-08-04	1980-08-06	4
18	2	1995-03-01	1995-03-05	6
19	7	1990-07-10	1990-07-15	34
20	2	1993-02-15	1993-02-18	9
1	2	2004-02-25	2004-03-08	1
21	7	1990-10-09	1990-10-12	32
10	6	2003-01-07	2003-01-07	28
22	4	1999-10-08	1999-10-15	22
23	4	1976-08-03	1976-08-06	23
24	4	1980-08-01	1980-08-05	24
25	7	2003-08-15	2003-08-18	35
26	7	2003-04-01	2003-04-05	34
27	6	2003-04-28	2003-04-30	29
28	7	1960-07-16	1960-07-17	33
29	7	2024-01-01	2024-02-01	33
30	7	2024-01-01	2024-01-28	31
31	7	2024-01-08	2024-01-17	32
32	4	2010-05-13	2010-05-13	19
33	7	2023-12-31	2024-02-02	33
37	7	2023-12-20	2024-01-18	31
34	7	2023-12-30	2024-01-29	32
36	7	2023-12-29	2024-01-17	33
38	7	2022-02-01	2022-02-03	32
46	7	2024-01-08	2024-01-08	32
47	7	2024-01-12	2024-01-12	31
\.


--
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_department_id_seq', 35, true);


--
-- Name: disease_id_disease_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disease_id_disease_seq', 8, true);


--
-- Name: hopital2_id_hospital_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hopital2_id_hospital_seq', 7, true);


--
-- Name: newtable_id_deaths_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newtable_id_deaths_seq', 77, true);


--
-- Name: newtable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newtable_id_seq', 1, true);


--
-- Name: position_id_position_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_id_position_seq', 16, true);


--
-- Name: registration_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registration_registration_id_seq', 48, true);


--
-- Name: room_id_room_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_id_room_seq', 35, true);


--
-- Name: staff_id_staff_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_staff_seq', 13, true);


--
-- Name: stay_id_stay_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stay_id_stay_seq', 47, true);


--
-- Name: department department_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pk PRIMARY KEY (department_id);


--
-- Name: disease disease_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_pk PRIMARY KEY (id_disease);


--
-- Name: hopital2 hopital2_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hopital2
    ADD CONSTRAINT hopital2_pk PRIMARY KEY (id_hospital);


--
-- Name: deaths numberofdeaths_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deaths
    ADD CONSTRAINT numberofdeaths_pk PRIMARY KEY (id_deaths);


--
-- Name: person person_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pk PRIMARY KEY (cnp);


--
-- Name: person person_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_un UNIQUE (cnp);


--
-- Name: position position_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pk PRIMARY KEY (id_position);


--
-- Name: registration registration_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_pk PRIMARY KEY (registration_id);


--
-- Name: room room_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pk PRIMARY KEY (id_room);


--
-- Name: staff staff_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pk PRIMARY KEY (id_staff);


--
-- Name: staff staff_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_un UNIQUE (contact);


--
-- Name: stay stay_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stay
    ADD CONSTRAINT stay_pk PRIMARY KEY (id_stay);


--
-- Name: department department_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_fk FOREIGN KEY (id_head) REFERENCES public.staff(id_staff) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: department department_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_fk_1 FOREIGN KEY (id_hospital) REFERENCES public.hopital2(id_hospital) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: hopital2 hopital2_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hopital2
    ADD CONSTRAINT hopital2_fk FOREIGN KEY (id_admin) REFERENCES public.staff(id_staff) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: deaths numberofdeaths_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deaths
    ADD CONSTRAINT numberofdeaths_fk FOREIGN KEY (id_hospital) REFERENCES public.hopital2(id_hospital) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: position position_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_fk FOREIGN KEY (id_staff) REFERENCES public.staff(id_staff) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: registration registration_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_fk FOREIGN KEY (id_hospital) REFERENCES public.hopital2(id_hospital) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: registration registration_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_fk_1 FOREIGN KEY (id_disease) REFERENCES public.disease(id_disease) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: registration registration_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_fk_2 FOREIGN KEY (stay_id) REFERENCES public.stay(id_stay) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: registration registration_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_fk_3 FOREIGN KEY (registr_cnp) REFERENCES public.person(cnp) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: room room_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_fk FOREIGN KEY (hospital_id) REFERENCES public.hopital2(id_hospital) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: staff staff_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_fk FOREIGN KEY (cnp_staff) REFERENCES public.person(cnp) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: stay stay_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stay
    ADD CONSTRAINT stay_fk FOREIGN KEY (id_room) REFERENCES public.room(id_room) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: stay stay_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stay
    ADD CONSTRAINT stay_fk_1 FOREIGN KEY (id_hospital) REFERENCES public.hopital2(id_hospital) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

