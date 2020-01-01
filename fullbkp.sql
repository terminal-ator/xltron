--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5fd383695d051e451102dfa2b4520993f';






\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-1.pgdg18.04+1)

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
-- PostgreSQL database dump complete
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-1.pgdg18.04+1)

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

SET default_with_oids = false;

--
-- Name: banks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banks (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp without time zone,
    updated_at timestamp without time zone,
    company_id integer
);


ALTER TABLE public.banks OWNER TO postgres;

--
-- Name: banks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banks_id_seq OWNER TO postgres;

--
-- Name: banks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banks_id_seq OWNED BY public.banks.id;


--
-- Name: chq_reg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chq_reg (
    id integer NOT NULL,
    createat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updatedat timestamp without time zone,
    deletedat timestamp without time zone,
    postedat date NOT NULL,
    chqno text,
    bankname text,
    chqdate date,
    name text,
    amount integer,
    bank_id integer,
    company_id integer,
    cust_id integer,
    has_bounced integer DEFAULT 0,
    notes text
);


ALTER TABLE public.chq_reg OWNER TO postgres;

--
-- Name: chq_reg_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chq_reg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chq_reg_id_seq OWNER TO postgres;

--
-- Name: chq_reg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chq_reg_id_seq OWNED BY public.chq_reg.id;


--
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    id integer NOT NULL,
    name text,
    year text
);


ALTER TABLE public.company OWNER TO postgres;

--
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_id_seq OWNER TO postgres;

--
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_id_seq OWNED BY public.company.id;


--
-- Name: company_masters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_masters (
    id integer NOT NULL,
    name text,
    company_id integer
);


ALTER TABLE public.company_masters OWNER TO postgres;

--
-- Name: company_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_masters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_masters_id_seq OWNER TO postgres;

--
-- Name: company_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_masters_id_seq OWNED BY public.company_masters.id;


--
-- Name: cust_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cust_id_seq
    START WITH 758
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cust_id_seq OWNER TO postgres;

--
-- Name: error_ledger; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.error_ledger (
    id integer,
    cust_id integer,
    master_id integer,
    master_name text,
    ledger_type text,
    ledger_date date,
    ledger_no text,
    associated_id integer,
    to_customer double precision,
    from_customer double precision,
    user_id integer,
    company_id integer,
    created_at timestamp without time zone,
    update_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.error_ledger OWNER TO postgres;

--
-- Name: files_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_table (
    id integer NOT NULL,
    location text,
    original text,
    filename text,
    company text,
    company_id integer
);


ALTER TABLE public.files_table OWNER TO postgres;

--
-- Name: files_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_table_id_seq OWNER TO postgres;

--
-- Name: files_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_table_id_seq OWNED BY public.files_table.id;


--
-- Name: ledger; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ledger (
    id integer NOT NULL,
    cust_id integer,
    master_id integer,
    master_name text,
    ledger_type text,
    ledger_date date,
    ledger_no text,
    associated_id integer,
    to_customer double precision,
    from_customer double precision,
    user_id integer,
    company_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.ledger OWNER TO postgres;

--
-- Name: ledger_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ledger_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ledger_id_seq OWNER TO postgres;

--
-- Name: ledger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ledger_id_seq OWNED BY public.ledger.id;


--
-- Name: master_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_groups (
    id integer NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    name text
);


ALTER TABLE public.master_groups OWNER TO postgres;

--
-- Name: master_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.master_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.master_groups_id_seq OWNER TO postgres;

--
-- Name: master_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.master_groups_id_seq OWNED BY public.master_groups.id;


--
-- Name: master_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.master_id_seq
    START WITH 1012
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.master_id_seq OWNER TO postgres;

--
-- Name: masters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.masters (
    id integer DEFAULT nextval('public.master_id_seq'::regclass) NOT NULL,
    cust_id integer,
    ismaster integer,
    name character varying,
    address character varying,
    area character varying,
    interface_code character varying,
    created_at character varying,
    updated_at character varying,
    deleted_at character varying,
    company_id integer DEFAULT 1,
    chq_flg integer DEFAULT 0,
    group_id integer,
    is_new integer DEFAULT 0
);


ALTER TABLE public.masters OWNER TO postgres;

--
-- Name: statement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statement_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statement_id_seq OWNER TO postgres;

--
-- Name: statement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statement (
    id integer DEFAULT nextval('public.statement_id_seq'::regclass) NOT NULL,
    date date,
    narration character varying,
    refno character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    user_id integer,
    master_id integer,
    cust_id integer,
    deposit double precision,
    withdrawl double precision,
    bank_id integer,
    company_id integer DEFAULT 1,
    exported_time integer DEFAULT 0
);


ALTER TABLE public.statement OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    password character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: banks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks ALTER COLUMN id SET DEFAULT nextval('public.banks_id_seq'::regclass);


--
-- Name: chq_reg id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chq_reg ALTER COLUMN id SET DEFAULT nextval('public.chq_reg_id_seq'::regclass);


--
-- Name: company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company ALTER COLUMN id SET DEFAULT nextval('public.company_id_seq'::regclass);


--
-- Name: company_masters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_masters ALTER COLUMN id SET DEFAULT nextval('public.company_masters_id_seq'::regclass);


--
-- Name: files_table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_table ALTER COLUMN id SET DEFAULT nextval('public.files_table_id_seq'::regclass);


--
-- Name: ledger id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger ALTER COLUMN id SET DEFAULT nextval('public.ledger_id_seq'::regclass);


--
-- Name: master_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_groups ALTER COLUMN id SET DEFAULT nextval('public.master_groups_id_seq'::regclass);


--
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banks (id, name, created_at, deleted_at, updated_at, company_id) FROM stdin;
1	Dummy Bank	2019-10-29 11:28:51.611291	\N	\N	1
2	TTC HDFC CA	2019-10-29 11:29:10.9701	\N	\N	1
3	TTC HDFC OD	2019-10-29 11:29:18.973731	\N	\N	1
4	JP HDFC CA	2019-10-29 11:29:35.557645	\N	\N	2
5	JP HDFC OD	2019-10-29 11:29:41.484838	\N	\N	2
\.


--
-- Data for Name: chq_reg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chq_reg (id, createat, updatedat, deletedat, postedat, chqno, bankname, chqdate, name, amount, bank_id, company_id, cust_id, has_bounced, notes) FROM stdin;
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (id, name, year) FROM stdin;
1	Tushar Trading Co.	2019-20
2	JP Enterprises	2019-20
\.


--
-- Data for Name: company_masters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_masters (id, name, company_id) FROM stdin;
1	Colgate	2
2	Cadbury	2
3	Dabur	2
4	Marg	2
5	Godrej	2
\.


--
-- Data for Name: error_ledger; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.error_ledger (id, cust_id, master_id, master_name, ledger_type, ledger_date, ledger_no, associated_id, to_customer, from_customer, user_id, company_id, created_at, update_at, deleted_at) FROM stdin;
\N	\N	\N	MITTAL TRADERS	colgate	2019-09-10	0012	\N	0	\N	\N	2	\N	\N	\N
\N	\N	\N	 TUSHA	colgate	2019-10-01	 0032	\N	0	\N	\N	2	\N	\N	\N
\N	\N	\N	 TUSHA	colgate	2019-10-01	 0032	\N	0	\N	\N	2	\N	\N	\N
\N	\N	\N	 TUSHA	colgate	2019-10-01	0332	\N	20192	\N	\N	2	\N	\N	\N
\N	\N	\N	 TUSHA	colgate	2019-10-01	0332	\N	20192	\N	\N	2	\N	\N	\N
\N	\N	\N	DEEPAK TRADING CO	2	2019-09-02	00932	\N	202910	\N	\N	0	\N	\N	\N
\.


--
-- Data for Name: files_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_table (id, location, original, filename, company, company_id) FROM stdin;
1	./upload		./json/test.csv2019-12-16T09:26:01+05:30.json	colgate	1
2	./upload		./json/test2.csv2019-12-16T18:27:06+05:30.json	colgate	2
3	./upload		./json/test2.csv2019-12-16T18:32:45+05:30.json	colgate	2
4	./upload		./json/test2.csv2019-12-16T18:42:04+05:30.json	colgate	2
5	./upload		./json/test2.csv2019-12-16T18:42:40+05:30.json	colgate	2
6	./upload		./json/test3.csv2019-12-16T18:43:49+05:30.json	colgate	2
7	./upload		./json/test3.csv2019-12-22T14:52:02+05:30.json	colgate	2
8	./upload		./json/test3.csv2019-12-22T14:53:10+05:30.json	colgate	2
9	./upload		./json/test3.csv2019-12-22T14:54:47+05:30.json	colgate	2
10	./upload		./json/test3.csv2019-12-22T14:56:09+05:30.json	colgate	2
11	./upload		./json/test4.csv2019-12-22T14:57:47+05:30.json	colgate	2
12	./upload		./json/test4.csv2019-12-22T15:03:25+05:30.json	colgate	2
13	./upload		./json/test4.csv2019-12-22T15:07:08+05:30.json	colgate	2
14	./upload		./json/test4.csv2019-12-22T15:27:00+05:30.json	2	0
15	./upload		./json/test4.csv2019-12-22T15:34:47+05:30.json	Cadbury	2
\.


--
-- Data for Name: ledger; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ledger (id, cust_id, master_id, master_name, ledger_type, ledger_date, ledger_no, associated_id, to_customer, from_customer, user_id, company_id, created_at, update_at, deleted_at) FROM stdin;
4	359	2419	MITTAL TRADERS	colgate	2019-09-10	0212	\N	202932	\N	\N	2	2019-12-16 19:07:15.439033	\N	\N
6	1094	3300	DEEPAK TRADING CO	colgate	2019-09-02	0093	\N	202910	\N	\N	2	2019-12-22 15:07:08.700087	\N	\N
7	1094	3300	DEEPAK TRADING CO	Cadbury	2019-09-02	00932	\N	202910	\N	\N	2	2019-12-22 15:34:47.896635	\N	\N
\.


--
-- Data for Name: master_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.master_groups (id, create_at, name) FROM stdin;
1	2019-10-31 18:01:51.053624	Sundry Debtors
2	2019-10-31 18:01:57.002215	Sundry Creditors
3	2019-11-05 12:13:23.74154	Cash Contra
4	2019-11-05 17:28:30.692576	Bank Charges
\.


--
-- Data for Name: masters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.masters (id, cust_id, ismaster, name, address, area, interface_code, created_at, updated_at, deleted_at, company_id, chq_flg, group_id, is_new) FROM stdin;
3338	1131	\N	DAY TO DAY SHOPPING MART	\N		MARG	41:53.9	\N	\N	2	1	1	0
2000	95	1	BALAJI DEPARTMENTAL STORE	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
2523	434	\N	BIG SHOP	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
1620	1	\N	AGGARWAL DEPATMENT STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3266	1061	1	SARVODYA MILK AND VEGETAB	\N		MARG	35:33.5	\N	\N	2	1	1	0
1667	17	1	POOJA CONFECTIONERY AND PASTY	\N		MARG	35:52.7	\N	\N	2	1	1	0
2721	586	1	GARG KIRANA	\N		MARG	35:52.7	\N	\N	2	1	1	0
1811	47	1	RUSH-OUR THE PASTRY SHOP	\N	ALPHA 2 DELTA 2	CAD	35:52.7	\N	\N	2	1	1	0
3122	901	1	VERMA CANTEEN STORE	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
2524	434	\N	BIG SHOP	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
3478	1263	1	Dummy 2	\N	\N	TALLY	\N	\N	\N	2	1	1	0
2525	434	\N	BIG SHOP	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
3339	1131	\N	DAY TO DAY SHOPPING MART	\N		MARG	41:53.9	\N	\N	2	1	1	0
1622	3	\N	ARN MEGAMART LLP	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
19	19	1	AGGARWAL KIRANA & GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
1623	3	\N	ARN MEGAMART LLP	\N		MARG	35:52.7	\N	\N	2	1	1	0
3475	1260	1	Dainik Bazar	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1624	3	\N	ARN MEGAMART LLP	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	1	1	0
2818	656	\N	KHUSHI ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	1	1	0
2819	656	\N	KHUSHI ENTERPRISES	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1013	762	1	Mondelez Pvt Ltd	\N	\N	\N	2019-10-01 19:32:10.472126+05:30	\N	\N	1	1	2	0
3473	1258	1	Drawings	\N	\N	TALLY	\N	\N	\N	2	1	2	0
3454	1245	1	Suspense Account	\N	\N	\N	\N	\N	\N	2	1	1	0
3535	782	1	SUS DINESH SINGH	\N	\N	TALLY	\N	\N	\N	1	1	2	0
3567	1313	1	SUS LAXMI KUMARI	\N	\N	TALLY	\N	\N	\N	2	1	1	0
2345	306	1	ROHIT MEDICAL STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
2941	747	1	PRINCE KIRANA STORE	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1653	12	1	GUPTA GROCERY STORE	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	1	1	0
3564	1310	1	SUS Manvendra Singh	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1012	761	1	Suspense Account	\N	\N	\N	2019-10-01 18:45:57.405537+05:30	\N	\N	1	1	1	0
3477	1262	1	GAGAN DAIRY	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3455	1246	1	Bank Charges	\N	\N	\N	\N	\N	\N	2	1	4	0
2015	97	1	Every Day Shopping Mart Pvt  Ltd	\N		GOD	26:18.6	\N	\N	2	1	1	0
2568	471	1	CITY SUPERMART	\N		MARG	35:52.7	\N	\N	2	1	1	0
3341	1131	\N	DAY TO DAY SHOPPING MART PVT LTD	\N		DAB	36:19.3	\N	\N	2	1	1	0
3488	1266	1	ISNEWCHECK	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1015	764	1	Colgate	\N	\N	\N	2019-10-01 19:32:31.081691+05:30	\N	\N	1	1	2	0
1897	68	1	EVERGREEN PHARMA	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
3577	812	1	ARN MEGA MART	\N	\N	TALLY	\N	\N	\N	1	1	1	0
1642	9	1	E-VOLENTI GENERAL STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
3471	1256	1	Bank Loan	\N	\N	TALLY	\N	\N	\N	2	1	2	0
3340	1131	1	DAY TO DAY SHOPPING MART PVT LTD	\N		DAB	36:19.3	\N	\N	2	1	1	0
1881	64	1	YUKTI TRADING COMPANY	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	1	1	0
3272	1070	\N	FRESHLEE RETAILS PRIVATE LIMITED	\N		COL	23:21.7	\N	\N	2	1	1	0
3277	1070	\N	FRESHLEE RETAILS PRIVATE LIMITED	\N		COL	23:21.7	\N	\N	2	1	1	0
3274	1070	\N	FRESHLEE RETAILS PRIVATE LIMITED	\N		COL	23:21.7	\N	\N	2	1	1	0
3566	1312	1	SUS ASHWANI KUMAR VERMA 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3273	1070	\N	FRESHLEE RETAILS PRIVATE LIMITED	\N		COL	23:21.7	\N	\N	2	1	1	0
3369	1161	1	MAX 24 PHARMACY	\N		MARG	38:21.8	\N	\N	2	1	1	0
3304	1070	\N	FRESHLEE RETAILS PVT LTD	\N		MARG	25:07.2	\N	\N	2	1	1	0
3541	788	1	AMIT GENERAL STORE	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3275	1070	1	FRESHLEE RETAILS PRIVATE LIMITED	\N		COL	23:21.7	\N	\N	2	1	1	0
1017	766	1	Perfetti	\N	\N	\N	2019-10-01 19:33:13.322012+05:30	\N	\N	1	1	2	0
3565	1311	1	SUS SACHIN GUPTA	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3534	781	1	SUS RAM BABAU KHACH	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3542	789	1	BRIJ BHIHARI	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3547	794	1	PAWAN TRADING	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3550	797	1	NAND MURTI DUSTBUTER	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3543	790	1	SATISH CHAND KAPIL CHAND	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3546	793	1	GOEL CYCLE STORE 	\N	\N	TALLY	\N	\N	\N	1	1	2	0
3453	1244	1	Cash	\N	\N		\N	\N	\N	2	1	3	0
1018	767	1	Bajaj	\N	\N	\N	2019-10-01 19:33:20.659165+05:30	\N	\N	1	1	2	0
1014	763	1	Godrej	\N	\N	\N	2019-10-01 19:32:17.429487+05:30	\N	\N	1	1	2	0
1016	765	1	Ayur	\N	\N	\N	2019-10-01 19:32:36.743706+05:30	\N	\N	1	1	2	0
3536	783	1	GST PAID	\N	\N	TALLY	\N	\N	\N	1	1	2	0
429	429	1	RADHEY LAL JAI PRAKASH			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
3581	816	1	SUS RESILIENT INNOVATION	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3576	811	1	SUS BHARAT MERCHAT	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3579	814	1	SHUBH MOBILES ZONE	\N	\N	TALLY	\N	\N	\N	1	1	2	0
3568	1314	1	SUS DS ASSOCIATE	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3555	802	1	Hygine pharmcy	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3472	1257	1	Car Loan	\N	\N	TALLY	\N	\N	\N	2	1	2	0
3569	1315	1	SUS PREETI SINGH	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3570	1316	1	J K TRADERS	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3554	801	1	BHAGWATI TRADERS	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3553	800	1	SUS VIKASH KUMAR	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3572	1318	1	SHREE SAI ENTERPRISES	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1627	4	\N	ARYAVART MEDICOS	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
1628	4	\N	ARYAVART MEDICOS	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	1	1	0
3571	1317	1	SHRI TRADING COMPANY	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1629	4	\N	ARYAVART MEDICOS	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1631	5	\N	BHARAT MEDICAL	\N		MARG	35:52.7	\N	\N	2	1	1	0
3303	1070	\N	FRESHLEE RETAILS PVT LTD	\N		MARG	25:07.2	\N	\N	2	1	1	0
3479	1264	1	MODI FOOD PRODUCTS	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3307	1070	\N	FRESHLEE RETAILS PVT LTD	\N		MARG	25:07.2	\N	\N	2	1	1	0
108	108	1	CHOUDHARI SWEETS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
3476	1261	1	KDM Stores	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3201	977	1	CHOUDHARY GENERAL STORE	\N		COL	35:52.7	\N	\N	2	1	1	0
326	326	1	MKS CONFECTIONERY & SUPER MARKET			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
3552	799	1	VIDYA MEDICAL STORE	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3578	813	1	SHRI TRADING COM . 	\N	\N	TALLY	\N	\N	\N	1	1	2	0
3580	815	1	HEMANT PHARMACY	\N	\N	TALLY	\N	\N	\N	1	1	1	0
1890	67	1	BAJRANG SHOPPING CENTRE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
2878	700	1	DAILY FRESH DEPATMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3582	817	1	MAA BHAGWATI GENERAL STORE	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3583	818	1	TAUHID	\N	\N	TALLY	\N	\N	\N	1	1	1	0
1986	91	1	SHIV SHAKTI GENERAL STORE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1633	6	\N	CALYFOX RETAILS PRIVATE LIMITED	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	1	1	0
3474	1259	1	GST Paid	\N	\N	TALLY	\N	\N	\N	2	1	2	0
3490	1268	1	INCOME TAX PAID	\N	\N	TALLY	\N	\N	\N	2	1	2	0
3491	1269	1	Mukesh Kumar Garg	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1634	6	\N	CALYFOX RETAILS PRIVATE LIMITED	\N		MARG	35:52.7	\N	\N	2	1	1	0
1635	6	\N	CALYFOX RETAILS PRIVATE LIMITE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
1636	6	\N	CALYFOX RETAILS PRIVATE LIMITED	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
3489	1267	1	Fuel Expenses	\N	\N	TALLY	\N	\N	\N	2	1	2	0
974	730	0	TTC		0	MARG	2019-01-12 14:53:56.514863+05:30	2019-01-12 14:53:56.514863+05:30		1	0	2	0
3468	1253	1	Ferrero India Pvt Ltd	\N	\N	TALLY	\N	\N	\N	2	1	2	0
3466	1251	1	Redbull India Pvt Ltd	\N	\N	TALLY	\N	\N	\N	2	1	2	0
1640	8	\N	DEV MISTHAN BANDHAR	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	0	1	0
3556	803	1	JHAL	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3557	804	1	KASAV GOYAL 	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3507	779	1	AMIR	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3584	819	1	AIRPLAZA RETAILS 	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3305	1070	\N	FRESHLEE RETAILS PVT LTD	\N		MARG	25:07.2	\N	\N	2	1	1	0
1641	8	\N	DEV MISTHAN BHANDAR AND C	\N		MARG	45:36.2	\N	\N	2	0	1	0
3306	1070	\N	FRESHLEE RETAILS PVT LTD	\N		MARG	25:07.2	\N	\N	2	1	1	0
3492	1270	1	Tiwari Departmental Store	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3092	873	1	PRASAD GROCERY & VEGETABLE STO	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	1	1	0
2034	101	\N	MED POINT PHARMACY & COSM	\N		MARG	45:36.2	\N	\N	2	1	1	0
1637	6	\N	CALYFOX RETAILS PRIVATE L	\N		MARG	35:52.7	\N	\N	2	1	1	0
2890	705	\N	VR MEDICOS	\N		MARG	56:16.3	\N	\N	2	1	1	0
1645	10	\N	FRIENDS PROVISIONAL STORE	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
1647	10	\N	FRIENDS PROVISIONAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1643	9	\N	E VOLENTI GENERAL STORE	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	1	1	0
1644	9	\N	E-VOLENTI GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3279	1074	1	G-ONE SUPER MART	\N		COL	23:21.7	\N	\N	2	1	1	0
3459	1248	1	API DUMMY	\N	\N	TALLY	\N	\N	\N	2	1	4	0
3461	769	1	Check	\N	\N	TALLY	\N	\N	\N	1	1	1	0
1806	46	\N	RATAN - MEDICOSE PVT. LTD	\N		MARG	35:52.7	\N	\N	2	1	1	0
1748	35	\N	BHAVISHYA STORE	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
3470	1255	1	Dabur India Pvt Ltd	\N	\N	TALLY	\N	\N	\N	2	1	2	0
1807	46	\N	RATAN - MEDICOS PVT. LTD.	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
1808	46	\N	RATAN - MEDICOSE PVT. LTD.	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
1810	46	\N	RATAN MEDICOS PVT  LTD	\N		DAB	31:07.7	\N	\N	2	1	1	0
3504	1282	1	SATYA PAL SINGH 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3508	1285	1	AMIR	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3509	1286	1	SUS PRAVIN KUMAR	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3506	1284	1	ANUPAM KUMARI	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3505	1283	1	HARENDRA KUMAR 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3464	1249	1	Godrej Consumer Products Pvt Ltd	\N	\N	TALLY	\N	\N	\N	2	1	2	0
3573	1319	1	SUS-SATISH SETH	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3510	1287	1	ALPHA-2 UNIT 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1648	10	\N	FRIENDS PROVISIONAL STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2035	101	1	MED POINT  PHARMACY COSMATICS	\N		GOD	26:18.6	\N	\N	2	1	1	0
1650	11	\N	GAYATRI ENTERPRISES	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
3514	1291	1	SUS RAVISH KUMAR	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3465	1250	1	Mondelez Food Pvt Ltd	\N	\N	TALLY	\N	\N	\N	2	1	2	0
1651	11	\N	GAYATRI ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	0	1	0
1652	11	\N	GAYATRI ENTERPRISES	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
1832	52	1	JAI BHAWANI KIRANA STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
3469	1254	1	Colgate India Pvt Ltd	\N	\N	TALLY	\N	\N	\N	2	1	2	0
1949	81	1	GOYAL SUPERMART	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
3296	1090	1	PATANJALI KIRANA STORE	\N		MARG	25:07.2	\N	\N	2	1	1	0
3562	809	1	SUS NAVIN YADAV	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3558	805	1	SUS MUNSHILAL	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3559	806	1	SUS ATUL CHAUAN	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3561	808	1	SUS MANOJ KUMAR	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3467	1252	1	Marico Pvt Ltd	\N	\N	TALLY	\N	\N	\N	2	1	2	0
1658	13	\N	HAMARA SAHYOG	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
1659	13	\N	HAMARA SAHYOG	\N		MARG	35:52.7	\N	\N	2	1	1	0
1654	12	\N	GUPTA GROCERY STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
3456	1247	1	Suspense Debitor	\N	\N	\N	\N	\N	\N	2	0	2	0
3460	768	1	Dummy from App	\N	\N	TALLY	\N	\N	\N	1	1	3	0
3462	770	1	Hey	\N	\N	TALLY	\N	\N	\N	1	1	1	0
1655	12	\N	GUPTA GROCERY STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3480	1265	1	DANISH GENERAL STORE	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1656	12	\N	GUPTA GROCERY STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
1664	15	\N	HEALTHCARE PHARMACY	\N		MARG	35:52.7	\N	\N	2	0	1	0
3575	1321	1	SUS RESILIENT INNOVATION	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1666	16	\N	NIDHI SUPERMARKET	\N		MARG	35:52.7	\N	\N	2	0	1	0
3574	1320	1	SUS HARENDRA KUMAR	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3512	1289	1	UMESH KUMAR 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1668	17	\N	POOJA CONFECTIONERY AND PASTRY	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	1	1	0
1669	17	\N	POOJA CONFECTIONERY AND P	\N		MARG	35:52.7	\N	\N	2	1	1	0
3563	810	1	SUS BHUPENDRA PATHAK	\N	\N	TALLY	\N	\N	\N	1	1	1	0
186	186	1	GOYAL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
3463	771	1	Godrej Consumer Products Pvt Ltd	\N	\N	TALLY	\N	\N	\N	1	1	2	0
1687	23	1	AGGARWAL KIRANA  AND GENERAL STORE	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
1671	18	\N	SARVODYA MILK AND VEGETABLE MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
3560	807	1	SANGRAM TRADING COM.	\N	\N	TALLY	\N	\N	\N	1	1	1	0
1625	3	1	ARN MEGAMART LLP	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
3513	1290	1	OM PROVISION STORE	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3511	1288	1	SUS RAJEEV KUMAR	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3515	1292	1	SUS SAHIDUL MIA 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1661	14	\N	HARIOM PROVISION STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
1662	14	\N	HARIOM PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1672	18	\N	SARVODYA MILK AND VEGETABLE MART	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	0	1	0
1679	20	\N	SHRI BALA JI MEDICOSE	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	1	1	0
1681	20	\N	SHRI BALA JI MEDICOSE	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
3487	778	1	BANK CHARGES	\N	\N	TALLY	\N	\N	\N	1	1	1	0
2763	616	\N	FRESH ZONE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
3519	1296	1	SUS AJAB SINGH	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1685	22	\N	AGGARWAL FOOD PLAZA	\N		MARG	35:52.7	\N	\N	2	1	1	0
938	692	0	DURGA TRADING CO.			COL	2018-12-25 15:25:18.402421+05:30			1	0	1	0
1673	18	\N	SARVODAYA MILK & VEG MART	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
1686	22	\N	AGGARWAL FOOD PLAZA	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
3518	1295	1	SUS WALLETMONE 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3484	775	1	Car Loan	\N	\N	TALLY	\N	\N	\N	1	1	2	0
1683	21	\N	SUVIDHA SUPER BAZAR	\N		MARG	35:52.7	\N	\N	2	1	1	0
3551	798	1	SUBHASH KIRANA STORE	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3539	786	1	DAINIK BAZAR	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3482	773	1	Cash	\N	\N	TALLY	\N	\N	\N	1	1	3	0
3485	776	1	BANK INTEREST	\N	\N	TALLY	\N	\N	\N	1	1	2	0
3481	772	1	DRAWINGS	\N	\N	TALLY	\N	\N	\N	1	1	2	0
3585	820	1	LOKESH KUMAR DHANESH KUMAR	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3586	821	1	PRIYA SHIV CONFECTIONERY	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3538	785	1	PANDIT DAYA SANKAR KIRANA 	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3486	777	1	DEEPAK TRADING COM.	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3540	787	1	SHRI BANKAY BHIHARI	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3545	792	1	JS SHOPPING MALL	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3549	796	1	PRAMOD KIRANA STORE	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3516	1293	1	SANTOSH CHANDRA MISH 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3548	795	1	priyanka kirana store	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3494	1272	1	D S Nagar	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3523	1300	1	SUS DHARMA SHARMA 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3537	784	1	RIDDIMA KIRANA STORE	\N	\N	TALLY	\N	\N	\N	1	1	1	0
3517	1294	1	SUS YATENDER KUMAR	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3521	1298	1	SUS GAURAV JAIN	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3493	1271	1	S.N. Mall	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3522	1299	1	SANJAY CHAURASIYA	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3520	1297	1	INDRESH 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3544	791	1	SN MALL	\N	\N	TALLY	\N	\N	\N	1	1	1	0
2622	513	1	ANTARIKSH ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	1	1	0
3483	774	1	Bank Loan	\N	\N	TALLY	\N	\N	\N	1	1	2	0
1674	19	\N	SHREE OM GENERAL STORE	\N	ACHER SOCIETY	MAR	35:52.7	\N	\N	2	1	1	0
1675	19	\N	SHREE OM GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1677	19	\N	SHREE OM GENERAL STORE	\N	SOCIETY	MAR	35:52.7	\N	\N	2	1	1	0
1678	19	\N	SHREEOM GENERAL STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
3531	1307	1	SUS BHARATPE MERCHANT	\N	\N	TALLY	\N	\N	\N	2	1	1	0
214	214	1	J.M.D GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
370	370	1	NITTU PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
449	449	1	RAJESWAR DAYAL PRADEEP KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
131	131	1	DSR@DS PROVISION MART			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
3524	1301	1	SUPER MART	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3587	822	1	SUS SANDEEP KUMAR 	\N	\N	TALLY	\N	\N	\N	1	1	1	0
269	269	1	KRISHNA DEPARTMENTAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
2712	577	\N	AGGARWAL KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
1701	26	\N	HARI OM DEPARTMENTAL STORE	\N	ALPHA 1 DELTA 1	CAD	35:52.7	\N	\N	2	1	1	0
1702	26	\N	HARIOM DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
349	349	1	NANCY CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
1699	25	\N	DHARMA FOOD JUNCTION	\N		MARG	35:52.7	\N	\N	2	1	1	0
930	667	0	YOGESH KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
462	462	1	RAMA PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
49	49	1	ANUJ MEDI			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
259	259	1	KHUSHI CONFECTIONARY			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
1688	23	\N	AGGARWAL KIRANA AND GENERAL STORE	\N	ALPHA 1 DELTA 1	CAD	35:52.7	\N	\N	2	1	1	0
1689	23	\N	AGGARAWL KIRANA & GENERAL STOR	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	1	1	0
1927	76	\N	TABS & CAPS	\N	GAAMMA 2	CAD	35:52.7	\N	\N	2	0	1	0
1690	23	\N	AGGARAWL KIRANA & GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3525	780	1	SUS ARUN GOYAL 	\N	\N	TALLY	\N	\N	\N	1	1	1	0
1691	23	\N	AGGARWL KIRANA & GENERAL STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
1692	23	\N	AGGARAWL KIRANA & GENERAL	\N		MARG	35:52.7	\N	\N	2	1	1	0
1694	24	\N	APNA STORE	\N	ALPHA 1 DELTA 1	CAD	35:52.7	\N	\N	2	1	1	0
1695	24	\N	APNA STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	1	1	0
1696	24	\N	APNA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1697	24	\N	APNA STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
143	143	1	FARHAN AALAM CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
3528	1304	1	SPAY TECHNOLOGY 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3529	1305	1	SUS ISRAIL SAIFI 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3526	1302	1	SUS ARUN GOYAL 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3527	1303	1	SUS SACHIN SHESHRAO	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3530	1306	1	RESILENT INNOVATION	\N	\N	TALLY	\N	\N	\N	2	1	1	0
929	663	0	VISHAL READYMADE STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
942	662	0	VISHAL KUMAR JATIN KUMAR KIRANA STO			COL	2018-12-25 15:25:18.412921+05:30			1	0	1	0
1703	26	\N	HARIOM DEPARTMENTAL STORE	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
1704	26	\N	HARIOM DEPARTMENTAL STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
928	661	0	VISHAL CONFECTIONERS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
3495	1273	1	REAL BIZ SOLUTIONS	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3533	1309	1	USHIKA MADICAl store	\N	\N	TALLY	\N	\N	\N	2	1	1	0
3532	1308	1	SUS IBUSER LIFE LINE 	\N	\N	TALLY	\N	\N	\N	2	1	1	0
926	656	0	VINOD KUMAR PRAMOD KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
1705	27	\N	KUMAR PROVISION STORE	\N	ALPHA I	MAR	35:52.7	\N	\N	2	0	1	0
1707	27	\N	KUMAR PROVISION STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
927	658	0	VINOD READYMADE & GENERAL MERCHANT			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1708	27	\N	KUMAR PROVISION STORE	\N	ALPHA 1 DELTA 1	MAR	35:52.7	\N	\N	2	0	1	0
954	657	0	VINOD  MEDICAL STORE			COL	2018-12-25 15:25:18.431133+05:30			1	0	1	0
1709	27	\N	KUMAR PROVISION STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
1716	30	\N	PAWAN MEDICAL STORE	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	1	1	0
1717	30	\N	PAWAN MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1718	30	\N	PAWAN MEDICAL STORE	\N	ALPHA 1 DELTA 1	MAR	35:52.7	\N	\N	2	1	1	0
959	655	0	VINIT KANSAL KIRANA STORE			COL	2018-12-25 15:25:18.445115+05:30			1	0	1	0
1719	30	\N	PAWAN MEDICAL STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
1710	28	\N	OM SHANTI PROVISION STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	1	1	0
1712	28	\N	OM SHANTI PROVISION STORE	\N	ALPHA 1 DELTA 1	CAD	35:52.7	\N	\N	2	1	1	0
1713	28	\N	OM SHANTI PROVISION STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
1720	31	\N	SATYARTH GREEN PRODUCTS	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
1722	31	\N	SATYARTH GREEN PRODUCTS	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	1	1	0
1723	31	\N	SATYARTH GREEN PRODUCTS	\N		MARG	35:52.7	\N	\N	2	1	1	0
1724	31	\N	SATYARTH GREEN PRODUCTS	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
2050	105	\N	SONI SUPERMART	\N	SOCIETY	MAR	35:52.7	\N	\N	2	1	1	0
1726	32	\N	SINGHAL PROVISION STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
925	648	0	VIJAY - ATUL KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
924	646	0	VIBHOR TRADERS			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
3496	1274	1	SHIV MEDICOS	\N	\N	TALLY	\N	\N	\N	2	1	1	0
923	644	0	VERDHAMAN KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
922	642	0	VED PRAKASH JAI BHAGWAN			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
921	641	0	VASUDEV GENARAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
920	639	0	VANSH KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1750	35	\N	BHAVISHYA STORE	\N	ALPHA 2 DELTA 2	MAR	35:52.7	\N	\N	2	1	1	0
1727	32	\N	SINGHAL PROVISION STORE	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	1	1	0
1728	32	\N	SINGHAL PROVISION STORE	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
940	636	0	UPENDRA YADAV KIRANA STORE			COL	2018-12-25 15:25:18.410369+05:30			1	0	1	0
1729	32	\N	SINGHAL PROVISION STORE	\N	ALPHA 1 DELTA 1	MAR	35:52.7	\N	\N	2	1	1	0
1731	33	\N	TANEJA COSMETICS & GIFT SHOP	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
3500	1278	1	Ramakrishan Traders	\N	\N	TALLY	\N	\N	\N	2	1	2	0
919	634	0	TYAGI MEDICAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1732	33	\N	TANEJA COSMETIC & GIFT SHOP	\N		MARG	35:52.7	\N	\N	2	0	1	0
1733	33	\N	TANEJA COSMETIC  GIFT SHOP	\N	ALPHA I	MAR	35:52.7	\N	\N	2	0	1	0
3503	1281	1	Shweta Garg	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1734	33	\N	TANEJA COSMATICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
918	631	0	TEJBHAN SITARAM			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1735	33	\N	TANEJA COSMETICS	\N	ALPHA 1 DELTA 1	CAD	35:52.7	\N	\N	2	0	1	0
3502	1280	1	Deepak Garg	\N	\N	TALLY	\N	\N	\N	2	1	1	0
1736	33	\N	TANEJA COSMETIC & GIFT SHOP	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
3499	1277	1	Insurance	\N	\N	TALLY	\N	\N	\N	2	1	2	0
917	629	0	SWETA BEAUTY PARLOUR			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1737	33	\N	TANEJA COSMETIC & GIFT SH	\N		MARG	35:52.7	\N	\N	2	0	1	0
1730	32	\N	SINGHAL PROVISION STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
1739	33	\N	TANEJA COSMATIC & GIFT SHOP	\N		GOD	30:40.7	\N	\N	2	0	1	0
3498	1276	1	Manoj Kumar	\N	\N	TALLY	\N	\N	\N	2	1	2	0
914	625	0	SURESH CHAND PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
913	624	0	SURESH CHAND KULDEEP KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
3497	1275	1	Electricity Charges	\N	\N	TALLY	\N	\N	\N	2	1	2	0
912	621	0	SUPER GARMENTS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
915	626	0	SURESH GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
916	627	0	SUSHIL KUMAR & SONS			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
1752	36	\N	DUTTA ICECREAM PARLOUR	\N	ALPHA 2 DELTA 2	CAD	35:52.7	\N	\N	2	0	1	0
911	619	0	SUNIL KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
3501	1279	1	Bank Interest	\N	\N	TALLY	\N	\N	\N	2	1	2	0
1754	37	\N	GANPATI SWEETS	\N	ALPHA 2 DELTA 2	CAD	35:52.7	\N	\N	2	0	1	0
1755	38	\N	HARI OM PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1756	38	\N	HARI OM PROVISION STORE	\N	ALPHA 2 DELTA 2	MAR	35:52.7	\N	\N	2	0	1	0
1757	38	\N	HARI OM PROVISION STORE	\N	ALPHA I	MAR	35:52.7	\N	\N	2	0	1	0
1740	34	\N	BALAJI PROVISION STORE.	\N		MARG	35:52.7	\N	\N	2	1	1	0
1741	34	\N	BALAJI PROVISION STORE	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
1742	34	\N	BALAJI PROVISION STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	1	1	0
1743	34	\N	BALAJI PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1744	34	\N	BALAJI PROVISION STORE	\N	ALPHA 2 DELTA 2	MAR	35:52.7	\N	\N	2	1	1	0
1745	34	\N	BALAJI PROVISION STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
1746	34	\N	BALAJI PROVISION STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
1759	38	\N	HARI OM PROVISION STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
1760	39	\N	HEALTH CARE PHARMACY	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	0	1	0
1761	39	\N	HEALTH CARE PHARMA	\N		MARG	35:52.7	\N	\N	2	0	1	0
910	607	0	SUBODH KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1777	42	\N	LIFE CARE PHARMACY	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	1	1	0
1778	42	\N	LIFE CARE PHARMACY.	\N		MARG	35:52.7	\N	\N	2	1	1	0
1779	42	\N	LIFE CARE PHARMACY	\N	ALPHA 2 DELTA 2	CAD	35:52.7	\N	\N	2	1	1	0
1762	39	\N	HEALTH CARE PHARMACY	\N	ALPHA 2 DELTA 2	CAD	35:52.7	\N	\N	2	0	1	0
1780	42	\N	LIFE CARE PHARMACY	\N		MARG	35:52.7	\N	\N	2	1	1	0
1763	39	\N	HEALTH CARE PHARMACY	\N		MARG	35:52.7	\N	\N	2	0	1	0
909	605	0	SUBASH JAIN KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1770	41	\N	KULDEEP KIRANA STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	1	1	0
908	604	0	SUBASH GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1771	41	\N	KULDEEP KIRANA STORE	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
1772	41	\N	KULDEEP KIRANA STORE	\N	ALPHA 2 DELTA 2	MAR	35:52.7	\N	\N	2	1	1	0
1773	41	\N	KULDEEP KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
907	602	0	SS MALIK GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1775	41	\N	KULDEEP KIRANA STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
1776	41	\N	KULDEEP KIRANA STORE P3	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
1782	42	\N	LIFE CARE PHARMACY	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
964	598	0	SONAM GIFT CENTRE			COL	2018-12-25 15:25:18.450734+05:30			1	0	1	0
906	597	0	SONU CONFECTIONERS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
905	590	0	SINGHAL COSMATICS STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1765	40	\N	KALIKA PROVISION STORE	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
1767	40	\N	KALIKA PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1784	43	\N	LOYAL MART	\N	ALPHA 2 DELTA 2	CAD	35:52.7	\N	\N	2	0	1	0
1768	40	\N	KALIKA PROVISION STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	1	1	0
1769	40	\N	KALIKA PROVISION STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
1785	44	\N	RADHA RANI GENERAL STORE	\N	ALPHA I	MAR	35:52.7	\N	\N	2	0	1	0
1786	44	\N	RADHA RANI GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1787	44	\N	RADHARANI GENERAL STORE	\N	ALPHA 2 DELTA 2	CAD	35:52.7	\N	\N	2	0	1	0
903	581	0	SHYAM MEDICAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1788	44	\N	RADHA RANI GENERAL STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
1790	44	\N	Radha Rani General Store	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
902	577	0	SHRI SHYAM PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1792	45	\N	ZRAKESH GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
901	575	0	SHRI RAM TRADERS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1793	46	\N	RATAN - MEDICOSE PVT. LTD.	\N		MARG	35:52.7	\N	\N	2	1	1	0
1794	46	\N	RATAN MEDICOS PVT. LTD..	\N	ALPHA 2 DELTA 2	CAD	35:52.7	\N	\N	2	1	1	0
1795	46	\N	RATAN - MEDICOSE PVT. LTD.	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	1	1	0
1796	46	\N	RATAN MEDICOS PVT. LTD.	\N	TUGALPUR KNOW	CAD	35:52.7	\N	\N	2	1	1	0
904	583	0	SIDH BABA KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
762	125	0	DHRUV KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
900	571	0	SHRI NIWAS KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
763	126	0	DINESH KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
764	126	0	DINESH KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
899	570	0	SHRI MANGAL GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
765	127	0	DINESH STORES			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
767	135	0	DUM DUM MEDICOS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
898	569	0	SHRI HARI PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
1813	48	\N	AGGARWAL PROVISION STORE	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	0	1	0
1814	48	\N	ZAGGARWAL PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1823	50	\N	DHRUV KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1824	50	\N	DHRUV KIRANA STORE	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
1816	48	\N	AGGARWAL PROVISION STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
1825	50	\N	DHRUV KIRANA STORE	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1826	50	\N	DHRUV KIRANA STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
766	131	0	DSR@DS PROVISION MART			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
897	548	0	SHIV SHANKAR COSMATICS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
896	548	0	SHIV SHANKAR COSMATICS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
895	542	0	SHIV KUMAR SANJAY KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1812	47	\N	RUSH-OUR THE PASTRY SHOP	\N		MARG	35:52.7	\N	\N	2	1	1	0
894	540	0	SHIV KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
893	540	0	SHIV KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1817	49	\N	AGGARWAL TRADING CO	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
1819	49	\N	AGGARWAL TRADING CO.	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1820	49	\N	AGGARWAL TRADING CO.	\N		MARG	35:52.7	\N	\N	2	1	1	0
1821	49	\N	AGGARWAL TRADING CO.	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1828	52	\N	JAI BHAWANI KIRANA STORE	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
1829	52	\N	JAI BHAWANI KIRANA STORE	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1830	52	\N	JAI BHAWANI KIRANA STORE	\N	BEETA 1 RAMPUR	MAR	35:52.7	\N	\N	2	1	1	0
1831	52	\N	JAI BHAWANI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1797	46	\N	RATAN - MEDICOS PVT LTD	\N	SOCIETY	MAR	35:52.7	\N	\N	2	1	1	0
1798	46	\N	RATAN - MEDICOSE PVT. LTD.	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	1	1	0
1799	46	\N	RATAN - MEDICOSE PVT. LTD..	\N		MARG	35:52.7	\N	\N	2	1	1	0
1800	46	\N	RATAN MEDICOSE PVT LTD	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
1801	46	\N	RATAN - MEDICOSE PVT LTD	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
1802	46	\N	RATAN MEDICOS PVT. LTD	\N	TUGALPUR KNOW	CAD	35:52.7	\N	\N	2	1	1	0
1803	46	\N	RATAN MEDICOS PVT LTD	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
1804	46	\N	RATAN MEDICOS PVT LTD	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
1805	46	\N	RATAN MEDICOSE PVT LTD	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
1856	58	\N	RAHUL CANTEEN STORE	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	1	1	0
1858	58	\N	RAHUL CANTEEN STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1859	59	\N	SAVERS CART	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
1860	59	\N	SAVERS CART	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1861	59	\N	SAVERS  CART	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	1	1	0
892	533	0	SHARMA MEDICAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1862	59	\N	SAVERS CART	\N		MARG	35:52.7	\N	\N	2	1	1	0
1863	59	\N	SAVERS CART	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1864	59	\N	SAVERS	\N		GOD	35:52.7	\N	\N	2	1	1	0
891	532	0	SHARMA KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
890	530	0	SHANU GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
889	526	0	SHAMA GIFT CENTRE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
888	520	0	SAURABH KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
887	519	0	SAURABH GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
969	516	0	SARFARAJ COSMATICS			COL	2018-12-25 15:25:18.460388+05:30			1	0	1	0
886	516	0	SARFARAJ FAISAL COSMATICS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
941	513	0	RAJIV KIRANA STORE			COL	2018-12-25 15:25:18.411604+05:30			1	0	1	0
885	513	0	SANJEEV KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1845	56	\N	MITTAL PROVISION STORE	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
884	511	0	SANJAY GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1847	56	\N	MITTAL PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1848	56	\N	MITTAL PROVISION STORE.	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	1	1	0
1849	56	\N	MITTAL PROVISION STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
1850	56	\N	MITTAL PROVISION STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1866	60	\N	SHOPPERS POINT	\N		MARG	35:52.7	\N	\N	2	1	1	0
1867	60	\N	SHOPPER POINT	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
1851	57	\N	OM RETAIL MART	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
2310	278	\N	VIKASH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1852	57	\N	OM RETAIL MART	\N		MARG	35:52.7	\N	\N	2	1	1	0
1853	57	\N	OM RETAIL MART..	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	1	1	0
1854	57	\N	OM RETAIL MART	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
1834	54	\N	MAHAVIRA GENERAL STORE	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
1835	54	\N	MAHAVIRA GENERAL STORE	\N	BEETA 1 RAMPUR	MAR	35:52.7	\N	\N	2	1	1	0
1836	54	\N	MAHAVIRA GENERAL STORE	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1838	54	\N	MAHAVIRA GENERAL STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1839	55	\N	MITTAL  SONS	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
1840	55	\N	MITTAL & SONS	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	1	1	0
1841	55	\N	MITTAL & SONS	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1842	55	\N	MITTAL & SONS	\N		MARG	35:52.7	\N	\N	2	1	1	0
1843	55	\N	MITTAL & SONS	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1886	67	\N	BAJRANG SHOPPING CENTRE	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	1	1	0
1887	67	\N	BAJRANG SHOPPING CENTRE	\N	GAMMA 2	MAR	35:52.7	\N	\N	2	1	1	0
1888	67	\N	BAJRANG SHOPPING CENTRE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1889	67	\N	BAJRANG SHOPPING CENTRE	\N	GAAMMA 2	MAR	35:52.7	\N	\N	2	1	1	0
1873	61	\N	SHREE BALAJI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
957	502	0	SAKSHI BANGLES & GEN STORE			COL	2018-12-25 15:25:18.44286+05:30			1	0	1	0
883	497	0	SAGUN KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1891	67	\N	BAJRANG SHOPPING CENTRE*	\N		MARG	41:53.9	\N	\N	2	1	1	0
1892	68	\N	EVERGREEN PHARMA	\N	GAAMMA 2	MAR	35:52.7	\N	\N	2	1	1	0
1893	68	\N	EVERGREEN PHARMA	\N	GAMMA 2	MAR	35:52.7	\N	\N	2	1	1	0
1894	68	\N	EVERGREEN PHARMA	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	1	1	0
881	493	0	SACHIN PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1895	68	\N	ZEVERGREEN PHARMA	\N		MARG	35:52.7	\N	\N	2	1	1	0
1896	68	\N	EVERGREEN PHARMA.	\N		MARG	35:52.7	\N	\N	2	1	1	0
880	488	0	RV FASHION POINT			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
879	488	0	RV FASHION POINT			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
875	477	0	RINKU PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
1868	60	\N	SHOPPERS POINT	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
878	488	0	RV FASHION POINT			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1875	62	\N	SHREE SHYAM KIRANA STORE	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
1876	62	\N	SHRI SHYAM KIRANA STORE	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	1	1	0
1877	62	\N	SHRI SHYAM KIRANA STORE	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
877	486	0	RS TRADING CO.			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1878	62	\N	SHRI SHYAM KIRANA STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1869	60	\N	SHOPPER POINT	\N		MARG	35:52.7	\N	\N	2	1	1	0
1871	60	\N	SHOPPER  POINT	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1882	64	\N	YUKTI TRADING COMPANY	\N		MARG	35:52.7	\N	\N	2	1	1	0
1883	64	\N	YUKTI TRADING COMPANY	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
882	495	0	SAGUN ATTA CHAKKI			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
943	481	0	RL KIRANA STORE			COL	2018-12-25 15:25:18.415426+05:30			1	0	1	0
1898	69	\N	GAGAN DAIRY	\N	GAAMMA 2	CAD	35:52.7	\N	\N	2	0	1	0
876	478	0	RISHI KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1900	70	\N	GOYAL ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	0	1	0
1901	70	\N	GOYAL ENTERPRISES	\N	GAAMMA 2	MAR	35:52.7	\N	\N	2	0	1	0
1879	63	\N	VERMA GENERAL STORE	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	1	1	0
874	476	0	RIDIMA KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
873	476	0	RIDIMA KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
476	476	0	RIDIMA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
996	746	1	GANGA TRADERS			COL				1	0	1	0
870	472	0	RAWAL RETAIL CORPORATION			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
872	475	0	REAL MEDICOSE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
193	475	0	GUNJAN GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
1902	70	\N	GOYAL ENTERPRISES	\N	GAMMA 2	MAR	35:52.7	\N	\N	2	0	1	0
871	473	0	RD PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1904	70	\N	GOYAL ENTERPRISES	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
869	471	0	RAVI KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1932	77	\N	AARADHYA CANTEEN STATIONERY & FOOD MART	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	1	1	0
1934	77	\N	AARADHYA CANTEEN STATIONERY & FOOD MART	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
868	470	0	RATISH KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1935	77	\N	AARADHYA CANTEEN STATIONA	\N		MARG	45:36.2	\N	\N	2	1	1	0
867	465	0	RAMESH KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
866	464	0	RAMESH CHAND VINOD KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
864	459	0	RAMA CONFECTIONARY STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
863	458	0	RAM MEDICAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
862	457	0	RAM KISHORE KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
861	456	0	RAM KISHAN DAS PRABHU DAYAL			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1928	76	\N	TABS  AND CAPS	\N	GAMMA 2	MAR	35:52.7	\N	\N	2	0	1	0
865	462	0	RAMA PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
1929	76	\N	TABS & CAPS	\N		MARG	35:52.7	\N	\N	2	0	1	0
1931	76	\N	TABS & CAPS	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
1915	73	\N	MEDI PLUS PHARMACY	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	1	1	0
1916	73	\N	MEDI PLUS PHARMACY	\N		MARG	35:52.7	\N	\N	2	1	1	0
858	448	0	RAJESH KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
857	447	0	RAJENDRA GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
856	446	0	RAJENDER GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1917	73	\N	MEDIPLUS PHARMACY	\N	GAAMMA 2	CAD	35:52.7	\N	\N	2	1	1	0
859	449	0	RAJESWAR DAYAL PRADEEP KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
855	444	0	RAJBALA BANGLES STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
984	476	1	RIDDHI GENERAL STORE			COL				1	1	1	0
931	443	0	RAJJAN LAL & SONS			COL	2018-12-25 13:20:26.453709+05:30			1	0	1	0
854	442	0	RAJ TRADING			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
860	454	0	RAKESH KUMAR RAJ KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
1918	73	\N	MEDI PLUS PHARMACY	\N	GAMMA 2	MAR	35:52.7	\N	\N	2	1	1	0
853	436	0	RAHUL PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1945	80	\N	BHAVYA BAKERY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2495	416	\N	MAA ANPURNA	\N		MARG	35:52.7	\N	\N	2	0	1	0
1943	79	\N	BAKERS ZONE..	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	1	1	0
1921	75	\N	SRI RAM MEDICOSE	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	1	1	0
1922	75	\N	SHRI RAM MEDICOSE 2	\N		MARG	35:52.7	\N	\N	2	1	1	0
1923	75	\N	SHRI RAM MEDICOSE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1924	75	\N	SHRI RAM MEDICOSE	\N	GAAMMA 2	CAD	35:52.7	\N	\N	2	1	1	0
1926	75	\N	SRI RAM MEDICOSE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1909	72	\N	LUXMI SUPER GENERAL STORE	\N	GAMMA 2	MAR	35:52.7	\N	\N	2	1	1	0
1910	72	\N	LUXMI SUPER GENERAL STORE	\N	GAAMMA 2	MAR	35:52.7	\N	\N	2	1	1	0
1936	78	\N	AGGARAWAL DEPARTMENTAL STORE	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1937	78	\N	AGGARAWAL DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1938	78	\N	AGGARAWAL DEPARTMENTAL STORE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1940	78	\N	AGGARWAL DEPARTMENTAL STORE	\N	JAGATFARM G1	MAR	35:52.7	\N	\N	2	1	1	0
1941	78	\N	AGGARAWAL DEPARTMENTAL ST	\N		MARG	35:52.7	\N	\N	2	1	1	0
1906	71	\N	ZGROWGREEN PRODUCTS LLP	\N		MARG	35:52.7	\N	\N	2	1	1	0
1907	71	\N	GROW GREEN RETAIL LLP	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1908	71	\N	GROWGREEN PRODUCTS	\N		MARG	35:52.7	\N	\N	2	1	1	0
1911	72	\N	LUXMI SUPER GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1912	72	\N	LUXMI SUPER GENERAL STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	1	1	0
1913	72	\N	LUXMI SUPER GENERAL STORE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
852	435	0	RAHUL KIRANA			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1998	95	\N	ZBALAJI DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1952	82	\N	KHUSHI DAIRY	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	0	1	0
1958	84	\N	LONG LIFE MEDICOSE	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	0	1	0
1959	84	\N	LONG LIFE MEDICOSE	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
1999	95	\N	BALAJI DEPARTMENTAL STORE	\N	P2	MAR	35:52.7	\N	\N	2	1	1	0
1960	84	\N	LONG LIFE MEDICOS	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	0	1	0
850	420	0	PRAVEEN KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1961	84	\N	LONG LIFE MEDICOSE	\N		MARG	35:52.7	\N	\N	2	0	1	0
849	417	0	PRAMOD KUMAR SHIV KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1964	85	\N	MANGALAARYA RETAIL AND ECOMMERCE LLP	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	0	1	0
848	416	0	PRAMOD KUMAR ANKUR JINDAL			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1965	85	\N	MANGALAARYA RETAIL  AND ECOMMERCE LLP	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	0	1	0
1946	81	\N	GOYAL SUPERMART	\N		MARG	35:52.7	\N	\N	2	1	1	0
847	415	0	PRAMOD KOMAR VINOD KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1966	85	\N	MANGALA ARYA RETAIL AND ECOMMERCE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
1967	85	\N	MANGALAARYA RETAIL & ECOM	\N		MARG	35:52.7	\N	\N	2	0	1	0
845	411	0	PRAKASH CHAND VINOD KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
844	409	0	PRADEEP KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1947	81	\N	GOYAL SUPERMART	\N	JAGATFARM G1	MAR	35:52.7	\N	\N	2	1	1	0
843	406	0	PRABHAT KIRANA			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1980	90	\N	SHAGUN SWEETS	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	0	1	0
1948	81	\N	GOYAL SUPERMART	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
1950	81	\N	GOYAL SUPERMART	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
840	400	0	PERMANAND MEDICAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1975	89	\N	RS ENTERPRISES	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1976	89	\N	RS ENTERPRISES	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	1	1	0
838	391	0	OM SHIV MEDICAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
837	387	0	OM SAI RAM MEDICAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
1978	89	\N	RS ENTERPRISES	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
836	386	0	OM SAI GARMENTS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2535	441	\N	FRIENDS ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	0	1	0
841	401	0	PIYUSH KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
846	414	0	PRAMOD KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
1989	93	\N	VIJAY MEDICOSE	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	1	1	0
1990	93	\N	VIJAY MEDICOS	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1991	93	\N	VIJAY MEDICOSE	\N		MARG	35:52.7	\N	\N	2	1	1	0
842	403	0	POOJA KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
839	399	0	PERFECT GIFT CENTRE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
1992	93	\N	VIJAY MEDICOS	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1981	91	\N	SHIV SHAKTI GENERAL STORE	\N	JAGATFARM G1	MAR	35:52.7	\N	\N	2	1	1	0
1982	91	\N	SHIV SHAKTI GENERAL STORE	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
851	429	0	RADHEY LAL JAI PRAKASH			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
1993	94	\N	9 TO 9 MARCETOS	\N	SOCIETY	MAR	35:52.7	\N	\N	2	1	1	0
1983	91	\N	SHIV SHAKTI GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1994	94	\N	9 TO 9 MERCATO	\N		MARG	35:52.7	\N	\N	2	1	1	0
1984	91	\N	SHIV SHAKTI GENERAL STORE	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1995	94	\N	9 TO 9 MERCATO	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
1969	87	\N	NEW UNIVERSAL MEDICARE	\N	JAGATFARM G1	MAR	35:52.7	\N	\N	2	1	1	0
1970	87	\N	NEW UNIVERSAL MEDICARE	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
1971	87	\N	NEW UNIVERSAL MEDICARE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1996	94	\N	9 TO 9 MERCATO..	\N	P2	CAD	35:52.7	\N	\N	2	1	1	0
1972	87	\N	NEW UNIVERSAL MEDICARE	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1985	91	\N	SHIV SHAKTI GENERAL STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1953	83	\N	KUMAR ENTERPRISES	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
1954	83	\N	KUMAR ENTERPRISES	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	1	1	0
1955	83	\N	ZKUMAR ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	1	1	0
1957	83	\N	KUMAR ENTERPRISES	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
2004	96	\N	DEV SHOPPEE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2026	101	\N	MED POINT PHARMACY & COSMATICS	\N		MARG	35:52.7	\N	\N	2	1	1	0
2027	101	\N	MED POINT  PHARMACY & COSMATIC	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
2005	96	\N	DEV SHOPPEE	\N	P2	CAD	35:52.7	\N	\N	2	0	1	0
832	378	0	OM GIFT CENTRE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2006	96	\N	DEV SHOPPEE	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
2028	101	\N	MED POINT PHARMACY AND COSMATICS	\N	SOCIETY	MAR	35:52.7	\N	\N	2	1	1	0
831	373	0	OM CONFECTIONERS			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
828	366	0	NIKHIL CONFECTIONERS STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
827	364	0	NEW MALIK GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2020	99	\N	JAANKI PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2021	99	\N	JANAKI PROVISION STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
826	361	0	NAVIN PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2029	101	\N	MEDPOINT PHARMACY AND COSMETICS	\N	P2	CAD	35:52.7	\N	\N	2	1	1	0
962	360	0	NAVIN COSMATICS STORE			COL	2018-12-25 15:25:18.448375+05:30			1	0	1	0
825	355	0	NARESH KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
833	380	0	OM PRAKASH ASHISH KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
830	370	0	NITTU PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2041	103	\N	SANJU DEPARTMENTAL STORE	\N	P2	CAD	35:52.7	\N	\N	2	0	1	0
829	370	0	NITTU PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2042	103	\N	SANJU DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
823	341	0	MUNNA BANGLES &GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2044	103	\N	SANJU DEPARTMENTAL STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
824	348	0	NAMAN KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2045	104	\N	SHRI VINAYAK STORE	\N	SOCIETY	MAR	35:52.7	\N	\N	2	0	1	0
2047	104	\N	SHRI VINAYAK STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2625	515	\N	ONE STOP MART	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2008	97	\N	EVERYDAY SHOPPING MART PVT. LTD.	\N	P2	CAD	35:52.7	\N	\N	2	1	1	0
2009	97	\N	EVERY DAY SHOPPING MART PVT. LTD.	\N		MARG	35:52.7	\N	\N	2	1	1	0
2010	97	\N	Every Day Shopping Mart Pvt. L	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
2011	97	\N	EVERYDAY SHOPING MART PVT LTD	\N	SOCIETY	MAR	35:52.7	\N	\N	2	1	1	0
2012	97	\N	Every Day Shopping Mart Pvt. Ltd.	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
2013	97	\N	EVERY DAY SHOPPING MART P	\N		MARG	35:52.7	\N	\N	2	1	1	0
835	381	0	OM PRAKASH CHAMAN PRAKASH			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
834	381	0	OM PRAKASH CHAMAN PRAKASH			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2014	97	\N	EVERY DAY SHOPPING MART P	\N		MARG	35:52.7	\N	\N	2	1	1	0
2030	101	\N	MED POINT PHARMACY & COSMATICS	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
2031	101	\N	MED PT	\N		MARG	35:52.7	\N	\N	2	1	1	0
2032	101	\N	MED PT	\N		MARG	35:52.7	\N	\N	2	1	1	0
2022	100	\N	MAA BHAGWATI GENERAL STORE	\N	P2	CAD	35:52.7	\N	\N	2	1	1	0
2023	100	\N	MAA BHAGWATI GENERAL STORE	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
2025	100	\N	MAA BHAGWATI GENERAL STOR	\N		MARG	35:52.7	\N	\N	2	1	1	0
2033	101	\N	MED POINT  PHARMACY & COSMATICS	\N		COL	35:52.7	\N	\N	2	1	1	0
2036	102	\N	MITTAL GENERAL STORE	\N	P2	MAR	35:52.7	\N	\N	2	1	1	0
2037	102	\N	MITTAL GENERAL STORE	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
2016	98	\N	GANGA TRADERS	\N		MARG	35:52.7	\N	\N	2	1	1	0
2017	98	\N	GANGA TRADERS	\N	P2	CAD	35:52.7	\N	\N	2	1	1	0
2038	102	\N	MITTAL GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2040	102	\N	MITTAL GENERAL  STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
2001	95	\N	BALAJI DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2002	95	\N	BALAJI DEPARTMENTAL STORE	\N	SOCIETY	MAR	35:52.7	\N	\N	2	1	1	0
2003	95	\N	BALAJI DEPARTMENTAL STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
2722	586	\N	GARG KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2723	586	\N	GARG KIRANA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
2051	105	\N	SONI SUPER MART	\N	P2	CAD	35:52.7	\N	\N	2	1	1	0
2048	104	\N	SHRI VINAYAK STORES	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
2049	104	\N	SHRI VINAYAK STORES	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
822	338	0	MUKESH KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
821	335	0	MOTHER DAIRY			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2055	106	\N	SUMIT GENERAL STORE	\N	P2	CAD	35:52.7	\N	\N	2	0	1	0
2056	106	\N	SUMIT GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2058	106	\N	SUMIT GENERAL STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2059	107	\N	SUNIL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2061	107	\N	SUNIL KIRANA STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
819	325	0	MITTAL PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2052	105	\N	SONI SUPERMART	\N		MARG	35:52.7	\N	\N	2	1	1	0
2053	105	\N	Soni Supermart	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
2070	110	\N	UTKASH GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
816	318	0	MITHAN LAL RAMESH CHAND			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
820	326	0	MKS CONFECTIONERY & SUPER MARKET			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
815	316	0	MAYANK KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2073	112	\N	SHIV CONFECTIONERS	\N	SURAJPUR	CAD	35:52.7	\N	\N	2	0	1	0
813	309	0	MANOJ KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2075	113	\N	ANANT WELLNESS	\N		MARG	35:52.7	\N	\N	2	0	1	0
814	313	0	MASTER JI MEDICAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2076	113	\N	ANANT WELLNESS	\N	SOCIETY	MAR	35:52.7	\N	\N	2	0	1	0
2077	113	\N	ANANT WELLNESS	\N	TUGALPUR KNOW	MAR	35:52.7	\N	\N	2	0	1	0
2078	113	\N	ANANT WELLNESS	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2079	113	\N	ANANT WELLNESS	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2080	113	\N	ANANT WELLNESS.	\N		MARG	35:52.7	\N	\N	2	0	1	0
812	307	0	MANGU MAL KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2071	111	\N	VISHWAS FOODS	\N		MARG	35:52.7	\N	\N	2	1	1	0
2062	108	\N	THE FAMILY MART	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
2063	108	\N	ZTHE FAMILY MART	\N		MARG	35:52.7	\N	\N	2	1	1	0
811	304	0	MANGAL KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
961	303	0	BALAJI GARMENTS STORE			COL	2018-12-25 15:25:18.447305+05:30			1	0	1	0
2087	118	\N	ANSHIKA COSMATICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2065	108	\N	THE FAMILY MART	\N	P2	CAD	35:52.7	\N	\N	2	1	1	0
2088	118	\N	ANSHIKA COSMETICS	\N	SOCIETY	MAR	35:52.7	\N	\N	2	0	1	0
2090	118	\N	ANSHIKA  COSMATICS	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2091	119	\N	SHRI KUNJ KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2092	119	\N	SHRI KUNJ KIRANA STORE	\N	SOCIETY	MAR	35:52.7	\N	\N	2	0	1	0
2094	119	\N	SHRI KUNJ KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2083	114	\N	HI GLANCE LABORATORIES PVT LTD	\N	TUGALPUR KNOW	CAD	35:52.7	\N	\N	2	1	1	0
810	294	0	MAHENDRA SHARMA KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2066	109	\N	USHA DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2095	120	\N	SHAH MEDICOSE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2068	109	\N	USHA DEPARTMENTAL STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
2084	114	\N	HIGLANCE LABORATORIES PVT LTD	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	1	1	0
818	322	0	MITTAL KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
936	305	0	MANGAL MEDICAL STORE			COL	2018-12-25 13:23:36.397887+05:30			1	1	1	0
817	321	0	MITTAL GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2085	114	\N	HIGLANCE LABORATORIES PVT LTD	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
809	292	0	MAHENDRA KUMAR SURENDER KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2099	122	\N	AJIS DEPARTMENTAL STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2103	125	\N	RUCHIKA GENERAL STORE	\N		COL	55:42.0	\N	\N	2	0	1	0
808	291	0	MAHENDRA KUMAR PRAMOD KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2112	131	\N	HONEY MONEY TOP RETAIL PVT LTD	\N		MARG	35:52.7	\N	\N	2	0	1	0
2113	131	\N	HONEY MONEY TOP RETAIL PRIVATE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
935	282	0	LOKESH KUMAR DANESH KUMAR			COL	2018-12-25 13:22:55.41454+05:30			1	0	1	0
2114	131	\N	HONEY MONEY TOP RETAIL PRIVATE LTD.	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2116	131	\N	HONEY MONEY TOP RETAIL PV	\N		MARG	35:52.7	\N	\N	2	0	1	0
807	277	0	LALIT BEAUTY			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
937	275	0	QUALITY GENERAL STORE			COL	2018-12-25 15:25:18.33304+05:30			1	0	1	0
806	275	0	KWALITY GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2122	137	\N	YASH RAJ DEPARTMENTAL STORE	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
2123	137	\N	YASH RAJ DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
805	272	0	KUMAR GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2110	130	\N	KRISHAN MEDICAL STORE	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	1	1	0
2127	139	\N	MAHAVIR MEDICAL STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2111	130	\N	KRISHANA MEDICAL POINT	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
803	264	0	KISHAN PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
802	263	0	KISHAN LAL BRIJ KISHORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
800	252	0	KARTIK KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2135	146	\N	UJJWAL ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	0	1	0
801	258	0	KHURJA DESHI GHEE STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2142	152	\N	DAILY SHOPING MART	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2145	153	\N	SINGHAL BANDHU KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
799	249	0	KANTI PRASAD MUKESH CHAND			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
798	247	0	KANSAL PROVISION STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2151	158	\N	SUVIDHA RETAILORS	\N		MARG	35:52.7	\N	\N	2	0	1	0
797	244	0	KANHA COSMATICS STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2128	140	\N	KING BAZAR	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
2152	159	\N	CAFE - DE -AMAN	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
796	242	0	KAMLESH KUMAR NARESH KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2154	159	\N	CAFE - DE -AMAN	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
795	241	0	KAMAL KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
794	241	0	KAMAL KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2104	126	\N	OM EVERGREEN SWEETS	\N		MARG	35:52.7	\N	\N	2	1	1	0
793	238	0	KALPANA MEDICAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
792	235	0	K.G. TRADERS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
791	231	0	JOHARI MAL YOGESH KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2165	165	\N	MAHENDRA TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
804	269	0	KRISHNA DEPARTMENTAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2166	165	\N	MAHENDRA TRADERS	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2157	162	\N	WE CARE PHARMACY.	\N		MARG	35:52.7	\N	\N	2	1	1	0
2158	162	\N	ZWE CARE PHARMACY	\N		MARG	35:52.7	\N	\N	2	1	1	0
967	229	0	JITENDRA  KIRANA STORE			COL	2018-12-25 15:25:18.457161+05:30			1	0	1	0
953	229	0	JITENDERA KIRANA STORE			COL	2018-12-25 15:25:18.430014+05:30			1	0	1	0
2159	162	\N	WE CARE PHARMACY	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
790	227	0	JAVED TRADERS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2160	162	\N	WE CARE PHARMACY	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
2161	162	\N	WE CARE PHARMACY	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
789	225	0	JAIN PANEER BHANDAR			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
773	158	0	GARG KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
788	223	0	JAIN CONFECTIONERS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
952	197	0	Guru Kirpa General store			COL	2018-12-25 15:25:18.428974+05:30			1	1	1	0
949	151	0	PRAVEEN KIRNA STORE			COL	2018-12-25 15:25:18.423361+05:30			1	1	1	0
944	151	0	G ONE TRADERS			COL	2018-12-25 15:25:18.416662+05:30			1	1	1	0
2181	178	\N	VEER MEDICAL STORE	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	0	1	0
939	221	0	JAI MATESHWARI TRADERS			COL	2018-12-25 15:25:18.406506+05:30			1	0	1	0
2182	179	\N	SHANKAR GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2183	179	\N	SHANKAR GENERAL STORE	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2184	179	\N	SHANKAR GENERAL STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
148	151	0	G-ONE			MARG	2018-12-23 17:18:09.772917+05:30	2019-01-12 11:47:31.9918+05:30		1	1	1	0
784	199	0	GYAN MAL CHIRANJI LAL			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
946	218	0	JAI MATA DI COSMATICS & READYMADE G			COL	2018-12-25 15:25:18.419632+05:30			1	0	1	0
787	217	0	JAI BABA GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
786	215	0	JAGDISH PRASAD & SONS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2189	183	\N	ROHIT GARG KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2190	183	\N	ROHIT GARG KIRANA STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
785	211	0	HIRA KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
960	208	0	HARSH MEDICAL STORE			COL	2018-12-25 15:25:18.446265+05:30			1	0	1	0
956	205	0	RAJOO CIGRETTE STORE			COL	2018-12-25 15:25:18.440003+05:30			1	0	1	0
966	198	0	GYAN BABA  MEDICAL STROE			COL	2018-12-25 15:25:18.455505+05:30			1	0	1	0
934	195	0	GUPTA KIRANA STORE			COL	2018-12-25 13:22:28.000041+05:30			1	0	1	0
933	195	0	GUPTA KIRANA STORE			COL	2018-12-25 13:22:05.162219+05:30			1	0	1	0
2211	203	\N	VIJAY KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2213	203	\N	VIJAY KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
947	189	0	GOYAL PROVISION  STORE			COL	2018-12-25 15:25:18.420649+05:30			1	0	1	0
782	185	0	GOYAL DEPARTMENTAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
781	180	0	GOPAL STD			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
780	179	0	GOPAL MEDICAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
779	178	0	GOEL KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
778	175	0	GIRDHARI LAL CHIRANJI LAL			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
777	172	0	GAYATRI KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2194	187	\N	FAIMLY MEDICOSE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2231	221	\N	POOJA KIRANA STORE GN	\N		MARG	35:52.7	\N	\N	2	0	1	0
2237	225	\N	POORVANCHAL KIRANA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2239	226	\N	NAGAR GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
776	171	0	GAURAV READYMADE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
774	161	0	GARG READYMADE & GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
775	167	0	GAURAV KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2265	246	\N	SHIV SHAKTI ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	1	1	0
2244	231	\N	SINGHAL TRADERS	\N		MARG	35:52.7	\N	\N	2	1	1	0
772	156	0	GARG CONFECTIONERS STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2258	242	\N	AV GREEN RETAIL SHOPS (OPC) PVT LTD	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
771	153	0	GAGAN CONFECTIONERS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2246	231	\N	SINGHAL TRADERS	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
2261	245	\N	GANPATI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2263	245	\N	GANPATI  KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
945	146	0	FAISHION GALLARY			COL	2018-12-25 15:25:18.418155+05:30			1	0	1	0
2268	249	\N	RAKESH GUPTA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2885	704	\N	DISHA COSMATICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
768	138	0	DURGA PRASAD TUKKI RAM			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
948	134	0	DULI CHAND DINESH KUMAAR			COL	2018-12-25 15:25:18.421846+05:30			1	0	1	0
770	139	0	DURGA TRADERS			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
760	122	0	DELHI PHARMACY			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2278	257	\N	SHRI BALAJI TRADERS	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
769	139	0	DURGA TRADERS			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2281	259	\N	FAROOKH TRADING CO	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2284	262	\N	GURU KRIPA KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2286	263	\N	ZDAILY NEED	\N		MARG	35:52.7	\N	\N	2	0	1	0
756	114	0	DAYA SHANKAR KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
761	124	0	DHARMENDRA KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2292	268	\N	CHIDHA SINGH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2293	268	\N	CHIDHA SINGH KIRANA STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
759	117	0	DEEPAK KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2295	268	\N	CHIDDHA SINGH KIRANA STORE	\N		MAR	57:54.3	\N	\N	2	0	1	0
2296	269	\N	THE NATURES ENERGY	\N		MARG	35:52.7	\N	\N	2	0	1	0
755	113	0	DAVENDRA KUMAR AYUSH KUMAR			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2297	269	\N	THE NATURES ENERGY	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
758	116	0	DEEPAK BEAUTY & GIFT CENTRE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
757	115	0	DEEP READYMADE STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2302	273	\N	PAPPU PANSARI KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
753	97	0	BHUPATI TRADING CO.			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2304	273	\N	PAPPU PANSARI KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
950	112	0	DAVENDER KIRANA STORE			COL	2018-12-25 15:25:18.424877+05:30			1	0	1	0
2308	277	\N	SHRI BALAJI BEAUTY SHOP	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
754	106	0	CHIDDA KHAN RAFIQE AHMED			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2317	284	\N	JAIN DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2318	284	\N	JAIN DEPARTMENTAL STORE	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
970	94	0	BHOLE PROVISION STORE			COL	2018-12-25 15:25:18.461989+05:30			1	0	1	0
752	91	0	BHOLE GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
751	90	0	BHIKKI MAL MAHESH CHAND			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
750	88	0	BHAGWATI READYMADE & GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
951	87	0	BHAGWATI  TRADERS			COL	2018-12-25 15:25:18.42648+05:30			1	0	1	0
749	86	0	BHAGMAL KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2332	296	\N	SHANTI MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
965	84	0	BANSAL TRDERS			COL	2018-12-25 15:25:18.452117+05:30			1	0	1	0
748	81	0	BALAJI KIRANA STORE STN			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2313	280	\N	PRACHI OVERSEAS	\N		MARG	35:52.7	\N	\N	2	1	1	0
2362	320	\N	CROWNE PLAZA GREATER NOIDA	\N		MARG	35:52.7	\N	\N	2	1	1	0
747	78	0	BALAJI GIFT CENTRE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2339	302	\N	AMRIT STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
746	71	0	BALAJI CONFECTIONERS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2348	308	\N	ARSH PROVISION STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2349	309	\N	SARTHAK TRADING CO	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
932	66	0	SANWARIYA TRADERS			COL	2018-12-25 13:21:01.543906+05:30			1	0	1	0
745	66	0	BABLOO KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
744	65	0	BABA TRADERS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
743	63	0	BABA MOHAN RAM GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
606	606	1	SUBEY SINGH			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
955	62	0	BABA MEDICAL STORE  (AGENCIES)			COL	2018-12-25 15:25:18.432169+05:30			1	1	1	0
2355	313	\N	CHIDDA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2343	306	\N	ROHIT MEDICAL STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	1	1	0
2344	306	\N	ROHIT MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2365	321	\N	CHAUDHARY ATTA CHAKKI	\N		MARG	35:52.7	\N	\N	2	0	1	0
730	18	0	AGGARWAL KIRANA & DRY FRUITS			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2430	365	\N	SHRI JEE GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2366	321	\N	CHAUDHARY ATTA CHAKKI	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
742	57	0	ATUL KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
968	49	0	ANUJ MEDICAL STORE			COL	2018-12-25 15:25:18.4588+05:30			1	1	1	0
2377	331	\N	A.K. KIRANA STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2379	332	\N	AGGARWAL SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2381	333	\N	SUJATA MEDICOSE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2383	334	\N	SHUBHAM STATIONARS	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
741	40	0	ANAND AND SONS			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
740	38	0	AMIT SHOPPING CENTRE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
737	34	0	AMIT JAIN KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
963	33	0	AMAN MEDICAL STORE			COL	2018-12-25 15:25:18.449521+05:30			1	0	1	0
736	29	0	AJIT KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2396	344	\N	APRITA ENTERPRISE	\N		MARG	35:52.7	\N	\N	2	0	1	0
735	28	0	AJAY KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2398	345	\N	OM ATTA CHAKKI	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
958	26	0	AJAY  HARIOM			COL	2018-12-25 15:25:18.444079+05:30			1	0	1	0
734	24	0	AHUJA READYMADE & GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2402	347	\N	ANJALI FACILITY SERVICES PVT. LTD.	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2403	348	\N	RAJJAK KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
732	21	0	AGGARWAL MEDICAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
731	20	0	AGGARWAL KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
729	17	0	AGGARWAL GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2408	351	\N	BALAJI KIRANA STORES	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2409	351	\N	BALAJI KIRANA STORE S	\N		MARG	35:52.7	\N	\N	2	0	1	0
2413	356	\N	BOMBAY CONFECTIONERY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2415	356	\N	BOMBAY CONFECTIONERS	\N		CAD	35:52.7	\N	\N	2	0	1	0
728	7	0	AAKASH MEDICOSE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
2417	357	\N	AVNISH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
7	7	0	AAKASH KIRANA STORE  MED			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
2422	361	\N	TULSI PATANJALI SWEDESHI KENDRA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2425	362	\N	BHAWANI MART	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
2421	360	1	UTIME	\N		MARG	35:52.7	\N	\N	2	0	1	0
2428	364	\N	SHREE BALAJI STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
1011	2	0	KUMAR ENTERPRISES		0	COL	2019-07-02 15:42:41.987199+05:30	2019-07-02 15:42:41.987199+05:30		1	0	1	0
1010	757	1	RX PHARMA		0	COL	2019-06-04 21:27:25.761803+05:30	2019-06-04 21:27:25.761803+05:30		1	0	1	0
1009	756	1	YUKTI TRADING COMPANY		0	COL	2019-06-04 21:27:19.751456+05:30	2019-06-04 21:27:19.751456+05:30		1	0	1	0
1008	755	1	GOYAL SUPERMART		0	COL	2019-06-04 21:27:13.245654+05:30	2019-06-04 21:27:13.245654+05:30		1	0	1	0
1007	754	1	JAI BHAWANI KIRANA STORE		0	COL	2019-06-04 21:26:59.512348+05:30	2019-06-04 21:26:59.512348+05:30		1	0	1	0
1006	753	1	DUBEY CANTEEN		0	COL	2019-06-04 21:26:37.17221+05:30	2019-06-04 21:26:37.17221+05:30		1	0	1	0
1005	752	1	GUPTA JI CANTEEN		0	COL	2019-06-04 16:05:38.402235+05:30	2019-06-04 16:05:38.402235+05:30		1	0	1	0
1003	750	1	HARIOM DEPARTMENTAL STORE		0	COL	2019-02-17 11:00:09.427018+05:30	2019-02-17 11:00:09.427018+05:30		1	0	1	0
1000	749	1	MAA ANPURNA		0	COL	2019-02-16 22:55:58.941436+05:30	2019-02-16 22:55:58.941436+05:30		1	0	1	0
997	747	1	LONG LIFE MEDICOSE			COL				1	0	1	0
995	745	1	DAKSH GENERAL STORE DELTA			COL				1	0	1	0
2419	359	\N	MITTAL TRADERS	\N		MARG	35:52.7	\N	\N	2	1	1	0
992	744	1	SHRI KUNJ KIRANA STORE			COL				1	0	1	0
990	743	1	HARI OM KIRANA STORE			COL				1	0	1	0
2392	342	\N	S SUPERMART	\N		MARG	35:52.7	\N	\N	2	1	1	0
989	742	1	RATAN - MEDICOSE PVT. LTD.			COL				1	0	1	0
988	741	1	RATAN - MEDICOSE PVT. LTD.			COL				1	0	1	0
987	740	1	RATAN - MEDICOSE PVT. LTD.			COL				1	0	1	0
739	35	0	AMIT KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
983	739	1	STAR GROCERY MART			COL				1	0	1	0
982	738	1	SHARMA MEDICOSE			COL				1	0	1	0
981	737	1	MED POINT  PHARMACY & COSMATICS			COL				1	0	1	0
980	736	1	EVERY DAY SHOPPING MART PVT. LTD.			COL				1	0	1	0
733	23	0	AGGARWAL TRADERS			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
727	6	0	AADI GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2388	339	\N	ZDAILY NEED DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
738	35	0	AMIT KIRANA STORE			COL	2018-12-25 13:15:21.181159+05:30			1	1	1	0
2394	342	\N	SUPERMART	\N		MARG	25:07.2	\N	\N	2	1	1	0
979	735	1	EVERY DAY SHOPPING MART PVT. LTD.			COL				1	0	1	0
978	734	1	CALYFOX RETAILS PRIVATE LIMITED			COL				1	0	1	0
977	733	1	RUCHICA GENERAL STORE			COL				1	0	1	0
976	732	1	SONI SUPERMART			COL				1	0	1	0
975	731	1	JAI DURGA MEDICAL STORE			COL				1	0	1	0
973	730	1	Tushar Trading Co.		0	MARG	2019-01-12 14:52:52.683839+05:30	2019-01-12 14:52:52.683839+05:30		1	0	1	0
726	726	1	ZZSHRI HARI PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
725	725	1	ZZAMAN MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
724	724	1	ZVISHAL JATIN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
723	723	1	zVED JAI BHAGWAN			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
722	722	1	ZTILAPTA GROCERY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
721	721	1	ZSURESH PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
720	720	1	ZSUHAG BANGLES STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
719	719	1	ZSINGHAL COSMATICS STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
718	718	1	ZSHUBHAM MEDICOS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
717	717	1	ZSHRI HARI STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
716	716	1	ZSHRI HARI PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
715	715	1	ZSHRI BALAJEE GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
714	714	1	ZSARTHAK KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
713	713	1	ZSANDEEP JAIN			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
712	712	1	ZROSHAN LAL LOKESH KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
711	711	1	ZRIDHIMMA DEPARTMENTAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
710	710	1	ZRAJOO CIGRETTE STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
709	709	1	ZQUALITY GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
708	708	1	ZOM VAISHNO KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
707	707	1	ZOM PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
706	706	1	ZOM PRAKASH RAKESH KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
705	705	1	ZNITTU PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
704	704	1	ZNITIN GROCERY STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
703	703	1	ZNAVIN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
702	702	1	ZMOHSIN KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
701	701	1	ZMANGAL MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
700	700	1	ZMANGAL GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
699	699	1	ZMAHI KIRANA STORE SP			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
698	698	1	ZKALICHARAN MAHESH CHAND			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
697	697	1	ZJAI MATA GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
696	696	1	ZHARSH MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
695	695	1	ZHARISH KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
694	694	1	ZFERMAN AALAM			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
693	693	1	ZFAISHION GALLARY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
692	692	1	ZDURGA TRADING CO.			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
691	691	1	ZDULI CHAND LOKESH KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
690	690	1	ZDUBEY KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
689	689	1	ZDSR & BIDHURI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
688	688	1	ZDINESH KUMAR CROCKERY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
687	687	1	ZDINESH CROCKERY HOUSE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
686	686	1	ZCHAPPAN BHOG			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
685	685	1	ZBINTOO KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
684	684	1	ZBHOLE PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
683	683	1	ZATUL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
682	682	1	ZASHOK KUMAR ASHU KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
681	681	1	ZARAGHAV KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
680	680	1	ZANUJ MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
972	727	1	Dum Dum Medicos			COL				1	1	1	0
679	679	1	ZAMANISH KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
678	678	1	ZAKALICHARAN MAHESH CHAND			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
677	677	1	ZAHUJA READYMADE & GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
676	676	1	ZAAKASH MEDICOSE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
675	675	1	YUVRAJ CONFECTIONERS & KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
674	674	1	YUVAN KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
673	673	1	YUSUF KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
672	672	1	YUKTI TRADING CO.			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
671	671	1	YOGESH STORE RR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
670	670	1	YOGESH KUMAR KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
669	669	1	YOGESH KIRANA STORE SP			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
668	668	1	YOGESH KIRANA STORE LM			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
667	667	1	YOGESH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
666	666	1	YASH CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
665	665	1	VMH SUPER MARKET			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
664	664	1	VISHNOI KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
663	663	1	VISHAL READYMADE STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
662	662	1	VISHAL KUMAR JATIN KUMAR KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
661	661	1	VISHAL CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
660	660	1	VIRAT KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
659	659	1	VIPUL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
658	658	1	VINOD READYMADE & GENERAL MERCHANT			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
657	657	1	VINOD MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
655	655	1	VINIT KANASL PROV. STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
654	654	1	VINAYAK GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
653	653	1	VINAY MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
652	652	1	VINAY KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
651	651	1	VIKASH KIRANA STORE (SP)			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
650	650	1	VIKASH KIRANA STORE (DADRI)			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
649	649	1	VIJAY KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
648	648	1	VIJAY - ATUL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
633	633	1	TIWARI DEPARTMENTAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
647	647	1	VIHAN ENTERPRISES			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
656	656	1	VINOD KUMAR PRAMOD KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
646	646	1	VIBHOR TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
645	645	1	VHM CONFECTIONERY AND SUPER MARKET			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
644	644	1	VERDHAMAN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
643	643	1	VEER PRAKASH C/O VINAY KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
642	642	1	VED PRAKASH JAI BHAGWAN			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
641	641	1	VASUDEV GENARAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
640	640	1	VASH CHABARA CONF. STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
639	639	1	VANSH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
638	638	1	VAISHNO MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
637	637	1	URBAN PATTY HOUSE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
636	636	1	UPENDRA MITTAL KIRANA STORE NTPC			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
635	635	1	UJJAWAL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
634	634	1	TYAGI MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
631	631	1	TEJBHAN SITARAM			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
629	629	1	SWETA BEAUTY PARLOUR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
625	625	1	SURESH CHAND PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
624	624	1	SURESH CHAND KULDEEP KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
623	623	1	SURENDER SINGH			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
622	622	1	SURAJ MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
621	621	1	SUPER GARMENTS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
628	628	1	SWASTIK SUPER BAZAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
620	620	1	SUNIL RAJE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
618	618	1	SUNIL KIRANA PALI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
617	617	1	SUNIL KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
616	616	1	SUNDER SHOPPING HOUSE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
615	615	1	SUMMIT TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
614	614	1	SUMMIT KIRANA STORE RJ			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
613	613	1	SUMIT KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
612	612	1	SULTAN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
611	611	1	SULTAN CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
626	626	1	SURESH GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
619	619	1	SUNIL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
630	630	1	TANNU TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
632	632	1	TILAPATA GROCERY MART			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
627	627	1	SUSHIL KUMAR & SONS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
610	610	1	SUJATA MEDICOSE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
609	609	1	SUHAG BANGLES COSMATICS AND BEAUTY PARLOUR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
608	608	1	SUDH BAJAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
607	607	1	SUBODH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
605	605	1	SUBASH JAIN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
604	604	1	SUBASH GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
603	603	1	SUBASH BOOK DEPOT			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
602	602	1	SS MALIK GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
601	601	1	SR ON LINE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
600	600	1	SONU TRADERS & GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
599	599	1	SONU KIRANA STORE WS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
598	598	1	SONU COSMATICS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
597	597	1	SONU CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
596	596	1	SK TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
594	594	1	SINGHAL TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
589	589	1	SINGHAL BROTHERS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
592	592	1	SINGHAL PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
583	583	1	SIDH BABA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
585	585	1	SIKANDER KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
591	591	1	SINGHAL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
593	593	1	SINGHAL SWEETS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
590	590	1	SINGHAL COSMATICS STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
565	565	1	SHRI BALAJI HOUSE KEEPING SERVICE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
588	588	1	SINGHAL BRO NEERAJ			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
587	587	1	SINGHAL BANDHU PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
586	586	1	SINDHANT MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
584	584	1	SIDHANT MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
582	582	1	SHYAM TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
581	581	1	SHYAM MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
580	580	1	SHUBHAM MEDICAL STORE (SP)			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
579	579	1	SHUB HITKARI TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
578	578	1	SHRRI HARI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
577	577	1	SHRI SHYAM PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
576	576	1	SHRI SAI CONFECTIONARY & GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
575	575	1	SHRI RAM TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
574	574	1	SHRI RAM GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
573	573	1	SHRI RAM GENERAL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
572	572	1	SHRI RAM CONF. STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
571	571	1	SHRI NIWAS KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
570	570	1	SHRI MANGAL GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
568	568	1	SHRI BALAJI TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
567	567	1	SHRI BALAJI TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
566	566	1	SHRI BALAJI MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
564	564	1	SHRI BALAJI GENERAL STORE MK			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
563	563	1	SHRI BALAJI GENERAL STORE DRM			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
562	562	1	SHRI BALAJI GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
561	561	1	SHRI BALAJI CONFECTIONERS & GIFT			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
560	560	1	SHRI BALAJI CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
559	559	1	SHRI BALAJI BEAUTY SHOP			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
558	558	1	SHRI BALAJI ANUJ CONFECTIONERS SP			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
556	556	1	SHREE GANGA AGENCY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
555	555	1	SHREE GANESH the MULTY SHOP			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
554	554	1	SHREE BALAJI CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
553	553	1	SHOBIT TRADING COMPANY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
595	595	1	SINGHAL TRADING CO.			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
552	552	1	SHIVAM PHARMA & SURGICAL			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
557	557	1	SHREE JEE FOODS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
569	569	1	SHRI HARI PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
551	551	1	SHIVAM MEDICOSE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
550	550	1	SHIV TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
549	549	1	SHIV TR PURROSHATTAM MAHESH			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
548	548	1	SHIV SHANKAR COSMATICS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
547	547	1	SHIV SHAKTI STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
546	546	1	SHIV SHAKTI KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
545	545	1	SHIV S CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
544	544	1	SHIV NADAR UNIVERSITY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
543	543	1	SHIV MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
542	542	1	SHIV KUMAR SANJAY KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
541	541	1	SHIV KUMAR MALAKPUR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
540	540	1	SHIV KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
539	539	1	SHIV GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
538	538	1	SHIV DEPARTMENTAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
537	537	1	SHIV CONFECTIONERS STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
536	536	1	SHIV CONF. S PUR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
535	535	1	SHIV CATERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
534	534	1	SHER SINGH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
533	533	1	SHARMA MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
532	532	1	SHARMA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
531	531	1	SHARMA CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
530	530	1	SHANU GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
529	529	1	SHANTI MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
528	528	1	SHANKAR SWEETS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
527	527	1	SHANA CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
526	526	1	SHAMA GIFT CENTRE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
525	525	1	SHAHNAZ MEDICOSE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
524	524	1	SHAH MEDICOSE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
523	523	1	SHAGUN SWEETS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
2054	105	1	Soni Supermart	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
2178	176	1	ATS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3168	945	1	PRINCE GEN STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
3351	1141	1	FRIENDS HOUSE KEEPING SOL	\N		MARG	41:53.9	\N	\N	2	0	1	0
2571	474	1	HARIOM ELDECO	\N		MARG	35:52.7	\N	\N	2	0	1	0
2163	163	1	SRI SRI THE AYURVEDA SATTVA MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
1721	31	1	SATYARTH GREEN PRODUCTS	\N	ALPHA 1 DELTA 1	MAR	35:52.7	\N	\N	2	1	1	0
2353	312	1	PATANJALI KASANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3036	824	1	LUXMI MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
500	500	1	SAIFFI KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
505	505	1	SANDEEP JAIN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
506	506	1	SANDEEP KUMAR KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
522	522	1	SHAGUN PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
521	521	1	SAURABH KIRANA STORE KING BAZAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
520	520	1	SAURABH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
519	519	1	SAURABH GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
518	518	1	SATYENDRA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
517	517	1	SARTHAK TRADING CO.			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
516	516	1	SARFARAJ FAISAL COSMATICS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
515	515	1	SANTOSH TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
514	514	1	SANJEEVANI MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
513	513	1	SANJEEV KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
512	512	1	SANJAY KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
511	511	1	SANJAY GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
510	510	1	SANJAY CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
509	509	1	SANGAM KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
508	508	1	SANDEEP SAINI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
507	507	1	SANDEEP MEDICAL STORES			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
504	504	1	SALMAN PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
503	503	1	SALMAN NAI AABADI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
502	502	1	SAKSHI BANGELS & GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
501	501	1	SAIFICA MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
499	499	1	SAI TRADING CO.			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
2282	260	1	A ONE BAKERY	\N		MARG	35:52.7	\N	\N	2	0	1	0
498	498	1	SAI BIKANER SWEETS AND RESTAURANT			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
497	497	1	SAGUN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
496	496	1	SAGUN CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
494	494	1	SADDAM KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
493	493	1	SACHIN PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
492	492	1	SACHIN PRO RR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
491	491	1	SACHIN KIRANA SURAJPUR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
490	490	1	SACHIN COSMATICS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
489	489	1	S KUMAR PROVISION & GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
488	488	1	RV FASHION POINT			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
487	487	1	RUCHI CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
486	486	1	RS TRADING CO.			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
485	485	1	ROYAL ENTERPRISES			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
484	484	1	ROSHAN LOKESH			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
483	483	1	ROSHAN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
482	482	1	ROHIT KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
481	481	1	RL KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
479	479	1	RIYA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
478	478	1	RISHI KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
474	474	1	REAL DAILY FRESH			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
473	473	1	RD PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
471	471	1	RAVI KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
470	470	1	RATISH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
469	469	1	RATISH DADRI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
468	468	1	RASWARA ENTERPRISES			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
467	467	1	RANA GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
466	466	1	RAMESWARAM PAWAN GARG KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
465	465	1	RAMESH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
463	463	1	RAMA RAKESH			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
461	461	1	RAMA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
460	460	1	RAMA CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
459	459	1	RAMA CONFECTIONARY STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
458	458	1	RAM MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
457	457	1	RAM KISHORE KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
456	456	1	RAM KISHAN DAS PRABHU DAYAL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
455	455	1	RAM BHUL PAN BHANDAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
453	453	1	RAJOO KONDLI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
452	452	1	RAJKUMAR CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
451	451	1	RAJJAK KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
450	450	1	RAJEY LAL AND CO.			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
448	448	1	RAJESH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
447	447	1	RAJENDRA GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
446	446	1	RAJENDER GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
445	445	1	RAJE PRADEEP			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
444	444	1	RAJBALA BANGLES STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
443	443	1	RAJAN LAL & SONS NON GST			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
442	442	1	RAJ TRADING			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
441	441	1	RAJ MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
440	440	1	RAJ LUXMI PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
439	439	1	RAJ LUXMI KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
438	438	1	RAJ KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
437	437	1	RAHUL PROVISION STORE DRM			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
436	436	1	RAHUL PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
435	435	1	RAHUL KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
434	434	1	RAHUL GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
433	433	1	RAGHAV TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
480	480	1	RK DEPARTMENTAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
475	475	1	REAL MEDICOSE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
477	477	1	RINKU PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
454	454	1	RAKESH KUMAR RAJ KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
464	464	1	RAMESH CHAND VINOD KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
472	472	1	RAWAL RETAIL CORPORATION			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
495	495	1	SAGUN ATTA CHAKKI			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
432	432	1	RAGHAV MOHIT KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
431	431	1	RADHEY RADHEY KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
430	430	1	RADHEY PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
428	428	1	PURVANCHAL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
427	427	1	PURVAN CHAL KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
426	426	1	PRIYANSHU CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
425	425	1	PRIYA COSMETICS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
424	424	1	PRINCE MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
423	423	1	PRINCE KIRANA STORE WS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
421	421	1	PRAVEEN TEA STALL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
420	420	1	PRAVEEN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
419	419	1	PRASHANT CONF GT ROAD			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
417	417	1	PRAMOD KUMAR SHIV KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
416	416	1	PRAMOD KUMAR ANKUR JINDAL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
415	415	1	PRAMOD KOMAR VINOD KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
413	413	1	PRAMOD KIR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
412	412	1	PRAMOD ANKUR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
411	411	1	PRAKASH CHAND VINOD KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
410	410	1	PRAGATI FOODS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
409	409	1	PRADEEP KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
407	407	1	PRACHI DEPARTMENTAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
406	406	1	PRABHAT KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
405	405	1	PRABHAT			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
404	404	1	POOJA KIRANA STORE SP			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
402	402	1	PIYUSH VINEET			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
400	400	1	PERMANAND MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
398	398	1	PARMANAND MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
397	397	1	PAPPY TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
396	396	1	PAPPU JAIN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
395	395	1	PANKAJ KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
394	394	1	ONE STOP MART			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
393	393	1	OM VAISHNO CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
391	391	1	OM SHIV MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
390	390	1	OM SHANTI OM MEDICOSE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
389	389	1	OM SHANTI MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
388	388	1	OM SAI SG CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
387	387	1	OM SAI RAM MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
386	386	1	OM SAI GARMENTS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
385	385	1	OM SAI CONFCTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
384	384	1	OM RETAIL MART			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
382	382	1	OM PRAKASH GUDDU			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
378	378	1	OM GIFT CENTRE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
377	377	1	OM EVERGREEN SWEETS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
376	376	1	OM DAIRY STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
375	375	1	OM DAIRY PRACHI KE PASS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
374	374	1	OM CONFECTIONERS GT ROAD			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
372	372	1	OM CHABRA CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
371	371	1	OM AGGARWAL SWEETS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
369	369	1	NITIN STATIONARY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
418	418	1	PRASAD GROCERY & VEGETABLE STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
401	401	1	PIYUSH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
379	379	1	OM LUXMI TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
403	403	1	POOJA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
399	399	1	PERFECT GIFT CENTRE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
373	373	1	OM CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
422	422	1	PREM CHAND PROMAD KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
392	392	1	OM TRADER			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
380	380	1	OM PRAKASH ASHISH KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
414	414	1	PRAMOD KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
408	408	1	PRACHI OVERSEAS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
383	383	1	OM PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
381	381	1	OM PRAKASH CHAMAN PRAKASH			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
368	368	1	NITIN GROCERY STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
367	367	1	NIKHIL PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
366	366	1	NIKHIL CONFECTIONERS STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
365	365	1	NEW NANDAN MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
364	364	1	NEW MALIK GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
363	363	1	NEW INDIA UMESH STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
362	362	1	NAVODYA VIDALAYA CANTEEN			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
361	361	1	NAVIN PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
360	360	1	NAVIN COSMATICS & BEENA BANGLES			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
359	359	1	NAVIN CANTEEN			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
358	358	1	NATIONAL MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
357	357	1	NASIR KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
356	356	1	NARESH KUMAR KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
355	355	1	NARESH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
354	354	1	NARESH BEAUTY CENTRE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
353	353	1	NARENDRA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
352	352	1	NARAYAN TELPHONE BADPURA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
351	351	1	NANDAN MEDICAL STORE S			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
350	350	1	NANDAN MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
347	347	1	NAGAR DAIRY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
346	346	1	NAAZ COSMATICS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
345	345	1	MUSKAN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
344	344	1	MUSKAN KIRANA & ANDA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
343	343	1	MUSKAN CONFECIONARY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
341	341	1	MUNNA BANGLES &GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
340	340	1	MUKH RAM GOYAL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
338	338	1	MUKESH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
337	337	1	MS CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
336	336	1	MOTHER DAIRY DADRI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
335	335	1	MOTHER DAIRY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
334	334	1	MOOL CHAND PAWAN KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
333	333	1	MONU KIRANA STORE (SURAJ PUR)			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
331	331	1	MOHIT KIRANA STORE JARCHA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
330	330	1	MOHIT KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
329	329	1	MOHAN CONFECTIONARY STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
328	328	1	MOD KHALID SAIFULLA PROVISION			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
325	325	1	MITTAL PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
324	324	1	MITTAL NIKHIL KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
323	323	1	MITTAL KIRANA STORE JAITPUR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
320	320	1	MITTAL ARUN			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
319	319	1	MITHAN RAMESH			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
318	318	1	MITHAN LAL RAMESH CHAND			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
317	317	1	MINI MART			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
316	316	1	MAYANK KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
315	315	1	MAYANK CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
314	314	1	MATESWARI COSMATICS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
313	313	1	MASTER JI MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
312	312	1	MANSI TRADING COMPANY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
311	311	1	MANSA FASHION GALLERY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
310	310	1	MANOJ KUMAR SINGHAL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
308	308	1	MANISH TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
307	307	1	MANGU MAL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
306	306	1	MANGALAARYA RETAIL & ECOMMERCE LLP			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
322	322	1	MITTAL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
305	305	1	MANGAL MEDICOSE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
327	327	1	MKS PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
342	342	1	MUNSHI LAL RAGHUNATH PRASAD			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
309	309	1	MANOJ KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
332	332	1	MOHSIN KIRANA & CONFECTIONAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
321	321	1	MITTAL GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
348	348	1	NAMAN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
339	339	1	MUKESH KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
304	304	1	MANGAL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
303	303	1	MANGAL BALAJI GARMENTS STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
302	302	1	MANAV SHISHODIA CONFECTIONERY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
301	301	1	MAHI SPUR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
299	299	1	MAHI CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
298	298	1	MAHI BOOK STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
297	297	1	MAHESH TILAPATA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
296	296	1	MAHESH CHAND DHARMESH KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
295	295	1	MAHENDRA TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
294	294	1	MAHENDRA SHARMA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
293	293	1	MAHENDRA PRAMOD SHARAD			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
292	292	1	MAHENDRA KUMAR SURENDER KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
290	290	1	MAHENDRA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
289	289	1	MAHENDER DEEPANSHU			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
288	288	1	MAHAVIR STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
287	287	1	MAHAVIR MEDICAL CENTRE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
286	286	1	MAHADEV CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
285	285	1	LUXMI MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
284	284	1	LOSS ACOOUNTS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
283	283	1	LOSS A/C S PUR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
227	227	1	JAVED TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
282	282	1	LOKESH KUMAR ROHIT KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
281	281	1	LOKESH KUMAR PANKAJ KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
280	280	1	LOKESH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
279	279	1	LAXMI TRADING CO			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
278	278	1	LAVI GIFT CENTRE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
277	277	1	LALIT BEAUTY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
276	276	1	LALAJI SWEETS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
275	275	1	KWALITY GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
274	274	1	KUNWAR MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
273	273	1	KUMAUO KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
272	272	1	KUMAR GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
271	271	1	KULDEEP KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
270	270	1	KRITI KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
268	268	1	KRISHNA DAIRY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
267	267	1	KRISHNA CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
266	266	1	KP SINGH SUPPLIERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
265	265	1	KOHINOOR TRADING CO.			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
264	264	1	KISHAN PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
263	263	1	KISHAN LAL BRIJ KISHORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
260	260	1	KHUSHI CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
258	258	1	KHURJA DESHI GHEE STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
257	257	1	KAVYA BEAUTY PARLOUR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
256	256	1	KAVYA & BROTHERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
254	254	1	KAUSHALYA WORLD SCHOOL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
253	253	1	KASHYAP KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
251	251	1	KARTHIK STN			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
250	250	1	KARTHIK KIRANA STORE GHODI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
249	249	1	KANTI PRASAD MUKESH CHAND			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
248	248	1	KANTI MUKESH			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
247	247	1	KANSAL PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
246	246	1	KANSAL COSMATICS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
245	245	1	KANHAIYA CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
244	244	1	KANHA COSMATICS STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
243	243	1	KANAK KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
242	242	1	KAMLESH KUMAR NARESH KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
241	241	1	KAMAL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
300	300	1	MAHI KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
291	291	1	MAHENDRA KUMAR PRAMOD KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
255	255	1	KAVITA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
252	252	1	KARTIK KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
262	262	1	KING BAZAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
261	261	1	KHUSHI ENTERPRISES			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
240	240	1	KAMAL HANDICRAFTS & STATIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
239	239	1	KAMAL GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
238	238	1	KALPANA MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
237	237	1	KALI MAHESH			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
235	235	1	K.G. TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
233	233	1	K APIL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
231	231	1	JOHARI MAL YOGESH KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
230	230	1	JMD MEGHA MART			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
229	229	1	JITENDRA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
228	228	1	JEEVAN MART			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
226	226	1	JAINSHI COSMATICS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
225	225	1	JAIN PANEER BHANDAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
224	224	1	JAIN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
223	223	1	JAIN CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
222	222	1	JAI SHREE RAM KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
221	221	1	JAI MATESWARI TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
220	220	1	JAI MATA STORE SP			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
219	219	1	JAI MATA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
218	218	1	JAI MATA DI COSMATICS & READYMADE GARMENTS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
217	217	1	JAI BABA GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
216	216	1	JAI AMBEY COSMATICS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
215	215	1	JAGDISH PRASAD & SONS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
213	213	1	ISHA CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
212	212	1	HONEY MONEY TOP RETAIL PRIVATE LTD.			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
211	211	1	HIRA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
210	210	1	HIMANSHI COSMATICS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
209	209	1	HEENA SHOPPING CENTRE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
208	208	1	HARSH MEDICOSE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
207	207	1	HARI SWEETS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
206	206	1	HARI OM SINGH			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
205	205	1	HARI OM GOEL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
204	204	1	HARI OM CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
203	203	1	HARENDRA BHATI GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
202	202	1	HAPPY GREEN VEGITABLE AND PRODUCTS SHOP			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
201	201	1	HAPPY GREEN			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
200	200	1	HANUMAN TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
198	198	1	GYAN BABA MEDICAL STROE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
196	196	1	GURU KI KRIPA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
195	195	1	GUPTA KIRANA STROE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
194	194	1	GUNMUN REAL COSMATICS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
783	193	1	GUNJAN GENERAL STORE			COL	2018-12-25 13:15:21.181159+05:30			1	0	1	0
192	192	1	GULLE JAIN			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
191	191	1	GROW GREEN PRODUCTS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
189	189	1	GOYAL PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
188	188	1	GOYAL MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
187	187	1	GOYAL KIRANA VED RAM KHERI WALE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
185	185	1	GOYAL DEPARTMENTAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
184	184	1	GOYAL CROCKERY HOUSE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
183	183	1	GOYAL CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
182	182	1	GOYAL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
181	181	1	GOVIND CONFECTIONERS STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
180	180	1	GOPAL STD			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
179	179	1	GOPAL MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
178	178	1	GOEL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
177	177	1	GOEL CIGRATTE STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
176	176	1	GIRISH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
175	175	1	GIRDHARI LAL CHIRANJI LAL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
190	190	1	GOYAL TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
197	197	1	GURU KIRPA GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
232	232	1	JP ENTERPRISES			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
199	199	1	GYAN MAL CHIRANJI LAL			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
236	236	1	KALI CHARAN MAHESH CHAND			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
234	234	1	K K STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
174	174	1	GIRDHARI CHIRANJI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
173	173	1	GENERAL LEDGER			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
172	172	1	GAYATRI KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
171	171	1	GAURAV READYMADE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
170	170	1	GAURAV PAN BHANDAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
169	169	1	GAURAV KIRANA STORE SP			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
168	168	1	GAURAV KIRANA STORE JR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
167	167	1	GAURAV KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
165	165	1	GAURAV CONF. STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
164	164	1	GAURAV ANIL CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
163	163	1	GARIMA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
162	162	1	GARG S PUR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
160	160	1	GARG MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
159	159	1	GARG KIRANA STORE S PUR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
157	157	1	GARG DADRI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
156	156	1	GARG CONFECTIONERS STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
155	155	1	GANESH KIRANA & GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
154	154	1	GAJENDER SINGH  S/O MAHARAJ SINGH			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
153	153	1	GAGAN CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
152	152	1	G.S. FASHION			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
150	150	1	G-ONE SUPER MART			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
149	149	1	G-ONE FRESH SHOPING MART			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
147	147	1	FAUJI BHAI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
146	146	1	FASHION GALLERY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
144	144	1	FAROOKH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
141	141	1	FAIMLY MART			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
140	140	1	EVERYDAY SHOPPING MART PVT LTD			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
138	138	1	DURGA PRASAD TUKKI RAM			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
137	137	1	DURGA CONF. STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
136	136	1	DUM VARUN COSMATICS JUNCTION			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
135	135	1	DUM DUM MEDICOS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
134	134	1	DULI CHAND DINESH KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
133	133	1	DUBEY TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
132	132	1	DTC			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
130	130	1	DS NAGAR KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
129	129	1	DIVESH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
128	128	1	DISHU KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
127	127	1	DINESH STORES			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
126	126	1	DINESH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
125	125	1	DHRUV KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
124	124	1	DHARMENDRA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
123	123	1	DEV GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
121	121	1	DELHI CHAT BHANDAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
120	120	1	DEEPAK READYMADE STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
119	119	1	DEEPAK READYMADE AND GENARAL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
118	118	1	DEEPAK KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
117	117	1	DEEPAK KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
116	116	1	DEEPAK BEAUTY & GIFT CENTRE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
115	115	1	DEEP READYMADE STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
112	112	1	DAVENDRA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
111	111	1	DANISH KIRANA STORE DADRI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
109	109	1	CHOUDHARY PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
114	114	1	DAYA SHANKAR KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
166	166	1	GAURAV ENTERPRISES			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
161	161	1	GARG READYMADE & GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
139	139	1	DURGA TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
113	113	1	DAVENDRA KUMAR AYUSH KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
151	151	1	G-ONE TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
122	122	1	DELHI PHARMACY			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
145	145	1	FAROOKH TRADING CO.			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
142	142	1	FAMILY BAJAR			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
110	110	1	DANISH GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
158	158	1	GARG KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
107	107	1	CHIDDA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
106	106	1	CHIDDA KHAN RAFIQE AHMED			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
105	105	1	CHAUHAN PANEER BHANDAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
104	104	1	CH KRISS PANWAR KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
103	103	1	BRAHMAJIT SINGH			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
102	102	1	BIRENDER KUMAR LAVANYA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
101	101	1	BINTOO KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
100	100	1	BIJENDRA PAN BHANDAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
98	98	1	BHUPENDER KAMRA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
96	96	1	BHUPATI STN			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
95	95	1	BHRAM DEV			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
94	94	1	BHOLEY PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
93	93	1	BHOLEY NON GST			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
92	92	1	BHOLE TRADING CO.			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
91	91	1	BHOLE GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
90	90	1	BHIKKI MAL MAHESH CHAND			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
89	89	1	BHARAT KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
88	88	1	BHAGWATI READYMADE & GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
87	87	1	BHAGWAT PRASAD & SONS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
86	86	1	BHAGMAL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
85	85	1	BANSHI CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
84	84	1	BANSAL TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
82	82	1	BALAJI PHOTO STATE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
81	81	1	BALAJI KIRANA STORE STN			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
80	80	1	BALAJI KIRANA STORE GT			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
78	78	1	BALAJI GIFT CENTRE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
77	77	1	BALAJI GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
75	75	1	BALAJI CONFECTIONERY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
74	74	1	BALAJI CONFECTIONERS OM DAIRY			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
73	73	1	BALAJI CONFECTIONERS GT			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
72	72	1	BALAJI CONFECTIONERS AY GANJ			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
71	71	1	BALAJI CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
70	70	1	BALAJI CONF. TEHSIL KE SAMNE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
69	69	1	BAKUL PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
68	68	1	BAJRANG KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
67	67	1	BADRI PRASAD JI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
66	66	1	BABLOO KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
65	65	1	BABA TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
64	64	1	BABA MOHAN RAM KIRANA TORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
63	63	1	BABA MOHAN RAM GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
61	61	1	BABA CONFECTIONERS STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
59	59	1	AVEEZ CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
58	58	1	ATUL MONU KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
57	57	1	ATUL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
56	56	1	ASRA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
55	55	1	ASHOK KUMAR ASHU KUMAR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
54	54	1	ASHIF KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
53	53	1	ASHARAM & SONS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
52	52	1	ARUN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
51	51	1	ARSH PROVISION STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
50	50	1	APNA GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
48	48	1	ANSHU KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
47	47	1	ANSHU GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
46	46	1	ANSHIKA TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
2770	622	1	DAILY DAY STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
79	79	1	BALAJI KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
97	97	1	BHUPATI TRADING CO.			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
83	83	1	BALAJI STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
60	60	1	AVINASH KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
99	99	1	BIJENDRA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
45	45	1	ANMOL PHARMACY			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
76	76	1	BALAJI DEPARTMENTAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
62	62	1	BABA MEDICAL STORE (AGENCIES)			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
44	44	1	ANMOL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
43	43	1	ANKIT KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
42	42	1	ANIL KUMAR CUTTER			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
41	41	1	ANIKATE KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
40	40	1	ANAND AND SONS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
39	39	1	AMRISH RAWAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
38	38	1	AMIT SHOPPING CENTRE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
37	37	1	AMIT KUMAR GUPTA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
36	36	1	AMIT KIRANA STORE RR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
34	34	1	AMIT JAIN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
33	33	1	AMAN MEDICAL STORE NON GST			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
32	32	1	ALISHA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
31	31	1	AKASH TYAGI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
30	30	1	AK KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
29	29	1	AJIT KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
28	28	1	AJAY KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
27	27	1	AJAY KIR RR			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
26	26	1	AJAY HARIOM			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
25	25	1	AJAY AAYUSH KIRANA			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
24	24	1	AHUJA READYMADE & GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
22	22	1	AGGARWAL SWEETS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
21	21	1	AGGARWAL MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
20	20	1	AGGARWAL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
17	17	1	AGGARWAL GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
16	16	1	AGGARAWAL CONFECTIONERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
15	15	1	AFFAA DADRI			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
13	13	1	AAYAN KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
12	12	1	AASHIRWAD ENTERPRISES			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
11	11	1	AARUSHI GOYAL			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
10	10	1	AARUSH MEDICAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
8	7	1	AAKASH MEDICOSE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
5	5	1	A SUNIL AGGARWAL KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
4	4	1	A SINGHAL TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
3	3	1	A JAI DURGA KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
2	2	1	A AMRIT STORE			MARG	2018-12-23 17:18:09.772917+05:30	2019-01-12 19:37:27.06808+05:30		1	0	1	0
1	1	1	A AGGARWAL TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	0	1	0
2435	370	\N	KAJAL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2437	370	\N	KAJAL KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2446	378	\N	NOIDA SHOP	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2447	378	\N	NOIDA SHOP	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2454	384	\N	KAVYA BROTHERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2460	389	\N	BIG B FOOD PRODUCTS*	\N		MARG	41:53.9	\N	\N	2	0	1	0
2479	406	\N	AGGAWAL TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2480	406	\N	AGGARWAL TRADERS	\N		COL	35:57.5	\N	\N	2	0	1	0
2484	409	\N	GAGAN MEDICOSE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2485	409	\N	GAGAN MEDICOSE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2491	414	\N	SHRi AMRIT PHARAMACY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2492	414	\N	SHRI AMRIT PHARMACY	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2497	417	\N	HARSH MEDICAL STORE	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2498	417	\N	HARSH MEDICAL	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2503	421	\N	MAHA LUXMI GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2507	423	\N	HIMALAYA RETAILS PVT. LTD.	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2515	430	\N	BALAJI MEDICAL STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2527	435	\N	BALAJI KIRANA STORES	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2528	435	\N	BALAJI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
9	9	1	AAKASH TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
14	14	1	ABHISHEK DEPARTMENTAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
18	18	1	AGGARWAL KIRANA & DRY FRUITS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
35	35	1	AMIT KIRANA STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
2517	431	\N	PAWAN CHAURASIA	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	1	1	0
2522	434	\N	BIG SHOP	\N		MARG	35:52.7	\N	\N	2	1	1	0
6	6	1	AADI GENERAL STORE			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
2505	422	\N	TUSHAR TRADING CO	\N		MARG	51:50.9	\N	\N	2	1	1	0
23	23	1	AGGARWAL TRADERS			MARG	2018-12-23 17:18:09.772917+05:30			1	1	1	0
2518	431	\N	PAWAN CHAURASIYA STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
2463	391	\N	JAIN SHREE GROCERY	\N		MARG	35:52.7	\N	\N	2	1	1	0
2532	438	\N	MA A NARAYANI GENERAL STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2540	444	\N	SHIV MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2548	451	\N	PRITAM KIRANA STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2556	459	\N	MANGLA ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	0	1	0
2575	477	\N	PATHAK GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2576	477	\N	PATHAK GENERAL STORE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2579	479	\N	SHIV DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2596	494	\N	MUSKAN KIRANA STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2601	498	\N	POOJA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2603	499	\N	MUSKAN MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2604	499	\N	MUSKAN MEDICOS	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2609	503	\N	VANDANA COSMATICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2611	504	\N	OM KHUSHI KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2614	506	\N	KUMAU KIRANA STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2619	511	\N	SISHODIA MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2620	511	\N	SISODIA MEDICAL STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2629	518	\N	HABVIR KIRANA STORE	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2630	518	\N	HABVIR KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2636	523	\N	RAMESHWARAM KIRANA STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2637	523	\N	RAMESWARAM KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2639	524	\N	MORNING CHOICE STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2641	525	\N	AAYAN KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2643	526	\N	SHIV KIRANA	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2645	527	\N	TARUN KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2659	540	\N	GRENO STATIONARY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2666	546	\N	ANSHIKA COSMATICS & GIFT	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2669	548	\N	TANNU COSMATICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2680	558	\N	SANJAY GUPTA GENERAL STOR	\N		MARG	57:27.8	\N	\N	2	0	1	0
2684	561	\N	HARI OM KIRANA STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2685	561	\N	HARI OM KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2687	562	\N	PEER BABA KIRANA STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2688	562	\N	PEER BABA KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2694	566	\N	DAILY NEED DEPARTMENTAL S	\N		MARG	35:52.7	\N	\N	2	0	1	0
2699	569	\N	PAPPY TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2704	573	\N	JANAKI PROVISION STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2706	574	\N	HEENA SHOPPING CENTRE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2734	597	\N	SHIVAM MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2741	602	\N	JAI DURGE SWEETS AND BAKE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2744	604	\N	COLOURS COSMATICS	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2745	604	\N	COLOURS COSMATICS	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2754	613	\N	SHRI GANESH KIRANA STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2756	613	\N	SHRI GANESH KIRANA STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2757	614	\N	HARSHIT DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2759	615	\N	KAMANI COSMATICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2772	623	\N	STORE 51	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2775	625	\N	PANDEY KIRANA STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2777	626	\N	OM DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2784	630	\N	SANTOSH GENERAL STORE	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2791	635	\N	SORYA DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2792	635	\N	SURYA DEPARTMENTAL STORE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2802	644	\N	SHIV TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2806	647	\N	ZSARVODYA MILK FOOD	\N		MARG	35:52.7	\N	\N	2	0	1	0
2807	647	\N	SARVODYA MILK FOOD	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2809	648	\N	RAJELAL AND CO.	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2823	659	\N	RAJ KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2833	667	\N	RAVI KIRANA STORE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2838	671	\N	GAURAV KIRANA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2844	676	\N	RIDDHI MEDICOS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2845	676	\N	RIDDHI MEDICOSE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2847	677	\N	MITTAL STORES	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2853	682	\N	MANOJ KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2762	616	\N	FRESH ZONE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
2696	567	\N	OM SHANTI MEDICAL STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	1	1	0
2768	620	\N	FRESH FOOD SERVICES	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
2710	577	\N	AGGARWAL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2588	487	\N	SHIV GENERAL STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
2691	564	\N	G-ONE FRESH SHOPING MART	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
2829	663	\N	SINGHAL BROTHERS	\N		MARG	35:52.7	\N	\N	2	1	1	0
2567	470	\N	GAURAV ENTERPRISES	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
2736	598	\N	SAIFICA MEDICAL STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	1	1	0
2781	629	\N	RAM- MEDICINES	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	1	1	0
2788	633	\N	TILAPATA GROCERY MART	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
2826	661	\N	SWASTIK SUPER BAZAR	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	1	1	0
2782	629	\N	RAM- MEDICINES	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
2711	577	\N	AGGARWAL KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	1	1	0
2854	682	\N	MANOJ KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2861	686	\N	SHREE GANESH KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2862	686	\N	SHREE GANESH STORE.	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2865	688	\N	GOYAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2876	698	\N	SUMMIT TRADERS	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2882	702	\N	MONU KIRANA STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2886	704	\N	DISHA COSMATICS	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2896	710	\N	FRIENDSPROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2897	710	\N	FRIENDS PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2906	718	\N	RADHEY KIRANA STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2928	738	\N	SUNIL AGGARWAL KIRANA STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2929	738	\N	SUNIL AGGARWAL KIRANA STO	\N		MARG	45:36.2	\N	\N	2	0	1	0
2933	741	\N	VISHNU CANTEEN	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
2934	741	\N	VISHNU CANTEEN	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2939	745	\N	SANGAM KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2946	750	\N	SMARTY TELECOM & SERVICES	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2947	750	\N	SMARTY TELECOM & SERVICES	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2961	764	\N	SINGHAL KIRANA STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2962	764	\N	SINGH KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2963	764	\N	SINGH KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2968	767	\N	JAGGAN NATH GUPTA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2978	775	\N	SANJEEVANI MEDICAL STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2979	775	\N	SANJEEVINI MEDICOSE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2981	776	\N	SONU STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2985	780	\N	HARSH MEDICOSE	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	0	1	0
3000	793	\N	SHRI KRISHNA MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3018	808	\N	GARG MEDICOSE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
3021	810	\N	KESHAV KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3022	810	\N	KESHAV KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
3040	827	\N	TBL PROJECTS LIMITED	\N		MARG	35:52.7	\N	\N	2	0	1	0
3041	827	\N	TBL PROJECTS LIMITED	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
3042	827	\N	TBL PROJECTS LIMITED	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
3044	828	\N	KANHA CONFACTORANRY	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
3052	835	\N	TBL SHOP	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
3055	836	\N	RADHA MEDICAL HALL	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
3062	842	\N	SHUBHAM MEDICAL SORE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
3063	842	\N	SUBHAM MEDICAL	\N		MARG	45:36.2	\N	\N	2	0	1	0
3066	844	\N	GURU KRIPA MEDICOSE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
3099	879	\N	ADEN STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
3120	899	\N	A TO Z STORE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
3127	904	\N	DKLP SUPER MART	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
3071	849	1	HASRAT ALI KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3146	922	\N	BANSAL TRADING COMPANY	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
3195	972	\N	SUMMIT KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
3252	1044	\N	FLAVOURED PAN SHOP	\N		MARG	15:40.6	\N	\N	2	0	1	0
3387	1178	\N	BREW BAKES.	\N		MARG	56:16.3	\N	\N	2	0	1	0
2850	680	1	UNITEK PATANJALI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2468	396	1	MANOJ GUPTA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3230	1023	1	MEHTAB COSMATICS CENTRE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2335	299	1	GREEN NEEDS STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3309	1103	1	POORVANCHAL PAN SHOP	\N		MARG	25:07.2	\N	\N	2	0	1	0
2574	477	1	PATHAK GENERAL STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
2285	262	1	GURU KRIPA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1899	69	1	BALAJI CONFECTIONARY STOR	\N		MARG	35:52.7	\N	\N	2	0	1	0
3407	1199	1	MAHALUXMI COLD DRINK	\N		MARG	18:43.5	\N	\N	2	0	1	0
2520	433	1	SHREE GAYATRI GROCERY STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2466	394	1	SINGHAL SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3335	1129	\N	RDM PHARMACY	\N		MARG	41:53.9	\N	\N	2	1	1	0
2988	782	\N	MUSKAN KIRANA & ANDA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
3253	1049	\N	KENDRIYA BHANDAR	\N	SOCIETY	MARG	53:07.8	\N	\N	2	1	1	0
2888	705	\N	V.R. MEDICOS	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	1	1	0
2994	787	\N	STAR GROCERY MART.	\N		MARG	41:53.9	\N	\N	2	1	1	0
3250	1042	\N	DAY2DAY SHOPPING MART	\N		MARG	15:40.5	\N	\N	2	1	1	0
3005	796	\N	JAI MEDICAL STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	1	1	0
2942	747	\N	PRINCE KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2879	700	\N	DAILY FRESH DEPATMENTAL S	\N		MARG	35:52.7	\N	\N	2	1	1	0
3343	1134	\N	PREETAM GENERAL STORE	\N		MARG	41:53.9	\N	\N	2	1	1	0
3280	1074	\N	G-one Super Mart	\N		MAR	56:35.8	\N	\N	2	1	1	0
2858	685	\N	MUSKAN TRADERS	\N		MARG	35:52.7	\N	\N	2	1	1	0
2922	733	\N	OM DAIRY .	\N		MARG	35:52.7	\N	\N	2	1	1	0
2429	365	1	SHRI JEE GENERAL STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
2975	773	\N	MOHSIN KIRANA & CONFECTIONERY	\N		MARG	35:52.7	\N	\N	2	1	1	0
3048	831	\N	GOYAL MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2889	705	\N	V.R, MEDICOS	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
2966	766	\N	SAIFI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3123	901	\N	VERMA CANTEEN STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
2859	685	\N	MUSKAN TRADERS	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
2299	270	1	HARSH CONFECTIONERS AND GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2196	188	1	RAHUL LADIES COSMATICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2108	129	1	FRESH BITE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2331	296	1	SHANTI MEDICAL STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3020	810	1	KESHAV KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2740	602	1	JAI DURGE SWEETS AND BAKERY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2541	445	1	BIKANER SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2125	138	1	BANSAL GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2204	196	1	ZMED POINT PHARMACY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2469	397	1	GUDWILL HEALTH CARE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2642	526	1	SHIV KIRANA RS SHARMA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3031	819	1	SHREE BALAJI GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2749	608	1	SARTHAK GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2686	562	1	PEER BABA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2855	683	1	AIM PHARMA	\N		MARG	35:52.7	\N	\N	2	0	1	0
1963	85	1	MANGALAARYA RETAIL & ECOMMERCE LLP	\N		MARG	35:52.7	\N	\N	2	0	1	0
2276	256	1	NAND GOPAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1833	53	1	Maa Annpurna Canteen	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	0	1	0
2631	519	1	OM PATANJALI KENDRA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2385	336	1	SHRI KRISHNA MEDICAL AGENCY	\N		MARG	35:52.7	\N	\N	2	0	1	0
3202	978	1	VAISHNO KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
3211	987	1	SHIPRA KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2172	170	1	PUNJAB BAKERY PUNJAB	\N		MARG	35:52.7	\N	\N	2	0	1	0
2983	779	1	SHRI BALAJI MULTI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3097	878	1	SANJAY GENERAL STORE	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
2990	784	1	VINAYAK SQUARE PVT LTD	\N		MARG	35:52.7	\N	\N	2	0	1	0
2357	315	1	MULTI OPTION STORE.	\N		MARG	35:52.7	\N	\N	2	0	1	0
2259	243	1	VIJAY JYOTHI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3150	926	1	RINKU MEDICAL	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
3430	1222	1	DTC	\N		MARG	39:23.8	\N	\N	2	0	1	0
2702	572	1	GURUKRIPA SHOPPING MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
2652	534	1	TANI MANI BIG STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2404	348	1	RAJJAK KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
3140	917	1	BHUMESH KIRANA STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
3093	874	1	GUPTA GENERAL STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2785	631	1	GAYATRI PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3373	1165	1	KANHA DEPT..	\N		MARG	28:40.6	\N	\N	2	0	1	0
2661	542	1	SINGHAL ACHER	\N		MARG	35:52.7	\N	\N	2	0	1	0
2451	382	1	SHREE KRISHNA TRADING / DRESSES	\N		MARG	35:52.7	\N	\N	2	0	1	0
2543	447	1	VINAY MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2400	346	1	RAJDEEP PANTJALI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3001	793	1	SHRI KRISHNA MEDICAL STOR	\N		MARG	35:33.5	\N	\N	2	0	1	0
2321	286	1	RAM MEDICAL	\N		MARG	35:52.7	\N	\N	2	0	1	0
3199	975	1	SUBH LAXMI	\N		COL	35:52.7	\N	\N	2	0	1	0
2553	457	1	BIKANER'S SWEET NAMKEEN & SNACKS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2610	504	1	OM KHUSHI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2593	492	1	RAMESH KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2352	311	1	SHIV SHAKTI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2764	617	1	SAH MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2057	106	1	SUMIT GENERAL STORE	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
3375	1167	1	THE CAKE CORNER	\N		MARG	28:40.6	\N	\N	2	0	1	0
3068	846	1	MITTAL DEEPAK KUMAR TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2827	662	1	MAX DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2168	166	1	CHACCHA BHATIJA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2514	430	1	BALAJI MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2773	624	1	JAGANATH KIRANA WS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2147	155	1	ZDAILY NEEDS STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2544	448	1	MLJ STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2533	439	1	ZEETA PATANJALI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3078	857	1	GARG MEDICAL STORE	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	0	1	0
2796	639	1	AGRO PULP RETAILS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2441	374	1	PRABHAT KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2891	706	1	PRASHANT BHATI DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
3301	1095	1	GROW GREEN	\N		MARG	25:07.2	\N	\N	2	0	1	0
3190	967	1	MUSKAN KIRANA  STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
3282	1076	1	SUMIT AWHO	\N		MARG	25:07.2	\N	\N	2	0	1	0
3098	879	1	ADEN STORES	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
1682	21	1	SUVIDHA SUPER BAZZAR	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	1	1	0
2420	359	1	MITTAL TRADERS	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
3244	1037	1	GOOD MORNING STORE	\N		MARG	15:40.5	\N	\N	2	1	1	0
1749	35	1	BHAVISHYA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1857	58	1	RAHUL CANTEEN STORE	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
2825	661	1	SWASTIK SUPER BAJAR	\N		MARG	35:52.7	\N	\N	2	1	1	0
3451	1243	1	OM CONFECTIONERS LUHARLI	\N		MARG	50:34.6	\N	\N	2	1	1	0
2921	733	1	OM DAIRY	\N		MARG	35:52.7	\N	\N	2	1	1	0
1880	63	1	VERMA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2504	422	1	TUSHAR TRADING CO.	\N		MARG	35:52.7	\N	\N	2	1	1	0
2082	114	1	HIGLANCE LABORATORIES PVT LTD	\N		MARG	35:52.7	\N	\N	2	1	1	0
3186	963	1	FOUJI KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2397	344	1	APRITA ENTERPRISE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2275	255	1	HEAMENT KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1920	74	1	PATHAK CANTEEN	\N	GAAMMA 2	CAD	35:52.7	\N	\N	2	0	1	0
2799	642	1	AGGARWAL SHOP	\N		MARG	35:52.7	\N	\N	2	0	1	0
2140	150	1	DOON KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3285	1079	1	CHOUDHARY KIRANA KASNA	\N		MARG	25:07.2	\N	\N	2	0	1	0
3061	842	1	SHUBHAM MEDICALS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3442	1234	1	KASHVI STATIONERY GIFTS &	\N		MARG	57:27.8	\N	\N	2	0	1	0
2952	756	1	SHREE JI FOODS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2599	497	1	BANGALI KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2581	481	1	KAUSHIK KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2742	603	1	DAKSH GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3207	983	1	MADHU KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2683	561	1	HARI OM KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3046	830	1	ZSHUBHAM STATIONERS & GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2719	584	1	LOSS ACCOUNTS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2333	297	1	ACCILITY DEALS PVT LTD	\N		MARG	35:52.7	\N	\N	2	0	1	0
2920	732	1	DADRI A/C	\N		MARG	35:52.7	\N	\N	2	0	1	0
2555	459	1	MANGLA ENTERPRISES	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
3176	953	1	FOUJI KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2198	190	1	NEW GRENO STATIONARY	\N		MARG	35:52.7	\N	\N	2	0	1	0
3362	1154	1	RAMU CHAURASIYA PAN	\N		MARG	37:54.5	\N	\N	2	0	1	0
3422	1214	1	RAM PAL KIRANA STORE	\N		MARG	39:23.8	\N	\N	2	0	1	0
2733	597	1	SHIVAM MEDICAL STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2586	486	1	GREENNEST RETAILS LLP	\N		MARG	35:52.7	\N	\N	2	0	1	0
2220	210	1	HARI OM CANTEEN	\N		MARG	35:52.7	\N	\N	2	0	1	0
2803	645	1	HIGHPHY FOODS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2752	611	1	PAWAN GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2701	571	1	ZMANGAL ARYA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3417	1209	1	SANJAY KIRANA STORE	\N		MARG	32:56.6	\N	\N	2	0	1	0
2098	122	1	ZAJIS DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3138	915	1	NEHA KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2675	554	1	DINESH PANDIT JI	\N		MARG	35:52.7	\N	\N	2	0	1	0
2526	435	1	BALAJI KIRANA STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2459	389	1	BIG B FOOD PRODUCTS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2626	516	1	OM DAIRY GAMMA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2274	254	1	KASHYAP KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2452	383	1	KUNWAR MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1815	48	1	AGGARWAL PROVISION STORE.	\N		MARG	35:52.7	\N	\N	2	0	1	0
3034	822	1	RAJPAL KHARI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2925	736	1	VINEET CONFECTIONERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2401	347	1	ANJALI FACILITY SERVICES PVT. LTD.	\N		MARG	35:52.7	\N	\N	2	0	1	0
3438	1230	1	ARUN TRADERS	\N		MARG	57:27.8	\N	\N	2	0	1	0
3196	972	1	SUMIT KIRANA STORE	\N		MARG	15:40.5	\N	\N	2	0	1	0
3054	836	1	RADHA MEDICAL HALL	\N		MARG	35:52.7	\N	\N	2	0	1	0
2232	221	1	POOJA KIRANA STORE GN	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2171	169	1	OM SAI COSMATICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2121	136	1	PATANJALI SWARNNAGRI	\N		MARG	35:52.7	\N	\N	2	0	1	0
2150	158	1	SUVIDHA RETAILORS	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
3112	892	1	MONU PROVISION STORE	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
3212	988	1	FAROOKH KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2598	496	1	KANHA DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3415	1207	1	KISHAN PATANJALI RASAN ST	\N		MARG	32:56.6	\N	\N	2	0	1	0
2391	341	1	RK KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1646	10	1	FRIENDS PROVISIONAL STORE	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	0	1	0
1987	92	1	STANDARD STATIONERS AND COMPUTERS	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	0	1	0
2951	755	1	SHIV SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3035	823	1	HARI SHANKAR MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
2839	672	1	MODI'S CAKE-N-CAFE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1753	37	1	GANPATI SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2760	615	1	KAMANI COSMATICS	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2218	208	1	ROHIT GARG NEW SHOP	\N		MARG	35:52.7	\N	\N	2	0	1	0
3379	1171	1	NITIN KIRANA STORE	\N		MARG	21:26.9	\N	\N	2	0	1	0
3047	831	1	GOYAL MEDICAL STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	1	1	0
3289	1083	1	FARM FRESH	\N		MARG	25:07.2	\N	\N	2	1	1	0
2667	547	1	ZAGGARWAL PROV STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1942	79	1	BAKERS ZONE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3355	1145	1	AIRPLAZA RETAIL HOLDINGS PVT LTD	\N		COL	35:57.5	\N	\N	2	1	1	0
3432	1224	1	FUTURE RETAIL LIMITED.	\N		MARG	31:59.7	\N	\N	2	1	1	0
1619	1	1	AGGARWAL DEPARTMENT STORE	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	1	1	0
3378	1170	1	OM ENTERPRISES	\N		MARG	21:26.9	\N	\N	2	1	1	0
2987	782	1	MUSKAN KIRANA & ANDA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3287	1081	1	TN ENTERPRISES	\N		MARG	25:07.2	\N	\N	2	1	1	0
2393	342	1	S SUPER MART	\N		MARG	15:40.5	\N	\N	2	1	1	0
2857	685	1	MUSKAN TRADERS	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
2389	339	1	DAILY NEED DEPARTMENTAL STORE	\N		COL	19:58.3	\N	\N	2	1	1	0
3404	1196	1	Soni Medicos	\N		DAB	16:32.2	\N	\N	2	1	1	0
3383	1175	1	KAUSHIK GENERAL STORE	\N		MARG	21:26.9	\N	\N	2	1	1	0
2715	580	1	G ONE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2235	224	1	SHRI VAISHNO GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2214	204	1	SHAILU GERNEL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3392	1183	1	RISHU GENERAL STORE	\N		MARG	31:23.2	\N	\N	2	0	1	0
2370	325	1	SACH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1951	82	1	KHUSHI DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
3107	887	1	JAGGI KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
3251	1044	1	FLAVOURED PAN SHOP	\N		MARG	15:40.6	\N	\N	2	0	1	0
3357	1149	1	KUKREJA ICE PARLOUR	\N		MARG	37:54.4	\N	\N	2	0	1	0
3101	881	1	BIHAR KIRANA STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2303	273	1	ZPAPPU PANSARI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2945	750	1	SMARTY TELECOM & SERVICES	\N		MARG	35:52.7	\N	\N	2	0	1	0
2605	500	1	PATANJALI GAMMA II	\N		MARG	35:52.7	\N	\N	2	0	1	0
2273	253	1	FRIENDS DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2149	157	1	MAHALUXMI DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2465	393	1	AJAY PANDEY KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3308	1102	1	SANTOSH MEDICAL	\N		MARG	25:07.2	\N	\N	2	0	1	0
3178	955	1	SHUBHI GENERAL STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2904	717	1	SHAH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3073	851	1	AMUL SHOP	\N		MARG	35:52.7	\N	\N	2	0	1	0
3007	798	1	ZRADHA RANI GNERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3229	1022	1	BANSAL PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2676	555	1	ZDAILY NEEDS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2864	688	1	GOYAL STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
3374	1166	1	RATAN	\N		MARG	28:40.6	\N	\N	2	0	1	0
2872	695	1	FAISHON VARIETY STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2130	141	1	PICK LIST	\N		MARG	35:52.7	\N	\N	2	0	1	0
3111	891	1	LUCKY GIFT GALLARY	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2900	713	1	SRI SRI PATANJALI	\N		MARG	35:52.7	\N	\N	2	0	1	0
2597	495	1	SARAS KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3032	820	1	ROUNAK DENTAL	\N		MARG	35:52.7	\N	\N	2	0	1	0
3105	885	1	NEELAM GENERAL STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2967	767	1	JAGGAN NATH GUPTA	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2716	581	1	SANDEEP FAST FOODS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2329	294	1	MEDSPREE PHARMACY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2060	107	1	SUNIL KIRANA STORE	\N	P2	CAD	35:52.7	\N	\N	2	0	1	0
2682	560	1	DESIGNARCH SHOPPING CENTRE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3132	909	1	SINGHAL TRADING CO	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2531	438	1	MAA NARAYANI SUPER STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2594	493	1	NEERAJ KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3263	1058	1	GANESH KIRANA AND GENERAL	\N		MARG	35:33.5	\N	\N	2	0	1	0
2306	275	1	PRAKASH AGENCIES	\N		MARG	35:52.7	\N	\N	2	0	1	0
2977	775	1	SANJEEVANI MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3380	1172	1	SHIV MEDICAL STORE KASNA	\N		MARG	21:26.9	\N	\N	2	0	1	0
2919	731	1	MANGE RAM KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2559	462	1	KS TRADING CO	\N		MARG	35:52.7	\N	\N	2	0	1	0
2380	333	1	SUJATA MEDICOSE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2681	559	1	NEEDS 24 RETAILMART PVT LTD	\N		MARG	35:52.7	\N	\N	2	0	1	0
2726	589	1	HONEY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2255	240	1	MAA BHAGWATI MEDICOS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2230	220	1	HIMALYA DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2096	120	1	SHAH MEDICOSE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2156	161	1	YOKOHAMA INDIA PVT. LTD.	\N		MARG	35:52.7	\N	\N	2	0	1	0
3057	838	1	DURGA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2093	119	1	SHRI KUNJ KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3428	1220	1	KC BHATI	\N		MARG	39:23.8	\N	\N	2	0	1	0
2999	792	1	TUSHAR KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2804	646	1	SHRI KRISHNA COSMETICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2591	490	1	SHREE RAM GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1665	16	1	NIDHI SUPERMARKET	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	0	1	0
3210	986	1	KRISHNA KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2828	663	1	SINGHAL  BROTHRS	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	1	1	0
3133	910	1	FARHAN AALAM CONFECTIONERS	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	1	1	0
1870	60	1	SHOPPER POINT	\N	BEETA 1 RAMPUR	MAR	35:52.7	\N	\N	2	1	1	0
1774	41	1	KULDEEP KIRANA STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	1	1	0
2109	130	1	KRISHAN MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1956	83	1	KUMAR ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	1	1	0
1747	34	1	BALAJI PROVISION STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	1	1	0
2800	643	1	FRIENDS HOUSE KEEPING SOLUTION	\N		MARG	35:52.7	\N	\N	2	1	1	0
3300	1094	1	DEEPAK TRADING CO	\N		MARG	25:07.2	\N	\N	2	1	1	0
1837	54	1	MAHAVIRA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2674	553	1	NAVEEN PHARMACY	\N		MARG	35:52.7	\N	\N	2	1	1	0
2780	629	1	RAM- MEDICINES	\N		MARG	35:52.7	\N	\N	2	1	1	0
2538	443	1	FRESH & FRESH RETAIL PRIVATE LIMITED	\N		MARG	35:52.7	\N	\N	2	1	1	0
2965	766	1	SAIFFI KIRANA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
1632	6	1	CALYFOX RETAILS PVT LTD	\N	SOCIETY	MAR	35:52.7	\N	\N	2	1	1	0
3311	1105	1	GET WELL PHARMACY	\N		MARG	25:07.2	\N	\N	2	1	1	0
3405	1197	1	BIG B SHYAM SUNDER	\N		MARG	18:43.5	\N	\N	2	1	1	0
3011	802	1	PATANJALI ATS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2250	235	1	ZHONEY MONEY TOP RETAILS PVT LTD	\N		MARG	35:52.7	\N	\N	2	0	1	0
2410	352	1	MEDICO NECTOR PHARMACY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2866	689	1	PRAKASH MEDICAL AGENCIES	\N		MARG	35:52.7	\N	\N	2	0	1	0
2254	239	1	MINI MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
2143	152	1	ZDAILY SHOPING MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
2513	429	1	SHUBHAM STATIONERS & G. STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2948	752	1	SHRI RADHEY STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3198	974	1	OM DAIRY STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2486	410	1	81C BAKERY CAFE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3030	818	1	BAJRANG KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2969	768	1	SHRI JAGANATH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2892	707	1	KULDEEP MALAKPUR	\N		MARG	35:52.7	\N	\N	2	0	1	0
2494	416	1	MAA ANPURNA	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2477	405	1	DUBEY CANTEEN	\N		MARG	35:52.7	\N	\N	2	0	1	0
2582	482	1	KIRANA 99	\N		MARG	35:52.7	\N	\N	2	0	1	0
1791	45	1	RAKESH GENERAL STORE	\N	ALPHA 2 DELTA 2	CAD	35:52.7	\N	\N	2	0	1	0
3371	1163	1	GOVIND PAN BHANDAR	\N		MARG	28:40.5	\N	\N	2	0	1	0
3384	1176	1	V3S ATTA CHAKKI GREENS ST	\N		MARG	21:26.9	\N	\N	2	0	1	0
2475	403	1	OM LUXMI TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2936	743	1	AGGARAL  SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3398	1189	1	SATISH CHAND KAPIL KUMAR	\N		MARG	31:23.2	\N	\N	2	0	1	0
2894	709	1	LOVE STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3236	1029	1	LAKSHMI DAIRY	\N		CAD	30:43.5	\N	\N	2	0	1	0
2737	599	1	YADAV PATANJALI	\N		MARG	35:52.7	\N	\N	2	0	1	0
2654	536	1	NEW FOOD AFFAIR	\N		MARG	35:52.7	\N	\N	2	0	1	0
2314	281	1	PREM PAL CHAI WALA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3200	976	1	GOODWILL MEDICOS	\N		COL	35:52.7	\N	\N	2	0	1	0
3245	1038	1	AGGARWAL TRADERS AI	\N		MARG	15:40.5	\N	\N	2	0	1	0
2501	420	1	MAHAVIR STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3167	944	1	MUKESH KIRANA	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2193	186	1	WHOLESALEBAZAR.IN	\N		MARG	35:52.7	\N	\N	2	0	1	0
1827	51	1	JAGANNATH PROVISION	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	0	1	0
3220	996	1	SONU SHARMA KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2126	139	1	MAHAVIR MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3290	1084	1	SHRISTI SWEETS	\N		MARG	25:07.2	\N	\N	2	0	1	0
3051	834	1	JAIN C COSMETICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3069	847	1	JALAL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2632	520	1	YUSUF KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2243	230	1	RAI GROCERY	\N		MARG	35:52.7	\N	\N	2	0	1	0
3134	911	1	BABA CANTEEN	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
3130	907	1	ASRA KIRANA STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2089	118	1	ANSHIKA COSMATICS	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
3243	1036	1	GOOD MORNING STORE	\N		MARG	15:40.5	\N	\N	2	0	1	0
2506	423	1	HIMALAYA RETAILS PVT. LTD.	\N		MARG	35:52.7	\N	\N	2	0	1	0
2995	788	1	SHRI BALAJI CHINA BAZAR	\N		MARG	35:52.7	\N	\N	2	0	1	0
2155	160	1	AMAN FAIMLY MART & GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2164	164	1	AMBESSY READYMADE GARMENT	\N		MARG	35:52.7	\N	\N	2	0	1	0
2580	480	1	SUVIDHA RETAIL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2536	441	1	FRIENDS ENTERPRISES	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2700	570	1	KRITI BAKERY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2225	215	1	LAXMAN CANTEEN	\N		MARG	35:52.7	\N	\N	2	0	1	0
2374	329	1	JIVA G STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2703	573	1	ZJANAKI PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2509	425	1	SAILAISH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2530	437	1	SAI MEERA RETAILS PVT LTD	\N		MARG	35:52.7	\N	\N	2	0	1	0
3081	860	1	ASHIRWAD PHARMACY	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
2916	728	1	SUBHASH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2557	460	1	KAVITA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3160	936	1	POOJA  ANSHIKA COSMETICS	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
3322	1116	1	ADDISTRO TECHNOLOGIES PVT	\N		MARG	25:07.2	\N	\N	2	1	1	0
1700	26	1	HARIOM DEPARTMENTAL STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	1	1	0
2817	656	1	KHUSHI ENTERPRISES	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
2426	363	1	ADITYA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2954	758	1	S KUMAR PROVISION & GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1844	55	1	MITTAL &  SONS	\N		GOD	26:18.6	\N	\N	2	1	1	0
2018	98	1	GANGA TRADERS	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
1711	28	1	OM SHANTI PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1684	22	1	AGGARWAL FOOD PLAZA	\N	ALPHA 1 DELTA 1	CAD	35:52.7	\N	\N	2	1	1	0
3249	1042	1	DAY2DAY SHOPPING MART	\N		MARG	15:40.5	\N	\N	2	1	1	0
3137	914	1	LOKESH KIRANA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
1977	89	1	RS ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	1	1	0
3419	1211	1	7 DAYS 24	\N		MARG	31:17.2	\N	\N	2	1	1	0
2224	214	1	SUBASH CHAI WALA	\N		MARG	35:52.7	\N	\N	2	1	1	0
2105	126	1	OM EVERGREEN SWEETS..	\N		CAD	35:52.7	\N	\N	2	1	1	0
2390	340	1	RIDDHI GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1974	88	1	REAL CELEBRATIONS	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	1	1	0
2577	478	1	SAKSHI TRADERS	\N		MARG	35:52.7	\N	\N	2	1	1	0
2766	619	1	AMIT KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1944	80	1	BHAVYA BAKERY	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	0	1	0
3128	905	1	SHIV GENERAL STORE SP	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2440	373	1	BRIJWASI ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	0	1	0
1639	8	1	DEV MISTHAN BHANDAR	\N		MARG	35:52.7	\N	\N	2	0	1	0
2267	248	1	OM LUXMI PATANJALI	\N		MARG	35:52.7	\N	\N	2	0	1	0
3129	906	1	SANDEEP MEDICAL STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2455	385	1	BALAJI CONFECTIONARY STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3109	889	1	OM SAI BANGLES KIRANA STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3012	803	1	BIKANERS SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2153	159	1	CAFE - DE -AMAN	\N		MARG	35:52.7	\N	\N	2	0	1	0
3259	1054	1	VARIETY FOODS AND VEGETAB	\N		MARG	35:33.5	\N	\N	2	0	1	0
3406	1198	1	NAVEEN TEA HOUSE	\N		MARG	18:43.5	\N	\N	2	0	1	0
2322	287	1	OM DAIRY PRACHI KE PASS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2837	671	1	GAURAV KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2731	594	1	BHAGAT JI SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3420	1212	1	SHIVAM TRADING COMPANY	\N		MARG	39:23.7	\N	\N	2	0	1	0
2453	384	1	KAVYA & BROTHERS	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
3028	816	1	ROYAL STATIONERY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2705	574	1	HEENA SHOPPING CENTRE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3126	904	1	DKPL SUPER MART	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2971	770	1	PATANJALI PRADHAN MARKET ACHER	\N		MARG	35:52.7	\N	\N	2	0	1	0
2583	483	1	SUBHASH KIRANA STORE A-I	\N		MARG	35:52.7	\N	\N	2	0	1	0
2227	217	1	SHRI RADHE KRISHNA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2074	112	1	SHIV CONF	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
3136	913	1	BANSHI CONFECTIONERS	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2549	452	1	PATANJALI KASANA 2	\N		MARG	35:52.7	\N	\N	2	0	1	0
2570	473	1	LUXMI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3235	1028	1	BOOK CAFE	\N		CAD	30:43.5	\N	\N	2	0	1	0
3029	817	1	RS BAKERY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2290	266	1	JANTA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3144	921	1	SAURABH MEDICAL STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2534	440	1	KUNAL KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2678	557	1	BHATI SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2448	379	1	RAMESH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2668	548	1	TANNU COSMATICS	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2950	754	1	AAKASH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2474	402	1	LUXMI NARAYAN	\N		MARG	35:52.7	\N	\N	2	0	1	0
3396	1187	1	RAMESH COLD DRINK	\N		MARG	31:23.2	\N	\N	2	0	1	0
3067	845	1	KHUTTAD DAILY NEED	\N		MARG	35:52.7	\N	\N	2	0	1	0
2673	552	1	PAHLAD KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2924	735	1	NEW NANDAN MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2412	355	1	SHISHODIA MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3350	1140	1	ALAM ENTERPRISES	\N		MARG	41:53.9	\N	\N	2	0	1	0
2315	282	1	GREEN APPLE PHARMACY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2789	634	1	GANPATI GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2320	285	1	TANISHQ CONFECTIONERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2986	781	1	NAND GOPAL GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2490	414	1	SHRI AMRIT PHARMACY	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2660	541	1	BRIJESH BHATI	\N		MARG	35:52.7	\N	\N	2	0	1	0
3399	1190	1	GARG INTERNATIONAL	\N		MARG	56:16.3	\N	\N	2	0	1	0
2236	225	1	POORVANCHAL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1663	15	1	HEALTHCARE PHARMACY	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	0	1	0
3185	962	1	SHUBHI GENERAL STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2677	556	1	KRISHNA CIVIL CONTRACTOR SWEET CORNER	\N		MARG	35:52.7	\N	\N	2	0	1	0
2816	655	1	KUMAR GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2602	499	1	MUSKAN MEDICAL STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2881	702	1	MONU KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2007	96	1	DEV SHOPPEE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
3152	928	1	SATISH KIRANA STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2199	191	1	ZMULTI OPTION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2923	734	1	JD PHARMACY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2323	288	1	ZASHOKA DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
3110	890	1	SIKANDER KIRANA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
3163	939	1	SAI CAR CARE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
1914	72	1	LAXMI SUPER GENERAL STORE	\N		MARG	25:07.2	\N	\N	2	1	1	0
2786	632	1	G.S.S TRADING COMPANY	\N		MARG	35:52.7	\N	\N	2	1	1	0
3354	1144	1	PRAGATI TRADERS	\N		COL	35:57.5	\N	\N	2	1	1	0
3246	1039	1	AGGARWAL TRADERS AI	\N		MARG	15:40.5	\N	\N	2	1	1	0
2195	187	1	FAIMLY MEDICOSE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	1	1	0
3131	908	1	SHOBIT TRADING CO	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
2288	264	1	ROYALE BAKERS	\N		MARG	35:52.7	\N	\N	2	1	1	0
2695	567	1	OM SHANTI MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2778	627	1	THE MILLENIUM SHOP	\N		MARG	35:52.7	\N	\N	2	1	1	0
2129	140	1	KING BAZAR	\N		MARG	35:52.7	\N	\N	2	1	1	0
2395	343	1	APNA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3224	1010	1	OM JAGANNATH STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3342	1133	1	RANBAAZ PAN SHOP	\N		MARG	41:53.9	\N	\N	2	1	1	0
2537	442	1	PROST O RING	\N		MARG	35:52.7	\N	\N	2	0	1	0
2257	242	1	AV GREEN RETAIL SHOPS(OPC) PVT LTD	\N		MARG	35:52.7	\N	\N	2	0	1	0
2824	660	1	PIYA PASAND ABHUSHAN MANDIR PVT LTD	\N		MARG	35:52.7	\N	\N	2	0	1	0
2209	201	1	RAJ MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2175	173	1	AGG DEP	\N		MARG	35:52.7	\N	\N	2	0	1	0
3194	971	1	SUNITA CANTEEN	\N		COL	35:52.7	\N	\N	2	0	1	0
2177	175	1	ON COST MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
3427	1219	1	OM GROCERY STORE.	\N		MARG	39:23.8	\N	\N	2	0	1	0
2899	712	1	TRIPUTI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2387	338	1	BIG SHOP.	\N		MARG	35:52.7	\N	\N	2	0	1	0
3356	1148	1	SINGHAL BANDHU PROVISION	\N		MARG	37:54.4	\N	\N	2	0	1	0
3234	1027	1	Smarty Telecom & Services	\N		CAD	30:43.5	\N	\N	2	0	1	0
2751	610	1	HEALTY FRESH	\N		MARG	35:52.7	\N	\N	2	0	1	0
2653	535	1	SHIV CONF S PUR	\N		MARG	35:52.7	\N	\N	2	0	1	0
3026	814	1	OM BHOJNALAYA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2957	761	1	FRIENDS RAMPUR	\N		MARG	35:52.7	\N	\N	2	0	1	0
2560	463	1	SANDEEP TRADING CO	\N		MARG	35:52.7	\N	\N	2	0	1	0
2843	676	1	RIDDHI MEDICOS	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2545	449	1	VISHAL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2972	771	1	NEW ROYAL COLLECTIONS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2776	626	1	OM DEPARTMENTAL STORE	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
3449	1241	1	NAMO NAMO KIRANA	\N		MARG	57:27.8	\N	\N	2	0	1	0
2565	469	1	ASHOK DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2835	669	1	ANKIT KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3053	835	1	TBL SHOP	\N		MARG	35:52.7	\N	\N	2	0	1	0
2600	498	1	POOJA KIRANA STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2097	121	1	PAWAN GENERAL	\N		MARG	35:52.7	\N	\N	2	0	1	0
3215	991	1	KOMAL GENERAL STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
3082	861	1	HARI MEDICAL STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
3086	866	1	MANGALA ARYA RETAIL AND ECOMME	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2873	696	1	MINI MART.	\N		MARG	35:52.7	\N	\N	2	0	1	0
2382	334	1	SHUBHAM STATIONARY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2750	609	1	REAL CELEBRATIONS SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2996	789	1	ARMAAN TELECOM	\N		MARG	35:52.7	\N	\N	2	0	1	0
2247	232	1	PREM CHAND PRAMOD KUMAR	\N		MARG	35:52.7	\N	\N	2	0	1	0
2938	745	1	SANGAM KIRANA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2450	381	1	REAL DAILY FRESH	\N		MARG	35:52.7	\N	\N	2	0	1	0
2883	703	1	MITTAL TRADERS.	\N		MARG	35:52.7	\N	\N	2	0	1	0
3345	1135	1	AGGARWAL STATIONERY AND G	\N		MARG	41:53.9	\N	\N	2	0	1	0
3025	813	1	SATHARTH	\N		MARG	35:52.7	\N	\N	2	0	1	0
2138	148	1	TUK TUK KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2542	446	1	NIDHI MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2476	404	1	RAGHU DEPATMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3391	1182	1	MOHIT KIRANA STORE	\N		MARG	31:23.2	\N	\N	2	0	1	0
3189	966	1	AMBEY KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2612	505	1	AMARPALI HEALTHCARE PRIVATE LIMITED	\N		MARG	35:52.7	\N	\N	2	0	1	0
2473	401	1	A.T. ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	0	1	0
2634	522	1	BASANT BAZZAR	\N		MARG	35:52.7	\N	\N	2	0	1	0
3434	1226	1	VANSH KIRANA KASNA	\N		MARG	51:53.9	\N	\N	2	0	1	0
2608	503	1	VANDANA COSMATICS	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2336	300	1	BANSAL SWEETS INDIA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3019	809	1	CHAUDHARY CONFECTIONERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2432	367	1	SILA NATH PROVISION	\N		MARG	35:52.7	\N	\N	2	0	1	0
3312	1106	1	UV MART	\N		MARG	25:07.2	\N	\N	2	0	1	0
2930	739	1	VNG PHARMA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3317	1111	1	RP RETAIL SHOP	\N		MARG	25:07.2	\N	\N	2	0	1	0
2958	762	1	ZDAILY STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2117	132	1	ROSHAN KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3121	900	1	PRINCE DEPARTMENTAL STORE	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
3158	934	1	BARO SERVICES	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
3056	837	1	POOJA SINGAR PLACE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2698	569	1	PAPPY TRADERS	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
3117	897	1	OM PRAKASH KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
3033	821	1	MAA BHAGWATI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1693	24	1	APNA STORES	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
2650	532	1	SHRI RAM GENERAL	\N		MARG	35:52.7	\N	\N	2	1	1	0
2830	665	1	PAWAN CANTEEN	\N		MARG	35:52.7	\N	\N	2	1	1	0
3403	1195	1	SONI MEDICOS	\N		CAD	15:31.1	\N	\N	2	1	1	0
3331	1125	1	LIFE CARE PHARMACY (ELDEC	\N		MARG	41:53.9	\N	\N	2	1	1	0
1630	5	1	BHARAT MEDICAL STORE	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	1	1	0
3409	1201	1	CRUNCHY BITES	\N		MARG	18:43.5	\N	\N	2	1	1	0
2767	620	1	FRESH FOOD SERVICES	\N		MARG	35:52.7	\N	\N	2	1	1	0
1809	46	1	RATAN MEDICOSE PVT  LTD	\N		GOD	26:18.6	\N	\N	2	1	1	0
3336	1129	1	RDM PHARMACY.	\N		MARG	31:59.7	\N	\N	2	1	1	0
2442	375	1	CITY CHEMIST	\N		MARG	35:52.7	\N	\N	2	1	1	0
2356	314	1	KRISHNA DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3288	1082	1	RADIANT KIRANA	\N		MARG	25:07.2	\N	\N	2	1	1	0
2346	307	1	KRISHNA DAIRY	\N		MARG	35:52.7	\N	\N	2	1	1	0
2067	109	1	USHA DEPARTMENTAL STORE	\N	P2	CAD	35:52.7	\N	\N	2	1	1	0
2354	313	1	CHIDDA KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	1	1	0
3064	843	1	SHRI RADHE KRISHNA	\N		MARG	35:52.7	\N	\N	2	0	1	0
1962	84	1	LONG LIFE MEDICOSE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2935	742	1	PATANJALI BEETA 2	\N		MARG	35:52.7	\N	\N	2	0	1	0
2656	538	1	SULTAN KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2242	229	1	GREEN VALLEY BASKET	\N		MARG	35:52.7	\N	\N	2	0	1	0
2562	466	1	JAI SIDH BABA	\N		MARG	35:52.7	\N	\N	2	0	1	0
1764	39	1	HEALTH CARE PHARMACY	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2132	143	1	VIKAS KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3441	1233	1	KASHVI STATIONERY GIFTS &	\N		MARG	57:27.8	\N	\N	2	0	1	0
2187	181	1	SATYENDRA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3347	1137	1	UTSAV FOODS	\N		MARG	41:53.9	\N	\N	2	0	1	0
2679	558	1	SANJAY GUPTA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2940	746	1	LAKSHMAN KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2319	284	1	JAIN DEPARTMENTAL STORE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
3192	969	1	SACHIN GARMENTS	\N		COL	35:52.7	\N	\N	2	0	1	0
2863	687	1	BALAJI DAILY FRESH	\N		MARG	35:52.7	\N	\N	2	0	1	0
2508	424	1	BABNU DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3002	794	1	SHRI MAHALUXMI CONFECTIONERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3294	1088	1	THE CAKE & BAKE	\N		MARG	25:07.2	\N	\N	2	0	1	0
2467	395	1	BOSKY MART LIMITED	\N		MARG	35:52.7	\N	\N	2	0	1	0
3157	933	1	VIDHYA MEDICAL	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
3217	993	1	SHIVA DAIRY & CONFECTIONERS	\N		COL	35:52.7	\N	\N	2	0	1	0
2558	461	1	THE DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2133	144	1	MOHINI MEDICOS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2283	261	1	SHRI KRISHNA DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3037	825	1	SHRI KRISHNA SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3116	896	1	JAI AMBEY COSMATICS STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2943	748	1	ZFRIENDS PROVISION STORES	\N		MARG	35:52.7	\N	\N	2	0	1	0
1783	43	1	LOYAL MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
2328	293	1	DOORSTEP RETAIL	\N		MARG	35:52.7	\N	\N	2	0	1	0
2305	274	1	RAGHAV TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3258	1053	1	SHRI KRISHNA DEPARTMENTAL	\N		MARG	35:33.5	\N	\N	2	0	1	0
2375	330	1	RAI KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
1758	38	1	HARI OM PROVISION STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
2120	135	1	SUMIT KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2797	640	1	SHRI KRISHNA TRADING	\N		MARG	35:52.7	\N	\N	2	0	1	0
3159	935	1	M RAM KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2692	565	1	ZJAI DURGA MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3172	949	1	TANEJA KIRANA	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2563	467	1	AMBALA MEDICAL AND COSMETICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2134	145	1	VK TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2755	613	1	SHRI GANESH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2046	104	1	SHRI VINAYAK STORE	\N	P2	MAR	35:52.7	\N	\N	2	0	1	0
3325	1119	1	AKHIL KIRANA STORE	\N		COL	39:00.9	\N	\N	2	0	1	0
2852	682	1	MANOJ KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2364	321	1	CHAUDHARY ATTA CHAKKI	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	0	1	0
3388	1179	1	MAA VAISHNO ATTA CHAKKI	\N		MARG	21:27.0	\N	\N	2	0	1	0
2725	588	1	MOH KHALID SAIFULLA PROVISION	\N		MARG	35:52.7	\N	\N	2	0	1	0
2309	278	1	VIKAS KIRANA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2399	345	1	OM ATTA CHAKKI	\N		MARG	35:52.7	\N	\N	2	0	1	0
3368	1160	1	SATYARTH GREEN PRODUCTS.	\N		MARG	38:21.8	\N	\N	2	0	1	0
2931	740	1	RUDRANSH SUPERMART	\N		MARG	35:52.7	\N	\N	2	0	1	0
3443	1235	1	AGGARWAL TRADERS ACHER	\N		MARG	57:27.8	\N	\N	2	0	1	0
2148	156	1	MUKUL CANTEEN	\N		MARG	35:52.7	\N	\N	2	0	1	0
2069	110	1	UTKARSH GENERAL STORE	\N	P2	CAD	35:52.7	\N	\N	2	0	1	0
2949	753	1	SIDH BABA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3179	956	1	FOUJI KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2982	777	1	MILAN MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2771	623	1	STORE 51	\N		MARG	35:52.7	\N	\N	2	0	1	0
2907	719	1	HEALTHWISE PHARMACY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2640	525	1	AAYAN KIRANA STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2918	730	1	SHRI BALAJI HOUSE KEEPING SERVICE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2623	514	1	ROYAL BIG BAJAAR	\N		MARG	35:52.7	\N	\N	2	1	1	0
1680	20	1	SHRI BALA JI MEDICOSE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3298	1092	1	DOOR STEP	\N		MARG	25:07.2	\N	\N	2	1	1	0
2024	100	1	MAA BHAGWATI GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3254	1049	1	KENDIRIYA BHANDAR	\N		COL	19:58.3	\N	\N	2	1	1	0
1884	65	1	SHAILU GENERAL STORE	\N	BETA 2	CAD	35:52.7	\N	\N	2	1	1	0
3344	1134	1	PRITAM GENERAL STORE	\N		MARG	32:56.6	\N	\N	2	1	1	0
2312	280	1	PRACHI OVERSEAS	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
3094	875	1	SUBASH GENERAL STORE	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	1	1	0
3269	1064	1	SHRI GANESH GENERAL STORE	\N		COL	23:21.7	\N	\N	2	1	1	0
3400	1191	1	CLASSIC MEDICOS	\N		MARG	56:16.3	\N	\N	2	1	1	0
3079	858	1	ANMOL PHARMACY	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	1	1	0
1766	40	1	KALIKA PROVISION STORE	\N	ALPHA 2 DELTA 2	MAR	35:52.7	\N	\N	2	1	1	0
2064	108	1	THE FAMILY MART	\N		MARG	35:52.7	\N	\N	2	1	1	0
2616	508	1	CHAUHAN KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3262	1057	1	EKTA TRADER	\N		MARG	35:33.5	\N	\N	2	1	1	0
2407	351	1	BALAJI KIRANA STORE SN	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2564	468	1	LATSAKA SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2431	366	1	SHRI BALAJI DELTA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3177	954	1	MOOL CHAND PAWAN KUMAR	\N		COL	35:52.7	\N	\N	2	0	1	0
3299	1093	1	ATDARATE DVZHUTPUT RETAIL	\N		MARG	25:07.2	\N	\N	2	0	1	0
2414	356	1	BOMBAY CONFETIONERS	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
3429	1221	1	AGARWAL SWEETS ACHER	\N		MARG	39:23.8	\N	\N	2	0	1	0
2870	693	1	UGENDRA KUMAR	\N		MARG	35:52.7	\N	\N	2	0	1	0
3239	1032	1	SUVIDHA SUPER MART	\N		MARG	15:40.5	\N	\N	2	0	1	0
3402	1193	1	ARUN DABUR	\N		MARG	56:16.3	\N	\N	2	0	1	0
2846	677	1	MITTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2595	494	1	MUSKAN KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3010	801	1	PANCHEE PETHA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2438	371	1	MASTAAN KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2758	614	1	HARSHIT DEPARTMENTAL STOR	\N		MARG	32:56.6	\N	\N	2	0	1	0
3377	1169	1	DEEPAK KIRANA STORE	\N		MARG	21:26.9	\N	\N	2	0	1	0
2743	604	1	COLOURS COSMATICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3437	1229	1	SAI CHEMIST	\N		MARG	57:27.8	\N	\N	2	0	1	0
2813	652	1	BHATI GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2124	137	1	YASH RAJ DEPARTMENTAL STO	\N		MARG	35:52.7	\N	\N	2	0	1	0
2228	218	1	V4 DESIGN SPACE PRIVATE LIMITED	\N		MARG	35:52.7	\N	\N	2	0	1	0
2423	361	1	TULSI PATANJALI SWEDESHI KENDRA	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
3231	1024	1	SHRI BALAJI KIRANA STORE (CM)	\N		CAD	35:52.7	\N	\N	2	0	1	0
2956	760	1	GANESH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2841	674	1	PATANJALI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2783	630	1	SANTOSH GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2572	475	1	TOMAR MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3170	947	1	RAJIV KRANA STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
2298	269	1	THE NATURES ENERGY	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2215	205	1	PRAVEEN DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2311	279	1	CHAUDHARY CONFECTIONERS STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1872	61	1	SHRI BALAJI KIRANA STORE	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	0	1	0
3382	1174	1	VANSH KIRANA STORE	\N		MARG	21:26.9	\N	\N	2	0	1	0
2434	369	1	NAGAR KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
3162	938	1	SAHU KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2657	539	1	CM STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3237	1030	1	OM AGGARWAL SWEETS	\N		MARG	15:40.5	\N	\N	2	0	1	0
2300	271	1	PURVANCHAL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2592	491	1	BRAHM DEV CUTTER SP	\N		MARG	35:52.7	\N	\N	2	0	1	0
3214	990	1	KOMAL GENERAL STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
3149	925	1	RAJAT ENTERPRISES	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2984	780	1	HARSH MEDICOSE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1649	11	1	GAYATRI ENTERPRISES	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	0	1	0
2115	131	1	HONEY MONEY TOP RETAIL PV	\N		MARG	35:52.7	\N	\N	2	0	1	0
3175	952	1	FOUJI KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
3193	970	1	GAURAV CANTEEN	\N		COL	35:52.7	\N	\N	2	0	1	0
2953	757	1	PRAMOD KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3218	994	1	NAJIM KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2992	786	1	PATANJALI SYNDICATE KASNA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2547	451	1	PRITAM KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1789	44	1	RADHA RANI GENERAL STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2644	527	1	TARUN KIRANA STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3426	1218	1	FLAVOURED PAN ALPHA 2	\N		MARG	39:23.8	\N	\N	2	0	1	0
3206	982	1	MADHU KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
3204	980	1	BUBLI KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2991	785	1	SANJU KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2655	537	1	AMIT TYAGI KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2291	267	1	GOLDEN BAKERY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2633	521	1	SHIV SHAKTI GENERAL STORE DELTA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2146	154	1	SANDEEP SHARMA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2867	690	1	LUXMI DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2226	216	1	BABLI KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2821	658	1	YADAV GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2814	653	1	SMARTY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2765	618	1	SACHIN MITTAL	\N		MARG	35:52.7	\N	\N	2	0	1	0
2910	722	1	SHARDA MEDICOS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3154	930	1	THE ROYAL COLLECTION	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2301	272	1	ATTADAAL.COM	\N		MARG	35:52.7	\N	\N	2	0	1	0
1933	77	1	AARADHYA CANTEEN STATIONARY & FOOD MART	\N		MARG	35:52.7	\N	\N	2	1	1	0
2606	501	1	ADYA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1698	25	1	DHARMA FOOD JUNCTION	\N	ALPHA 1 DELTA 1	CAD	35:52.7	\N	\N	2	1	1	0
1905	71	1	GROWGREEN PRODUCTS LLP	\N	GAAMMA 2	CAD	35:52.7	\N	\N	2	1	1	0
3318	1112	1	JBM ENTERPRISES	\N		MARG	25:07.2	\N	\N	2	1	1	0
2993	787	1	STAR GROCERY MART	\N		MARG	35:52.7	\N	\N	2	1	1	0
1781	42	1	LIFECARE PHARMACY	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
2690	564	1	G ONE FRESH SHOPPING MART	\N		MARG	35:52.7	\N	\N	2	1	1	0
2735	598	1	SAIFICA MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2443	376	1	PARI STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3191	968	1	DEV MEDICAL STORE	\N		COL	35:52.7	\N	\N	2	1	1	0
2439	372	1	YOGESH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2176	174	1	NEW AGGARWAL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2831	666	1	PATANJALI RASAN STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3366	1158	1	CHAMAN COLD DRINKS	\N		MARG	37:54.5	\N	\N	2	0	1	0
2628	518	1	HABVIR KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2307	277	1	SHRI BALAJI BEAUTY SHOP	\N		MARG	35:52.7	\N	\N	2	0	1	0
3321	1115	1	PRINCE TRADING CO	\N		MARG	25:07.2	\N	\N	2	0	1	0
2229	219	1	SANDEEP CANTEEN	\N		MARG	35:52.7	\N	\N	2	0	1	0
2200	192	1	S B KITCHENS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2618	511	1	SISHODIYA MEDICAL STORE	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
1979	90	1	SHAGUN SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3446	1238	1	SUPER INDIA MEDICAL	\N		MARG	57:27.8	\N	\N	2	0	1	0
3077	855	1	BABU STORES	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
3153	929	1	SHUBHI STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2911	723	1	ROYAL COLLECTION	\N		MARG	35:52.7	\N	\N	2	0	1	0
3164	940	1	SAM BHOJAN FOOD	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
3364	1156	1	DAY 2 DAY	\N		MARG	37:54.5	\N	\N	2	0	1	0
2917	729	1	RANBEER SINGH	\N		MARG	35:52.7	\N	\N	2	0	1	0
2774	625	1	PANDEY KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3050	833	1	RAJ KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2470	398	1	FAMILY MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
3072	850	1	GAYATRI	\N		MARG	35:52.7	\N	\N	2	0	1	0
2167	165	1	MD	\N		MARG	35:52.7	\N	\N	2	0	1	0
2998	791	1	MAA VAISHNO SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2815	654	1	RAJENDRA KUMAR KAUSHIK	\N		MARG	35:52.7	\N	\N	2	0	1	0
3393	1184	1	DAKOTI BAKERS	\N		MARG	31:23.2	\N	\N	2	0	1	0
2529	436	1	SHARMA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2748	607	1	CHOUDHARY KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3058	839	1	LAKSHAY	\N		MARG	35:52.7	\N	\N	2	0	1	0
3171	948	1	REAL SOLUTION DEPT. STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
3009	800	1	RX PHARMACY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2811	650	1	ZSHIV GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2488	412	1	PIYAPASAND ABHUSHAN MANDIR PVT LTD	\N		MARG	35:52.7	\N	\N	2	0	1	0
3045	829	1	AGGARWAL STATIONARY	\N		MARG	35:52.7	\N	\N	2	0	1	0
3292	1086	1	OM SHANTI RAIL VIHAR	\N		MARG	25:07.2	\N	\N	2	0	1	0
2180	178	1	VEER MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2665	546	1	ANSHIKA COSMATICS & GIFT	\N		MARG	35:52.7	\N	\N	2	0	1	0
2877	699	1	AMAN STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2856	684	1	BURGER CAFE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2101	124	1	KANHA CAKE O PASTRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2849	679	1	ROYAL DRY FRUITS & MORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3425	1217	1	NEERAJ GENERAL STORE	\N		MARG	39:23.8	\N	\N	2	0	1	0
2658	540	1	GRENO STATIONARY	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
3445	1237	1	VJ PHARMACY	\N		MARG	57:27.8	\N	\N	2	0	1	0
2173	171	1	KRISHNA SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3125	903	1	STORE 12	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
1706	27	1	KUMAR PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2444	377	1	THE NATURE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3180	957	1	FOUJI KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2551	455	1	NARMADA PATANJALI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2552	456	1	JEEVAN MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
3182	959	1	AMBEY KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2976	774	1	CHAUSARASIYA PAWAN PAN	\N		MARG	35:52.7	\N	\N	2	0	1	0
2915	727	1	ZHARIOM PROVISION STORE NEW	\N		MARG	35:52.7	\N	\N	2	0	1	0
2338	302	1	AMRIT STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
2234	223	1	BABA PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2106	127	1	JAI DURGA MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3264	1059	1	MALHOTRAS SUPER STORE AND	\N		MARG	35:33.5	\N	\N	2	0	1	0
3394	1185	1	RAJESH KIRANA STORE	\N		MARG	31:23.2	\N	\N	2	0	1	0
3124	902	1	DHAMA SUPER STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2747	606	1	MAHESH PURSHOTTAM	\N		MARG	35:52.7	\N	\N	2	0	1	0
2241	228	1	PATANJALI HARIRASHAN STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2361	319	1	ASHIF KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3227	1016	1	TULSI PATANJALI SWEDESHI	\N		MARG	35:52.7	\N	\N	2	0	1	0
2170	168	1	SURESH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2617	509	1	COLGATE PALMOLIVE(INDIA) LIMITED	\N		MARG	35:52.7	\N	\N	2	0	1	0
2369	324	1	PAL ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	0	1	0
2546	450	1	SHOPPERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3142	919	1	MANISH KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2131	142	1	GREEN APPLE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1919	73	1	MEDI PLUS PHARMACY	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
2264	246	1	SHIV SHAKTI  ENTERPRISES	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	1	1	0
2351	310	1	BANSAL MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3390	1181	1	PAWAN CHAURASIYA PAAN	\N		MARG	21:27.0	\N	\N	2	1	1	0
3248	1041	1	FAMILY BAZAR	\N		MARG	15:40.5	\N	\N	2	1	1	0
3395	1186	1	MANDI FRESH FOOD	\N		MARG	31:23.2	\N	\N	2	1	1	0
2672	551	1	GANPATI TRADERS	\N		MARG	35:52.7	\N	\N	2	1	1	0
3328	1122	1	RAJA RAM KIRANA STORE	\N		MARG	41:53.9	\N	\N	2	1	1	0
3247	1040	1	FAMILY BAZAR	\N		MARG	15:40.5	\N	\N	2	1	1	0
1846	56	1	MITTAL PROVISION STORE	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
3435	1227	1	SINGHAL TP	\N		MARG	51:54.0	\N	\N	2	0	1	0
2272	252	1	SHRI BALAJI GIFT CAMPUS GIFT	\N		MARG	35:52.7	\N	\N	2	0	1	0
3100	880	1	SHISHODIA KIRANA STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2496	417	1	HARSH MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2191	183	1	ROHIT GARG KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2043	103	1	SANJU DEPARTMENTAL STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
3174	951	1	SHUBHI GENERAL STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2613	506	1	KUMAO KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2238	226	1	NAGAR GENERAL STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2233	222	1	RAJOO KONDLI	\N		MARG	35:52.7	\N	\N	2	0	1	0
3291	1085	1	SHIVAM KIRANA STORE	\N		MARG	25:07.2	\N	\N	2	0	1	0
2578	479	1	SHIV DEPARTMENTAL STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3118	898	1	CAMPUS GIFT GALLARY	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3113	893	1	AGGARWAL PROVISION AVJ	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
2848	678	1	RUDR DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3209	985	1	SHINE KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2136	146	1	UJJWAL ENTERPRISES	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
3295	1089	1	KRISHNA COSMETICS	\N		MARG	25:07.2	\N	\N	2	0	1	0
2663	544	1	MANISH TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2662	543	1	GURU KRIPA MEDICOS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2798	641	1	SARLA MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2457	387	1	BALAJI CANTEEN	\N		MARG	35:52.7	\N	\N	2	0	1	0
2294	268	1	CHIDDA SINGH KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
3416	1208	1	BHAGWATI GENERAL STORE	\N		MARG	32:56.6	\N	\N	2	0	1	0
2728	591	1	SUNDER SHOPPING SHOP	\N		MARG	35:52.7	\N	\N	2	0	1	0
2324	289	1	YADAV KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2119	134	1	FFAROOKH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3216	992	1	PAL KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
3367	1159	1	URVASHI BAKERY	\N		MARG	38:09.2	\N	\N	2	0	1	0
3284	1078	1	CHOUDHARY KIRANA KASNA	\N		MARG	25:07.2	\N	\N	2	0	1	0
2989	783	1	DILLI 6	\N		MARG	35:52.7	\N	\N	2	0	1	0
2519	432	1	BABA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2510	426	1	ZGREEN GROCERIES	\N		MARG	35:52.7	\N	\N	2	0	1	0
2893	708	1	ZFRESH FAST FOOD CENTRE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3421	1213	1	KANIKA TRADERS	\N		MARG	39:23.8	\N	\N	2	0	1	0
2266	247	1	RAVINDRA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3226	1015	1	TULSI PATANJALI SWEDESHI	\N		MARG	35:52.7	\N	\N	2	0	1	0
2378	332	1	AGGARWAL SWEETS .	\N		MARG	35:52.7	\N	\N	2	0	1	0
3059	840	1	SHRI RAM KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2252	237	1	ZBALAJI KIRANA GREEN WOODS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3257	1052	1	SHANKAR SWEETS.	\N		MARG	35:33.5	\N	\N	2	0	1	0
2753	612	1	NAGAR KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2717	582	1	JAYANT KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2427	364	1	SHREI BALAJI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3155	931	1	TULSI PHARMA	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2615	507	1	BIKANERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2901	714	1	PALAK KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3016	807	1	NEIPUN RETAILS PVT LTD	\N		MARG	35:52.7	\N	\N	2	0	1	0
2670	549	1	SHRI KRISHNA MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
2086	115	1	HI GLANCE LABORATOROES PVT LTD	\N	TUGALPUR KNOW	CAD	35:52.7	\N	\N	2	0	1	0
1638	7	1	DAILY FRESH GENERAL STORE	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	0	1	0
2222	212	1	PATANJALI AAROYAGA DHAM	\N		MARG	35:52.7	\N	\N	2	0	1	0
2874	697	1	BAJNA PANEER DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2216	206	1	SHRI BALAJI SAREE CENTRE & COSMATICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2651	533	1	VAN PATANJALI	\N		MARG	35:52.7	\N	\N	2	0	1	0
2708	576	1	SATGURU KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2360	318	1	SHARMA MEDICOSE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2330	295	1	OM SAI RAM GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1885	66	1	SHAURYA DEPARTMENTAL STORE	\N	BETA 2	CAD	35:52.7	\N	\N	2	0	1	0
2445	378	1	NOIDA SHOP	\N		MARG	35:52.7	\N	\N	2	0	1	0
2347	308	1	ARSH PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3038	826	1	POOJA TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3222	999	1	RAJKUMAR KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2221	211	1	AGGARWAL GENERAL STORE/WS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2169	167	1	RADHE KRISHNA KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
1930	76	1	TABS & CAPS	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	0	1	0
2793	636	1	SUMMARY ACCOUNTS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3431	1223	1	AIRPLAZA RETAIL HOLDINGS	\N		MARG	31:59.6	\N	\N	2	1	1	0
3424	1216	1	SHUBH CHAURASIYA	\N		MARG	39:23.8	\N	\N	2	1	1	0
3385	1177	1	ROMS PIZZA	\N		MARG	21:26.9	\N	\N	2	1	1	0
3315	1109	1	ANUJ PAN BHANDAAR	\N		MARG	25:07.2	\N	\N	2	1	1	0
2162	162	1	WE CARE PHARMACY	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
2709	577	1	AGGARWAL KIRANA STORE	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	1	1	0
2880	701	1	BALAJI DEPARTMENTAL	\N		MARG	35:52.7	\N	\N	2	1	1	0
2566	470	1	GAURAV ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	1	1	0
3370	1162	1	SHRI JI ENTERPRISES	\N		MARG	38:21.8	\N	\N	2	1	1	0
1968	86	1	MODI CAKE - N - CAFÉ	\N	JAGATFARM G1	CAD	35:52.7	\N	\N	2	1	1	0
2245	231	1	SINGHAL TRADERS	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
2511	427	1	DAKSH TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3313	1107	1	BABA TRADERS	\N		MARG	25:07.2	\N	\N	2	0	1	0
2868	691	1	D.S ASSOCIATES	\N		MARG	35:52.7	\N	\N	2	0	1	0
2499	418	1	RADHIKA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2411	353	1	CAKE & CAFE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3043	828	1	KANHA CONFECTIONERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3169	946	1	RAGHAV AUTOMOBILE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
3084	863	1	MITHILESH MEDICOSE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2898	711	1	ZTULSI PATANJALI	\N		MARG	35:52.7	\N	\N	2	0	1	0
2327	292	1	CNH INDUSTRIAL INDIA PRIVATE LIMITED	\N		MARG	35:52.7	\N	\N	2	0	1	0
2794	637	1	VIJAY KUMAR UNITECH	\N		MARG	35:52.7	\N	\N	2	0	1	0
2368	323	1	YOGESH KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2729	592	1	OM KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2367	322	1	LR KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3238	1031	1	OM AGGARWAL SWEETS	\N		MARG	15:40.5	\N	\N	2	0	1	0
2137	147	1	FIROJ KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3414	1206	1	SHIV PAN SHOP	\N		MARG	32:56.6	\N	\N	2	0	1	0
3096	877	1	JAI SHREE RAM KIRANA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2718	583	1	PATANJALI ELDECO MISTIC	\N		MARG	35:52.7	\N	\N	2	0	1	0
2449	380	1	PATANJALI GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3023	811	1	BISREKH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2955	759	1	NIKHIL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2481	407	1	CAFE HAPPY GO LUCKY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2458	388	1	KUTUMB STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2912	724	1	BOBBY GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2118	133	1	PAT OM LUXMI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3361	1153	1	SS COLD DRINK	\N		MARG	37:54.5	\N	\N	2	0	1	0
2350	309	1	SARTHAK TRADING CO.	\N		MARG	35:52.7	\N	\N	2	0	1	0
2478	406	1	AGGAWAL TRADERS	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
3184	961	1	MOOL CHAND PAWAN KUMAR	\N		COL	35:52.7	\N	\N	2	0	1	0
3027	815	1	JAISWAL GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2326	291	1	MITTAL BAKERY	\N		MARG	35:52.7	\N	\N	2	0	1	0
3333	1127	1	FLAVOURED PAN SHOP JF	\N		MARG	41:53.9	\N	\N	2	0	1	0
2820	657	1	BAKE EXPRESS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2635	523	1	RAMESWARAM KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3329	1123	1	RAJA RAM KIRANA STORE	\N		MARG	41:53.9	\N	\N	2	0	1	0
2869	692	1	RSD OVERSEAS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3349	1139	1	GUDDU KIRANA STORE	\N		MARG	41:53.9	\N	\N	2	0	1	0
2959	763	1	ZDAILY NEEDS POINT	\N		MARG	35:52.7	\N	\N	2	0	1	0
2649	531	1	VINAY KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1621	2	1	AGGARWAL PROVISION STORE (AVJ)	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	0	1	0
2905	718	1	RADHE KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3103	883	1	CHANDANI KIRANA  STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
3087	868	1	POOJA SHANKAR	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2186	180	1	MALIK GREEN STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3267	1062	1	SINGHAL ENTERPRISES	\N		MARG	35:33.5	\N	\N	2	0	1	0
3065	844	1	GURU KRIPA MEDICOSE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2805	647	1	SARVODYA MILK FOOD	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2219	209	1	HIGHWAY MART 108	\N		MARG	35:52.7	\N	\N	2	0	1	0
3091	872	1	ANSHU GENERAL STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3015	806	1	ZDAILY NEED PATANJALI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2801	644	1	SHIV TRADERS	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
3337	1130	1	CHAURASIYA PAN RAMPUR	\N		MARG	41:53.9	\N	\N	2	0	1	0
3145	922	1	BANSAL TRADING COMPANY	\N	TUE J. FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
3108	888	1	NAVIN KIRANA STORE  GN	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2436	370	1	KAJAL KIRANA STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2964	765	1	RASWARA ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	0	1	0
2554	458	1	ZOM SHANTI MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2648	530	1	VIJAY MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3148	924	1	BOBBY STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2713	578	1	HCL CAKE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3447	1239	1	BIJENDER KIRANA STORE	\N		MARG	57:27.8	\N	\N	2	0	1	0
3106	886	1	PAWAN KIRANA STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2253	238	1	SHIVA ATTA CHAKI	\N		MARG	35:52.7	\N	\N	2	0	1	0
3173	950	1	MOOL CHAND PAWAN KUMAR	\N		COL	35:52.7	\N	\N	2	0	1	0
3014	805	1	MADAN KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2550	453	1	ZNIDHI GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1855	57	1	OM RETAIL MART	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
3444	1236	1	SHARMA STORE	\N		MARG	57:27.8	\N	\N	2	1	1	0
2516	431	1	PAWAN CHAURASIA	\N		MARG	35:52.7	\N	\N	2	1	1	0
2072	111	1	VISHWAS FOODS	\N	P2	CAD	35:52.7	\N	\N	2	1	1	0
3268	1063	1	JAGROSHNI ENTERPRISES	\N		MAR	22:45.5	\N	\N	2	1	1	0
2217	207	1	A.K. TRADERS	\N		MARG	35:52.7	\N	\N	2	1	1	0
3381	1173	1	AMIT TRADERS	\N		MARG	21:26.9	\N	\N	2	1	1	0
3265	1060	1	SARVODYA MILK AND VEGETAB	\N		MARG	35:33.5	\N	\N	2	1	1	0
3281	1075	1	LUCKY PAN	\N		MARG	25:07.2	\N	\N	2	1	1	0
2341	304	1	RATHI MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2462	391	1	JAIN SHREE GROCERY	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
3141	918	1	K K STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	1	1	0
3181	958	1	SAHU GENERAL STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2607	502	1	LIFE CARE PHARMACY NSG	\N		MARG	35:52.7	\N	\N	2	0	1	0
2808	648	1	RAJE LAL & CO	\N		MARG	35:52.7	\N	\N	2	0	1	0
3213	989	1	SINGH MEDICAL STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2822	659	1	RAJ KIRANA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2561	464	1	KARTHIK MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3240	1033	1	SUVIDHA SUPER MART	\N		MARG	15:40.5	\N	\N	2	0	1	0
2471	399	1	RADHIKA ENTERPRISES	\N		MARG	35:52.7	\N	\N	2	0	1	0
3452	\N	1	DUMMY DABUR	\N		DAB	45:47.4	\N	\N	2	0	1	0
3135	912	1	DUBEY TRADERS	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2871	694	1	SHRI RAM MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2342	305	1	GAURAV GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2960	764	1	SINGHAL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3008	799	1	RAKESH PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2271	251	1	SHRI SAI BHOG	\N		MARG	35:52.7	\N	\N	2	0	1	0
3397	1188	1	OM SAI DEPARTMENTAL STORE	\N		MARG	31:23.2	\N	\N	2	0	1	0
2707	575	1	SHRI RAM GOPAL PHARMACY AND COSMATIC	\N		MARG	35:52.7	\N	\N	2	0	1	0
2502	421	1	MAHA LUXMI GENERAL STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
2433	368	1	PATANJALI COMM BELT	\N		MARG	35:52.7	\N	\N	2	0	1	0
2970	769	1	BABLOO KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2624	515	1	ONE STOP MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
1751	36	1	DUTTA ICECREAM PARLOUR	\N		MARG	35:52.7	\N	\N	2	0	1	0
2270	250	1	OMKAR TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3197	973	1	OM DAIRY STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
3085	864	1	SHUBH MEDICAL	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2795	638	1	SHARMA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2590	489	1	ON COST	\N		MARG	35:52.7	\N	\N	2	0	1	0
2372	327	1	LAXMI DAIRY.	\N		MARG	35:52.7	\N	\N	2	0	1	0
3440	1232	1	ARUN TRADERS	\N		MARG	57:27.8	\N	\N	2	0	1	0
2810	649	1	OM SHANTI OM MEDICOSE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2646	528	1	HARSH CONFECTIONERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2980	776	1	SONU STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2406	350	1	KRISHNADEEP SWADESHI KENDRA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2179	177	1	KRISHAN CANTEEN	\N		MARG	35:52.7	\N	\N	2	0	1	0
3203	979	1	VAISHNO KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2738	600	1	SURAJPUR PATANJALI	\N		MARG	35:52.7	\N	\N	2	0	1	0
3436	1228	1	UMESH AGGARWAL STORE	\N		MARG	57:27.7	\N	\N	2	0	1	0
3188	965	1	SAHU GENERAL STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2418	358	1	SUPER GARMENTS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3017	808	1	GARG MEDICOSE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2937	744	1	VED PRAKASH JAI BHAGWAN	\N		MARG	35:52.7	\N	\N	2	0	1	0
1670	18	1	SARVODYA MILK AND VEGETABLE MA	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	0	1	0
3013	804	1	VIPUL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2376	331	1	AK KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3327	1121	1	MANOJ PAN	\N		MARG	41:53.9	\N	\N	2	0	1	0
3003	795	1	SHREE MAHAVEER STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2100	123	1	ZKHUSHI KIRANA 2	\N		MARG	35:52.7	\N	\N	2	0	1	0
2627	517	1	VK STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2386	337	1	SWASTHYAREKHA INTERNET PRIVATE LIMITED	\N		MARG	35:52.7	\N	\N	2	0	1	0
2851	681	1	SK TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2240	227	1	AMARPALI PHARMACY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2206	198	1	CONCERN AND CARE PHARMACY PVT LTD	\N		MARG	35:52.7	\N	\N	2	0	1	0
3323	1117	1	BRIJWASI SWEETS ACHER	\N		MARG	25:07.2	\N	\N	2	0	1	0
1738	33	1	TANEJA COSMETICS GIFT SHOP	\N		GOD	26:18.6	\N	\N	2	0	1	0
2584	484	1	BANKE BIHARI TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3147	923	1	NAVEEN TRADERS	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3358	1150	1	GOYAL COLD DRINK	\N		MARG	37:54.4	\N	\N	2	0	1	0
2842	675	1	SHUBHAM MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
2325	290	1	AJAIPUR MEDICAL	\N		MARG	35:52.7	\N	\N	2	0	1	0
3114	894	1	NIZAM GENERAL STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3255	1050	1	SHIV CONFECTIONERS STORE	\N		MARG	35:33.5	\N	\N	2	0	1	0
2464	392	1	GROCERY PLANET RETAILS PVT LTD	\N		MARG	35:52.7	\N	\N	2	0	1	0
2569	472	1	VIKAS DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2334	298	1	VIJAY MEDICAL HALL	\N		MARG	35:52.7	\N	\N	2	1	1	0
3278	1073	1	ADDISTRO TECHNOLOGIES PVT LTD	\N		COL	23:21.7	\N	\N	2	1	1	0
2761	616	1	FRESH ZONE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3448	1240	1	HEMANT PHARMACY	\N		MARG	57:27.8	\N	\N	2	1	1	0
3389	1180	1	SHARMA MEDICAL AGENCY	\N		MARG	21:27.0	\N	\N	2	1	1	0
1865	59	1	SAVERS CART.	\N		MARG	15:40.5	\N	\N	2	1	1	0
1626	4	1	ARYAVART MEDICOS	\N		MARG	35:52.7	\N	\N	2	1	1	0
2363	320	1	CROWNE PLAZA GREATER NOID	\N		MARG	18:43.5	\N	\N	2	1	1	0
1725	32	1	SINGHAL PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2461	390	1	PANDEY DEPATMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2769	621	1	AADHYA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3143	920	1	GOYAL TRADERS	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	1	1	0
1874	62	1	SHREE SHYAM KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3271	1066	1	KUMAR ENTERPRISES*	\N		COL	23:21.7	\N	\N	2	1	1	0
2621	512	1	SHRI KRISHANA MEDICOSE	\N		MARG	35:52.7	\N	\N	2	1	1	0
1988	93	1	VIJAY MEDICOS	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
3359	1151	1	DAKOTI EVERGREEN BAKERY	\N		MARG	37:54.4	\N	\N	2	1	1	0
3049	832	1	RIYA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3242	1035	1	BRIJWASI SWEETS	\N		MARG	15:40.5	\N	\N	2	0	1	0
3165	941	1	SHARMA ENTERPRISES	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
3346	1136	1	SANJAY PAN BHANDAR	\N		MARG	41:53.9	\N	\N	2	0	1	0
2279	258	1	SHAID BHAGAT SHOPPING MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
2210	202	1	RAHUL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2424	362	1	BHAWANI MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
2223	213	1	NEW INDIA UMESH STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2456	386	1	MAHALUXMI COSMETICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3241	1034	1	BRIJWASI SWEETS	\N		MARG	15:40.5	\N	\N	2	0	1	0
2693	566	1	DAILY NEED DEPARTMENTAL STORE.	\N		MARG	35:52.7	\N	\N	2	0	1	0
3187	964	1	FOUJI KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2973	772	1	ANANT RAM MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3386	1178	1	BREW BAKES	\N		MARG	21:26.9	\N	\N	2	0	1	0
3410	1202	1	AAKASH PAN BHANDAR	\N		MARG	18:43.5	\N	\N	2	0	1	0
2573	476	1	MANJU KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3139	916	1	AALAM KIRANA STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2932	741	1	VISHNU CANTEEN	\N		MARG	35:52.7	\N	\N	2	0	1	0
2487	411	1	KULDEEP GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3332	1126	1	RAM NIWAS	\N		MARG	41:53.9	\N	\N	2	0	1	0
3348	1138	1	SHRI BALAJI SAREE CENTRE	\N		MARG	41:53.9	\N	\N	2	0	1	0
2174	172	1	GANESH KIRANA AND GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2493	415	1	SHARMA CANTEEN	\N		MARG	35:52.7	\N	\N	2	0	1	0
3208	984	1	ROBIN CANTEEN	\N		COL	35:52.7	\N	\N	2	0	1	0
3076	854	1	NANDAN MEDICAL STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3119	899	1	A TO Z STORES	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
3075	853	1	ROUNAK DENTAL CENTRE VIHAAN ME	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2262	245	1	GANPATI KIRANA STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3219	995	1	SONU SHARMA KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2746	605	1	SAURABH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2405	349	1	RAI SINGH PANTJALI SWADESHI KENDRA	\N		MARG	35:52.7	\N	\N	2	0	1	0
1714	29	1	PARESH FAST FOOD	\N	ALPHA 1 DELTA 1	CAD	35:52.7	\N	\N	2	0	1	0
2647	529	1	TARUN COSMATICS STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2287	263	1	DAILY NEED	\N		MARG	25:07.2	\N	\N	2	0	1	0
2019	99	1	JANKI PROVISION STORE	\N	P2	CAD	35:52.7	\N	\N	2	0	1	0
3090	871	1	KAMAL GENERAL STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3232	1025	1	GURMEET KIRANA STORE	\N		CAD	35:52.7	\N	\N	2	0	1	0
2638	524	1	MORNING CHOICE STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
2483	409	1	GAGAN MEDICOSE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3418	1210	1	BIG SHOP SILVER CITY I	\N		MARG	31:17.1	\N	\N	2	0	1	0
3261	1056	1	SHUBHANGI ENTERPRISES	\N		MARG	35:33.5	\N	\N	2	0	1	0
2188	182	1	OM SAI RAM CONFECTIONERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3161	937	1	PRAKASH MARKETING	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
3156	932	1	VIDHA MEDICAL STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2081	113	1	ANANT WELNESS	\N		DAB	27:55.3	\N	\N	2	0	1	0
3439	1231	1	ARUN TRADERS	\N		MARG	57:27.8	\N	\N	2	0	1	0
2489	413	1	ROYAL SUPERMARKET	\N		MARG	35:52.7	\N	\N	2	0	1	0
3089	870	1	MANOJ SINGHAL KIRANA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3104	884	1	OM SAI KIRANA STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3413	1205	1	RK COLD DRINKS	\N		MARG	32:56.5	\N	\N	2	0	1	0
2903	716	1	AGAM TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3102	882	1	SUNDER SHOPPING HOUSE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3363	1155	1	DAY 2 DAY	\N		MARG	37:54.5	\N	\N	2	0	1	0
2384	335	1	VAISHNO PATANJALI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3228	1018	1	RADIANT BAKERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2840	673	1	SHIV GENERAL STORE.	\N		MARG	35:52.7	\N	\N	2	0	1	0
2482	408	1	PARB CANTEEN	\N		MARG	35:52.7	\N	\N	2	0	1	0
2260	244	1	JAIN GIFT AND BAKERY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2102	125	1	RUCHICA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2779	628	1	STANDARD STATIONERS & COMPUTERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3205	981	1	SHIV KUMAR KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
2277	257	1	SHRI BALAJI TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3316	1110	1	POORVANCHAL PAN A2	\N		MARG	25:07.2	\N	\N	2	0	1	0
3223	1006	1	SINGHAL PRO. STORE	\N		GOD	35:52.7	\N	\N	2	1	1	0
1818	49	1	AGGARWAL TRADING CO.	\N	BEETA 1 RAMPUR	CAD	35:52.7	\N	\N	2	1	1	0
2373	328	1	GURUKRIPA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2521	434	1	BIG SHOP	\N	MON - OUTER - 2	COL	35:52.7	\N	\N	2	1	1	0
2248	233	1	SHREE GANESH TRADERS	\N		MARG	35:52.7	\N	\N	2	1	1	0
3293	1087	1	PRIYANKA KIRANA STORE	\N		MARG	25:07.2	\N	\N	2	1	1	0
2739	601	1	RAMA PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3320	1114	1	SACHIN PAN SHOP	\N		MARG	25:07.2	\N	\N	2	1	1	0
3334	1128	1	ANANDAM FOOD SUPPLIES	\N		MARG	41:53.9	\N	\N	2	1	1	0
3352	1142	1	SHRI KRIPA PHARMACY	\N		MARG	41:53.9	\N	\N	2	1	1	0
3297	1091	1	DOOR STEP	\N		MARG	25:07.2	\N	\N	2	1	1	0
2107	128	1	GOYAL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3302	1096	1	CHAURASIYA PAN BHANDAR	\N		MARG	25:07.2	\N	\N	2	1	1	0
2887	705	1	V.R. MEDICOSE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2732	595	1	SHRI BALAJI STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2192	184	1	ANSHIKA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2720	585	1	OP SHARMA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2249	234	1	RAGHAV DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2269	249	1	RAKESH GUPTA GENERAL STOR	\N		MARG	15:40.5	\N	\N	2	0	1	0
3330	1124	1	DAKSH GENERAL STORE DELTA	\N		MARG	41:53.9	\N	\N	2	0	1	0
2500	419	1	KANSAL COSMATICS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2914	726	1	BHAWANA CONFECTIONERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2860	686	1	SHREE GANESH KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3411	1203	1	PALAK GARMENT & COSMETICS	\N		MARG	18:43.5	\N	\N	2	0	1	0
2812	651	1	KHUSHI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3060	841	1	NIVESH GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2832	667	1	RAVI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3070	848	1	CHAURASIYA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
1903	70	1	GOYAL ENTERPRISES	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
3433	1225	1	SHRI BALAJI KV COMPLEX	\N		MARG	31:59.7	\N	\N	2	0	1	0
2141	151	1	ANGEL PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3360	1152	1	GURU KRIPA DEPARTMENTAL S	\N		MARG	37:54.5	\N	\N	2	0	1	0
2944	749	1	SONI MEDICAL	\N		MARG	35:52.7	\N	\N	2	0	1	0
2371	326	1	LEELAWATI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3151	927	1	RINKU STORE	\N	ALPHA I  AND II	GOD	35:52.7	\N	\N	2	0	1	0
2730	593	1	SABHARAWAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2289	265	1	SHISHODIYA KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2472	400	1	MUSKAN RAMPUR	\N		MARG	35:52.7	\N	\N	2	0	1	0
2212	203	1	VIJAY KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2585	485	1	KUNAL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3372	1164	1	DIVINE PHARMACY	\N		MARG	28:40.6	\N	\N	2	0	1	0
2908	720	1	NUTRIWELL PHARMACY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2197	189	1	SHUKLA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2337	301	1	MALHOTRAS SUPER STORE AND AGENCIES	\N		MARG	35:52.7	\N	\N	2	0	1	0
3365	1157	1	CHOTE LAL JI	\N		MARG	37:54.5	\N	\N	2	0	1	0
2203	195	1	CHETAN CIGRETTE STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2895	710	1	FRIENDSPROVISION STORE	\N	MON TUGAHLPUR	COL	35:52.7	\N	\N	2	0	1	0
2834	668	1	MANOJ KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2671	550	1	PATANJALI HARI RASAN STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2926	737	1	EVD MART	\N		MARG	35:52.7	\N	\N	2	0	1	0
3324	1118	1	SINGHAL KIRANA TP	\N		GOD	26:18.6	\N	\N	2	0	1	0
2884	704	1	DISHA COSMATICS	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	0	1	0
3083	862	1	DEODHAR MEDICAL STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2144	153	1	SINGHAL BANDHU PROVISION STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2280	259	1	FAROOKH TRADING CO.	\N		MARG	35:52.7	\N	\N	2	0	1	0
3115	895	1	RATAN LAL GENERAL STORE	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	0	1	0
2316	283	1	YO TIME	\N		MARG	35:52.7	\N	\N	2	0	1	0
3326	1120	1	BHATIA GENERAL STORE	\N		MARG	41:53.9	\N	\N	2	0	1	0
2790	635	1	SURYA DEPARTMENTAL STORE	\N	THU GAMMA ALPHA	COL	35:52.7	\N	\N	2	0	1	0
2208	200	1	CHAUDHARY MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2913	725	1	DHORIYA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2358	316	1	BADOLI PATANJALI STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2909	721	1	JIYA DEPARTMENTAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3080	859	1	CONCERN AND CARE PHARMACY	\N	WED - OUTER	COL	35:52.7	\N	\N	2	0	1	0
3183	960	1	MUSKAN KIRANA  STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
3166	942	1	SHIV SHANKAR KIRANA STORE	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	0	1	0
2927	738	1	SUNIL AGGARWAL KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3310	1104	1	BANKE BIHARI	\N		MARG	25:07.2	\N	\N	2	0	1	0
2205	197	1	KHARI KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2139	149	1	SANTOSH TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2875	698	1	SUMMIT TRADERS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3412	1204	1	BHARAT KASNA MEDICAL STOR	\N		MARG	18:43.5	\N	\N	2	0	1	0
3450	1242	1	RUDRA CAFE	\N		MARG	50:34.4	\N	\N	2	0	1	0
3260	1055	1	SHANKAR SWEETS	\N		MARG	35:33.5	\N	\N	2	0	1	0
2416	357	1	AVNEESH KIRANA STORE	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	0	1	0
3353	1143	1	GURU KRIPA DEPARTMENTAL STORE	\N		COL	35:57.4	\N	\N	2	0	1	0
3006	797	1	MOTHER DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2251	236	1	RAWAL RETAIL CORPORATION	\N		MARG	35:52.7	\N	\N	2	0	1	0
3004	796	1	SAI MEDICAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3074	852	1	Future Retail Limited	\N	WED TUGHALPUR - 2	COL	35:52.7	\N	\N	2	1	1	0
1676	19	1	SHREE OM GENERAL STORE	\N	WED - OUTER	COL	35:52.7	\N	\N	2	1	1	0
3319	1113	1	PAWAN CHAURASIYA PAN SHOP	\N		MARG	25:07.2	\N	\N	2	1	1	0
3401	1192	1	HIGH GENESIS PHARMACY	\N		MARG	56:16.3	\N	\N	2	1	1	0
2974	773	1	MOHSIN KIRANA & CONFECTIONAR	\N	SAT SURAJ PUR - 2	COL	35:52.7	\N	\N	2	1	1	0
1925	75	1	SHRI RAM MEDICOS	\N	GAMMA 2	MAR	35:52.7	\N	\N	2	1	1	0
1657	13	1	HAMARA SAHYOG	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	1	1	0
3286	1080	1	TN ENTERPRISES	\N		MARG	25:07.2	\N	\N	2	1	1	0
2587	487	1	SHIV GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
3423	1215	1	SHRI SHYAM TRADING	\N		MARG	39:23.8	\N	\N	2	1	1	0
2836	670	1	GREEN GROCERIES	\N		MARG	35:52.7	\N	\N	2	1	1	0
1973	87	1	NEW UNIVERSAL MEDICARE	\N	GAMMA I AND II	GOD	35:52.7	\N	\N	2	1	1	0
1660	14	1	HARIOM PROVISION STORE	\N	ACHER SOCIETY	CAD	35:52.7	\N	\N	2	1	1	0
1997	94	1	9 TO 9 MERCATO	\N	APPARTMENT AND  TUGALPUR	GOD	35:52.7	\N	\N	2	1	1	0
2589	488	1	RX PHARMA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2201	193	1	JAI DURGE SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3024	812	1	LUCKY SUPER STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2202	194	1	PATANJALI CM MARKET	\N		MARG	35:52.7	\N	\N	2	0	1	0
2724	587	1	PAPPU PANSARI	\N		MARG	35:52.7	\N	\N	2	0	1	0
3095	876	1	GANESH KIRANA & GENERAL STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
2689	563	1	ZGAURAV GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2340	303	1	VISHESH MEDICOS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2256	241	1	KISHAN PATANJALI RASAN STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3408	1200	1	VINNI COSMETICS	\N		MARG	18:43.5	\N	\N	2	0	1	0
2697	568	1	SHRI BALAJI KIRANA	\N		MARG	35:52.7	\N	\N	2	0	1	0
2997	790	1	TUSHAR SWEETS	\N		MARG	35:52.7	\N	\N	2	0	1	0
3225	1012	1	HIGLANCE LABORATORIES PVT	\N		MARG	35:52.7	\N	\N	2	0	1	0
2539	444	1	SHIV MEDICAL STORE	\N	SAT SURAJ PUR	COL	35:52.7	\N	\N	2	0	1	0
3088	869	1	GURUKRIPA MEDICAL STORE	\N	TUE-J.FARM & RAMPUR	COL	35:52.7	\N	\N	2	0	1	0
2664	545	1	MEDIPLUS	\N		MARG	35:52.7	\N	\N	2	0	1	0
2512	428	1	PATANJALI ALPHA I	\N		MARG	35:52.7	\N	\N	2	0	1	0
2207	199	1	GUPTA FAST FOOD	\N		MARG	35:52.7	\N	\N	2	0	1	0
2727	590	1	MAHENDRA DAIRY	\N		MARG	35:52.7	\N	\N	2	0	1	0
2902	715	1	KRISHNA GENERAL STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
3221	997	1	HIMANSHI KIRANA STORE	\N		COL	35:52.7	\N	\N	2	0	1	0
3039	827	1	TBL PROJECTS LIMITED	\N	THU GAMMA ALPHA - 2	COL	35:52.7	\N	\N	2	0	1	0
2714	579	1	ZSARTHAK KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	0	1	0
2185	179	1	SHANKAR GENERAL STORE	\N	BETA I AND II	GOD	35:52.7	\N	\N	2	0	1	0
1822	50	1	DHRUV KIRANA STORE	\N	BEETA 1 RAMPUR	MAR	35:52.7	\N	\N	2	1	1	0
3270	1065	1	BALAJI STORE	\N		COL	23:21.7	\N	\N	2	1	1	0
1715	30	1	PAWAN MEDICAL STORE	\N	ALPHA I	MAR	35:52.7	\N	\N	2	1	1	0
3276	1070	\N	FRESHLEE RETAILS PRIVATE LIMITED	\N		COL	23:21.7	\N	\N	2	1	1	0
3314	1108	1	HARSHIT TRADERS	\N		MARG	25:07.2	\N	\N	2	1	1	0
2359	317	1	ADITYA KIRANA STORE	\N		MARG	35:52.7	\N	\N	2	1	1	0
2787	633	1	TILAPATA GROCERY MART	\N		MARG	35:52.7	\N	\N	2	1	1	0
1939	78	1	AGGARWAL DEPARTMENTAL STORE	\N	RAMPUR JAGIR	MAR	35:52.7	\N	\N	2	1	1	0
3256	1051	1	OM GROCERY STORE	\N		MARG	35:33.5	\N	\N	2	1	1	0
2039	102	1	MITTAL GENERAL STORE	\N	SOCIETY	MAR	35:52.7	\N	\N	2	1	1	0
3376	1168	1	SHITLA PAN	\N		MARG	21:26.9	\N	\N	2	1	1	0
3283	1077	1	DANKAUR SANCHIT	\N		MARG	25:07.2	\N	\N	2	1	1	0
\.


--
-- Data for Name: statement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statement (id, date, narration, refno, created_at, updated_at, deleted_at, user_id, master_id, cust_id, deposit, withdrawl, bank_id, company_id, exported_time) FROM stdin;
1574	2019-04-03	ACH D- MONDELEZ INDIA FOODS-DB35570801	0000008756208324	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	112550.270000000004	2	1	0
1573	2019-04-03	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-HDFCR52019040372289124-COLGATE	HDFCR52019040372289124	2019-10-01 23:34:09.331984	\N	\N	1	\N	764	\N	443289.340000000026	2	1	0
1575	2019-04-04	NEFT DR-CITI0000002-PERFETTI VAN MELLE INDIA PVT LTD-NETBANK, MUM-N094190793166017-PERFETTI	N094190793166017	2019-10-01 23:34:09.331984	\N	\N	1	\N	766	\N	115000	2	1	0
1584	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000911991	2019-10-01 23:34:09.331984	\N	\N	1	\N	349	12311	\N	2	1	0
1586	2019-04-09	IMPS-909912167489-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000909912167489	2019-10-01 23:34:09.331984	\N	\N	1	\N	159	20426	\N	2	1	0
1567	2019-04-02	ACH D- MONDELEZ INDIA FOODS-DB35530828	0000008718314368	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	163715.390000000014	2	1	0
1590	2019-04-10	NEFT DR-CITI0000002-PERFETTI VAN MELLE INDIA PVT LTD-NETBANK, MUM-N100190798330469-PERFETTI	N100190798330469	2019-10-01 23:34:09.331984	\N	\N	1	\N	766	\N	150000	2	1	0
1571	2019-04-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000037045	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	9270	\N	2	1	0
1569	2019-04-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008921	2019-10-01 23:34:09.331984	\N	\N	1	\N	23	9731	\N	2	1	0
1618	2019-04-20	50200007138822-TPT-JP CA TO TTC CA	0000000145822132	2019-10-01 23:34:09.331984	2019-12-22 16:53:46.792414	\N	1	\N	761	200000	\N	2	1	0
1566	2019-04-02	50100040075595-TPT-DRAWINGS	0000000147993225	2019-10-01 23:34:09.331984	\N	\N	1	\N	772	\N	10000	2	1	0
1572	2019-04-03	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	300000	\N	2	1	0
1576	2019-04-04	EMI 58456073 CHQ S58456073110 041958456073	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	774	\N	87242	2	1	0
1585	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000074202	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	4284	\N	2	1	0
1578	2019-04-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000165794	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	14448	\N	2	1	0
1580	2019-04-07	O/S INTEREST RECOVERY FOR A/C XXXXXXXXXX3444	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	776	\N	16207	2	1	0
1577	2019-04-06	RDMCGHA0090-STP-RDM	IB06160320989517	2019-10-01 23:34:09.331984	\N	\N	1	\N	765	\N	25175	2	1	0
1589	2019-04-10	CHQ PAID-MICR CTS-NO-LIC OF INDIA	0000000000000188	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	2132	2	1	0
1583	2019-04-08	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN619098946306	SBIN619098946306	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	9340	\N	2	1	0
1581	2019-04-08	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	290000	\N	2	1	0
1582	2019-04-08	HB3142NR1000007858-STP-GODREJ	IB08122406586992	2019-10-01 23:34:09.331984	\N	\N	1	\N	763	\N	190000	2	1	0
1587	2019-04-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019560	2019-10-01 23:34:09.331984	\N	\N	1	\N	626	3159	\N	2	1	0
1588	2019-04-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000478077	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	9589	\N	2	1	0
1592	2019-04-10	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN819100829745	SBIN819100829745	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	1096	\N	2	1	0
1591	2019-04-10	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	328000	\N	2	1	0
1593	2019-04-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000114891	2019-10-01 23:34:09.331984	\N	\N	1	\N	261	15359	\N	2	1	0
1599	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000102592	2019-10-01 23:34:09.331984	\N	\N	1	\N	418	10550	\N	2	1	0
1598	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000172714	2019-10-01 23:34:09.331984	\N	\N	1	\N	565	11863	\N	2	1	0
1597	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000986732	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	18112	\N	2	1	0
1596	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122423	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	18488	\N	2	1	0
1600	2019-04-14	IMPS-910413159139-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000910413159139	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	14870	\N	2	1	0
1602	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000206	2019-10-01 23:34:09.331984	\N	\N	1	\N	585	6258	\N	2	1	0
1601	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000904913	2019-10-01 23:34:09.331984	\N	\N	1	\N	627	10550	\N	2	1	0
1603	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000049	2019-10-01 23:34:09.331984	\N	\N	1	\N	777	21644	\N	2	1	0
1606	2019-04-16	FT - CR - 09272000000837 - ANUJ MEDICAL STORE	0000000000000249	2019-10-01 23:34:09.331984	\N	\N	1	\N	49	3134	\N	2	1	0
1604	2019-04-16	HB3142NR1000007858-STP-GODREJ	IB16120520875903	2019-10-01 23:34:09.331984	\N	\N	1	\N	763	\N	160000	2	1	0
1608	2019-04-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000486113	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	4313	\N	2	1	0
1607	2019-04-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000036	2019-10-01 23:34:09.331984	\N	\N	1	\N	252	3823	\N	2	1	0
1605	2019-04-16	ACH D- MONDELEZ INDIA FOODS-DB35700798	0000009215206380	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	331165.969999999972	2	1	0
1609	2019-04-17	IMPS-910709592617-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000910709592617	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	22220	\N	2	1	0
1612	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039351	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	2755	\N	2	1	0
1615	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000463	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	8080	\N	2	1	0
1616	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000598900	2019-10-01 23:34:09.331984	\N	\N	1	\N	381	10007	\N	2	1	0
1613	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000802	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	10966	\N	2	1	0
1611	2019-04-18	IMPS-910814105146-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000910814105146	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	17912	\N	2	1	0
1614	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000076058	2019-10-01 23:34:09.331984	\N	\N	1	\N	619	31819	\N	2	1	0
1621	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000078237	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	19660	\N	2	1	0
1620	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000986746	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	35141	\N	2	1	0
1617	2019-04-20	NEFT CR-SBIN0003342-RAMA PROVISION STORE-TUSHAR TRADING CO-SBIN719110672739	SBIN719110672739	2019-10-01 23:34:09.331984	\N	\N	1	\N	462	53235	\N	2	1	0
1619	2019-04-20	NEFT DR-CITI0000002-PERFETTI VAN MELLE INDIA PVT LTD-NETBANK, MUM-N110190805709707-PERFETTI	N110190805709707	2019-10-01 23:34:09.331984	\N	\N	1	\N	766	\N	150000	2	1	0
1610	2019-04-18	50200007138822-TPT-TTC CA TO JP CA	0000000324067890	2019-10-01 23:34:09.331984	\N	\N	1	\N	232	\N	80000	2	1	0
1579	2019-04-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000486110	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	6072	\N	2	1	0
1594	2019-04-11	GST/BANK REFERENCE NO: R1910110777931/CIN NO: HDFC19040900170212	0190411090017525	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	11978	2	1	0
1570	2019-04-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000037065	2019-10-01 23:34:09.331984	\N	\N	1	\N	9	38217	\N	2	1	0
1677	2019-05-02	NEFT CR-BARB0SURGAU-GOYAL TRADERS-TUSHAR TRADING COMPANY-BARBU19122971372	BARBU19122971372	2019-10-01 23:34:09.331984	\N	\N	1	\N	190	82039	\N	2	1	0
4243	2019-04-02	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N092190790297392-RED BULL	N092190790297392	2019-10-29 14:58:30.573357	\N	\N	1	\N	1251	\N	50000	4	2	0
1626	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036732	2019-10-01 23:34:09.331984	\N	\N	1	\N	35	2127	\N	2	1	0
1625	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071792	2019-10-01 23:34:09.331984	\N	\N	1	\N	252	5886	\N	2	1	0
1624	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000486115	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	6363	\N	2	1	0
1623	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000165803	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	10378	\N	2	1	0
1622	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000095665	2019-10-01 23:34:09.331984	\N	\N	1	\N	214	14826	\N	2	1	0
1632	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000898	2019-10-01 23:34:09.331984	\N	\N	1	\N	348	1827	\N	2	1	0
1633	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000135113	2019-10-01 23:34:09.331984	\N	\N	1	\N	454	4353	\N	2	1	0
1628	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000986574	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	6669	\N	2	1	0
1629	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000812	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	8864	\N	2	1	0
1630	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000060002	2019-10-01 23:34:09.331984	\N	\N	1	\N	414	13451	\N	2	1	0
1631	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000065868	2019-10-01 23:34:09.331984	\N	\N	1	\N	449	16687	\N	2	1	0
1627	2019-04-22	ACH D- MONDELEZ INDIA FOODS-DB35750866	0000009294083287	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	214015.73000000001	2	1	0
1637	2019-04-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033064	2019-10-01 23:34:09.331984	\N	\N	1	\N	113	5490	\N	2	1	0
1636	2019-04-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000011944	2019-10-01 23:34:09.331984	\N	\N	1	\N	472	17006	\N	2	1	0
1635	2019-04-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000190	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	28834	\N	2	1	0
1639	2019-04-24	IMPS-911415681351-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000911415681351	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	5454	\N	2	1	0
1644	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000087	2019-10-01 23:34:09.331984	\N	\N	1	\N	326	9739	\N	2	1	0
1643	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001849	2019-10-01 23:34:09.331984	\N	\N	1	\N	139	13975	\N	2	1	0
1642	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000100951	2019-10-01 23:34:09.331984	\N	\N	1	\N	557	16716	\N	2	1	0
1641	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000078239	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	20407	\N	2	1	0
1640	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000911995	2019-10-01 23:34:09.331984	\N	\N	1	\N	349	23933	\N	2	1	0
1645	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000032283	2019-10-01 23:34:09.331984	\N	\N	1	\N	18	36538	\N	2	1	0
1650	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000031088	2019-10-01 23:34:09.331984	\N	\N	1	\N	305	2748	\N	2	1	0
1649	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001260	2019-10-01 23:34:09.331984	\N	\N	1	\N	262	6209	\N	2	1	0
1648	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000473	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	6499	\N	2	1	0
1647	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122449	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	6705	\N	2	1	0
1646	2019-04-25	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN119115826254	SBIN119115826254	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	11913	\N	2	1	0
1652	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000811	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	23387	\N	2	1	0
1651	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000069835	2019-10-01 23:34:09.331984	\N	\N	1	\N	197	35273	\N	2	1	0
1656	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000055181	2019-10-01 23:34:09.331984	\N	\N	1	\N	166	3190	\N	2	1	0
1655	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382329	2019-10-01 23:34:09.331984	\N	\N	1	\N	332	5392	\N	2	1	0
1653	2019-04-26	IMPS-911610146182-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000911610146182	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	6835	\N	2	1	0
1654	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000349104	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	27080	\N	2	1	0
1661	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000907	2019-10-01 23:34:09.331984	\N	\N	1	\N	348	1745	\N	2	1	0
1660	2019-04-29	IMPS-911912664670-K K STORE-HDFC-XXXXXXXXXX1250-	0000911912664670	2019-10-01 23:34:09.331984	\N	\N	1	\N	234	2897	\N	2	1	0
1662	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000838455	2019-10-01 23:34:09.331984	\N	\N	1	\N	322	3907	\N	2	1	0
1663	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039362	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	5642	\N	2	1	0
1664	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000836	2019-10-01 23:34:09.331984	\N	\N	1	\N	379	7893	\N	2	1	0
1665	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000986590	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	8294	\N	2	1	0
1666	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000060004	2019-10-01 23:34:09.331984	\N	\N	1	\N	414	13451	\N	2	1	0
1667	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000754	2019-10-01 23:34:09.331984	\N	\N	1	\N	475	21951	\N	2	1	0
1668	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000153584	2019-10-01 23:34:09.331984	\N	\N	1	\N	595	28481	\N	2	1	0
1657	2019-04-29	ACH D- MONDELEZ INDIA FOODS-DB35810803	0000009352323834	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	205766.420000000013	2	1	0
1659	2019-04-29	HB3142NR1000007858-STP-GODREJ	IB29114252086961	2019-10-01 23:34:09.331984	\N	\N	1	\N	763	\N	265000	2	1	0
1674	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000078245	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	4254	\N	2	1	0
1673	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000095666	2019-10-01 23:34:09.331984	\N	\N	1	\N	214	4301	\N	2	1	0
1672	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000833	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	13621	\N	2	1	0
1671	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000218845	2019-10-01 23:34:09.331984	\N	\N	1	\N	349	21057	\N	2	1	0
1670	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038354	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	30400	\N	2	1	0
1676	2019-05-01	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000095666	2019-10-01 23:34:09.331984	\N	\N	1	\N	214	\N	4301	2	1	0
1634	2019-04-23	CHQ DEP RET- DRAWER SIGNATURE DIFFERS	0000000000060002	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	13451	2	1	0
1669	2019-04-30	50200013317598-TPT-TUSHAR	0000000141012077	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	12128	\N	2	1	0
1686	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000986603	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	2692	\N	2	1	0
1680	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000751	2019-10-01 23:34:09.331984	\N	\N	1	\N	553	45544	\N	2	1	0
1681	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000349108	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	29176	\N	2	1	0
1682	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000386656	2019-10-01 23:34:09.331984	\N	\N	1	\N	464	15324	\N	2	1	0
1683	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000369594	2019-10-01 23:34:09.331984	\N	\N	1	\N	62	9274	\N	2	1	0
1684	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000087	2019-10-01 23:34:09.331984	\N	\N	1	\N	110	5158	\N	2	1	0
1685	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000480	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	4560	\N	2	1	0
1690	2019-05-03	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	96000	\N	2	1	0
1687	2019-05-03	50200007138822-TPT-TTC CA TO JP CA	0000000275129257	2019-10-01 23:34:09.331984	\N	\N	1	\N	232	\N	200000	2	1	0
1688	2019-05-03	50200029537650-TPT-JP OD TO TTC CA	0000000275147790	2019-10-01 23:34:09.331984	\N	\N	1	\N	232	200000	\N	2	1	0
1689	2019-05-03	IMPS-912310187975-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000912310187975	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	13292	\N	2	1	0
1691	2019-05-03	HB3142NR1000007858-STP-GODREJ	IB03144823571721	2019-10-01 23:34:09.331984	\N	\N	1	\N	763	\N	144000	2	1	0
1692	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000620807	2019-10-01 23:34:09.331984	\N	\N	1	\N	627	9596	\N	2	1	0
1697	2019-05-04	ACH D- MONDELEZ INDIA FOODS-DB35880698	0000009491402176	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	332176.330000000016	2	1	0
1695	2019-05-04	50200007138822-TPT-JP CA TO TTC CA	0000000192541271	2019-10-01 23:34:09.331984	\N	\N	1	\N	232	100000	\N	2	1	0
1698	2019-05-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036981	2019-10-01 23:34:09.331984	\N	\N	1	\N	96	31858	\N	2	1	0
1702	2019-05-06	NEFT CR-SBIN0003342-RAMA PROVISION STORE-TUSHAR TRADING CO-SBIN819126941612	SBIN819126941612	2019-10-01 23:34:09.331984	\N	\N	1	\N	462	59035	\N	2	1	0
1704	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000061072	2019-10-01 23:34:09.331984	\N	\N	1	\N	401	10089	\N	2	1	0
1705	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000847	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	12039	\N	2	1	0
1706	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000201405	2019-10-01 23:34:09.331984	\N	\N	1	\N	380	41534	\N	2	1	0
1703	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000031091	2019-10-01 23:34:09.331984	\N	\N	1	\N	306	4081	\N	2	1	0
1708	2019-05-07	HB3142NR1000007858-STP-GODREJ	IB07112503693031	2019-10-01 23:34:09.331984	\N	\N	1	\N	763	\N	32000	2	1	0
1709	2019-05-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038364	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	24788	\N	2	1	0
1707	2019-05-07	O/S INTEREST RECOVERY FOR A/C XXXXXXXXXX3444	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	776	\N	12786	2	1	0
1711	2019-05-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000073329	2019-10-01 23:34:09.331984	\N	\N	1	\N	6	7112	\N	2	1	0
1714	2019-05-08	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN219128095929	SBIN219128095929	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	12270	\N	2	1	0
1716	2019-05-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000078254	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	5602	\N	2	1	0
1717	2019-05-09	IMPS-912910648323-K K STORE-HDFC-XXXXXXXXXX1250-	0000912910648323	2019-10-01 23:34:09.331984	\N	\N	1	\N	234	2897	\N	2	1	0
1720	2019-05-09	RDMCGHA0090-STP-RDM	IB09164312207245	2019-10-01 23:34:09.331984	\N	\N	1	\N	765	\N	30435	2	1	0
1721	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000486119	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	3382	\N	2	1	0
1722	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000716192	2019-10-01 23:34:09.331984	\N	\N	1	\N	186	1093	\N	2	1	0
1723	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000375388	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	1803	\N	2	1	0
1724	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001282	2019-10-01 23:34:09.331984	\N	\N	1	\N	262	3024	\N	2	1	0
1725	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126568	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	4216	\N	2	1	0
1726	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000489	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	5434	\N	2	1	0
1718	2019-05-09	ACH D- MONDELEZ INDIA FOODS-DB35930553	0000009600697187	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	63099.5899999999965	2	1	0
1727	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000076075	2019-10-01 23:34:09.331984	\N	\N	1	\N	619	54896	\N	2	1	0
1728	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000349119	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	29778	\N	2	1	0
1731	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000850	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	22854	\N	2	1	0
1733	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036987	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	14195	\N	2	1	0
1735	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000172720	2019-10-01 23:34:09.331984	\N	\N	1	\N	565	13056	\N	2	1	0
1736	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382335	2019-10-01 23:34:09.331984	\N	\N	1	\N	332	6837	\N	2	1	0
1730	2019-05-13	NEFT CR-BARB0SURGAU-GOYAL TRADERS-TUSHAR TRADING COMPANY-BARBZ19133892426	BARBZ19133892426	2019-10-01 23:34:09.331984	\N	\N	1	\N	190	35402	\N	2	1	0
1700	2019-05-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019571	2019-10-01 23:34:09.331984	\N	\N	1	\N	626	2261	\N	2	1	0
1699	2019-05-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123608	2019-10-01 23:34:09.331984	\N	\N	1	\N	589	3886	\N	2	1	0
1696	2019-05-04	EMI 58456073 CHQ S58456073111 051958456073	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	774	\N	87242	2	1	0
1712	2019-05-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039369	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	3698	\N	2	1	0
1715	2019-05-08	CHQ DEP RET- IMAGE NOT CLEAR PRESENT AGA	0000000000039369	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	\N	3698	2	1	0
1729	2019-05-13	CHQ PAID-MICR CTS-NO-DINESH SINGH	0000000000000189	2019-10-01 23:34:09.331984	\N	\N	1	\N	782	\N	80000	2	1	0
1713	2019-05-08	CHQ DEP RET CHGS 010519-MIR1912741501892	0000000000095666	2019-10-01 23:34:09.331984	\N	\N	1	\N	778	\N	118	2	1	0
1732	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000032296	2019-10-01 23:34:09.331984	\N	\N	1	\N	18	16071	\N	2	1	0
1734	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000102600	2019-10-01 23:34:09.331984	\N	\N	1	\N	418	14085	\N	2	1	0
1693	2019-05-03	CHQ PAID-INWARD TRAN-SHRIRAM ELECTRONICS	0000000000000192	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	3200	2	1	0
1694	2019-05-04	CHQ PAID-MICR CTS-NO-SHUBH MOBIEL	0000000000000190	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	5200	2	1	0
1719	2019-05-09	CHQ DEP - MICR CLG - NOIDA WBO	0000000000039369	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	3698	\N	2	1	0
1744	2019-05-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000135115	2019-10-01 23:34:09.331984	\N	\N	1	\N	454	1953	\N	2	1	0
1741	2019-05-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000201408	2019-10-01 23:34:09.331984	\N	\N	1	\N	381	13516	\N	2	1	0
1738	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033067	2019-10-01 23:34:09.331984	\N	\N	1	\N	113	1830	\N	2	1	0
1742	2019-05-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000066849	2019-10-01 23:34:09.331984	\N	\N	1	\N	348	5342	\N	2	1	0
1740	2019-05-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038373	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	24119	\N	2	1	0
1739	2019-05-14	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000102600	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	14085	2	1	0
1746	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000031093	2019-10-01 23:34:09.331984	\N	\N	1	\N	305	4144	\N	2	1	0
1750	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000069844	2019-10-01 23:34:09.331984	\N	\N	1	\N	197	67323	\N	2	1	0
1754	2019-05-17	CHQ DEP RET CHGS 140519-MIR1913760011911	0000000000102600	2019-10-01 23:34:09.331984	\N	\N	1	\N	778	\N	118	2	1	0
1748	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000165824	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	24387	\N	2	1	0
1749	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000620813	2019-10-01 23:34:09.331984	\N	\N	1	\N	627	39126	\N	2	1	0
1752	2019-05-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957604	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	12073	\N	2	1	0
1753	2019-05-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126578	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	4866	\N	2	1	0
1751	2019-05-16	NEFT DR-CITI0000002-PERFETTI VAN MELLE INDIA PVT LTD-NETBANK, MUM-N136190827489680-PERFETTI	N136190827489680	2019-10-01 23:34:09.331984	\N	\N	1	\N	766	\N	56000	2	1	0
1756	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000912008	2019-10-01 23:34:09.331984	\N	\N	1	\N	349	17503	\N	2	1	0
1755	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000055190	2019-10-01 23:34:09.331984	\N	\N	1	\N	166	1784	\N	2	1	0
1766	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000089	2019-10-01 23:34:09.331984	\N	\N	1	\N	326	4171	\N	2	1	0
1743	2019-05-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000076860	2019-10-01 23:34:09.331984	\N	\N	1	\N	785	3871	\N	2	1	0
1759	2019-05-20	FT - CR - 50200038727490 - VINOD KUMAR PRAMOD KUMAR	0000000000000003	2019-10-01 23:34:09.331984	\N	\N	1	\N	656	196210	\N	2	1	0
1761	2019-05-21	NEFT DR-KKBK0000272-BAJAJ CORP LTD-NETBANK, MUM-N141190830462463-BAJAJ	N141190830462463	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	60000	2	1	0
1763	2019-05-21	HB3142NR1000007858-STP-GODREJ	IB21125317706059	2019-10-01 23:34:09.331984	\N	\N	1	\N	763	\N	388000	2	1	0
1757	2019-05-20	IMPS-914011590593-K K STORE-HDFC-XXXXXXXXXX1250-	0000914011590593	2019-10-01 23:34:09.331984	\N	\N	1	\N	234	1471	\N	2	1	0
1768	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000838457	2019-10-01 23:34:09.331984	\N	\N	1	\N	322	5011	\N	2	1	0
1769	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000986646	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	2998	\N	2	1	0
1771	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000391024	2019-10-01 23:34:09.331984	\N	\N	1	\N	62	3079	\N	2	1	0
1772	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000073332	2019-10-01 23:34:09.331984	\N	\N	1	\N	6	5525	\N	2	1	0
1773	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000386659	2019-10-01 23:34:09.331984	\N	\N	1	\N	464	6102	\N	2	1	0
1774	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000486122	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	6120	\N	2	1	0
1775	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000037239	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	13452	\N	2	1	0
1776	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000061076	2019-10-01 23:34:09.331984	\N	\N	1	\N	401	15151	\N	2	1	0
1777	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038852	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	15364	\N	2	1	0
1770	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000080002	2019-10-01 23:34:09.331984	\N	\N	1	\N	199	19755	\N	2	1	0
1779	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071161	2019-10-01 23:34:09.331984	\N	\N	1	\N	151	8402	\N	2	1	0
1780	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000124726	2019-10-01 23:34:09.331984	\N	\N	1	\N	261	19683	\N	2	1	0
1778	2019-05-22	IMPS-914213138377-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000914213138377	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	20619	\N	2	1	0
1785	2019-05-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126589	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	2332	\N	2	1	0
1783	2019-05-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001295	2019-10-01 23:34:09.331984	\N	\N	1	\N	262	9678	\N	2	1	0
1782	2019-05-23	ACH D- MONDELEZ INDIA FOODS-DB36070677	0000009848433255	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	144595.309999999998	2	1	0
1784	2019-05-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039376	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	7965	\N	2	1	0
1789	2019-05-24	IMPS-914417424357-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000914417424357	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	12330	\N	2	1	0
1790	2019-05-24	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN419144999546	SBIN419144999546	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	11928	\N	2	1	0
1791	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033061	2019-10-01 23:34:09.331984	\N	\N	1	\N	18	38069	\N	2	1	0
1792	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957614	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	25552	\N	2	1	0
1793	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000100603	2019-10-01 23:34:09.331984	\N	\N	1	\N	557	10584	\N	2	1	0
1787	2019-05-24	BCCLTDGT69776-STP-BAJAJ	IB24114732336197	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	240000	2	1	0
1747	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000065882	2019-10-01 23:34:09.331984	\N	\N	1	\N	449	11798	\N	2	1	0
1758	2019-05-20	CHQ DEP RET CHGS 150519-MIR1913862286795	0000000000135115	2019-10-01 23:34:09.331984	\N	\N	1	\N	778	\N	118	2	1	0
1765	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000039	2019-10-01 23:34:09.331984	\N	\N	1	\N	252	4016	\N	2	1	0
1764	2019-05-21	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	150000	\N	2	1	0
1781	2019-05-23	50200013317598-TPT-TUSHAR	0000000388048281	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	15784	\N	2	1	0
1788	2019-05-24	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	205000	\N	2	1	0
1786	2019-05-24	BCCLTDGT69776-STP-BAJAJ	IB24113917229146	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	1	2	1	0
1767	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672560	2019-10-01 23:34:09.331984	\N	\N	1	\N	786	36647	\N	2	1	0
1745	2019-05-15	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000135115	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	1953	2	1	0
1760	2019-05-20	GST/BANK REFERENCE NO: R1914011730033/CIN NO: HDFC19050900345861	0190520090073658	2019-10-01 23:34:09.331984	\N	\N	1	\N	783	\N	10704	2	1	0
4247	2019-04-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002232	2019-10-29 14:58:30.573357	\N	\N	1	\N	1061	2904	\N	4	2	0
1795	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038857	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	5109	\N	2	1	0
1797	2019-05-27	NEFT CR-SBIN0003342-RAMA PROVISION STORE-TUSHAR TRADING CO-SBIN519147153746	SBIN519147153746	2019-10-01 23:34:09.331984	\N	\N	1	\N	462	70501	\N	2	1	0
1796	2019-05-27	CHQ PAID-MICR CTS-NO-INFOSAF NET	0000000000000193	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	4200	2	1	0
1798	2019-05-27	ACH D- MONDELEZ INDIA FOODS-DB36090430	0000009897731179	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	191709.970000000001	2	1	0
1801	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000093	2019-10-01 23:34:09.331984	\N	\N	1	\N	326	5000	\N	2	1	0
1802	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000011960	2019-10-01 23:34:09.331984	\N	\N	1	\N	472	8008	\N	2	1	0
1803	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000166	2019-10-01 23:34:09.331984	\N	\N	1	\N	594	37233	\N	2	1	0
1804	2019-05-28	50200007138822-TPT-TTC CA TO JP CA	0000000326324804	2019-10-01 23:34:09.331984	\N	\N	1	\N	232	\N	200000	2	1	0
1806	2019-05-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038394	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	19608	\N	2	1	0
1807	2019-05-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000871	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	11285	\N	2	1	0
1808	2019-05-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008947	2019-10-01 23:34:09.331984	\N	\N	1	\N	23	4527	\N	2	1	0
1810	2019-05-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000078274	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	27094	\N	2	1	0
1805	2019-05-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000076090	2019-10-01 23:34:09.331984	\N	\N	1	\N	619	41142	\N	2	1	0
1815	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000172727	2019-10-01 23:34:09.331984	\N	\N	1	\N	565	4664	\N	2	1	0
1812	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957623	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	25333	\N	2	1	0
1813	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000505	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	6298	\N	2	1	0
1814	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129107	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	5992	\N	2	1	0
1818	2019-05-31	BCCLTDGT69776-STP-BAJAJ	IB31121609700911	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	200000	2	1	0
1819	2019-05-31	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN119151281290	SBIN119151281290	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	3162	\N	2	1	0
1817	2019-05-31	IMPS-915110196352-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000915110196352	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	14404	\N	2	1	0
1821	2019-06-01	ACH D- MONDELEZ INDIA FOODS-DB36160738	0000009994021037	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	52468.1800000000003	2	1	0
1822	2019-06-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000486127	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	3949	\N	2	1	0
1823	2019-06-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000811	2019-10-01 23:34:09.331984	\N	\N	1	\N	475	27776	\N	2	1	0
1820	2019-06-01	CHQ DEP RET CHGS 300519-MIR1915280945544	0000000000078274	2019-10-01 23:34:09.331984	\N	\N	1	\N	778	\N	118	2	1	0
1826	2019-06-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036921	2019-10-01 23:34:09.331984	\N	\N	1	\N	727	42269	\N	2	1	0
1824	2019-06-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000066856	2019-10-01 23:34:09.331984	\N	\N	1	\N	348	654	\N	2	1	0
1828	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038867	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	14455	\N	2	1	0
1829	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000881	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	12553	\N	2	1	0
1830	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000095	2019-10-01 23:34:09.331984	\N	\N	1	\N	326	8302	\N	2	1	0
1831	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000073337	2019-10-01 23:34:09.331984	\N	\N	1	\N	6	6984	\N	2	1	0
1827	2019-06-03	IMPS-915412670043-K K STORE-HDFC-XXXXXXXXXX1250-	0000915412670043	2019-10-01 23:34:09.331984	\N	\N	1	\N	234	2897	\N	2	1	0
1832	2019-06-04	BCCLTDGT69776-STP-BAJAJ	IB04111105982138	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	160000	2	1	0
1835	2019-06-04	HB3142NR1000007858-STP-GODREJ	IB04145439776343	2019-10-01 23:34:09.331984	\N	\N	1	\N	763	\N	275000	2	1	0
1836	2019-06-04	NEFT CR-BARB0SURGAU-GOYAL TRADERS-TUSHAR TRADING COMPANY-BARBX19155313686	BARBX19155313686	2019-10-01 23:34:09.331984	\N	\N	1	\N	190	43760	\N	2	1	0
1837	2019-06-04	50200007138822-TPT-TTC CA TO JP CA	0000000114912362	2019-10-01 23:34:09.331984	\N	\N	1	\N	232	\N	150000	2	1	0
1838	2019-06-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000279	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	21854	\N	2	1	0
1839	2019-06-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036739	2019-10-01 23:34:09.331984	\N	\N	1	\N	35	5621	\N	2	1	0
1840	2019-06-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000078280	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	27094	\N	2	1	0
1841	2019-06-05	IMPS-915611489677-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-COLGATE	0000915611489677	2019-10-01 23:34:09.331984	\N	\N	1	\N	186	1429	\N	2	1	0
1844	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000201415	2019-10-01 23:34:09.331984	\N	\N	1	\N	381	2353	\N	2	1	0
1845	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000055200	2019-10-01 23:34:09.331984	\N	\N	1	\N	166	2649	\N	2	1	0
1846	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039384	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	2969	\N	2	1	0
1847	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000165840	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	4681	\N	2	1	0
1848	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826702	2019-10-01 23:34:09.331984	\N	\N	1	\N	45	5230	\N	2	1	0
1849	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000578528	2019-10-01 23:34:09.331984	\N	\N	1	\N	349	15389	\N	2	1	0
1843	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957631	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	22398	\N	2	1	0
1851	2019-06-07	BCCLTDGT69776-STP-BAJAJ	IB07142950963196	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	60000	2	1	0
1800	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672581	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	3178	\N	2	1	0
1811	2019-05-30	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000078274	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	27094	2	1	0
1809	2019-05-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000031095	2019-10-01 23:34:09.331984	\N	\N	1	\N	305	3002	\N	2	1	0
1825	2019-06-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033069	2019-10-01 23:34:09.331984	\N	\N	1	\N	113	1609	\N	2	1	0
1834	2019-06-04	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	300000	\N	2	1	0
1842	2019-06-06	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	190000	\N	2	1	0
1799	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000088208	2019-10-01 23:34:09.331984	\N	\N	1	\N	787	243023	\N	2	1	0
1861	2019-06-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000065897	2019-10-01 23:34:09.331984	\N	\N	1	\N	449	25718	\N	2	1	0
1854	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000096	2019-10-01 23:34:09.331984	\N	\N	1	\N	326	9776	\N	2	1	0
1856	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038108	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	8460	\N	2	1	0
1857	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000165845	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	8245	\N	2	1	0
1858	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038876	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	6487	\N	2	1	0
1859	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000265775	2019-10-01 23:34:09.331984	\N	\N	1	\N	454	4084	\N	2	1	0
1860	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000486128	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	2912	\N	2	1	0
1855	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000620825	2019-10-01 23:34:09.331984	\N	\N	1	\N	627	11823	\N	2	1	0
1864	2019-06-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036740	2019-10-01 23:34:09.331984	\N	\N	1	\N	35	3994	\N	2	1	0
1868	2019-06-14	50100040075595-TPT-DRAWINGS	0000000228340360	2019-10-01 23:34:09.331984	\N	\N	1	\N	772	\N	100000	2	1	0
1862	2019-06-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000078286	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	9981	\N	2	1	0
1863	2019-06-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000286	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	18727	\N	2	1	0
1867	2019-06-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000756624	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	3637	\N	2	1	0
1872	2019-06-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038119	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	4932	\N	2	1	0
1873	2019-06-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036742	2019-10-01 23:34:09.331984	\N	\N	1	\N	35	2942	\N	2	1	0
1874	2019-06-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038882	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	13316	\N	2	1	0
1870	2019-06-15	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN319165152452	SBIN319165152452	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	5895	\N	2	1	0
1876	2019-06-16	IMPS-916720886090-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000916720886090	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	7149	\N	2	1	0
1875	2019-06-16	IMPS-916720864685-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000916720864685	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	15324	\N	2	1	0
1877	2019-06-16	IMPS-916720901322-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000916720901322	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	3073	\N	2	1	0
1881	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039392	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	3195	\N	2	1	0
1882	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033070	2019-10-01 23:34:09.331984	\N	\N	1	\N	113	652	\N	2	1	0
1883	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000391047	2019-10-01 23:34:09.331984	\N	\N	1	\N	62	619	\N	2	1	0
1878	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001939	2019-10-01 23:34:09.331984	\N	\N	1	\N	139	63878	\N	2	1	0
1880	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036939	2019-10-01 23:34:09.331984	\N	\N	1	\N	727	10133	\N	2	1	0
1884	2019-06-18	ACH D- MONDELEZ INDIA FOODS-DB36330732	0000000328192538	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	457.629999999999995	2	1	0
1886	2019-06-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000486132	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	1758	\N	2	1	0
1887	2019-06-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000078290	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	8288	\N	2	1	0
1888	2019-06-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039768	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	10561	\N	2	1	0
1891	2019-06-20	NEFT DR-DEUT0784BBY-MONDELEZ INDIA FOODS PVT LTD-NETBANK, MUM-N171190855353703-MONDELEZ	N171190855353703	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	150000	2	1	0
1892	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001076	2019-10-01 23:34:09.331984	\N	\N	1	\N	262	18290	\N	2	1	0
1893	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000060013	2019-10-01 23:34:09.331984	\N	\N	1	\N	414	11271	\N	2	1	0
1894	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000386665	2019-10-01 23:34:09.331984	\N	\N	1	\N	464	5268	\N	2	1	0
1895	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129136	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	4404	\N	2	1	0
1885	2019-06-18	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000060011	2019-10-01 23:34:09.331984	2019-12-22 16:51:22.045121	\N	1	\N	414	\N	11271	2	1	0
1890	2019-06-20	IMPS-917110101248-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000917110101248	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	11358	\N	2	1	0
1897	2019-06-21	NEFT CR-CBIN0284598-MS SUNIL KIRANA STORE-TUSHAR TRADING CO-CBINH19172104739	CBINH19172104739	2019-10-01 23:34:09.331984	\N	\N	1	\N	619	90689	\N	2	1	0
1899	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123639	2019-10-01 23:34:09.331984	\N	\N	1	\N	589	6435	\N	2	1	0
1900	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000082309	2019-10-01 23:34:09.331984	\N	\N	1	\N	197	21596	\N	2	1	0
1901	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957646	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	54616	\N	2	1	0
1898	2019-06-21	BCCLTDGT69776-STP-BAJAJ	IB21114819594116	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	275000	2	1	0
1903	2019-06-24	ACH D- MONDELEZ INDIA FOODS-DB36370700	0000000407813905	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	176145.869999999995	2	1	0
1904	2019-06-24	FT - CR - 09272000000837 - ANUJ MEDICAL STORE	0000000000000259	2019-10-01 23:34:09.331984	\N	\N	1	\N	49	4038	\N	2	1	0
1906	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000073341	2019-10-01 23:34:09.331984	\N	\N	1	\N	6	2884	\N	2	1	0
1907	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071166	2019-10-01 23:34:09.331984	\N	\N	1	\N	151	3540	\N	2	1	0
1908	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038889	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	4462	\N	2	1	0
1902	2019-06-24	NEFT CR-SBIN0003342-RAMA PROVISION STORE-TUSHAR TRADING CO-SBIN119175118085	SBIN119175118085	2019-10-01 23:34:09.331984	\N	\N	1	\N	462	73225	\N	2	1	0
1865	2019-06-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000082304	2019-10-01 23:34:09.331984	\N	\N	1	\N	197	28002	\N	2	1	0
1879	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000060011	2019-10-01 23:34:09.331984	\N	\N	1	\N	414	11271	\N	2	1	0
1889	2019-06-19	50100040075595-TPT-DRAWINGS	0000000369640991	2019-10-01 23:34:09.331984	\N	\N	1	\N	772	\N	100000	2	1	0
1896	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000528	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	2437	\N	2	1	0
1869	2019-06-15	CHQ PAID-MICR CTS-NO-SHUBH MOBILE ZONE	0000000000000194	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	13000	2	1	0
1905	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000088219	2019-10-01 23:34:09.331984	\N	\N	1	\N	787	318847	\N	2	1	0
1871	2019-06-15	051030815061909575- CBDT TAX	IB15113410965061	2019-10-01 23:34:09.331984	2019-12-22 16:54:32.61119	\N	1	\N	761	\N	30000	2	1	0
1960	2019-07-05	CHQ PAID-MICR CTS-NO-LIC OF INDIA	0000000000000195	2019-10-01 23:34:09.331984	2019-12-22 16:52:35.187118	\N	1	\N	761	\N	4127	2	1	0
1913	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000047893	2019-10-01 23:34:09.331984	\N	\N	1	\N	14	28632	\N	2	1	0
1910	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482369	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	5407	\N	2	1	0
1912	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033077	2019-10-01 23:34:09.331984	\N	\N	1	\N	18	26151	\N	2	1	0
1915	2019-06-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000486134	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	2967	\N	2	1	0
1916	2019-06-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000391054	2019-10-01 23:34:09.331984	\N	\N	1	\N	62	2422	\N	2	1	0
1918	2019-06-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000049971	2019-10-01 23:34:09.331984	\N	\N	1	\N	227	7517	\N	2	1	0
1917	2019-06-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000298	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	23913	\N	2	1	0
1919	2019-06-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036743	2019-10-01 23:34:09.331984	\N	\N	1	\N	35	3220	\N	2	1	0
1921	2019-06-26	BCCLTDGT69776-STP-BAJAJ	IB26153352196653	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	120000	2	1	0
1920	2019-06-26	IMPS-917713146305-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000917713146305	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	6525	\N	2	1	0
1923	2019-06-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000065906	2019-10-01 23:34:09.331984	\N	\N	1	\N	449	19043	\N	2	1	0
1925	2019-06-27	FT - CR - 50200038727490 - VINOD KUMAR PRAMOD KUMAR	0000000000000027	2019-10-01 23:34:09.331984	\N	\N	1	\N	656	259265	\N	2	1	0
1930	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957652	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	40439	\N	2	1	0
1931	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123010	2019-10-01 23:34:09.331984	\N	\N	1	\N	418	6504	\N	2	1	0
1932	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129147	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	17110	\N	2	1	0
1933	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000055210	2019-10-01 23:34:09.331984	\N	\N	1	\N	188	2810	\N	2	1	0
1927	2019-06-28	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-HDFCR52019062884654050-COLGATE	HDFCR52019062884654050	2019-10-01 23:34:09.331984	\N	\N	1	\N	764	\N	347000	2	1	0
1926	2019-06-28	IMPS-917908955977-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TG	0000917908955977	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	5070	\N	2	1	0
1928	2019-06-28	ACH D- MONDELEZ INDIA FOODS-DB36430640	0000000518426827	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	59656.2699999999968	2	1	0
1929	2019-06-28	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN119179239414	SBIN119179239414	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	3159	\N	2	1	0
1937	2019-06-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038137	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	3243	\N	2	1	0
1938	2019-06-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000100	2019-10-01 23:34:09.331984	\N	\N	1	\N	326	5640	\N	2	1	0
1935	2019-06-29	NEFT CR-CBIN0284598-RADHEY LAL JAI PRAKASH-TUSHAR TRADING CO-CBINH19180132173	CBINH19180132173	2019-10-01 23:34:09.331984	\N	\N	1	\N	429	83140	\N	2	1	0
1936	2019-06-29	BCCLTDGT69776-STP-BAJAJ	IB29144718772580	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	50000	2	1	0
1939	2019-07-01	HB3142NR1000007858-STP-GODREJ	IB01131017777144	2019-10-01 23:34:09.331984	\N	\N	1	\N	763	\N	321000	2	1	0
1940	2019-07-01	ACH D- MONDELEZ INDIA FOODS-DB36440395	0000000559989289	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	72077.7700000000041	2	1	0
1942	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000243037	2019-10-01 23:34:09.331984	\N	\N	1	\N	99	5000	\N	2	1	0
1943	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000031100	2019-10-01 23:34:09.331984	\N	\N	1	\N	305	1717	\N	2	1	0
1944	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001039	2019-10-01 23:34:09.331984	\N	\N	1	\N	348	2640	\N	2	1	0
1941	2019-07-01	ACH D- MONDELEZ INDIA FOODS-DB36450651	0000000559989288	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	199868.190000000002	2	1	0
1945	2019-07-02	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN419183903027	SBIN419183903027	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	7956	\N	2	1	0
1947	2019-07-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000079155	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	9166	\N	2	1	0
1946	2019-07-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000301	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	9020	\N	2	1	0
1950	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001714	2019-10-01 23:34:09.331984	\N	\N	1	\N	139	8057	\N	2	1	0
1951	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033085	2019-10-01 23:34:09.331984	\N	\N	1	\N	18	22247	\N	2	1	0
1952	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000578547	2019-10-01 23:34:09.331984	\N	\N	1	\N	349	24574	\N	2	1	0
1949	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000756663	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	7831	\N	2	1	0
1958	2019-07-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000535	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	9026	\N	2	1	0
1954	2019-07-04	50200007138822-TPT-FT JP CA TO TTC CA	0000000134341748	2019-10-01 23:34:09.331984	\N	\N	1	\N	232	150000	\N	2	1	0
1957	2019-07-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001084	2019-10-01 23:34:09.331984	\N	\N	1	\N	262	4203	\N	2	1	0
1959	2019-07-04	IMPS-918520694351-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000918520694351	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	9617	\N	2	1	0
1963	2019-07-06	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN419187656611	SBIN419187656611	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	3198	\N	2	1	0
1922	2019-06-26	CHQ DEP RET CHGS 180619-MIR1917313268383	0000000000060011	2019-10-01 23:34:09.331984	\N	\N	1	\N	778	\N	118	2	1	0
1934	2019-06-29	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	400000	\N	2	1	0
1948	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000620838	2019-10-01 23:34:09.331984	\N	\N	1	\N	627	7208	\N	2	1	0
1956	2019-07-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000160912	2019-10-01 23:34:09.331984	\N	\N	1	\N	408	4104	\N	2	1	0
1953	2019-07-04	EMI 58456073 CHQ S58456073113 071958456073	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	774	\N	87242	2	1	0
1955	2019-07-04	BCCLTDGT69776-STP-BAJAJ	IB04132431260651	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	130000	2	1	0
1961	2019-07-05	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000160912	2019-10-01 23:34:09.331984	\N	\N	1	\N	408	\N	4104	2	1	0
1962	2019-07-06	BCCLTDGT69776-STP-RDM	IB06130007696545	2019-10-01 23:34:09.331984	\N	\N	1	\N	765	\N	49042	2	1	0
1964	2019-07-06	RDMCGHA0090-STP-RDM	IB06163831759903	2019-10-01 23:34:09.331984	\N	\N	1	\N	765	\N	49042	2	1	0
1965	2019-07-07	O/S INTEREST RECOVERY FOR A/C XXXXXXXXXX3444	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	776	\N	15792	2	1	0
1911	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672644	2019-10-01 23:34:09.331984	\N	\N	1	\N	786	11912	\N	2	1	0
1914	2019-06-25	50200013317598-TPT-TUSHAR	0000000129183028	2019-10-01 23:34:09.331984	2019-12-22 16:52:40.8945	\N	1	\N	761	17854	\N	2	1	0
1970	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036684	2019-10-01 23:34:09.331984	\N	\N	1	\N	476	8266	\N	2	1	0
1969	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000924	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	6121	\N	2	1	0
1972	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482385	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	12576	\N	2	1	0
1967	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382354	2019-10-01 23:34:09.331984	\N	\N	1	\N	332	1897	\N	2	1	0
1968	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000265777	2019-10-01 23:34:09.331984	\N	\N	1	\N	454	4227	\N	2	1	0
1975	2019-07-09	CHQ DEP - MICR CLG - NOIDA WBO	0000000000391066	2019-10-01 23:34:09.331984	\N	\N	1	\N	62	2500	\N	2	1	0
1976	2019-07-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001047	2019-10-01 23:34:09.331984	\N	\N	1	\N	348	5775	\N	2	1	0
1973	2019-07-09	50200029537650-TPT-JP OD TO TUSHAR CA	0000000293471208	2019-10-01 23:34:09.331984	\N	\N	1	\N	232	200000	\N	2	1	0
1974	2019-07-09	CHQ DEP - MICR CLG - NOIDA WBO	0000000000000270	2019-10-01 23:34:09.331984	\N	\N	1	\N	585	3875	\N	2	1	0
1980	2019-07-10	IMPS-919111515009-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-BORNVITA	0000919111515009	2019-10-01 23:34:09.331984	\N	\N	1	\N	186	726	\N	2	1	0
1981	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044805	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	8031	\N	2	1	0
1982	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000079160	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	4177	\N	2	1	0
1986	2019-07-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957664	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	27969	\N	2	1	0
1988	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131515	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	1457	\N	2	1	0
1989	2019-07-14	IMPS-919520845404-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000919520845404	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	3523	\N	2	1	0
1996	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071169	2019-10-01 23:34:09.331984	\N	\N	1	\N	151	7957	\N	2	1	0
1998	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000935	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	11786	\N	2	1	0
1999	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000320	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	15354	\N	2	1	0
2000	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000040162	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	16269	\N	2	1	0
1990	2019-07-15	IMPS-919611144940-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000919611144940	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	5488	\N	2	1	0
1991	2019-07-15	50200007138822-TPT-JP CA TO TTC CA	0000000552692671	2019-10-01 23:34:09.331984	\N	\N	1	\N	232	150000	\N	2	1	0
1992	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000765891	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	2952	\N	2	1	0
1993	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000154	2019-10-01 23:34:09.331984	\N	\N	1	\N	326	3884	\N	2	1	0
1994	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000065915	2019-10-01 23:34:09.331984	\N	\N	1	\N	449	5710	\N	2	1	0
1995	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482390	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	6852	\N	2	1	0
2003	2019-07-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000086902	2019-10-01 23:34:09.331984	\N	\N	1	\N	590	1582	\N	2	1	0
2004	2019-07-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000386666	2019-10-01 23:34:09.331984	\N	\N	1	\N	464	11924	\N	2	1	0
2005	2019-07-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000453499	2019-10-01 23:34:09.331984	\N	\N	1	\N	392	26744	\N	2	1	0
2006	2019-07-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000011979	2019-10-01 23:34:09.331984	\N	\N	1	\N	472	16269	\N	2	1	0
1987	2019-07-12	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000011977	2019-10-01 23:34:09.331984	\N	\N	1	\N	472	\N	16269	2	1	0
1984	2019-07-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000011977	2019-10-01 23:34:09.331984	\N	\N	1	\N	472	16269	\N	2	1	0
2002	2019-07-16	ACH D- MONDELEZ INDIA FOODS-DB36610817	0000000859419207	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	353507.070000000007	2	1	0
2010	2019-07-18	CHQ DEP - MICR CLG - NOIDA WBO	0000000000131529	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	9663	\N	2	1	0
2009	2019-07-18	ACH D- MONDELEZ INDIA FOODS-DB36630525	0000000890586569	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	345.029999999999973	2	1	0
2014	2019-07-19	NEFT CR-CBIN0284598-MS SUNIL KIRANA STORE-TUSDHAR TRADING CO-CBINH19200119086	CBINH19200119086	2019-10-01 23:34:09.331984	\N	\N	1	\N	619	58917	\N	2	1	0
2018	2019-07-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000082315	2019-10-01 23:34:09.331984	\N	\N	1	\N	197	8182	\N	2	1	0
2015	2019-07-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957669	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	23356	\N	2	1	0
2020	2019-07-20	IMPS-920111175545-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000920111175545	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	8594	\N	2	1	0
2022	2019-07-20	CHQ DEP - MICR CLG - NOIDA WBO	0000000000578558	2019-10-01 23:34:09.331984	\N	\N	1	\N	349	25467	\N	2	1	0
2023	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000086853	2019-10-01 23:34:09.331984	\N	\N	1	\N	505	3126	\N	2	1	0
2013	2019-07-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000949213	2019-10-01 23:34:09.331984	\N	\N	1	\N	788	11455	\N	2	1	0
1977	2019-07-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000308	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	25972	\N	2	1	0
1978	2019-07-10	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	286000	\N	2	1	0
1985	2019-07-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007327	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	14988	\N	2	1	0
1983	2019-07-11	CHQ DEP RET CHGS 050719-MIR1919136944297	0000000000160912	2019-10-01 23:34:09.331984	\N	\N	1	\N	778	\N	118	2	1	0
1997	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672681	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	8787	\N	2	1	0
2001	2019-07-16	CHQ DEP RET CHGS 120719-MIR1919646084932	0000000000011977	2019-10-01 23:34:09.331984	\N	\N	1	\N	778	\N	118	2	1	0
2007	2019-07-17	CHQ DEP - TRANSFER OW 2 - NOIDA WBO	0000000000000079	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	8202	\N	2	1	0
2008	2019-07-17	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000079	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	8202	2	1	0
2011	2019-07-18	CHQ DEP - MICR CLG - NOIDA WBO	0000000000074046	2019-10-01 23:34:09.331984	\N	\N	1	\N	552	9648	\N	2	1	0
2019	2019-07-20	50200013317598-TPT-TUSHAR	0000000103671900	2019-10-01 23:34:09.331984	2019-12-22 16:52:04.068098	\N	1	\N	761	27837	\N	2	1	0
2017	2019-07-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000208	2019-10-01 23:34:09.331984	\N	\N	1	\N	309	10774	\N	2	1	0
2016	2019-07-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033089	2019-10-01 23:34:09.331984	\N	\N	1	\N	18	20710	\N	2	1	0
1971	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000076865	2019-10-01 23:34:09.331984	\N	\N	1	\N	785	8379	\N	2	1	0
2021	2019-07-20	HB3142NR1000007858-STP-	IB20144817965773	2019-10-01 23:34:09.331984	2019-12-22 16:52:10.70872	\N	1	\N	761	\N	201000	2	1	0
2026	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000556	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	17593	\N	2	1	0
2027	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000391089	2019-10-01 23:34:09.331984	\N	\N	1	\N	62	1499	\N	2	1	0
2031	2019-07-23	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN219204851491	SBIN219204851491	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	2007	\N	2	1	0
2033	2019-07-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019584	2019-10-01 23:34:09.331984	\N	\N	1	\N	626	1200	\N	2	1	0
2034	2019-07-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000331	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	18265	\N	2	1	0
2072	2019-08-03	BCCLTDGT69776-STP-BAJAJ	IB03115909615089	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	167000	2	1	0
2073	2019-08-03	ACH D- MONDELEZ INDIA FOODS-DB36790381	0000001184156967	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	21382.6599999999999	2	1	0
2075	2019-08-05	FT - CR - 50100239891016 - RINKU NAGAR	0000000000000009	2019-10-01 23:34:09.331984	\N	\N	1	\N	480	5794	\N	2	1	0
2070	2019-08-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131548	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	3070	\N	2	1	0
2071	2019-08-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001309	2019-10-01 23:34:09.331984	\N	\N	1	\N	262	3012	\N	2	1	0
2078	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000076869	2019-10-01 23:34:09.331984	\N	\N	1	\N	114	3142	\N	2	1	0
2077	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039813	2019-10-01 23:34:09.331984	\N	\N	1	\N	23	4059	\N	2	1	0
2076	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000797	2019-10-01 23:34:09.331984	\N	\N	1	\N	591	50988	\N	2	1	0
2081	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000086923	2019-10-01 23:34:09.331984	\N	\N	1	\N	590	1241	\N	2	1	0
2080	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000161	2019-10-01 23:34:09.331984	\N	\N	1	\N	326	3000	\N	2	1	0
2079	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000765949	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	3116	\N	2	1	0
2030	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122015	2019-10-01 23:34:09.331984	\N	\N	1	\N	791	19945	\N	2	1	0
2037	2019-07-24	50200029537650-TPT-JP OD TO TTC CA	0000000349620032	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	100000	\N	2	1	0
2035	2019-07-24	CHQ PAID-MICR CTS-NO-MANOJ KUMAR	0000000000000197	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	10000	2	1	0
2032	2019-07-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039565	2019-10-01 23:34:09.331984	\N	\N	1	\N	727	13818	\N	2	1	0
2039	2019-07-25	FT - CR - 50200033974471 - J S SHOPPING MALL	0000000000000079	2019-10-01 23:34:09.331984	\N	\N	1	\N	792	8202	\N	2	1	0
2036	2019-07-24	ACH D- MONDELEZ INDIA FOODS-DB36690443	0000001002017018	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	217938.010000000009	2	1	0
2038	2019-07-25	NEFT DR-CNRB0002159-GOEL CYCLE STORE-NETBANK, MUM-N206190883892693-CYCLE	N206190883892693	2019-10-01 23:34:09.331984	\N	\N	1	\N	793	\N	3000	2	1	0
2049	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071170	2019-10-01 23:34:09.331984	\N	\N	1	\N	151	8407	\N	2	1	0
2048	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044813	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	8649	\N	2	1	0
2047	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131540	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	9197	\N	2	1	0
2046	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001303	2019-10-01 23:34:09.331984	\N	\N	1	\N	262	11393	\N	2	1	0
2040	2019-07-26	IMPS-920710199162-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000920710199162	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	13013	\N	2	1	0
2042	2019-07-26	NEFT CR-SBIN0003342-RAMA PROVISION STORE-TUSHAR TRADING CO-SBIN419207873183	SBIN419207873183	2019-10-01 23:34:09.331984	\N	\N	1	\N	462	50000	\N	2	1	0
2045	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957678	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	52912	\N	2	1	0
2043	2019-07-26	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	300000	\N	2	1	0
2041	2019-07-26	CHQ DEP RET CHGS 170719-MIR1920271479276	0000000000000079	2019-10-01 23:34:09.331984	\N	\N	1	\N	778	\N	118	2	1	0
2062	2019-07-30	CHQ DEP RET- ALTERATIONS ON INSTRUMENT O	0000000000033071	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	3054	2	1	0
2051	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000095667	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	4000	\N	2	1	0
2060	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033071	2019-10-01 23:34:09.331984	\N	\N	1	\N	113	3054	\N	2	1	0
2052	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000080402	2019-10-01 23:34:09.331984	\N	\N	1	\N	6	6443	\N	2	1	0
2053	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000486147	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	10797	\N	2	1	0
2054	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382359	2019-10-01 23:34:09.331984	\N	\N	1	\N	332	11269	\N	2	1	0
2055	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000041806	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	11570	\N	2	1	0
2056	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000061084	2019-10-01 23:34:09.331984	\N	\N	1	\N	401	14780	\N	2	1	0
2057	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000620848	2019-10-01 23:34:09.331984	\N	\N	1	\N	627	17041	\N	2	1	0
2058	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000894	2019-10-01 23:34:09.331984	\N	\N	1	\N	475	26338	\N	2	1	0
2050	2019-07-29	ACH D- MONDELEZ INDIA FOODS-DB36720746	0000001078668540	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	21382.6599999999999	2	1	0
2063	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000082320	2019-10-01 23:34:09.331984	\N	\N	1	\N	197	11870	\N	2	1	0
2064	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000040475	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	23436	\N	2	1	0
2061	2019-07-30	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000095667	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	4000	2	1	0
2068	2019-07-31	CHQ DEP - MICR CLG - NOIDA WBO	0000000000079175	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	3749	\N	2	1	0
2067	2019-07-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033105	2019-10-01 23:34:09.331984	\N	\N	1	\N	18	41987	\N	2	1	0
2065	2019-07-31	BCCLTDGT69776-STP-BAJAJ	IB31143915260918	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	100000	2	1	0
2028	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672702	2019-10-01 23:34:09.331984	\N	\N	1	\N	786	8467	\N	2	1	0
2059	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000264	2019-10-01 23:34:09.331984	\N	\N	1	\N	108	1214	\N	2	1	0
2069	2019-08-01	ACH D- MONDELEZ INDIA FOODS-DB36770559	0000001138686598	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	127155.460000000006	2	1	0
2074	2019-08-04	EMI 58456073 CHQ S58456073114 081958456073	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	775	\N	87242	2	1	0
2066	2019-07-31	FT - CR - 50100040075595 - MUKESH KUMAR GARG	0000000000000028	2019-10-01 23:34:09.331984	2019-12-22 16:51:47.762524	\N	1	\N	339	80000	\N	2	1	0
2044	2019-07-26	FT - DR - 50200029853444 - TUSHAR TRADING COMPANY	0000000000000198	2019-10-01 23:34:09.331984	2019-12-22 16:51:59.244507	\N	1	\N	761	\N	300000	2	1	0
2090	2019-08-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000011	2019-10-01 23:34:09.331984	\N	\N	1	\N	76	5000	\N	2	1	0
2083	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000040484	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	29643	\N	2	1	0
2084	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127295	2019-10-01 23:34:09.331984	\N	\N	1	\N	261	26809	\N	2	1	0
2085	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000040180	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	10751	\N	2	1	0
2086	2019-08-05	CHQ DEP - MICR CLG - NOIDA WBO	0000000000129016	2019-10-01 23:34:09.331984	\N	\N	1	\N	589	5221	\N	2	1	0
2088	2019-08-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482412	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	18731	\N	2	1	0
2091	2019-08-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000201	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	9324	\N	2	1	0
2094	2019-08-07	ACH D- MONDELEZ INDIA FOODS-DB36830708	0000001274168906	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	150166.380000000005	2	1	0
2095	2019-08-08	IMPS-922013684571-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000922013684571	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	19463	\N	2	1	0
2097	2019-08-09	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-N221190899163356-COLGATE	N221190899163356	2019-10-01 23:34:09.331984	\N	\N	1	\N	764	\N	125000	2	1	0
2096	2019-08-09	ACH D- MONDELEZ INDIA FOODS-DB36850709	0000001343038706	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	38130.6200000000026	2	1	0
2098	2019-08-10	IMPS-922211169029-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000922211169029	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	17877	\N	2	1	0
2103	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000041813	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	24735	\N	2	1	0
2104	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000065930	2019-10-01 23:34:09.331984	\N	\N	1	\N	449	19398	\N	2	1	0
2105	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000040495	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	16106	\N	2	1	0
2107	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000162	2019-10-01 23:34:09.331984	\N	\N	1	\N	326	4000	\N	2	1	0
2108	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382363	2019-10-01 23:34:09.331984	\N	\N	1	\N	332	3776	\N	2	1	0
2109	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033073	2019-10-01 23:34:09.331984	\N	\N	1	\N	112	3054	\N	2	1	0
2110	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826727	2019-10-01 23:34:09.331984	\N	\N	1	\N	45	2244	\N	2	1	0
2111	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000043943	2019-10-01 23:34:09.331984	\N	\N	1	\N	122	1923	\N	2	1	0
2100	2019-08-13	FT - CR - 50200038727490 - VINOD KUMAR PRAMOD KUMAR	0000000000000012	2019-10-01 23:34:09.331984	\N	\N	1	\N	656	138392	\N	2	1	0
2102	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000674	2019-10-01 23:34:09.331984	\N	\N	1	\N	14	27083	\N	2	1	0
2113	2019-08-14	IMPS-922610500200-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-ALMOND	0000922610500200	2019-10-01 23:34:09.331984	\N	\N	1	\N	186	973	\N	2	1	0
2114	2019-08-14	FT - CR - 09272000000837 - ANUJ MEDICAL STORE	0000000000000266	2019-10-01 23:34:09.331984	\N	\N	1	\N	49	2782	\N	2	1	0
2115	2019-08-14	ACH D- MONDELEZ INDIA FOODS-DB36890685	0000001424811461	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	185505.760000000009	2	1	0
2117	2019-08-14	CHQ DEP - MICR CLG - NOIDA WBO	0000000000482420	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	11661	\N	2	1	0
2118	2019-08-14	CHQ DEP - MICR CLG - NOIDA WBO	0000000000000013	2019-10-01 23:34:09.331984	\N	\N	1	\N	76	5000	\N	2	1	0
2119	2019-08-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482261	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	5317	\N	2	1	0
2120	2019-08-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000386672	2019-10-01 23:34:09.331984	\N	\N	1	\N	464	9956	\N	2	1	0
2121	2019-08-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000453504	2019-10-01 23:34:09.331984	\N	\N	1	\N	392	41053	\N	2	1	0
2122	2019-08-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000763597	2019-10-01 23:34:09.331984	\N	\N	1	\N	35	72713	\N	2	1	0
2116	2019-08-14	CHQ DEP - MICR CLG - NOIDA WBO	0000000000086309	2019-10-01 23:34:09.331984	\N	\N	1	\N	236	75449	\N	2	1	0
2129	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044823	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	7406	\N	2	1	0
2126	2019-08-16	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN219228192460	SBIN219228192460	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	19786	\N	2	1	0
2124	2019-08-16	IMPS-922809143119-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000922809143119	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	3164	\N	2	1	0
2125	2019-08-16	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN219228186029	SBIN219228186029	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	11467	\N	2	1	0
2131	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000578	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	23704	\N	2	1	0
2127	2019-08-16	IMPS-922817197698-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000922817197698	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	6318	\N	2	1	0
2128	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001321	2019-10-01 23:34:09.331984	\N	\N	1	\N	262	1947	\N	2	1	0
2130	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134270	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	8979	\N	2	1	0
2132	2019-08-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039596	2019-10-01 23:34:09.331984	\N	\N	1	\N	727	21616	\N	2	1	0
2133	2019-08-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000082329	2019-10-01 23:34:09.331984	\N	\N	1	\N	197	10178	\N	2	1	0
2134	2019-08-18	IMPS-923017418068-K K STORE-HDFC-XXXXXXXXXX1250-	0000923017418068	2019-10-01 23:34:09.331984	\N	\N	1	\N	234	2599	\N	2	1	0
2136	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019589	2019-10-01 23:34:09.331984	\N	\N	1	\N	626	1358	\N	2	1	0
2137	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000201436	2019-10-01 23:34:09.331984	\N	\N	1	\N	381	2383	\N	2	1	0
2138	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000798623	2019-10-01 23:34:09.331984	\N	\N	1	\N	62	3058	\N	2	1	0
4252	2019-04-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397031	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	29187	\N	4	2	0
2089	2019-08-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672734	2019-10-01 23:34:09.331984	\N	\N	1	\N	786	9885	\N	2	1	0
2087	2019-08-06	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	100000	\N	2	1	0
2093	2019-08-07	CHQ DEP RET CHGS 300719-MIR1921484099499	0000000000095667	2019-10-01 23:34:09.331984	\N	\N	1	\N	778	\N	118	2	1	0
2092	2019-08-07	O/S INTEREST RECOVERY FOR A/C XXXXXXXXXX3444	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	776	\N	20694	2	1	0
2106	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036697	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	14500	\N	2	1	0
2101	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000795175	2019-10-01 23:34:09.331984	\N	\N	1	\N	794	31129	\N	2	1	0
2099	2019-08-13	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	120000	\N	2	1	0
2123	2019-08-14	50100040075595-TPT-DRAWINGS	0000000186563586	2019-10-01 23:34:09.331984	\N	\N	1	\N	772	\N	50000	2	1	0
2141	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000040196	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	19227	\N	2	1	0
2142	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000080407	2019-10-01 23:34:09.331984	\N	\N	1	\N	6	17120	\N	2	1	0
2143	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000040509	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	6221	\N	2	1	0
2148	2019-08-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000218	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	18010	\N	2	1	0
2139	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000018	2019-10-01 23:34:09.331984	\N	\N	1	\N	76	3626	\N	2	1	0
2147	2019-08-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000949216	2019-10-01 23:34:09.331984	\N	\N	1	\N	788	28351	\N	2	1	0
2146	2019-08-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000500305	2019-10-01 23:34:09.331984	\N	\N	1	\N	791	31562	\N	2	1	0
2144	2019-08-20	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	205000	\N	2	1	0
2145	2019-08-20	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000018	2019-10-01 23:34:09.331984	\N	\N	1	\N	76	\N	3626	2	1	0
2157	2019-08-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482264	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	3152	\N	2	1	0
2149	2019-08-21	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-N233190906645069-COLGATE	N233190906645069	2019-10-01 23:34:09.331984	\N	\N	1	\N	764	\N	88000	2	1	0
2150	2019-08-21	BCCLTDGT69776-STP-BAJAJ	IB21121438236354	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	100000	2	1	0
2151	2019-08-21	ACH D- MONDELEZ INDIA FOODS-DB36970696	0000001556951381	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	257275.109999999986	2	1	0
2152	2019-08-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044826	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	3262	\N	2	1	0
2154	2019-08-22	IMPS-923412164332-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000923412164332	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	6573	\N	2	1	0
2156	2019-08-22	FT - CR - 50100239891016 - RINKU NAGAR	0000000000000013	2019-10-01 23:34:09.331984	\N	\N	1	\N	477	19353	\N	2	1	0
2155	2019-08-22	CHQ DEP RET CHGS 200819-MIR1923420730592	0000000000000018	2019-10-01 23:34:09.331984	\N	\N	1	\N	778	\N	118	2	1	0
2162	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000502	2019-10-01 23:34:09.331984	\N	\N	1	\N	795	2877	\N	2	1	0
2163	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000589	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	3450	\N	2	1	0
2164	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000820519	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	12906	\N	2	1	0
2165	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000011990	2019-10-01 23:34:09.331984	\N	\N	1	\N	472	13829	\N	2	1	0
2166	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000222	2019-10-01 23:34:09.331984	\N	\N	1	\N	309	16000	\N	2	1	0
2158	2019-08-26	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	550000	\N	2	1	0
2161	2019-08-26	BCCLTDGT69776-STP-BAJAJ	IB26122744698181	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	100000	2	1	0
2159	2019-08-26	NEFT DR-CITI0000002-PERFETTI VAN MELLE INDIA PVT LTD-NETBANK, MUM-N238190909327091-PERFETTI	N238190909327091	2019-10-01 23:34:09.331984	\N	\N	1	\N	766	\N	160000	2	1	0
2160	2019-08-26	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-N238190909390847-COLGATE	N238190909390847	2019-10-01 23:34:09.331984	\N	\N	1	\N	764	\N	370000	2	1	0
2167	2019-08-27	FT - CR - 09272000000837 - ANUJ MEDICAL STORE	0000000000000268	2019-10-01 23:34:09.331984	\N	\N	1	\N	49	2803	\N	2	1	0
2174	2019-08-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000558100	2019-10-01 23:34:09.331984	\N	\N	1	\N	79	5694	\N	2	1	0
2173	2019-08-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000040523	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	8772	\N	2	1	0
2172	2019-08-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482432	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	13976	\N	2	1	0
2171	2019-08-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000229	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	21847	\N	2	1	0
2168	2019-08-27	FT - CR - 50200029853444 - TUSHAR TRADING COMPANY	0000000000000066	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	300000	\N	2	1	0
2175	2019-08-28	CHQ DEP - MICR CLG - NOIDA WBO	0000000000000502	2019-10-01 23:34:09.331984	\N	\N	1	\N	795	2877	\N	2	1	0
2170	2019-08-27	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000222	2019-10-01 23:34:09.331984	\N	\N	1	\N	309	\N	16000	2	1	0
2169	2019-08-27	CHQ DEP RET- IMAGE NOT CLEAR PRESENT AGA	0000000000000502	2019-10-01 23:34:09.331984	\N	\N	1	\N	795	\N	2877	2	1	0
2178	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000079185	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	3980	\N	2	1	0
2179	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133564	2019-10-01 23:34:09.331984	\N	\N	1	\N	261	9119	\N	2	1	0
2177	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000060021	2019-10-01 23:34:09.331984	\N	\N	1	\N	414	14351	\N	2	1	0
2176	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042706	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	20638	\N	2	1	0
2180	2019-08-28	50100061740350-TPT-TUSHAR TO TTC	0000000521621905	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	150000	\N	2	1	0
2184	2019-08-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000726720	2019-10-01 23:34:09.331984	\N	\N	1	\N	300	2300	\N	2	1	0
2182	2019-08-29	CHQ DEP RET CHGS 270819-MIR1924133136712	0000000000000222	2019-10-01 23:34:09.331984	\N	\N	1	\N	778	\N	118	2	1	0
2181	2019-08-29	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-HDFCR52019082993207798-COLGATE	HDFCR52019082993207798	2019-10-01 23:34:09.331984	\N	\N	1	\N	764	\N	236000	2	1	0
2183	2019-08-29	ACH D- MONDELEZ INDIA FOODS-DB37050533	0000001700361651	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	349856.950000000012	2	1	0
2189	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134289	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	10697	\N	2	1	0
2185	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001335	2019-10-01 23:34:09.331984	\N	\N	1	\N	262	13337	\N	2	1	0
2186	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000061087	2019-10-01 23:34:09.331984	\N	\N	1	\N	401	16379	\N	2	1	0
2187	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672781	2019-10-01 23:34:09.331984	\N	\N	1	\N	786	20282	\N	2	1	0
2188	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000349669	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	44895	\N	2	1	0
2192	2019-08-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033075	2019-10-01 23:34:09.331984	\N	\N	1	\N	113	1773	\N	2	1	0
2193	2019-08-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482271	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	2464	\N	2	1	0
2191	2019-08-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000047257	2019-10-01 23:34:09.331984	\N	\N	1	\N	122	4000	\N	2	1	0
2194	2019-08-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000578578	2019-10-01 23:34:09.331984	\N	\N	1	\N	349	20000	\N	2	1	0
2195	2019-08-31	IMPS-924321942137-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TUSHAR	0000924321942137	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	29154	\N	2	1	0
2190	2019-08-31	BCCLTDGT69776-STP-BAJAJ	IB31153302673738	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	50000	2	1	0
2202	2019-09-04	ACH D- MONDELEZ INDIA FOODS-DB37110739	0000001836991266	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	153888.320000000007	2	1	0
2197	2019-09-02	ACH D- MONDELEZ INDIA FOODS-DB37080460	0000001782713292	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	151657.459999999992	2	1	0
2198	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000080411	2019-10-01 23:34:09.331984	\N	\N	1	\N	6	7082	\N	2	1	0
2196	2019-09-02	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	90000	\N	2	1	0
2215	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000273	2019-10-01 23:34:09.331984	\N	\N	1	\N	108	1246	\N	2	1	0
2204	2019-09-04	CHQ DEP - MICR CLG - NOIDA WBO	0000000000043941	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	1979	\N	2	1	0
2216	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000820539	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	2319	\N	2	1	0
2205	2019-09-04	CHQ DEP - MICR CLG - NOIDA WBO	0000000000849716	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	2332	\N	2	1	0
2206	2019-09-04	CHQ DEP - MICR CLG - NOIDA WBO	0000000000134261	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	2508	\N	2	1	0
2217	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044835	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	3280	\N	2	1	0
2207	2019-09-04	CHQ DEP - MICR CLG - NOIDA WBO	0000000000001314	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	3358	\N	2	1	0
2211	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482439	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	4941	\N	2	1	0
2203	2019-09-04	CHQ DEP - MICR CLG - NOIDA WBO	0000000000672763	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	5183	\N	2	1	0
2212	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000041414	2019-10-01 23:34:09.331984	\N	\N	1	\N	727	11391	\N	2	1	0
2210	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000976	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	11540	\N	2	1	0
2208	2019-09-04	CHQ DEP - MICR CLG - NOIDA WBO	0000000000025995	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	20080	\N	2	1	0
2214	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000236	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	22054	\N	2	1	0
2213	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000971	2019-10-01 23:34:09.331984	\N	\N	1	\N	475	26832	\N	2	1	0
2209	2019-09-04	CHQ DEP - MICR CLG - NOIDA WBO	0000000000578565	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	67226	\N	2	1	0
2200	2019-09-04	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	206000	\N	2	1	0
2201	2019-09-04	EMI 58456073 CHQ S58456073115 091958456073	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	775	\N	87242	2	1	0
2219	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000047262	2019-10-01 23:34:09.331984	\N	\N	1	\N	122	3000	\N	2	1	0
2220	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129038	2019-10-01 23:34:09.331984	\N	\N	1	\N	589	3480	\N	2	1	0
2222	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000108	2019-10-01 23:34:09.331984	\N	\N	1	\N	110	3615	\N	2	1	0
2223	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134295	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	6680	\N	2	1	0
2224	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000593	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	6846	\N	2	1	0
2225	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000074553	2019-10-01 23:34:09.331984	\N	\N	1	\N	392	19586	\N	2	1	0
2226	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000490244	2019-10-01 23:34:09.331984	\N	\N	1	\N	630	20462	\N	2	1	0
2228	2019-09-06	FT - CR - 50100306177469 - IMRAN SAIFI	0000000000000002	2019-10-01 23:34:09.331984	\N	\N	1	\N	500	4200	\N	2	1	0
2234	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000201439	2019-10-01 23:34:09.331984	\N	\N	1	\N	381	4072	\N	2	1	0
2221	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001345	2019-10-01 23:34:09.331984	\N	\N	1	\N	262	3592	\N	2	1	0
2233	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101016	2019-10-01 23:34:09.331984	\N	\N	1	\N	557	5292	\N	2	1	0
2232	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785629	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	32827	\N	2	1	0
2231	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000620863	2019-10-01 23:34:09.331984	\N	\N	1	\N	627	35438	\N	2	1	0
2230	2019-09-06	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000074553	2019-10-01 23:34:09.331984	\N	\N	1	\N	392	\N	19586	2	1	0
2229	2019-09-06	BCCLTDGT69776-STP-BAJAJ	IB06111643365957	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	44546	2	1	0
2236	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482274	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	1770	\N	2	1	0
2237	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001089	2019-10-01 23:34:09.331984	\N	\N	1	\N	348	3531	\N	2	1	0
2238	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000949217	2019-10-01 23:34:09.331984	\N	\N	1	\N	788	8449	\N	2	1	0
2235	2019-09-07	O/S INTEREST RECOVERY FOR A/C XXXXXXXXXX3444	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	776	\N	1565	2	1	0
2242	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000047265	2019-10-01 23:34:09.331984	\N	\N	1	\N	122	3000	\N	2	1	0
2243	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000024	2019-10-01 23:34:09.331984	\N	\N	1	\N	83	5000	\N	2	1	0
2240	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000080414	2019-10-01 23:34:09.331984	\N	\N	1	\N	6	8357	\N	2	1	0
2241	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042718	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	9318	\N	2	1	0
2239	2019-09-09	RTGS DR-DEUT0784BBY-MONDELEZ INDIA FOODS PVT LTD-NETBANK, MUM-HDFCR52019090994675328-MONDELEZ	HDFCR52019090994675328	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	200000	2	1	0
2246	2019-09-11	IMPS-925410416542-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-BORNVITA	0000925410416542	2019-10-01 23:34:09.331984	\N	\N	1	\N	186	940	\N	2	1	0
2250	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482446	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	6466	\N	2	1	0
2251	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000041834	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	6471	\N	2	1	0
2252	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000985	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	8977	\N	2	1	0
2253	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000079191	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	11725	\N	2	1	0
2248	2019-09-11	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN119254664068	SBIN119254664068	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	17448	\N	2	1	0
2249	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000065947	2019-10-01 23:34:09.331984	\N	\N	1	\N	449	20973	\N	2	1	0
2245	2019-09-11	50200007138822-TPT-JP CA TO TTC CA	0000000274805290	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	50000	\N	2	1	0
2247	2019-09-11	CHQ DEP RET CHGS 060919-MIR1925354610547	0000000000074553	2019-10-01 23:34:09.331984	\N	\N	1	\N	778	\N	118	2	1	0
2311	2019-09-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000079201	2019-10-01 23:34:09.331984	\N	\N	1	\N	269	10169	\N	2	1	0
2244	2019-09-11	50200029537650-TPT-JP OD TO TTC CA	0000000274796633	2019-10-01 23:34:09.331984	\N	\N	1	\N	232	100000	\N	2	1	0
2258	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137853	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	1696	\N	2	1	0
2269	2019-09-16	ACH D- MONDELEZ INDIA FOODS-DB37210668	0000002064565144	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	105630.389999999999	2	1	0
2259	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000602	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	3248	\N	2	1	0
2261	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044840	2019-10-01 23:34:09.331984	\N	\N	1	\N	370	3883	\N	2	1	0
2260	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008109	2019-10-01 23:34:09.331984	\N	\N	1	\N	798	10052	\N	2	1	0
2254	2019-09-12	NEFT CR-CBIN0284598-RADHEY LAL JAI PRAKASH-TUSHAR TRADING CO-CBINH19255118671	CBINH19255118671	2019-10-01 23:34:09.331984	\N	\N	1	\N	429	74710	\N	2	1	0
2255	2019-09-12	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	139500	\N	2	1	0
2256	2019-09-12	ACH D- MONDELEZ INDIA FOODS-DB37180376	0000002019388000	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	267821.270000000019	2	1	0
2264	2019-09-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000798646	2019-10-01 23:34:09.331984	\N	\N	1	\N	62	1415	\N	2	1	0
2306	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000798661	2019-10-01 23:34:09.331984	\N	\N	1	\N	62	2660	\N	2	1	0
2263	2019-09-13	ACH D- MONDELEZ INDIA FOODS-DB37200383	0000002035062900	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	86801.8600000000006	2	1	0
2272	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000010057	2019-10-01 23:34:09.331984	\N	\N	1	\N	23	1517	\N	2	1	0
2267	2019-09-15	051030815091926680- CBDT TAX	IB15230438212520	2019-10-01 23:34:09.331984	\N	\N	1	\N	761	\N	50000	2	1	0
2262	2019-09-13	NEFT DR-CITI0000002-PERFETTI VAN MELLE INDIA PVT LTD-NETBANK, MUM-N256190927555143-PERFETTI	N256190927555143	2019-10-01 23:34:09.331984	\N	\N	1	\N	766	\N	100000	2	1	0
2266	2019-09-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785638	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	25748	\N	2	1	0
2273	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826743	2019-10-01 23:34:09.331984	\N	\N	1	\N	45	1524	\N	2	1	0
2274	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000047270	2019-10-01 23:34:09.331984	\N	\N	1	\N	122	2398	\N	2	1	0
2275	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482276	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	2468	\N	2	1	0
2271	2019-09-16	IMPS-925918668068-K K STORE-HDFC-XXXXXXXXXX1250-	0000925918668068	2019-10-01 23:34:09.331984	\N	\N	1	\N	234	4418	\N	2	1	0
2276	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000049	2019-10-01 23:34:09.331984	\N	\N	1	\N	252	5292	\N	2	1	0
2277	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000076872	2019-10-01 23:34:09.331984	\N	\N	1	\N	785	5423	\N	2	1	0
2278	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000048802	2019-10-01 23:34:09.331984	\N	\N	1	\N	35	7410	\N	2	1	0
2279	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001000	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	11624	\N	2	1	0
2280	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000010192	2019-10-01 23:34:09.331984	\N	\N	1	\N	408	11797	\N	2	1	0
2281	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000061090	2019-10-01 23:34:09.331984	\N	\N	1	\N	401	18028	\N	2	1	0
2282	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033127	2019-10-01 23:34:09.331984	\N	\N	1	\N	18	33249	\N	2	1	0
2283	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001663	2019-10-01 23:34:09.331984	\N	\N	1	\N	139	74543	\N	2	1	0
2270	2019-09-16	CASH DEP DADRI	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	773	200000	\N	2	1	0
2285	2019-09-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000201444	2019-10-01 23:34:09.331984	\N	\N	1	\N	381	4656	\N	2	1	0
2284	2019-09-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000250	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	32168	\N	2	1	0
2289	2019-09-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000026	2019-10-01 23:34:09.331984	\N	\N	1	\N	76	5053	\N	2	1	0
2287	2019-09-18	NEFT CR-KKBK0000958-OM CONFECTIONERY-TUSHARTRADINGCO-KKBKH19261819968	KKBKH19261819968	2019-10-01 23:34:09.331984	\N	\N	1	\N	373	8000	\N	2	1	0
2288	2019-09-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000820578	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	9258	\N	2	1	0
2290	2019-09-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133580	2019-10-01 23:34:09.331984	\N	\N	1	\N	261	15199	\N	2	1	0
2292	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000112	2019-10-01 23:34:09.331984	\N	\N	1	\N	110	4054	\N	2	1	0
2291	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000386676	2019-10-01 23:34:09.331984	\N	\N	1	\N	464	16560	\N	2	1	0
2293	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785648	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	48487	\N	2	1	0
2294	2019-09-19	GST/BANK REFERENCE NO: R1926214135576/CIN NO: HDFC19090900294232	0190919090039283	2019-10-01 23:34:09.331984	\N	\N	1	\N	783	\N	3708	2	1	0
2296	2019-09-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000798656	2019-10-01 23:34:09.331984	\N	\N	1	\N	62	2237	\N	2	1	0
2297	2019-09-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000047271	2019-10-01 23:34:09.331984	\N	\N	1	\N	122	2697	\N	2	1	0
2295	2019-09-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000544448	2019-10-01 23:34:09.331984	\N	\N	1	\N	593	3578	\N	2	1	0
2300	2019-09-21	CHQ DEP - MICR CLG - NOIDA WBO	0000000000482279	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	932	\N	2	1	0
2299	2019-09-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672815	2019-10-01 23:34:09.331984	\N	\N	1	\N	786	4950	\N	2	1	0
2298	2019-09-21	IMPS-926416625099-K K STORE-HDFC-XXXXXXXXXX1250-	0000926416625099	2019-10-01 23:34:09.331984	\N	\N	1	\N	234	12950	\N	2	1	0
2301	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019595	2019-10-01 23:34:09.331984	\N	\N	1	\N	626	931	\N	2	1	0
2302	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000076873	2019-10-01 23:34:09.331984	\N	\N	1	\N	785	1587	\N	2	1	0
2307	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001094	2019-10-01 23:34:09.331984	\N	\N	1	\N	348	2082	\N	2	1	0
2265	2019-09-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007935	2019-10-01 23:34:09.331984	\N	\N	1	\N	799	10666	\N	2	1	0
2305	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482281	2019-10-01 23:34:09.331984	\N	\N	1	\N	646	3473	\N	2	1	0
2304	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000169	2019-10-01 23:34:09.331984	\N	\N	1	\N	326	3550	\N	2	1	0
2303	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000820598	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	4059	\N	2	1	0
2308	2019-09-24	NEFT CR-KKBK0000958-OM CONFECTIONERY-TUSHARTRADINGCO-KKBKH19267843637	KKBKH19267843637	2019-10-01 23:34:09.331984	\N	\N	1	\N	373	5740	\N	2	1	0
2310	2019-09-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000041847	2019-10-01 23:34:09.331984	\N	\N	1	\N	569	32809	\N	2	1	0
2309	2019-09-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000082346	2019-10-01 23:34:09.331984	\N	\N	1	\N	197	39578	\N	2	1	0
2286	2019-09-18	50200007138822-TPT-TTC CA TO JP CA	0000000251810802	2019-10-01 23:34:09.331984	\N	\N	1	\N	232	\N	150000	2	1	0
2331	2019-09-30	NEFT CR-ICIC0001917-SUNIL KIRANA STORE-TUSHAR TRADING CO-000074279297	0000000074279297	2019-10-01 23:34:09.331984	\N	\N	1	\N	617	31711	\N	2	1	0
2313	2019-09-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000060025	2019-10-01 23:34:09.331984	\N	\N	1	\N	796	5746	\N	2	1	0
2336	2019-09-30	FT - CR - 50200038727490 - VINOD KUMAR PRAMOD KUMAR	0000000000000019	2019-10-01 23:34:09.331984	\N	\N	1	\N	656	290646	\N	2	1	0
2334	2019-09-30	ACH D- MONDELEZ INDIA FOODS-DB37350840	0000002334481653	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	370269.239999999991	2	1	0
1762	2019-05-21	NEFT DR-CITI0000002-PERFETTI VAN MELLE INDIA PVT LTD-NETBANK, MUM-N141190830588244-PERFETTI	N141190830588244	2019-10-01 23:34:09.331984	\N	\N	1	\N	766	\N	90000	2	1	0
2332	2019-09-30	FT - CR - 09272000000837 - ANUJ MEDICAL STORE	0000000000000272	2019-10-01 23:34:09.331984	\N	\N	1	\N	49	2575	\N	2	1	0
2323	2019-09-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137870	2019-10-01 23:34:09.331984	\N	\N	1	\N	142	5466	\N	2	1	0
1794	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000201411	2019-10-01 23:34:09.331984	\N	\N	1	\N	381	8750	\N	2	1	0
2338	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000171	2019-10-01 23:34:09.331984	\N	\N	1	\N	326	4395	\N	2	1	0
2339	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000018499	2019-10-01 23:34:09.331984	\N	\N	1	\N	804	3975	\N	2	1	0
2337	2019-09-30	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN119273655692	SBIN119273655692	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	10114	\N	2	1	0
1816	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001052	2019-10-01 23:34:09.331984	\N	\N	1	\N	262	4331	\N	2	1	0
2326	2019-09-27	NEFT DR-CITI0000002-PERFETTI VAN MELLE INDIA PVT LTD-NETBANK, MUM-N270190937689953-PERFETTI	N270190937689953	2019-10-01 23:34:09.331984	\N	\N	1	\N	766	\N	100000	2	1	0
2343	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000751703	2019-10-01 23:34:09.331984	\N	\N	1	\N	383	12126	\N	2	1	0
1850	2019-06-07	IMPS-915810146124-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-NO 1	0000915810146124	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	15917	\N	2	1	0
2333	2019-09-30	BCCLTDGT69776-STP-BAJAJ CONSUMER CARE	IB30114146975700	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	100000	2	1	0
2218	2019-09-05	BCCLTDGT69776-STP-BAJAJ	IB05120616615781	2019-10-01 23:34:09.331984	\N	\N	1	\N	767	\N	180000	2	1	0
1853	2019-06-07	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN619158647382	SBIN619158647382	2019-10-01 23:34:09.331984	\N	\N	1	\N	403	371	\N	2	1	0
2342	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042739	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	22949	\N	2	1	0
1675	2019-05-01	NEFT DR-CNRB0002159-TUSHAR TRADING CO-NETBANK, MUM-N121190813395811-HDFC TO CANARA BAN	N121190813395811	2019-10-01 23:34:09.331984	\N	\N	1	\N	730	\N	150000	2	1	0
1678	2019-05-02	NEFT DR-CITI0000002-PERFETTI VAN MELLE INDIA PVT LTD-NETBANK, MUM-N122190814802328-PERFETTI	N122190814802328	2019-10-01 23:34:09.331984	\N	\N	1	\N	766	\N	120000	2	1	0
1679	2019-05-02	HB3142NR1000007858-STP-GODREJ	IB02140443264468	2019-10-01 23:34:09.331984	\N	\N	1	\N	763	\N	233000	2	1	0
1701	2019-05-04	IMPS-912420143625-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000912420143625	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	7992	\N	2	1	0
1737	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000986627	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	3481	\N	2	1	0
1866	2019-06-13	IMPS-916410183975-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-BOURNVITA	0000916410183975	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	17692	\N	2	1	0
1909	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038131	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	4904	\N	2	1	0
1924	2019-06-27	RTGS DR-DEUT0784BBY-MONDELEZ INDIA FOODS PVT LTD-NETBANK, MUM-HDFCR52019062784458481-MONDELEZ	HDFCR52019062784458481	2019-10-01 23:34:09.331984	\N	\N	1	\N	762	\N	200000	2	1	0
1966	2019-07-07	IMPS-918810107729-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000918810107729	2019-10-01 23:34:09.331984	\N	\N	1	\N	158	11550	\N	2	1	0
2012	2019-07-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001093	2019-10-01 23:34:09.331984	\N	\N	1	\N	262	1450	\N	2	1	0
2025	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000948	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	8437	\N	2	1	0
2082	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000043935	2019-10-01 23:34:09.331984	\N	\N	1	\N	122	1789	\N	2	1	0
2312	2019-09-25	IMPS-926811473750-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-GOOD NIGHT REFIL	0000926811473750	2019-10-01 23:34:09.331984	\N	\N	1	\N	186	2321	\N	2	1	0
2316	2019-09-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000029	2019-10-01 23:34:09.331984	\N	\N	1	\N	76	2996	\N	2	1	0
2315	2019-09-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000074567	2019-10-01 23:34:09.331984	\N	\N	1	\N	392	29960	\N	2	1	0
2314	2019-09-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001007	2019-10-01 23:34:09.331984	\N	\N	1	\N	131	32780	\N	2	1	0
2319	2019-09-26	UPI-VIKAS KUMAR SO PRASA-9953904863@PAYTM-CORP0003167-926937642125-NA	0000926913009834	2019-10-01 23:34:09.331984	\N	\N	1	\N	800	63	\N	2	1	0
2318	2019-09-26	IMPS-926913039468-VIKAS KUMAR-HDFC-XXXXXXXX4863-	0000926913039468	2019-10-01 23:34:09.331984	\N	\N	1	\N	800	500	\N	2	1	0
2320	2019-09-26	IMPS-926914522587-BHAGWATI TRADERS  -HDFC-XXXXXXXXXXX5608-TUSHAR	0000926914522587	2019-10-01 23:34:09.331984	\N	\N	1	\N	801	600	\N	2	1	0
2346	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033076	2019-10-01 23:34:09.331984	\N	\N	1	\N	113	1478	\N	2	1	0
2324	2019-09-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000610	2019-10-01 23:34:09.331984	\N	\N	1	\N	628	7914	\N	2	1	0
2322	2019-09-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000086315	2019-10-01 23:34:09.331984	\N	\N	1	\N	236	38072	\N	2	1	0
2321	2019-09-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000086704	2019-10-01 23:34:09.331984	\N	\N	1	\N	236	295835	\N	2	1	0
2327	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000842339	2019-10-01 23:34:09.331984	\N	\N	1	\N	802	1595	\N	2	1	0
2328	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137005	2019-10-01 23:34:09.331984	\N	\N	1	\N	589	3480	\N	2	1	0
2329	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000620874	2019-10-01 23:34:09.331984	\N	\N	1	\N	627	19948	\N	2	1	0
2330	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785658	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	48698	\N	2	1	0
2325	2019-09-27	NEFT CR-SBIN0003342-RAMA PROVISION STORE-TUSHAR TRADING CO-SBIN319270646926	SBIN319270646926	2019-10-01 23:34:09.331984	\N	\N	1	\N	462	98346	\N	2	1	0
2335	2019-09-30	FT - CR - 50100239891016 - RINKU NAGAR	0000000000000017	2019-10-01 23:34:09.331984	\N	\N	1	\N	803	3836	\N	2	1	0
2345	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000551042	2019-10-01 23:34:09.331984	\N	\N	1	\N	633	3169	\N	2	1	0
2344	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000043013	2019-10-01 23:34:09.331984	\N	\N	1	\N	784	8045	\N	2	1	0
2341	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000041443	2019-10-01 23:34:09.331984	\N	\N	1	\N	727	30876	\N	2	1	0
2340	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000689	2019-10-01 23:34:09.331984	\N	\N	1	\N	14	93696	\N	2	1	0
2112	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036748	2019-10-01 23:34:09.331984	\N	\N	1	\N	35	1750	\N	2	1	0
2140	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000349653	2019-10-01 23:34:09.331984	\N	\N	1	\N	143	31488	\N	2	1	0
4255	2019-04-03	CHQ DEP - TRANSFER OW 1 - NOIDA WBO	0000000000000116	2019-10-29 14:58:30.573357	\N	\N	1	\N	1113	3560	\N	4	2	0
4260	2019-04-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000050494	2019-10-29 14:58:30.573357	\N	\N	1	\N	59	25349	\N	4	2	0
4265	2019-04-04	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N094190220097988	N094190220097988	2019-10-29 14:58:30.573357	\N	\N	1	\N	1070	58853	\N	4	2	0
4266	2019-04-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000114887	2019-10-29 14:58:30.573357	\N	\N	1	\N	656	76101	\N	4	2	0
4267	2019-04-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000399957	2019-10-29 14:58:30.573357	\N	\N	1	\N	78	58156	\N	4	2	0
4268	2019-04-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000145554	2019-10-29 14:58:30.573357	\N	\N	1	\N	14	49763	\N	4	2	0
4269	2019-04-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121309	2019-10-29 14:58:30.573357	\N	\N	1	\N	55	20659	\N	4	2	0
4270	2019-04-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000353	2019-10-29 14:58:30.573357	\N	\N	1	\N	88	15358	\N	4	2	0
4271	2019-04-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000294294	2019-10-29 14:58:30.573357	\N	\N	1	\N	901	4864	\N	4	2	0
4272	2019-04-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000965376	2019-10-29 14:58:30.573357	\N	\N	1	\N	87	1524	\N	4	2	0
4273	2019-04-05	50200004799122-TPT-J P ENT 24MAR	0000000192268309	2019-10-29 14:58:30.573357	\N	\N	1	\N	94	51730	\N	4	2	0
4275	2019-04-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008397	2019-10-29 14:58:30.573357	\N	\N	1	\N	105	71913	\N	4	2	0
4276	2019-04-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000242	2019-10-29 14:58:30.573357	\N	\N	1	\N	126	30238	\N	4	2	0
4277	2019-04-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000373322	2019-10-29 14:58:30.573357	\N	\N	1	\N	42	2064	\N	4	2	0
4278	2019-04-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000975446	2019-10-29 14:58:30.573357	\N	\N	1	\N	93	3828	\N	4	2	0
4279	2019-04-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000119765	2019-10-29 14:58:30.573357	\N	\N	1	\N	68	4596	\N	4	2	0
4280	2019-04-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000320635	2019-10-29 14:58:30.573357	\N	\N	1	\N	512	6815	\N	4	2	0
4281	2019-04-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000881061	2019-10-29 14:58:30.573357	\N	\N	1	\N	1066	9000	\N	4	2	0
4282	2019-04-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000399676	2019-10-29 14:58:30.573357	\N	\N	1	\N	1094	16513	\N	4	2	0
4284	2019-04-06	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19096040768	VIJBH19096040768	2019-10-29 14:58:30.573357	\N	\N	1	\N	471	50000	\N	4	2	0
4288	2019-04-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000381680	2019-10-29 14:58:30.573357	\N	\N	1	\N	264	9137	\N	4	2	0
4289	2019-04-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000017	2019-10-29 14:58:30.573357	\N	\N	1	\N	1191	5321	\N	4	2	0
4290	2019-04-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000360302	2019-10-29 14:58:30.573357	\N	\N	1	\N	747	3166	\N	4	2	0
4291	2019-04-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000226	2019-10-29 14:58:30.573357	\N	\N	1	\N	20	4357	\N	4	2	0
4292	2019-04-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071769	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	10310	\N	4	2	0
4293	2019-04-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000997	2019-10-29 14:58:30.573357	\N	\N	1	\N	12	30089	\N	4	2	0
4294	2019-04-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001444	2019-10-29 14:58:30.573357	\N	\N	1	\N	81	67612	\N	4	2	0
4295	2019-04-06	FT - CR - 50200031829519 - PAWAN CHAURASIA PAAN SHOP	0000000000000117	2019-10-29 14:58:30.573357	\N	\N	1	\N	1113	12703	\N	4	2	0
4296	2019-04-06	CHQ DEP - MICR CLG - NOIDA WBO	0000000000281410	2019-10-29 14:58:30.573357	\N	\N	1	\N	478	6914	\N	4	2	0
4302	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000120191	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	3000	\N	4	2	0
4303	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000736	2019-10-29 14:58:30.573357	\N	\N	1	\N	65	3616	\N	4	2	0
4305	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003539	2019-10-29 14:58:30.573357	\N	\N	1	\N	101	4949	\N	4	2	0
4306	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121779	2019-10-29 14:58:30.573357	\N	\N	1	\N	390	5953	\N	4	2	0
4304	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000825	2019-10-29 14:58:30.573357	\N	\N	1	\N	95	4640	\N	4	2	0
4307	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003540	2019-10-29 14:58:30.573357	\N	\N	1	\N	101	7002	\N	4	2	0
4308	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000478076	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	7576	\N	4	2	0
4309	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000041691	2019-10-29 14:58:30.573357	\N	\N	1	\N	102	8635	\N	4	2	0
4297	2019-04-07	UPI-008561900000773-9971344900@YBL-909730065078-PAYMENT FROM PHONEPE	0000909710032908	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	5343	\N	4	2	0
4264	2019-04-04	8201201012-04 04 2019-HD03123849	0000904045056674	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	308460.830000000016	\N	4	2	0
4283	2019-04-05	UPI-918750062002-8750062002@PAYTM-909544814881-NA	0000909520735790	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	14611	\N	4	2	0
4256	2019-04-03	CASH DEP DADRI	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1244	300000	\N	4	2	0
4261	2019-04-04	CASH DEP DADRI	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1244	270000	\N	4	2	0
4285	2019-04-06	CASH DEP DADRI	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1244	230000	\N	4	2	0
4299	2019-04-08	CASH DEP DADRI	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1244	165000	\N	4	2	0
4274	2019-04-05	EMI 52012431 CHQ S52012431117 041952012431	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1257	\N	16495	4	2	0
4258	2019-04-03	HB3142NR1000009999-STP-GODREJ	IB03132707959177	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	50000	4	2	0
4254	2019-04-03	CHQ PAID-MICR CTS-NO-FERRERO INDIA PRIVA	0000000000000393	2019-10-29 14:58:30.573357	\N	\N	1	\N	1253	\N	94000	4	2	0
4257	2019-04-03	HB3142NR1000009999-STP-GODREJ	IB03132258576398	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	300000	4	2	0
4259	2019-04-03	ACH D- MONDELEZ INDIA FOODS-DB35570587	0000008756208326	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	876690.089999999967	4	2	0
4263	2019-04-04	MARICO4254-STP-MARICO	IB04130904224786	2019-10-29 14:58:30.573357	\N	\N	1	\N	1252	\N	525000	4	2	0
4287	2019-04-06	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N096190795515091-COLGATE	N096190795515091	2019-10-29 14:58:30.573357	\N	\N	1	\N	1254	\N	150000	4	2	0
4300	2019-04-08	HB3142NR1000009999-STP-GODREJ	IB08150803881408	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	292000	4	2	0
4301	2019-04-08	ACH D- MONDELEZ INDIA FOODS-DB35610292	0000008852582808	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	799295.229999999981	4	2	0
4262	2019-04-04	EMI 45070519 CHQ S45070519126 041945070519	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1256	\N	69821	4	2	0
2135	2019-08-19	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-HDFCR52019081991688983-COLGATE	HDFCR52019081991688983	2019-10-01 23:34:09.331984	\N	\N	1	\N	764	\N	306000	2	1	0
4310	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000399677	2019-10-29 14:58:30.573357	\N	\N	1	\N	1094	11437	\N	4	2	0
4323	2019-04-10	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N100190222684784	N100190222684784	2019-10-29 14:58:30.573357	\N	\N	1	\N	1070	85484	\N	4	2	0
4322	2019-04-10	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19100076394	VIJBH19100076394	2019-10-29 14:58:30.573357	\N	\N	1	\N	471	17992	\N	4	2	0
4353	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000399979	2019-10-29 14:58:30.573357	\N	\N	1	\N	78	91734	\N	4	2	0
4311	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000650	2019-10-29 14:58:30.573357	\N	\N	1	\N	1186	13881	\N	4	2	0
4312	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000312035	2019-10-29 14:58:30.573357	\N	\N	1	\N	67	15466	\N	4	2	0
4313	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000472653	2019-10-29 14:58:30.573357	\N	\N	1	\N	46	18230	\N	4	2	0
4314	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000421431	2019-10-29 14:58:30.573357	\N	\N	1	\N	114	28229	\N	4	2	0
4315	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000031	2019-10-29 14:58:30.573357	\N	\N	1	\N	21	32000	\N	4	2	0
4316	2019-04-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000104503	2019-10-29 14:58:30.573357	\N	\N	1	\N	14	56921	\N	4	2	0
4317	2019-04-09	IMPS-909912170103-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000909912170103	2019-10-29 14:58:30.573357	\N	\N	1	\N	586	11843	\N	4	2	0
4319	2019-04-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000360	2019-10-29 14:58:30.573357	\N	\N	1	\N	9	6289	\N	4	2	0
4320	2019-04-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155519	2019-10-29 14:58:30.573357	\N	\N	1	\N	512	12028	\N	4	2	0
4321	2019-04-10	50200004799122-TPT-J P ENT 1 APR	0000000250538050	2019-10-29 14:58:30.573357	\N	\N	1	\N	94	37759	\N	4	2	0
4324	2019-04-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008508	2019-10-29 14:58:30.573357	\N	\N	1	\N	105	83709	\N	4	2	0
4325	2019-04-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254325	2019-10-29 14:58:30.573357	\N	\N	1	\N	19	49206	\N	4	2	0
4326	2019-04-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000388262	2019-10-29 14:58:30.573357	\N	\N	1	\N	359	45387	\N	4	2	0
4327	2019-04-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000997459	2019-10-29 14:58:30.573357	\N	\N	1	\N	434	33943	\N	4	2	0
4328	2019-04-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121463	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	29557	\N	4	2	0
4329	2019-04-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121312	2019-10-29 14:58:30.573357	\N	\N	1	\N	55	9704	\N	4	2	0
4330	2019-04-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000399681	2019-10-29 14:58:30.573357	\N	\N	1	\N	1094	6601	\N	4	2	0
4331	2019-04-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000356	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	3902	\N	4	2	0
4333	2019-04-11	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19101863144	KKBKH19101863144	2019-10-29 14:58:30.573357	\N	\N	1	\N	1243	9290	\N	4	2	0
4339	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121465	2019-10-29 14:58:30.573357	\N	\N	1	\N	56	52307	\N	4	2	0
4340	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000258985	2019-10-29 14:58:30.573357	\N	\N	1	\N	1131	29052	\N	4	2	0
4341	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000986731	2019-10-29 14:58:30.573357	\N	\N	1	\N	910	21225	\N	4	2	0
4342	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071775	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	20000	\N	4	2	0
4343	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000881063	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	17771	\N	4	2	0
4344	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122424	2019-10-29 14:58:30.573357	\N	\N	1	\N	1041	4608	\N	4	2	0
4345	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000986566	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	1422	\N	4	2	0
4346	2019-04-13	IMPS-910310918884-35959771-HDFC-XXXXXXXX8519-	0000910310918884	2019-10-29 14:58:30.573357	\N	\N	1	\N	340	8000	\N	4	2	0
4347	2019-04-14	UPI-AMIT AGARWAL SO MKAG-9999900212@UPI-ORBC0100526-910408669477-NO REMARKS	0000091048055311	2019-10-29 14:58:30.573357	\N	\N	1	\N	670	20000	\N	4	2	0
4348	2019-04-14	IMPS-910413157797-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000910413157797	2019-10-29 14:58:30.573357	\N	\N	1	\N	586	12717	\N	4	2	0
4354	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259028	2019-10-29 14:58:30.573357	\N	\N	1	\N	1131	89272	\N	4	2	0
4355	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001365	2019-10-29 14:58:30.573357	\N	\N	1	\N	81	64675	\N	4	2	0
4356	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000030	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	38500	\N	4	2	0
4357	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000993	2019-10-29 14:58:30.573357	\N	\N	1	\N	60	28271	\N	4	2	0
4358	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000039	2019-10-29 14:58:30.573357	\N	\N	1	\N	1064	26481	\N	4	2	0
4359	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000907130	2019-10-29 14:58:30.573357	\N	\N	1	\N	40	19343	\N	4	2	0
4361	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001262	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	14882	\N	4	2	0
4360	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000026474	2019-10-29 14:58:30.573357	\N	\N	1	\N	24	18983	\N	4	2	0
4362	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000040	2019-10-29 14:58:30.573357	\N	\N	1	\N	17	10078	\N	4	2	0
4363	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000119981	2019-10-29 14:58:30.573357	\N	\N	1	\N	75	8895	\N	4	2	0
4364	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000055248	2019-10-29 14:58:30.573357	\N	\N	1	\N	32	7402	\N	4	2	0
4318	2019-04-09	NEFT CR-CNRB0002159-J.P.ENTERPRISES-J P ENTERPRISES-P19040982248741	0P19040982248741	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	200000	\N	4	2	0
4351	2019-04-15	50200029853444-TPT-TTC OD TO JP OD	0000000297670445	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	250000	\N	4	2	0
4334	2019-04-11	ACH D- MONDELEZ INDIA FOODS-DB35650526	0000009077749307	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	210077.399999999994	4	2	0
4336	2019-04-12	CASH DEP HOME BRN CHGS 040419-MIR1910193097362	MIR1910193097362	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	955.799999999999955	4	2	0
4352	2019-04-15	MARICO4254-STP-MARICO	IB15155732232409	2019-10-29 14:58:30.573357	\N	\N	1	\N	1252	\N	180000	4	2	0
4350	2019-04-15	HB3142NR1000009999-STP-GODREJ	IB15141127677276	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	595321.930000000051	4	2	0
4335	2019-04-11	GST/BANK REFERENCE NO: R1910110777922/CIN NO: HDFC19040900170165	0190411090017510	2019-10-29 14:58:30.573357	\N	\N	1	\N	1259	\N	30806	4	2	0
4337	2019-04-12	50100051672149-TPT-DRAWINGS	0000000273768517	2019-10-29 14:58:30.573357	\N	\N	1	\N	1258	\N	25000	4	2	0
4366	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000109991	2019-10-29 14:58:30.573357	\N	\N	1	\N	663	4780	\N	4	2	0
4367	2019-04-16	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19106764669	KKBKH19106764669	2019-10-29 14:58:30.573357	\N	\N	1	\N	1243	3700	\N	4	2	0
4370	2019-04-16	FT - CR - 50200010626700 - HARI OM DEPARTMENTAL STORE	0000000000000503	2019-10-29 14:58:30.573357	\N	\N	1	\N	26	20749	\N	4	2	0
4374	2019-04-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000460718	2019-10-29 14:58:30.573357	\N	\N	1	\N	1042	1956	\N	4	2	0
4375	2019-04-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000452334	2019-10-29 14:58:30.573357	\N	\N	1	\N	306	8661	\N	4	2	0
4376	2019-04-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000510199	2019-10-29 14:58:30.573357	\N	\N	1	\N	705	6703	\N	4	2	0
4377	2019-04-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000022880	2019-10-29 14:58:30.573357	\N	\N	1	\N	700	11613	\N	4	2	0
4378	2019-04-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001261	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	18265	\N	4	2	0
4379	2019-04-17	IMPS-910709599976-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000910709599976	2019-10-29 14:58:30.573357	\N	\N	1	\N	633	13867	\N	4	2	0
4380	2019-04-17	50200004799122-TPT-J P 7APR BILL	0000000216760918	2019-10-29 14:58:30.573357	\N	\N	1	\N	94	44354	\N	4	2	0
4384	2019-04-18	IMPS-910811375011-SHITALA PRASAD-HDFC-XXXXXXXX7705-	0000910811375011	2019-10-29 14:58:30.573357	\N	\N	1	\N	1168	3000	\N	4	2	0
4385	2019-04-18	IMPS-910814103518-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000910814103518	2019-10-29 14:58:30.573357	\N	\N	1	\N	586	9371	\N	4	2	0
4398	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000155	2019-10-29 14:58:30.573357	\N	\N	1	\N	231	2783	\N	4	2	0
4387	2019-04-18	IMPS-910817507090-K K STORE-HDFC-XXXXXXXXXX1250-	0000910817507090	2019-10-29 14:58:30.573357	\N	\N	1	\N	918	12671	\N	4	2	0
4388	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000373336	2019-10-29 14:58:30.573357	\N	\N	1	\N	42	2443	\N	4	2	0
4389	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000360313	2019-10-29 14:58:30.573357	\N	\N	1	\N	747	6339	\N	4	2	0
4391	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071781	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	12511	\N	4	2	0
4411	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000023137	2019-10-29 14:58:30.573357	\N	\N	1	\N	42	3816	\N	4	2	0
4392	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000727342	2019-10-29 14:58:30.573357	\N	\N	1	\N	1065	10000	\N	4	2	0
4393	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000388270	2019-10-29 14:58:30.573357	\N	\N	1	\N	359	26919	\N	4	2	0
4394	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108388	2019-10-29 14:58:30.573357	\N	\N	1	\N	64	31581	\N	4	2	0
4395	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000737142	2019-10-29 14:58:30.573357	\N	\N	1	\N	1074	44471	\N	4	2	0
4396	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000104504	2019-10-29 14:58:30.573357	\N	\N	1	\N	14	53908	\N	4	2	0
4397	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000109998	2019-10-29 14:58:30.573357	\N	\N	1	\N	663	2030	\N	4	2	0
4386	2019-04-18	FT - CR - 50100209140242 - INDRESH	0000000000000041	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	6000	\N	4	2	0
4399	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000362	2019-10-29 14:58:30.573357	\N	\N	1	\N	9	7185	\N	4	2	0
4400	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121319	2019-10-29 14:58:30.573357	\N	\N	1	\N	55	15120	\N	4	2	0
4401	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000615512	2019-10-29 14:58:30.573357	\N	\N	1	\N	513	13726	\N	4	2	0
4402	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000464	2019-10-29 14:58:30.573357	\N	\N	1	\N	661	20809	\N	4	2	0
4403	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000377	2019-10-29 14:58:30.573357	\N	\N	1	\N	1083	16700	\N	4	2	0
4405	2019-04-20	NEFT CR-INDB0000006-RAVINDRA NATH-JPENTERPRISES-000186461654	0000000186461654	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	8000	\N	4	2	0
4406	2019-04-20	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010774	2019-10-29 14:58:30.573357	\N	\N	1	\N	97	218650	\N	4	2	0
4409	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121710	2019-10-29 14:58:30.573357	\N	\N	1	\N	390	1850	\N	4	2	0
4410	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000166678	2019-10-29 14:58:30.573357	\N	\N	1	\N	87	2337	\N	4	2	0
4390	2019-04-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039637	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	6509	\N	4	2	0
4412	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000767	2019-10-29 14:58:30.573357	\N	\N	1	\N	73	3866	\N	4	2	0
4413	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000986573	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	3952	\N	4	2	0
4414	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038099	2019-10-29 14:58:30.573357	\N	\N	1	\N	108	5000	\N	4	2	0
4415	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000119989	2019-10-29 14:58:30.573357	\N	\N	1	\N	75	5699	\N	4	2	0
4382	2019-04-17	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000510199	2019-10-29 14:58:30.573357	\N	\N	1	\N	705	\N	6703	4	2	0
4416	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122214	2019-10-29 14:58:30.573357	\N	\N	1	\N	89	5836	\N	4	2	0
4417	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000156	2019-10-29 14:58:30.573357	\N	\N	1	\N	231	7027	\N	4	2	0
4418	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000022881	2019-10-29 14:58:30.573357	\N	\N	1	\N	700	11613	\N	4	2	0
4419	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000014724	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	11744	\N	4	2	0
4420	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000986745	2019-10-29 14:58:30.573357	\N	\N	1	\N	910	12783	\N	4	2	0
4421	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071782	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	15470	\N	4	2	0
4383	2019-04-18	50200006539210-TPT-TTC CA TO JP CA	0000000324067890	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	80000	\N	4	2	0
4373	2019-04-16	CASH DEP HOME BRN CHGS 080419-MIR1910599771729	MIR1910599771729	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	584.100000000000023	4	2	0
4371	2019-04-16	CASH DEP HOME BRN CHGS 060419-MIR1910599290546	MIR1910599290546	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	814.200000000000045	4	2	0
4369	2019-04-16	HB3142NR1000009999-STP-GODREJ	IB16140002964018	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	100000	4	2	0
4368	2019-04-16	ACH D- MONDELEZ INDIA FOODS-DB35700515	0000009215206392	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	213880.549999999988	4	2	0
4404	2019-04-20	CHQ PAID-MICR CTS-NO-FERRERO INDIA PLTD	0000000000000394	2019-10-29 14:58:30.573357	\N	\N	1	\N	1253	\N	122700	4	2	0
4408	2019-04-20	ACH D- MONDELEZ INDIA FOODS-DB35720443	0000009272174782	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	686012.189999999944	4	2	0
4407	2019-04-20	50200006539210-TPT-JP CA TO TTC CA	0000000145822132	2019-10-29 14:58:30.573357	\N	\N	1	\N	422	\N	200000	4	2	0
4423	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000368836	2019-10-29 14:58:30.573357	\N	\N	1	\N	31	27906	\N	4	2	0
4425	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000622022	2019-10-29 14:58:30.573357	\N	\N	1	\N	34	32640	\N	4	2	0
4429	2019-04-22	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N112190226739677	N112190226739677	2019-10-29 14:58:30.573357	\N	\N	1	\N	443	118457	\N	4	2	0
4430	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000452345	2019-10-29 14:58:30.573357	\N	\N	1	\N	306	573	\N	4	2	0
4431	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000758	2019-10-29 14:58:30.573357	\N	\N	1	\N	65	3816	\N	4	2	0
4432	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000045	2019-10-29 14:58:30.573357	\N	\N	1	\N	17	7827	\N	4	2	0
4433	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000776	2019-10-29 14:58:30.573357	\N	\N	1	\N	73	8102	\N	4	2	0
4434	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000727358	2019-10-29 14:58:30.573357	\N	\N	1	\N	1065	11958	\N	4	2	0
4435	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000026480	2019-10-29 14:58:30.573357	\N	\N	1	\N	24	14046	\N	4	2	0
4436	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000351642	2019-10-29 14:58:30.573357	\N	\N	1	\N	508	20515	\N	4	2	0
4437	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000827	2019-10-29 14:58:30.573357	\N	\N	1	\N	95	21120	\N	4	2	0
4438	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000068	2019-10-29 14:58:30.573357	\N	\N	1	\N	1094	27368	\N	4	2	0
4439	2019-04-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007080	2019-10-29 14:58:30.573357	\N	\N	1	\N	514	43528	\N	4	2	0
4441	2019-04-23	NEFT CR-UTIB0000624-JAI BHAWANI KIRANA STORE-JP ENTERPRISES-AXMB191139568474	AXMB191139568474	2019-10-29 14:58:30.573357	\N	\N	1	\N	52	6527	\N	4	2	0
4443	2019-04-23	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19113827899	KKBKH19113827899	2019-10-29 14:58:30.573357	\N	\N	1	\N	1243	8459	\N	4	2	0
4428	2019-04-22	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000122214	2019-10-29 14:58:30.573357	\N	\N	1	\N	89	\N	5836	4	2	0
4444	2019-04-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038100	2019-10-29 14:58:30.573357	\N	\N	1	\N	108	5500	\N	4	2	0
4445	2019-04-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002274	2019-10-29 14:58:30.573357	\N	\N	1	\N	1061	6000	\N	4	2	0
4446	2019-04-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259064	2019-10-29 14:58:30.573357	\N	\N	1	\N	1131	68153	\N	4	2	0
4447	2019-04-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008635	2019-10-29 14:58:30.573357	\N	\N	1	\N	105	71078	\N	4	2	0
4449	2019-04-24	IMPS-911415693849-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000911415693849	2019-10-29 14:58:30.573357	\N	\N	1	\N	633	853	\N	4	2	0
4450	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254340	2019-10-29 14:58:30.573357	\N	\N	1	\N	19	44998	\N	4	2	0
4451	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000145559	2019-10-29 14:58:30.573357	\N	\N	1	\N	14	32076	\N	4	2	0
4452	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000046	2019-10-29 14:58:30.573357	\N	\N	1	\N	21	31938	\N	4	2	0
4453	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108393	2019-10-29 14:58:30.573357	\N	\N	1	\N	64	18357	\N	4	2	0
4454	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000071	2019-10-29 14:58:30.573357	\N	\N	1	\N	1094	24138	\N	4	2	0
4455	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000105073	2019-10-29 14:58:30.573357	\N	\N	1	\N	1151	10678	\N	4	2	0
4456	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000460727	2019-10-29 14:58:30.573357	\N	\N	1	\N	1042	18000	\N	4	2	0
4457	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122218	2019-10-29 14:58:30.573357	\N	\N	1	\N	89	5527	\N	4	2	0
4458	2019-04-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000367	2019-10-29 14:58:30.573357	\N	\N	1	\N	9	9478	\N	4	2	0
4459	2019-04-25	50200004799122-TPT-J P ENT 14APR	0000000188365191	2019-10-29 14:58:30.573357	\N	\N	1	\N	94	73006	\N	4	2	0
4462	2019-04-25	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19115064726	VIJBH19115064726	2019-10-29 14:58:30.573357	\N	\N	1	\N	471	41449	\N	4	2	0
4465	2019-04-25	FT - CR - 50100205755921 - PREETI SINGH	0000000000000032	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	33477	\N	4	2	0
4466	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071651	2019-10-29 14:58:30.573357	\N	\N	1	\N	31	38403	\N	4	2	0
4467	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071793	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	20880	\N	4	2	0
4468	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000460728	2019-10-29 14:58:30.573357	\N	\N	1	\N	1131	17386	\N	4	2	0
4469	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001273	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	16985	\N	4	2	0
4470	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121325	2019-10-29 14:58:30.573357	\N	\N	1	\N	55	15270	\N	4	2	0
4471	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038101	2019-10-29 14:58:30.573357	\N	\N	1	\N	108	5360	\N	4	2	0
4472	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122447	2019-10-29 14:58:30.573357	\N	\N	1	\N	1041	3538	\N	4	2	0
4473	2019-04-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001259	2019-10-29 14:58:30.573357	\N	\N	1	\N	140	3328	\N	4	2	0
4474	2019-04-26	IMPS-911610144948-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000911610144948	2019-10-29 14:58:30.573357	\N	\N	1	\N	586	16356	\N	4	2	0
4475	2019-04-26	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010781	2019-10-29 14:58:30.573357	\N	\N	1	\N	97	71915	\N	4	2	0
4476	2019-04-26	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000038101	2019-10-29 14:58:30.573357	\N	\N	1	\N	108	\N	5360	4	2	0
4477	2019-04-26	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N116190228468465	N116190228468465	2019-10-29 14:58:30.573357	\N	\N	1	\N	1070	127343	\N	4	2	0
4478	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000400018	2019-10-29 14:58:30.573357	\N	\N	1	\N	78	27918	\N	4	2	0
4426	2019-04-21	UPI-AMIT AGARWAL SO MKAG-9999900212@UPI-ORBC0100526-911115769399-NO REMARKS	0000911115855254	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	20000	\N	4	2	0
4427	2019-04-22	HB3142NR1000009999-STP-GODREJ	IB22151607952542	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	20000	4	2	0
4440	2019-04-23	CHQ DEP RET CHGS 170419-MIR1910920098358	0000000000510199	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4442	2019-04-23	ACH D- MONDELEZ INDIA FOODS-DB35770311	0000009307026875	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	400893.039999999979	4	2	0
4448	2019-04-24	CHQ DEP RET CHGS 220419-MIR1911426173165	0000000000122214	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4460	2019-04-25	MARICO4254-STP-MARICO	IB25132240687424	2019-10-29 14:58:30.573357	\N	\N	1	\N	1252	\N	50000	4	2	0
4463	2019-04-25	HB3142NR1000009999-STP-GODREJ	IB25152423856700	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	205000	4	2	0
4464	2019-04-25	ACH D- MONDELEZ INDIA FOODS-DB35790407	0000009332716044	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	287963.330000000016	4	2	0
4480	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001274	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	15876	\N	4	2	0
4481	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315621	2019-10-29 14:58:30.573357	\N	\N	1	\N	35	10829	\N	4	2	0
4482	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000284	2019-10-29 14:58:30.573357	\N	\N	1	\N	126	10080	\N	4	2	0
4484	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382328	2019-10-29 14:58:30.573357	\N	\N	1	\N	773	5117	\N	4	2	0
4485	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123601	2019-10-29 14:58:30.573357	\N	\N	1	\N	663	4859	\N	4	2	0
4486	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000407406	2019-10-29 14:58:30.573357	\N	\N	1	\N	1129	2240	\N	4	2	0
4487	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000055182	2019-10-29 14:58:30.573357	\N	\N	1	\N	470	951	\N	4	2	0
4488	2019-04-27	IMPS-911711359364-35959771-HDFC-XXXXXXXX8519-	0000911711359364	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	5000	\N	4	2	0
4490	2019-04-28	UPI-VISHWAS FOODS-8750062002@PAYTM-PYTM0123456-911842310176-NA	0000911818032567	2019-10-29 14:58:30.573357	\N	\N	1	\N	111	5500	\N	4	2	0
4491	2019-04-29	IMPS-911912664593-K K STORE-HDFC-XXXXXXXXXX1250-	0000911912664593	2019-10-29 14:58:30.573357	\N	\N	1	\N	918	15328	\N	4	2	0
4492	2019-04-29	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N119190229093228	N119190229093228	2019-10-29 14:58:30.573357	\N	\N	1	\N	1070	148430	\N	4	2	0
4493	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000283781	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	14451	\N	4	2	0
4494	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000014	2019-10-29 14:58:30.573357	\N	\N	1	\N	553	2037	\N	4	2	0
4495	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000180018	2019-10-29 14:58:30.573357	\N	\N	1	\N	28	4000	\N	4	2	0
4496	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000168	2019-10-29 14:58:30.573357	\N	\N	1	\N	17	4737	\N	4	2	0
4497	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001025	2019-10-29 14:58:30.573357	\N	\N	1	\N	60	10902	\N	4	2	0
4498	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001300	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	11784	\N	4	2	0
4499	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000026489	2019-10-29 14:58:30.573357	\N	\N	1	\N	24	12762	\N	4	2	0
4500	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000006	2019-10-29 14:58:30.573357	\N	\N	1	\N	72	13240	\N	4	2	0
4501	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155532	2019-10-29 14:58:30.573357	\N	\N	1	\N	130	13843	\N	4	2	0
4502	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000110	2019-10-29 14:58:30.573357	\N	\N	1	\N	1066	15184	\N	4	2	0
4503	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039642	2019-10-29 14:58:30.573357	\N	\N	1	\N	547	18056	\N	4	2	0
4504	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000044	2019-10-29 14:58:30.573357	\N	\N	1	\N	365	18111	\N	4	2	0
4505	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000857	2019-10-29 14:58:30.573357	\N	\N	1	\N	95	19118	\N	4	2	0
4506	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254342	2019-10-29 14:58:30.573357	\N	\N	1	\N	19	19443	\N	4	2	0
4507	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058203	2019-10-29 14:58:30.573357	\N	\N	1	\N	32	23525	\N	4	2	0
4508	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042014	2019-10-29 14:58:30.573357	\N	\N	1	\N	102	55637	\N	4	2	0
4509	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001501	2019-10-29 14:58:30.573357	\N	\N	1	\N	81	59016	\N	4	2	0
4510	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397094	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	39911	\N	4	2	0
4511	2019-04-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992634	2019-10-29 14:58:30.573357	\N	\N	1	\N	23	97629	\N	4	2	0
4514	2019-04-30	50200004799122-TPT-J P ENT 21 APR BILL	0000000142444012	2019-10-29 14:58:30.573357	\N	\N	1	\N	94	24678	\N	4	2	0
4515	2019-04-30	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000155532	2019-10-29 14:58:30.573357	\N	\N	1	\N	130	\N	13843	4	2	0
4517	2019-04-30	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19120633782	KKBKH19120633782	2019-10-29 14:58:30.573357	\N	\N	1	\N	1243	5970	\N	4	2	0
4518	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000907141	2019-10-29 14:58:30.573357	\N	\N	1	\N	40	42480	\N	4	2	0
4519	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259107	2019-10-29 14:58:30.573357	\N	\N	1	\N	1131	27975	\N	4	2	0
4520	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000312045	2019-10-29 14:58:30.573357	\N	\N	1	\N	67	13985	\N	4	2	0
4521	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001301	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	11000	\N	4	2	0
4522	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001046	2019-10-29 14:58:30.573357	\N	\N	1	\N	1105	8934	\N	4	2	0
4523	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000374	2019-10-29 14:58:30.573357	\N	\N	1	\N	9	5657	\N	4	2	0
4528	2019-05-02	CASH DEP DADRI	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1244	240000	\N	4	2	0
4527	2019-05-01	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000510229	2019-10-29 14:58:30.573357	\N	\N	1	\N	89	\N	5577	4	2	0
4524	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000510229	2019-10-29 14:58:30.573357	\N	\N	1	\N	89	5577	\N	4	2	0
4525	2019-04-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000453808	2019-10-29 14:58:30.573357	\N	\N	1	\N	91	120000	\N	4	2	0
4530	2019-05-02	CHQ DEP RET CHGS 260419-MIR1912131867608	0000000000038101	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4535	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126555	2019-10-29 14:58:30.573357	\N	\N	1	\N	1040	4973	\N	4	2	0
4534	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000360327	2019-10-29 14:58:30.573357	\N	\N	1	\N	747	5342	\N	4	2	0
4533	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000389	2019-10-29 14:58:30.573357	\N	\N	1	\N	1083	16492	\N	4	2	0
4532	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387454	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	23897	\N	4	2	0
4531	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000077	2019-10-29 14:58:30.573357	\N	\N	1	\N	1094	41258	\N	4	2	0
4489	2019-04-27	MARICO4254-STP-MARICO	IB27115253969578	2019-10-29 14:58:30.573357	\N	\N	1	\N	1252	\N	430000	4	2	0
4513	2019-04-30	ACH D- MONDELEZ INDIA FOODS-DB35820218	0000009395308982	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	229946.700000000012	4	2	0
4512	2019-04-30	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019043075891899-COLGATE	HDFCR52019043075891899	2019-10-29 14:58:30.573357	\N	\N	1	\N	1254	\N	284000	4	2	0
4529	2019-05-02	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019050276300522-RED BULL	HDFCR52019050276300522	2019-10-29 14:58:30.573357	\N	\N	1	\N	1251	\N	400000	4	2	0
4526	2019-05-01	NEFT DR-CNRB0002159-JP ENTERPRISES-NETBANK, MUM-N121190813407439-HDFC TO CANARA BAN	N121190813407439	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	\N	100000	4	2	0
4536	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000349109	2019-10-29 14:58:30.573357	\N	\N	1	\N	910	4197	\N	4	2	0
4538	2019-05-02	CHQ DEP - MICR CLG - NOIDA WBO	0000000000281430	2019-10-29 14:58:30.573357	\N	\N	1	\N	478	7040	\N	4	2	0
4539	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008662	2019-10-29 14:58:30.573357	\N	\N	1	\N	105	102884	\N	4	2	0
4540	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000597	2019-10-29 14:58:30.573357	\N	\N	1	\N	98	151767	\N	4	2	0
4555	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000814285	2019-10-29 14:58:30.573357	\N	\N	1	\N	62	6431	\N	4	2	0
4554	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121743	2019-10-29 14:58:30.573357	\N	\N	1	\N	390	6576	\N	4	2	0
4553	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000251782	2019-10-29 14:58:30.573357	\N	\N	1	\N	42	10104	\N	4	2	0
4552	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001941	2019-10-29 14:58:30.573357	\N	\N	1	\N	67	12302	\N	4	2	0
4551	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000042	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	19124	\N	4	2	0
4542	2019-05-03	IMPS-912310189243-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000912310189243	2019-10-29 14:58:30.573357	\N	\N	1	\N	586	20040	\N	4	2	0
4550	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000622033	2019-10-29 14:58:30.573357	\N	\N	1	\N	34	20126	\N	4	2	0
4549	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992644	2019-10-29 14:58:30.573357	\N	\N	1	\N	23	20970	\N	4	2	0
4548	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071660	2019-10-29 14:58:30.573357	\N	\N	1	\N	31	30133	\N	4	2	0
4547	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123120	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	39837	\N	4	2	0
4546	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000761440	2019-10-29 14:58:30.573357	\N	\N	1	\N	1049	41385	\N	4	2	0
4545	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000300	2019-10-29 14:58:30.573357	\N	\N	1	\N	126	73034	\N	4	2	0
4544	2019-05-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000400051	2019-10-29 14:58:30.573357	\N	\N	1	\N	78	92972	\N	4	2	0
4568	2019-05-04	IMPS-912420138014-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000912420138014	2019-10-29 14:58:30.573357	\N	\N	1	\N	633	3731	\N	4	2	0
4557	2019-05-04	UPI-KULDEEP-8860682190@PAYTM-PUNB0460300-912435816187-NA	0000912411343324	2019-10-29 14:58:30.573357	\N	\N	1	\N	41	4500	\N	4	2	0
4567	2019-05-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000141903	2019-10-29 14:58:30.573357	\N	\N	1	\N	13	5159	\N	4	2	0
4560	2019-05-04	UPI-GUPTA GROCERY STORE-8744800800@YBL-BARB0GNOIDA-912436474178-PAYMENT FROM PHONE	0000912412657490	2019-10-29 14:58:30.573357	\N	\N	1	\N	12	10000	\N	4	2	0
4565	2019-05-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000119946	2019-10-29 14:58:30.573357	\N	\N	1	\N	1134	11783	\N	4	2	0
4562	2019-05-04	NEFT CR-UTIB0000624-SHRI JEE GENERAL STORE-JAYPEE ENTERPRISES-AXMB191243686500	AXMB191243686500	2019-10-29 14:58:30.573357	\N	\N	1	\N	365	15000	\N	4	2	0
4564	2019-05-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001529	2019-10-29 14:58:30.573357	\N	\N	1	\N	81	37592	\N	4	2	0
4563	2019-05-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672530	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	56718	\N	4	2	0
4591	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122221	2019-10-29 14:58:30.573357	\N	\N	1	\N	89	2472	\N	4	2	0
4590	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000452357	2019-10-29 14:58:30.573357	\N	\N	1	\N	306	3905	\N	4	2	0
4589	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122219	2019-10-29 14:58:30.573357	\N	\N	1	\N	89	5836	\N	4	2	0
4588	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000375	2019-10-29 14:58:30.573357	\N	\N	1	\N	9	6168	\N	4	2	0
4587	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058206	2019-10-29 14:58:30.573357	\N	\N	1	\N	1006	7508	\N	4	2	0
4586	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000869	2019-10-29 14:58:30.573357	\N	\N	1	\N	701	8562	\N	4	2	0
4585	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000058	2019-10-29 14:58:30.573357	\N	\N	1	\N	17	9656	\N	4	2	0
4584	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000370455	2019-10-29 14:58:30.573357	\N	\N	1	\N	101	10068	\N	4	2	0
4583	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000531	2019-10-29 14:58:30.573357	\N	\N	1	\N	1081	12519	\N	4	2	0
4582	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000026496	2019-10-29 14:58:30.573357	\N	\N	1	\N	24	13407	\N	4	2	0
4581	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134460	2019-10-29 14:58:30.573357	\N	\N	1	\N	434	14418	\N	4	2	0
4580	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000727367	2019-10-29 14:58:30.573357	\N	\N	1	\N	1065	15674	\N	4	2	0
4579	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042023	2019-10-29 14:58:30.573357	\N	\N	1	\N	102	15996	\N	4	2	0
4571	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000312050	2019-10-29 14:58:30.573357	\N	\N	1	\N	67	18393	\N	4	2	0
4572	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000033	2019-10-29 14:58:30.573357	\N	\N	1	\N	1039	19191	\N	4	2	0
4573	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001050	2019-10-29 14:58:30.573357	\N	\N	1	\N	60	20031	\N	4	2	0
4574	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000453816	2019-10-29 14:58:30.573357	\N	\N	1	\N	91	20634	\N	4	2	0
4575	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000972467	2019-10-29 14:58:30.573357	\N	\N	1	\N	46	26047	\N	4	2	0
4576	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000458	2019-10-29 14:58:30.573357	\N	\N	1	\N	342	26716	\N	4	2	0
4577	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007115	2019-10-29 14:58:30.573357	\N	\N	1	\N	514	28191	\N	4	2	0
4578	2019-05-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134459	2019-10-29 14:58:30.573357	\N	\N	1	\N	514	40000	\N	4	2	0
4592	2019-05-07	CHQ DEP RET CHGS 300419-MIR1912535985924	0000000000155532	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4543	2019-05-03	ACH D- MONDELEZ INDIA FOODS-DB35870398	0000009467381300	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	410387.580000000016	4	2	0
4556	2019-05-04	CHQ PAID-MICR CTS-NO-FERRERD INDIA PT LT	0000000000000395	2019-10-29 14:58:30.573357	\N	\N	1	\N	1253	\N	100000	4	2	0
4561	2019-05-04	HB3142NR1000009999-STP-GODREJ	IB04131234584789	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	150000	4	2	0
4558	2019-05-04	EMI 45070519 CHQ S45070519127 051945070519	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1256	\N	69821	4	2	0
4569	2019-05-05	EMI 52012431 CHQ S52012431118 051952012431	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1257	\N	16495	4	2	0
4541	2019-05-03	50200006539210-TPT-TTC CA TO JP CA	0000000275129257	2019-10-29 14:58:30.573357	\N	\N	1	\N	422	200000	\N	4	2	0
4559	2019-05-04	50200006539210-TPT-JP CA TO TTC CA	0000000192541271	2019-10-29 14:58:30.573357	\N	\N	1	\N	422	\N	100000	4	2	0
4600	2019-05-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000115	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	9248	\N	4	2	0
4597	2019-05-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000022915	2019-10-29 14:58:30.573357	\N	\N	1	\N	700	15610	\N	4	2	0
4598	2019-05-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000021082	2019-10-29 14:58:30.573357	\N	\N	1	\N	1186	15000	\N	4	2	0
4596	2019-05-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000020011	2019-10-29 14:58:30.573357	\N	\N	1	\N	313	40781	\N	4	2	0
4593	2019-05-07	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19127091405	VIJBH19127091405	2019-10-29 14:58:30.573357	\N	\N	1	\N	471	50000	\N	4	2	0
4595	2019-05-07	NEFT CR-BARB0KHURJA-J K TRADERS-J P ENTERPRISES-BARBX19127593849	BARBX19127593849	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	103800	\N	4	2	0
4604	2019-05-08	NEFT CR-UTIB0000624-JAI BHAWANI KIRANA STORE-JP ENTERPRISES-AXMB191285310249	AXMB191285310249	2019-10-29 14:58:30.573357	\N	\N	1	\N	52	3816	\N	4	2	0
4610	2019-05-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000078	2019-10-29 14:58:30.573357	\N	\N	1	\N	1094	11437	\N	4	2	0
4611	2019-05-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121346	2019-10-29 14:58:30.573357	\N	\N	1	\N	55	12001	\N	4	2	0
4609	2019-05-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000388301	2019-10-29 14:58:30.573357	\N	\N	1	\N	359	15318	\N	4	2	0
4608	2019-05-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001318	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	18409	\N	4	2	0
4607	2019-05-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123144	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	25000	\N	4	2	0
4602	2019-05-08	FT - CR - 50100205755921 - PREETI SINGH	0000000000000036	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	29296	\N	4	2	0
4603	2019-05-08	CHQ DEP RET CHGS 010519-MIR1912741486526	0000000000510229	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4606	2019-05-08	NEFT CR-PUNB0656400-GOYAL TRADERS-J P ENTERPRISES-PUNBH19128329775	PUNBH19128329775	2019-10-29 14:58:30.573357	\N	\N	1	\N	920	103800	\N	4	2	0
4623	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001281	2019-10-29 14:58:30.573357	\N	\N	1	\N	140	3420	\N	4	2	0
4622	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000488	2019-10-29 14:58:30.573357	\N	\N	1	\N	661	7346	\N	4	2	0
4616	2019-05-09	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19129244622	IOBAN19129244622	2019-10-29 14:58:30.573357	\N	\N	1	\N	30	8298	\N	4	2	0
4612	2019-05-09	50200027549434-TPT-PLAX PAYMENT J P	0000000147582585	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	12191	\N	4	2	0
4621	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000022916	2019-10-29 14:58:30.573357	\N	\N	1	\N	700	15610	\N	4	2	0
4620	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001319	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	17655	\N	4	2	0
4619	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387467	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	23473	\N	4	2	0
4618	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000709	2019-10-29 14:58:30.573357	\N	\N	1	\N	391	29573	\N	4	2	0
4639	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000967146	2019-10-29 14:58:30.573357	\N	\N	1	\N	553	2835	\N	4	2	0
4638	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315627	2019-10-29 14:58:30.573357	\N	\N	1	\N	35	5595	\N	4	2	0
4625	2019-05-10	FT - CR - 02782560000772 - DHARMA FOOD JUNCTION	0000000000000398	2019-10-29 14:58:30.573357	\N	\N	1	\N	25	7216	\N	4	2	0
4637	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000360335	2019-10-29 14:58:30.573357	\N	\N	1	\N	747	7466	\N	4	2	0
4636	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123603	2019-10-29 14:58:30.573357	\N	\N	1	\N	68	7922	\N	4	2	0
4634	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000901421	2019-10-29 14:58:30.573357	\N	\N	1	\N	264	11817	\N	4	2	0
4633	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000400073	2019-10-29 14:58:30.573357	\N	\N	1	\N	78	21381	\N	4	2	0
4632	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992649	2019-10-29 14:58:30.573357	\N	\N	1	\N	23	22959	\N	4	2	0
4631	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071671	2019-10-29 14:58:30.573357	\N	\N	1	\N	31	23233	\N	4	2	0
4624	2019-05-10	IMPS-913010409051-K K STORE-HDFC-XXXXXXXXXX1250-	0000913010409051	2019-10-29 14:58:30.573357	\N	\N	1	\N	918	31672	\N	4	2	0
4630	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000907144	2019-10-29 14:58:30.573357	\N	\N	1	\N	40	32653	\N	4	2	0
4629	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000897	2019-10-29 14:58:30.573357	\N	\N	1	\N	126	42730	\N	4	2	0
4628	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008719	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	51066	\N	4	2	0
4627	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254636	2019-10-29 14:58:30.573357	\N	\N	1	\N	1162	67787	\N	4	2	0
4626	2019-05-10	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010804	2019-10-29 14:58:30.573357	\N	\N	1	\N	97	116640	\N	4	2	0
4641	2019-05-11	UPI-GUPTA GROCERY STORE-8744800800@YBL-BARB0GNOIDA-913128378150-PAYMENT FROM PHONE	0000913114875809	2019-10-29 14:58:30.573357	\N	\N	1	\N	12	10000	\N	4	2	0
4640	2019-05-11	IMPS-913110181549-35959771-HDFC-XXXXXXXX8519-	0000913110181549	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	2400	\N	4	2	0
4642	2019-05-13	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19133605492	KKBKH19133605492	2019-10-29 14:58:30.573357	\N	\N	1	\N	1243	7895	\N	4	2	0
4648	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397121	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	23438	\N	4	2	0
4647	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000630575	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	94745	\N	4	2	0
4645	2019-05-13	RTGS CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-YESBR52019051363058881	YESBR52019051363058881	2019-10-29 14:58:30.573357	\N	\N	1	\N	1070	250320	\N	4	2	0
4601	2019-05-08	50200004799122-TPT-J P ENT 28APR BILL	0000000235236007	2019-10-29 14:58:30.573357	\N	\N	1	\N	94	15052	\N	4	2	0
4594	2019-05-07	HB3142NR1000009999-STP-GODREJ	IB07143700960138	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	31729.119999999999	4	2	0
4605	2019-05-08	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000021082	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	15000	4	2	0
4617	2019-05-09	HB3142NR1000009999-STP-GODREJ	IB09175437590247	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	20000	4	2	0
4615	2019-05-09	HB3142NR1000009999-STP-GODREJ	IB09164636948099	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	200000	4	2	0
4613	2019-05-09	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019050977421837-RED BULL	HDFCR52019050977421837	2019-10-29 14:58:30.573357	\N	\N	1	\N	1251	\N	300000	4	2	0
4614	2019-05-09	ACH D- MONDELEZ INDIA FOODS-DB35930381	0000009600697188	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	644124.119999999995	4	2	0
4646	2019-05-13	HB3142NR1000009999-STP-GODREJ	IB13165547109878	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	45000	4	2	0
4644	2019-05-13	ACH D- MONDELEZ INDIA FOODS-DB35950634	0000009660235394	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	178744.899999999994	4	2	0
4643	2019-05-13	HB3142NR1000009999-STP-GODREJ	IB13152132355560	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	235000	4	2	0
4659	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000407422	2019-10-29 14:58:30.573357	\N	\N	1	\N	1129	3141	\N	4	2	0
4658	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000452362	2019-10-29 14:58:30.573357	\N	\N	1	\N	306	3696	\N	4	2	0
4657	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382334	2019-10-29 14:58:30.573357	\N	\N	1	\N	773	4096	\N	4	2	0
4656	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000370457	2019-10-29 14:58:30.573357	\N	\N	1	\N	101	5809	\N	4	2	0
4655	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000070	2019-10-29 14:58:30.573357	\N	\N	1	\N	17	6452	\N	4	2	0
4654	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027881	2019-10-29 14:58:30.573357	\N	\N	1	\N	24	10110	\N	4	2	0
4653	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000727398	2019-10-29 14:58:30.573357	\N	\N	1	\N	1065	10618	\N	4	2	0
4652	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000884	2019-10-29 14:58:30.573357	\N	\N	1	\N	701	11477	\N	4	2	0
4651	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000622037	2019-10-29 14:58:30.573357	\N	\N	1	\N	34	12812	\N	4	2	0
4650	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038169	2019-10-29 14:58:30.573357	\N	\N	1	\N	5	19587	\N	4	2	0
4649	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000020000	2019-10-29 14:58:30.573357	\N	\N	1	\N	317	22542	\N	4	2	0
4668	2019-05-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000017603	2019-10-29 14:58:30.573357	\N	\N	1	\N	1057	9991	\N	4	2	0
4667	2019-05-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058210	2019-10-29 14:58:30.573357	\N	\N	1	\N	1006	12289	\N	4	2	0
4666	2019-05-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000020017	2019-10-29 14:58:30.573357	\N	\N	1	\N	313	18144	\N	4	2	0
4665	2019-05-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029147	2019-10-29 14:58:30.573357	\N	\N	1	\N	46	22580	\N	4	2	0
4664	2019-05-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000907149	2019-10-29 14:58:30.573357	\N	\N	1	\N	40	26482	\N	4	2	0
4663	2019-05-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254860	2019-10-29 14:58:30.573357	\N	\N	1	\N	19	29290	\N	4	2	0
4669	2019-05-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259182	2019-10-29 14:58:30.573357	\N	\N	1	\N	1131	115529	\N	4	2	0
4661	2019-05-14	CHQ DEP RET CHGS 080519-MIR1913249432231	0000000000021082	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4673	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002331	2019-10-29 14:58:30.573357	\N	\N	1	\N	1061	5000	\N	4	2	0
4674	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000546	2019-10-29 14:58:30.573357	\N	\N	1	\N	1081	5882	\N	4	2	0
4672	2019-05-15	IMPS-913518021850-OM SHANTI MEDICAL ST-HDFC-XXXXXXXXXXXX1728-	0000913518021850	2019-10-29 14:58:30.573357	\N	\N	1	\N	567	7112	\N	4	2	0
4675	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000593111	2019-10-29 14:58:30.573357	\N	\N	1	\N	77	8000	\N	4	2	0
4676	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000380	2019-10-29 14:58:30.573357	\N	\N	1	\N	9	9996	\N	4	2	0
4677	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108400	2019-10-29 14:58:30.573357	\N	\N	1	\N	64	12708	\N	4	2	0
4678	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000022917	2019-10-29 14:58:30.573357	\N	\N	1	\N	700	15610	\N	4	2	0
4679	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000050532	2019-10-29 14:58:30.573357	\N	\N	1	\N	59	27566	\N	4	2	0
4680	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000400689	2019-10-29 14:58:30.573357	\N	\N	1	\N	1094	32228	\N	4	2	0
4681	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000388291	2019-10-29 14:58:30.573357	\N	\N	1	\N	359	35656	\N	4	2	0
4682	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123783	2019-10-29 14:58:30.573357	\N	\N	1	\N	56	40622	\N	4	2	0
4683	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001450	2019-10-29 14:58:30.573357	\N	\N	1	\N	81	54889	\N	4	2	0
4684	2019-05-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000124718	2019-10-29 14:58:30.573357	\N	\N	1	\N	656	66312	\N	4	2	0
4690	2019-05-16	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19136635416	IOBAN19136635416	2019-10-29 14:58:30.573357	\N	\N	1	\N	30	1510	\N	4	2	0
4686	2019-05-16	IMPS-913611566206-SHITALA PRASAD-HDFC-XXXXXXXX7705-	0000913611566206	2019-10-29 14:58:30.573357	\N	\N	1	\N	1168	1975	\N	4	2	0
4685	2019-05-16	IMPS-913611556721-SHITALA PRASAD-HDFC-XXXXXXXX7705-	0000913611556721	2019-10-29 14:58:30.573357	\N	\N	1	\N	1168	2000	\N	4	2	0
4698	2019-05-16	IMPS-913617145567-GROWGREEN PRODUCTS-HDFC-XXXXXXXXXXX0684-GROWGREEN	0000913617145567	2019-10-29 14:58:30.573357	\N	\N	1	\N	71	5331	\N	4	2	0
4687	2019-05-16	FT - CR - 50200031829519 - PAWAN CHAURASIA PAAN SHOP	0000000000000138	2019-10-29 14:58:30.573357	\N	\N	1	\N	1181	11001	\N	4	2	0
4697	2019-05-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126577	2019-10-29 14:58:30.573357	\N	\N	1	\N	1040	5534	\N	4	2	0
4696	2019-05-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000495	2019-10-29 14:58:30.573357	\N	\N	1	\N	661	12984	\N	4	2	0
4695	2019-05-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000145567	2019-10-29 14:58:30.573357	\N	\N	1	\N	14	15531	\N	4	2	0
4694	2019-05-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387477	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	30000	\N	4	2	0
4693	2019-05-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000637	2019-10-29 14:58:30.573357	\N	\N	1	\N	98	61499	\N	4	2	0
4692	2019-05-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000997492	2019-10-29 14:58:30.573357	\N	\N	1	\N	434	63735	\N	4	2	0
4700	2019-05-16	CHQ DEP - MICR CLG - NOIDA WBO	0000000000453841	2019-10-29 14:58:30.573357	\N	\N	1	\N	91	95227	\N	4	2	0
4691	2019-05-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000769	2019-10-29 14:58:30.573357	\N	\N	1	\N	908	67011	\N	4	2	0
4703	2019-05-17	FT - CR - 02782560000772 - DHARMA FOOD JUNCTION	0000000000000402	2019-10-29 14:58:30.573357	\N	\N	1	\N	25	6379	\N	4	2	0
4704	2019-05-17	UPI-AMIT AGARWAL SO MKAG-9999900212@UPI-ORBC0100526-913710259443-NO REMARKS	0000913710270562	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	20000	\N	4	2	0
4705	2019-05-17	8201356986-16 05 2019-HD03123849	0000905178130913	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	188137.040000000008	\N	4	2	0
4699	2019-05-16	50200004799122-TPT-J P ENT 5MAY BILL	0000000225720185	2019-10-29 14:58:30.573357	\N	\N	1	\N	94	26006	\N	4	2	0
4670	2019-05-15	50100051672149-TPT-DRAWINGS	0000000406087645	2019-10-29 14:58:30.573357	\N	\N	1	\N	1258	\N	25000	4	2	0
4702	2019-05-16	CHQ DEP RET- CHEQUE IRREGULARLY DRAWN	0000000000123783	2019-10-29 14:58:30.573357	\N	\N	1	\N	56	\N	40622	4	2	0
4689	2019-05-16	HB3142NR1000009999-STP-GODREJ	IB16163127688921	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	100000	4	2	0
4688	2019-05-16	ACH D- MONDELEZ INDIA FOODS-DB36000270	0000009733635520	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	484113.150000000023	4	2	0
4701	2019-05-16	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000593111	2019-10-29 14:58:30.573357	\N	\N	1	\N	77	\N	8000	4	2	0
4720	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000312057	2019-10-29 14:58:30.573357	\N	\N	1	\N	67	4986	\N	4	2	0
4719	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000814292	2019-10-29 14:58:30.573357	\N	\N	1	\N	62	6093	\N	4	2	0
4718	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000593112	2019-10-29 14:58:30.573357	\N	\N	1	\N	77	7703	\N	4	2	0
4717	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957603	2019-10-29 14:58:30.573357	\N	\N	1	\N	910	10835	\N	4	2	0
4716	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001344	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	15813	\N	4	2	0
4707	2019-05-17	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19137013522	VIJBH19137013522	2019-10-29 14:58:30.573357	\N	\N	1	\N	471	21013	\N	4	2	0
4715	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992658	2019-10-29 14:58:30.573357	\N	\N	1	\N	23	24065	\N	4	2	0
4714	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000400102	2019-10-29 14:58:30.573357	\N	\N	1	\N	78	34492	\N	4	2	0
4713	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123036	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	35731	\N	4	2	0
4711	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008791	2019-10-29 14:58:30.573357	\N	\N	1	\N	105	75627	\N	4	2	0
4712	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000102313	2019-10-29 14:58:30.573357	\N	\N	1	\N	1109	61334	\N	4	2	0
4710	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000014035	2019-10-29 14:58:30.573357	\N	\N	1	\N	57	88827	\N	4	2	0
4709	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000322	2019-10-29 14:58:30.573357	\N	\N	1	\N	126	105439	\N	4	2	0
4708	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003432	2019-10-29 14:58:30.573357	\N	\N	1	\N	97	180117	\N	4	2	0
4724	2019-05-20	IMPS-914011590534-K K STORE-HDFC-XXXXXXXXXX1250-	0000914011590534	2019-10-29 14:58:30.573357	\N	\N	1	\N	918	18606	\N	4	2	0
4729	2019-05-20	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N140190237860448	N140190237860448	2019-10-29 14:58:30.573357	\N	\N	1	\N	1070	256861	\N	4	2	0
4737	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000986645	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	1042	\N	4	2	0
4738	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000142894	2019-10-29 14:58:30.573357	\N	\N	1	\N	620	3707	\N	4	2	0
4749	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000452372	2019-10-29 14:58:30.573357	\N	\N	1	\N	306	2105	\N	4	2	0
4739	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000097	2019-10-29 14:58:30.573357	\N	\N	1	\N	501	4000	\N	4	2	0
4736	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000615561	2019-10-29 14:58:30.573357	\N	\N	1	\N	513	5082	\N	4	2	0
4734	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315630	2019-10-29 14:58:30.573357	\N	\N	1	\N	35	5143	\N	4	2	0
4722	2019-05-18	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000593112	2019-10-29 14:58:30.573357	\N	\N	1	\N	77	\N	7703	4	2	0
4726	2019-05-20	CHQ DEP RET CHGS 180519-MIR1913965206556	0000000000593112	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4725	2019-05-20	CHQ DEP RET CHGS 160519-MIR1913863788173	0000000000593111	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4727	2019-05-20	HB3142NR1000009999-STP-GODREJ	IB20144720574096	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	150000	4	2	0
4728	2019-05-20	MARICO4254-STP-MARICO	IB20144751965067	2019-10-29 14:58:30.573357	\N	\N	1	\N	1252	\N	200000	4	2	0
4723	2019-05-20	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019052078799342-RED BULL	HDFCR52019052078799342	2019-10-29 14:58:30.573357	\N	\N	1	\N	1251	\N	300000	4	2	0
4731	2019-05-21	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19141692543	KKBKH19141692543	2019-10-29 14:58:30.573357	\N	\N	1	\N	1243	7260	\N	4	2	0
4735	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000014	2019-10-29 14:58:30.573357	\N	\N	1	\N	705	6478	\N	4	2	0
4745	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000166711	2019-10-29 14:58:30.573357	\N	\N	1	\N	87	6836	\N	4	2	0
4746	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001370	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	8576	\N	4	2	0
4750	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001371	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	10909	\N	4	2	0
4747	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027890	2019-10-29 14:58:30.573357	\N	\N	1	\N	24	11862	\N	4	2	0
4748	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001076	2019-10-29 14:58:30.573357	\N	\N	1	\N	60	13258	\N	4	2	0
4751	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000558	2019-10-29 14:58:30.573357	\N	\N	1	\N	1081	13791	\N	4	2	0
4743	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000401	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	16099	\N	4	2	0
4752	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387478	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	16189	\N	4	2	0
4744	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000622040	2019-10-29 14:58:30.573357	\N	\N	1	\N	34	17462	\N	4	2	0
4740	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259227	2019-10-29 14:58:30.573357	\N	\N	1	\N	1131	20857	\N	4	2	0
4753	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000907154	2019-10-29 14:58:30.573357	\N	\N	1	\N	40	23774	\N	4	2	0
4741	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672559	2019-10-29 14:58:30.573357	\N	\N	1	\N	1260	27595	\N	4	2	0
4742	2019-05-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000997554	2019-10-29 14:58:30.573357	\N	\N	1	\N	434	54271	\N	4	2	0
4732	2019-05-21	ACH D- MONDELEZ INDIA FOODS-DB36030288	0000009803133979	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	178344.459999999992	4	2	0
4733	2019-05-21	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N141190831033428-COLGATE	N141190831033428	2019-10-29 14:58:30.573357	\N	\N	1	\N	1254	\N	228000	4	2	0
4761	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000383	2019-10-29 14:58:30.573357	\N	\N	1	\N	9	8868	\N	4	2	0
4760	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000353590	2019-10-29 14:58:30.573357	\N	\N	1	\N	46	10473	\N	4	2	0
4755	2019-05-22	IMPS-914213136629-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000914213136629	2019-10-29 14:58:30.573357	\N	\N	1	\N	586	13274	\N	4	2	0
4759	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000869506	2019-10-29 14:58:30.573357	\N	\N	1	\N	31	22053	\N	4	2	0
4758	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108401	2019-10-29 14:58:30.573357	\N	\N	1	\N	64	29362	\N	4	2	0
4757	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000388313	2019-10-29 14:58:30.573357	\N	\N	1	\N	359	34671	\N	4	2	0
4756	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123797	2019-10-29 14:58:30.573357	\N	\N	1	\N	56	42489	\N	4	2	0
4754	2019-05-22	50200004799122-TPT-J P ENT 12MAY BILL	0000000175280809	2019-10-29 14:58:30.573357	\N	\N	1	\N	94	50821	\N	4	2	0
4706	2019-05-17	DD ISSUE  - HDFC BANK LT - NEW DELHI -  - 007718 - 092713006917 - *****DABUR INDIA LTD*****	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1255	\N	400000	4	2	0
4770	2019-05-22	IMPS-914218184968-OM SHANTI MEDICAL ST-HDFC-XXXXXXXXXXXX1728-	0000914218184968	2019-10-29 14:58:30.573357	\N	\N	1	\N	567	1933	\N	4	2	0
4766	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259893	2019-10-29 14:58:30.573357	\N	\N	1	\N	1192	3880	\N	4	2	0
4765	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000370462	2019-10-29 14:58:30.573357	\N	\N	1	\N	101	5552	\N	4	2	0
4764	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000948	2019-10-29 14:58:30.573357	\N	\N	1	\N	487	6571	\N	4	2	0
4763	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000124725	2019-10-29 14:58:30.573357	\N	\N	1	\N	656	6701	\N	4	2	0
4762	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001067	2019-10-29 14:58:30.573357	\N	\N	1	\N	1105	7137	\N	4	2	0
4769	2019-05-22	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000014	2019-10-29 14:58:30.573357	\N	\N	1	\N	705	\N	6478	4	2	0
4768	2019-05-22	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000558	2019-10-29 14:58:30.573357	\N	\N	1	\N	1081	\N	13791	4	2	0
4783	2019-05-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126590	2019-10-29 14:58:30.573357	\N	\N	1	\N	1040	3920	\N	4	2	0
4782	2019-05-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000105088	2019-10-29 14:58:30.573357	\N	\N	1	\N	1151	5244	\N	4	2	0
4781	2019-05-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002349	2019-10-29 14:58:30.573357	\N	\N	1	\N	1061	6607	\N	4	2	0
4780	2019-05-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957610	2019-10-29 14:58:30.573357	\N	\N	1	\N	1065	8592	\N	4	2	0
4773	2019-05-23	FT - CR - 50100205755921 - PREETI SINGH	0000000000000050	2019-10-29 14:58:30.573357	\N	\N	1	\N	787	17429	\N	4	2	0
4779	2019-05-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001293	2019-10-29 14:58:30.573357	\N	\N	1	\N	140	24786	\N	4	2	0
4778	2019-05-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000125829	2019-10-29 14:58:30.573357	\N	\N	1	\N	56	40622	\N	4	2	0
4777	2019-05-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000400133	2019-10-29 14:58:30.573357	\N	\N	1	\N	78	60512	\N	4	2	0
4775	2019-05-23	50200027549434-TPT-BILL 1235 J P	0000000389212834	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	5427	\N	4	2	0
4772	2019-05-23	CHQBK_COURIER_RETURN 05/13/19 150519-MIR1914270397154	MIR1914270397154	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	59	4	2	0
4774	2019-05-23	ACH D- MONDELEZ INDIA FOODS-DB36070479	0000009848433265	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	196483.899999999994	4	2	0
4776	2019-05-23	FT-N3058220156601310-CMS_ECOLL_DABUR INDIA LTD E-CM	0000FT1431636658	2019-10-29 14:58:30.573357	\N	\N	1	\N	1255	\N	200000	4	2	0
4771	2019-05-23	MARICO4254-STP-MARICO	IB23132743373524	2019-10-29 14:58:30.573357	\N	\N	1	\N	1252	\N	300000	4	2	0
4794	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000407432	2019-10-29 14:58:30.573357	\N	\N	1	\N	1129	1840	\N	4	2	0
4793	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122775	2019-10-29 14:58:30.573357	\N	\N	1	\N	75	3099	\N	4	2	0
4785	2019-05-24	FT - CR - 02782560000772 - DHARMA FOOD JUNCTION	0000000000000408	2019-10-29 14:58:30.573357	\N	\N	1	\N	25	4027	\N	4	2	0
4786	2019-05-24	IMPS-914417418925-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000914417418925	2019-10-29 14:58:30.573357	\N	\N	1	\N	633	4808	\N	4	2	0
4792	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000125758	2019-10-29 14:58:30.573357	\N	\N	1	\N	1134	10050	\N	4	2	0
4791	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000630579	2019-10-29 14:58:30.573357	\N	\N	1	\N	1261	10430	\N	4	2	0
4790	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000334	2019-10-29 14:58:30.573357	\N	\N	1	\N	126	10595	\N	4	2	0
4789	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121356	2019-10-29 14:58:30.573357	\N	\N	1	\N	55	16456	\N	4	2	0
4788	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957613	2019-10-29 14:58:30.573357	\N	\N	1	\N	910	27754	\N	4	2	0
4787	2019-05-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008856	2019-10-29 14:58:30.573357	\N	\N	1	\N	105	58919	\N	4	2	0
4784	2019-05-24	CHQ DEP RET- CONNECTIVITY NOT ESTABLISHE	0000000000400133	2019-10-29 14:58:30.573357	\N	\N	1	\N	78	\N	60512	4	2	0
4797	2019-05-25	UPI-KULDEEP-8860682190@PAYTM-PUNB0460300-914534293634-NA	0000914510879865	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	6020	\N	4	2	0
4796	2019-05-25	IMPS-914509988545-35959771-HDFC-XXXXXXXX8519-	0000914509988545	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	7000	\N	4	2	0
4805	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000426945	2019-10-29 14:58:30.573357	\N	\N	1	\N	100	2778	\N	4	2	0
4806	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000120240	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	3465	\N	4	2	0
4807	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123623	2019-10-29 14:58:30.573357	\N	\N	1	\N	663	4700	\N	4	2	0
4808	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672579	2019-10-29 14:58:30.573357	\N	\N	1	\N	1260	5351	\N	4	2	0
4809	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000128849	2019-10-29 14:58:30.573357	\N	\N	1	\N	5	5810	\N	4	2	0
4810	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000904	2019-10-29 14:58:30.573357	\N	\N	1	\N	95	5949	\N	4	2	0
4811	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000622045	2019-10-29 14:58:30.573357	\N	\N	1	\N	34	7694	\N	4	2	0
4803	2019-05-27	CHQ DEP - TRANSFER OW 2 - NOIDA WBO	0000000000000007	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	8527	\N	4	2	0
4812	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000005035	2019-10-29 14:58:30.573357	\N	\N	1	\N	111	10000	\N	4	2	0
4813	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000004	2019-10-29 14:58:30.573357	\N	\N	1	\N	598	10085	\N	4	2	0
4814	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000155	2019-10-29 14:58:30.573357	\N	\N	1	\N	1066	12629	\N	4	2	0
4815	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027898	2019-10-29 14:58:30.573357	\N	\N	1	\N	24	13286	\N	4	2	0
4817	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000615560	2019-10-29 14:58:30.573357	\N	\N	1	\N	513	20139	\N	4	2	0
4816	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000570	2019-10-29 14:58:30.573357	\N	\N	1	\N	1081	14171	\N	4	2	0
4818	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397177	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	28097	\N	4	2	0
4800	2019-05-27	CHQ DEP - MICR - MICR CLG - NOIDA WBO	0000000000400133	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	60512	\N	4	2	0
4804	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001548	2019-10-29 14:58:30.573357	\N	\N	1	\N	81	95206	\N	4	2	0
4799	2019-05-27	CHQ DEP RET CHGS 220519-MIR1914472538640	0000000000000014	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4798	2019-05-27	CHQ DEP RET CHGS 220519-MIR1914472501986	0000000000000558	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4801	2019-05-27	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N147190834648132-REDBULL	N147190834648132	2019-10-29 14:58:30.573357	\N	\N	1	\N	1251	\N	150000	4	2	0
4802	2019-05-27	HB3142NR1000009999-STP-GODREJ	IB27153058200365	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	250000	4	2	0
4821	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001081	2019-10-29 14:58:30.573357	\N	\N	1	\N	60	47827	\N	4	2	0
4820	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254639	2019-10-29 14:58:30.573357	\N	\N	1	\N	1162	50118	\N	4	2	0
4829	2019-05-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002368	2019-10-29 14:58:30.573357	\N	\N	1	\N	1061	3199	\N	4	2	0
4828	2019-05-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000020247	2019-10-29 14:58:30.573357	\N	\N	1	\N	460	7616	\N	4	2	0
4823	2019-05-28	NEFT CR-UTIB0000624-JAI BHAWANI KIRANA STORE-JP ENTERPRISES-AXMB191481660964	AXMB191481660964	2019-10-29 14:58:30.573357	\N	\N	1	\N	52	10717	\N	4	2	0
4827	2019-05-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000055	2019-10-29 14:58:30.573357	\N	\N	1	\N	1262	21137	\N	4	2	0
4826	2019-05-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254881	2019-10-29 14:58:30.573357	\N	\N	1	\N	19	41410	\N	4	2	0
4825	2019-05-28	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000004	2019-10-29 14:58:30.573357	\N	\N	1	\N	598	\N	10085	4	2	0
4824	2019-05-28	ACH D- MONDELEZ INDIA FOODS-DB36120666	0000009922132199	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	391105.059999999998	4	2	0
4837	2019-05-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000017605	2019-10-29 14:58:30.573357	\N	\N	1	\N	1057	4282	\N	4	2	0
4835	2019-05-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001398	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	5365	\N	4	2	0
4834	2019-05-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000388	2019-10-29 14:58:30.573357	\N	\N	1	\N	9	7859	\N	4	2	0
4833	2019-05-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108406	2019-10-29 14:58:30.573357	\N	\N	1	\N	64	7913	\N	4	2	0
4832	2019-05-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000232276	2019-10-29 14:58:30.573357	\N	\N	1	\N	62	8870	\N	4	2	0
4836	2019-05-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000388324	2019-10-29 14:58:30.573357	\N	\N	1	\N	359	17155	\N	4	2	0
4831	2019-05-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000087	2019-10-29 14:58:30.573357	\N	\N	1	\N	17	21407	\N	4	2	0
4847	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001051	2019-10-29 14:58:30.573357	\N	\N	1	\N	140	4504	\N	4	2	0
4846	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129106	2019-10-29 14:58:30.573357	\N	\N	1	\N	1040	4956	\N	4	2	0
4845	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000593143	2019-10-29 14:58:30.573357	\N	\N	1	\N	77	10000	\N	4	2	0
4844	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000504	2019-10-29 14:58:30.573357	\N	\N	1	\N	661	10887	\N	4	2	0
4843	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001399	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	11998	\N	4	2	0
4842	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957622	2019-10-29 14:58:30.573357	\N	\N	1	\N	910	14123	\N	4	2	0
4841	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000677	2019-10-29 14:58:30.573357	\N	\N	1	\N	98	47554	\N	4	2	0
4840	2019-05-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008920	2019-10-29 14:58:30.573357	\N	\N	1	\N	105	56686	\N	4	2	0
4838	2019-05-30	CHQ DEP RET CHGS 280519-MIR1915079069970	0000000000000004	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4839	2019-05-30	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000232276	2019-10-29 14:58:30.573357	\N	\N	1	\N	62	\N	8870	4	2	0
4854	2019-05-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000820	2019-10-29 14:58:30.573357	\N	\N	1	\N	73	1644	\N	4	2	0
4863	2019-05-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315637	2019-10-29 14:58:30.573357	\N	\N	1	\N	35	2870	\N	4	2	0
4862	2019-05-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122781	2019-10-29 14:58:30.573357	\N	\N	1	\N	75	4638	\N	4	2	0
4861	2019-05-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000034	2019-10-29 14:58:30.573357	\N	\N	1	\N	307	10293	\N	4	2	0
4860	2019-05-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000119774	2019-10-29 14:58:30.573357	\N	\N	1	\N	1042	17358	\N	4	2	0
4848	2019-05-31	IMPS-915110198001-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000915110198001	2019-10-29 14:58:30.573357	\N	\N	1	\N	586	26815	\N	4	2	0
4859	2019-05-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000145573	2019-10-29 14:58:30.573357	\N	\N	1	\N	14	28930	\N	4	2	0
4857	2019-05-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992671	2019-10-29 14:58:30.573357	\N	\N	1	\N	23	33471	\N	4	2	0
4858	2019-05-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000125824	2019-10-29 14:58:30.573357	\N	\N	1	\N	56	32213	\N	4	2	0
4856	2019-05-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122965	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	40455	\N	4	2	0
4855	2019-05-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007174	2019-10-29 14:58:30.573357	\N	\N	1	\N	514	74424	\N	4	2	0
4851	2019-05-31	CASH DEP DADRI	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1244	320000	\N	4	2	0
4853	2019-05-31	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000593143	2019-10-29 14:58:30.573357	\N	\N	1	\N	77	\N	10000	4	2	0
4849	2019-05-31	ACH D- MONDELEZ INDIA FOODS-DB36150533	0000009976817077	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	122642.160000000003	4	2	0
4850	2019-05-31	HB3142NR1000009999-STP-GODREJ	IB31143935086184	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	200000	4	2	0
4852	2019-05-31	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019053180675287-COLGATE	HDFCR52019053180675287	2019-10-29 14:58:30.573357	\N	\N	1	\N	1254	\N	350000	4	2	0
4864	2019-06-01	UPI-GUPTA GROCERY STORE-8744800800@YBL-BARB0GNOIDA-915213403994-PAYMENT FROM PHONE	0000915213185399	2019-10-29 14:58:30.573357	\N	\N	1	\N	12	12705	\N	4	2	0
4867	2019-06-01	CHQ DEP - TRANSFER OW 2 - NOIDA WBO	0000000000000053	2019-10-29 14:58:30.573357	\N	\N	1	\N	787	15000	\N	4	2	0
4868	2019-06-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029833	2019-10-29 14:58:30.573357	\N	\N	1	\N	601	15714	\N	4	2	0
4869	2019-06-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992672	2019-10-29 14:58:30.573357	\N	\N	1	\N	23	20456	\N	4	2	0
4870	2019-06-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000050546	2019-10-29 14:58:30.573357	\N	\N	1	\N	59	35527	\N	4	2	0
4871	2019-06-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000453863	2019-10-29 14:58:30.573357	\N	\N	1	\N	91	118073	\N	4	2	0
4865	2019-06-01	CHQ DEP RET CHGS 300519-MIR1915280915392	0000000000232276	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4866	2019-06-01	ACH D- MONDELEZ INDIA FOODS-DB36160597	0000009994021036	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	124445.270000000004	4	2	0
4873	2019-06-03	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010632	2019-10-29 14:58:30.573357	\N	\N	1	\N	97	42160	\N	4	2	0
4875	2019-06-03	IMPS-915412669951-K K STORE-HDFC-XXXXXXXXXX1250-	0000915412669951	2019-10-29 14:58:30.573357	\N	\N	1	\N	918	16082	\N	4	2	0
4872	2019-06-03	N3058220156601330-STP-	IB03113714661263	2019-10-29 14:58:30.573357	\N	\N	1	\N	1255	\N	1	4	2	0
4874	2019-06-03	FT-N3058220156601330-CMS_ECOLL_DABUR INDIA LTD E-CM	0000000000000451	2019-10-29 14:58:30.573357	\N	\N	1	\N	1255	\N	150000	4	2	0
4822	2019-05-28	50200006539210-TPT-TTC CA TO JP CA	0000000326324804	2019-10-29 14:58:30.573357	\N	\N	1	\N	422	200000	\N	4	2	0
4882	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000452388	2019-10-29 14:58:30.573357	\N	\N	1	\N	306	4075	\N	4	2	0
4881	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000915	2019-10-29 14:58:30.573357	\N	\N	1	\N	95	4844	\N	4	2	0
4880	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003728	2019-10-29 14:58:30.573357	\N	\N	1	\N	101	5002	\N	4	2	0
4879	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254887	2019-10-29 14:58:30.573357	\N	\N	1	\N	19	5303	\N	4	2	0
4893	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000312	2019-10-29 14:58:30.573357	\N	\N	1	\N	1	5588	\N	4	2	0
4892	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027907	2019-10-29 14:58:30.573357	\N	\N	1	\N	24	5623	\N	4	2	0
4891	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000353621	2019-10-29 14:58:30.573357	\N	\N	1	\N	46	6014	\N	4	2	0
4890	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058227	2019-10-29 14:58:30.573357	\N	\N	1	\N	32	6697	\N	4	2	0
4889	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000670	2019-10-29 14:58:30.573357	\N	\N	1	\N	42	11915	\N	4	2	0
4878	2019-06-03	CHQ DEP - MICR CLG - NOIDA WBO	0000000000282415	2019-10-29 14:58:30.573357	\N	\N	1	\N	478	12735	\N	4	2	0
4888	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000312064	2019-10-29 14:58:30.573357	\N	\N	1	\N	67	14487	\N	4	2	0
4887	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000584035	2019-10-29 14:58:30.573357	\N	\N	1	\N	1049	18591	\N	4	2	0
4886	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000615562	2019-10-29 14:58:30.573357	\N	\N	1	\N	513	20139	\N	4	2	0
4885	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001564	2019-10-29 14:58:30.573357	\N	\N	1	\N	81	38631	\N	4	2	0
4884	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000516	2019-10-29 14:58:30.573357	\N	\N	1	\N	86	50785	\N	4	2	0
4877	2019-06-03	ACH D- MONDELEZ INDIA FOODS-DB36170219	0000000018693007	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	132759.329999999987	4	2	0
4909	2019-06-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000373377	2019-10-29 14:58:30.573357	\N	\N	1	\N	42	2826	\N	4	2	0
4908	2019-06-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000102	2019-10-29 14:58:30.573357	\N	\N	1	\N	501	5000	\N	4	2	0
4907	2019-06-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000124108	2019-10-29 14:58:30.573357	\N	\N	1	\N	390	8865	\N	4	2	0
4901	2019-06-04	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19155765804	KKBKH19155765804	2019-10-29 14:58:30.573357	\N	\N	1	\N	1243	10000	\N	4	2	0
4906	2019-06-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957642	2019-10-29 14:58:30.573357	\N	\N	1	\N	1065	11566	\N	4	2	0
4905	2019-06-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000418	2019-10-29 14:58:30.573357	\N	\N	1	\N	1083	17613	\N	4	2	0
4904	2019-06-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000111	2019-10-29 14:58:30.573357	\N	\N	1	\N	313	25523	\N	4	2	0
4903	2019-06-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013784	2019-10-29 14:58:30.573357	\N	\N	1	\N	57	48216	\N	4	2	0
4902	2019-06-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259320	2019-10-29 14:58:30.573357	\N	\N	1	\N	1131	80325	\N	4	2	0
4896	2019-06-04	CASH DEP DADRI	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1244	292000	\N	4	2	0
4895	2019-06-04	EMI 45070519 CHQ S45070519128 061945070519	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1256	\N	69821	4	2	0
4894	2019-06-04	N3058220156601310-STP-DABUR HPC	IB04100224154071	2019-10-29 14:58:30.573357	\N	\N	1	\N	1255	\N	110000	4	2	0
4898	2019-06-04	RTGS DR-DEUT0537PUN-FERRERO INDIA PVT LTD-NETBANK, MUM-HDFCR52019060481148352-COLGATE	HDFCR52019060481148352	2019-10-29 14:58:30.573357	\N	\N	1	\N	1253	\N	472000	4	2	0
4910	2019-06-05	IMPS-915611489825-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-COLGATE	0000915611489825	2019-10-29 14:58:30.573357	\N	\N	1	\N	128	2167	\N	4	2	0
4911	2019-06-05	EMI 52012431 CHQ S52012431119 061952012431	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1257	\N	16495	4	2	0
4914	2019-06-06	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19157350920	IOBAN19157350920	2019-10-29 14:58:30.573357	\N	\N	1	\N	30	4268	\N	4	2	0
4913	2019-06-06	IMPS-915716892912-GROWGREEN PRODUCTS-HDFC-XXXXXXXXXXX0684-GROWGREEN	0000915716892912	2019-10-29 14:58:30.573357	\N	\N	1	\N	71	5000	\N	4	2	0
4916	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000211212	2019-10-29 14:58:30.573357	\N	\N	1	\N	60	5598	\N	4	2	0
4917	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000113357	2019-10-29 14:58:30.573357	\N	\N	1	\N	1264	7452	\N	4	2	0
4918	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000475	2019-10-29 14:58:30.573357	\N	\N	1	\N	342	7614	\N	4	2	0
4919	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000124743	2019-10-29 14:58:30.573357	\N	\N	1	\N	656	8020	\N	4	2	0
4920	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000383	2019-10-29 14:58:30.573357	\N	\N	1	\N	88	10325	\N	4	2	0
4921	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155542	2019-10-29 14:58:30.573357	\N	\N	1	\N	512	10669	\N	4	2	0
4922	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000312065	2019-10-29 14:58:30.573357	\N	\N	1	\N	67	11944	\N	4	2	0
4923	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108409	2019-10-29 14:58:30.573357	\N	\N	1	\N	64	12961	\N	4	2	0
4924	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387496	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	13631	\N	4	2	0
4925	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000022988	2019-10-29 14:58:30.573357	\N	\N	1	\N	700	15041	\N	4	2	0
4926	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121370	2019-10-29 14:58:30.573357	\N	\N	1	\N	55	15366	\N	4	2	0
4927	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000869522	2019-10-29 14:58:30.573357	\N	\N	1	\N	31	18053	\N	4	2	0
4928	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000420044	2019-10-29 14:58:30.573357	\N	\N	1	\N	1074	18097	\N	4	2	0
4929	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000113097	2019-10-29 14:58:30.573357	\N	\N	1	\N	79	21216	\N	4	2	0
4930	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000907160	2019-10-29 14:58:30.573357	\N	\N	1	\N	40	22583	\N	4	2	0
4931	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000125880	2019-10-29 14:58:30.573357	\N	\N	1	\N	56	24253	\N	4	2	0
4915	2019-06-06	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N157190244615700	N157190244615700	2019-10-29 14:58:30.573357	\N	\N	1	\N	1070	83558	\N	4	2	0
4912	2019-06-06	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019060681283584-COLGATE	HDFCR52019060681283584	2019-10-29 14:58:30.573357	\N	\N	1	\N	1254	\N	372000	4	2	0
4883	2019-06-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259902	2019-10-29 14:58:30.573357	\N	\N	1	\N	1192	2214	\N	4	2	0
4899	2019-06-04	50200029853444-TPT-TTC OD TO JP CA	0000000114900786	2019-10-29 14:58:30.573357	\N	\N	1	\N	422	50000	\N	4	2	0
4900	2019-06-04	50200006539210-TPT-TTC CA TO JP CA	0000000114912362	2019-10-29 14:58:30.573357	\N	\N	1	\N	422	150000	\N	4	2	0
4943	2019-06-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000407444	2019-10-29 14:58:30.573357	\N	\N	1	\N	1129	1340	\N	4	2	0
4944	2019-06-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000553709	2019-10-29 14:58:30.573357	\N	\N	1	\N	1261	2188	\N	4	2	0
4945	2019-06-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315640	2019-10-29 14:58:30.573357	\N	\N	1	\N	35	6517	\N	4	2	0
4946	2019-06-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122784	2019-10-29 14:58:30.573357	\N	\N	1	\N	75	6670	\N	4	2	0
4947	2019-06-07	50200004799122-TPT-J P ENT 271	0000000254834401	2019-10-29 14:58:30.573357	\N	\N	1	\N	94	8852	\N	4	2	0
4938	2019-06-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000901441	2019-10-29 14:58:30.573357	\N	\N	1	\N	264	9072	\N	4	2	0
4934	2019-06-07	IMPS-915810146920-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-COLGATE	0000915810146920	2019-10-29 14:58:30.573357	\N	\N	1	\N	586	11289	\N	4	2	0
4939	2019-06-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000022987	2019-10-29 14:58:30.573357	\N	\N	1	\N	700	15041	\N	4	2	0
4940	2019-06-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000622053	2019-10-29 14:58:30.573357	\N	\N	1	\N	34	18257	\N	4	2	0
4942	2019-06-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000927	2019-10-29 14:58:30.573357	\N	\N	1	\N	126	70025	\N	4	2	0
4941	2019-06-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397645	2019-10-29 14:58:30.573357	\N	\N	1	\N	78	55818	\N	4	2	0
4948	2019-06-07	NEFT CR-SBIN0006070-FUTURE RETAIL LIMITED-J P ENTERPRISES-SBIN619158631926	SBIN619158631926	2019-10-29 14:58:30.573357	\N	\N	1	\N	852	114591.639999999999	\N	4	2	0
4936	2019-06-07	N3058220156601310-STP-DABUR HPC	IB07145453108483	2019-10-29 14:58:30.573357	\N	\N	1	\N	1255	\N	170000	4	2	0
4935	2019-06-07	MARICO4254-STP-MARICO	IB07142747339433	2019-10-29 14:58:30.573357	\N	\N	1	\N	1252	\N	200000	4	2	0
4949	2019-06-08	IMPS-915911112493-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000915911112493	2019-10-29 14:58:30.573357	\N	\N	1	\N	633	8381	\N	4	2	0
4950	2019-06-10	NEFT CR-UTIB0000624-SHRI JEE GENERAL STORE-JAYPEE ENTERPRISES-AXMB191615883238	AXMB191615883238	2019-10-29 14:58:30.573357	\N	\N	1	\N	365	11048	\N	4	2	0
4982	2019-06-11	ACH D- MONDELEZ INDIA FOODS-DB36260755	0000000184213888	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	129031.419999999998	4	2	0
4983	2019-06-11	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19162631246	KKBKH19162631246	2019-10-29 14:58:30.573357	\N	\N	1	\N	1243	10000	\N	4	2	0
4988	2019-06-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001448	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	15000	\N	4	2	0
4984	2019-06-11	8201452917-10 06 2019-HD03123849	0000906102075454	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	22019	\N	4	2	0
4989	2019-06-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000922	2019-10-29 14:58:30.573357	\N	\N	1	\N	95	16510	\N	4	2	0
4981	2019-06-11	CHQ DEP RET CHGS 310519-MIR1915583711661	0000000000593143	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
4979	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123631	2019-10-29 14:58:30.573357	\N	\N	1	\N	663	994	\N	4	2	0
4978	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000145863	2019-10-29 14:58:30.573357	\N	\N	1	\N	620	1785	\N	4	2	0
4977	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000032472	2019-10-29 14:58:30.573357	\N	\N	1	\N	914	1943	\N	4	2	0
4976	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000019	2019-10-29 14:58:30.573357	\N	\N	1	\N	162	2297	\N	4	2	0
4975	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259912	2019-10-29 14:58:30.573357	\N	\N	1	\N	1192	2382	\N	4	2	0
4974	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000195276	2019-10-29 14:58:30.573357	\N	\N	1	\N	567	3267	\N	4	2	0
4973	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000105	2019-10-29 14:58:30.573357	\N	\N	1	\N	501	3800	\N	4	2	0
4972	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000717754	2019-10-29 14:58:30.573357	\N	\N	1	\N	747	5355	\N	4	2	0
4971	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000076	2019-10-29 14:58:30.573357	\N	\N	1	\N	1039	5964	\N	4	2	0
4970	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003740	2019-10-29 14:58:30.573357	\N	\N	1	\N	101	6141	\N	4	2	0
4969	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000168	2019-10-29 14:58:30.573357	\N	\N	1	\N	1066	6511	\N	4	2	0
4968	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058231	2019-10-29 14:58:30.573357	\N	\N	1	\N	32	6952	\N	4	2	0
4967	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000426947	2019-10-29 14:58:30.573357	\N	\N	1	\N	100	6959	\N	4	2	0
4966	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382340	2019-10-29 14:58:30.573357	\N	\N	1	\N	773	7995	\N	4	2	0
4965	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000122244	2019-10-29 14:58:30.573357	\N	\N	1	\N	89	8220	\N	4	2	0
4964	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001450	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	8385	\N	4	2	0
4962	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000394	2019-10-29 14:58:30.573357	\N	\N	1	\N	9	11468	\N	4	2	0
4961	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000145859	2019-10-29 14:58:30.573357	\N	\N	1	\N	620	11945	\N	4	2	0
4960	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000351646	2019-10-29 14:58:30.573357	\N	\N	1	\N	508	15000	\N	4	2	0
4959	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000873	2019-10-29 14:58:30.573357	\N	\N	1	\N	1010	15262	\N	4	2	0
4958	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042057	2019-10-29 14:58:30.573357	\N	\N	1	\N	102	16150	\N	4	2	0
4980	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000054974	2019-10-29 14:58:30.573357	\N	\N	1	\N	1122	16590	\N	4	2	0
4957	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000907166	2019-10-29 14:58:30.573357	\N	\N	1	\N	40	17400	\N	4	2	0
4956	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000869523	2019-10-29 14:58:30.573357	\N	\N	1	\N	31	19282	\N	4	2	0
4955	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254891	2019-10-29 14:58:30.573357	\N	\N	1	\N	19	25000	\N	4	2	0
4954	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397215	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	30000	\N	4	2	0
4953	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123056	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	32473	\N	4	2	0
4952	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992683	2019-10-29 14:58:30.573357	\N	\N	1	\N	23	32510	\N	4	2	0
4951	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000104509	2019-10-29 14:58:30.573357	\N	\N	1	\N	14	57008	\N	4	2	0
4986	2019-06-11	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000019	2019-10-29 14:58:30.573357	\N	\N	1	\N	162	\N	2297	4	2	0
4985	2019-06-11	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000195276	2019-10-29 14:58:30.573357	\N	\N	1	\N	28	\N	3267	4	2	0
4987	2019-06-11	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000054974	2019-10-29 14:58:30.573357	\N	\N	1	\N	1122	\N	16590	4	2	0
4933	2019-06-07	CHQ PAID-MICR CTS-NO-MANOJ KUMAR	0000000000000458	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	\N	10000	4	2	0
4990	2019-06-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000198357	2019-10-29 14:58:30.573357	\N	\N	1	\N	46	22877	\N	4	2	0
4992	2019-06-12	50200004799122-TPT-J P ENT 2JUN BILL	0000000498825526	2019-10-29 14:58:30.573357	\N	\N	1	\N	94	28492	\N	4	2	0
4993	2019-06-12	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000510268	2019-10-29 14:58:30.573357	\N	\N	1	\N	705	\N	2568	4	2	0
4998	2019-06-13	IMPS-916410120346-SHITALA PRASAD-HDFC-XXXXXXXX7705-	0000916410120346	2019-10-29 14:58:30.573357	\N	\N	1	\N	1168	685	\N	4	2	0
4999	2019-06-13	IMPS-916413160397-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000916413160397	2019-10-29 14:58:30.573357	\N	\N	1	\N	586	30983	\N	4	2	0
5000	2019-06-13	MARICO4254-STP-MARICO	IB13154726867997	2019-10-29 14:58:30.573357	\N	\N	1	\N	1252	\N	250000	4	2	0
5001	2019-06-13	HB3142NR1000009999-STP-GODREJ	IB13173033744631	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	260000	4	2	0
5004	2019-06-14	POS REF 436303******9204-06/14 ANIL AUTO	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	25.3900000000000006	\N	4	2	0
5003	2019-06-14	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19165283260	IOBAN19165283260	2019-10-29 14:58:30.573357	\N	\N	1	\N	30	2554	\N	4	2	0
5006	2019-06-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000096	2019-10-29 14:58:30.573357	\N	\N	1	\N	1265	6734	\N	4	2	0
5007	2019-06-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123640	2019-10-29 14:58:30.573357	\N	\N	1	\N	68	7155	\N	4	2	0
5008	2019-06-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123005	2019-10-29 14:58:30.573357	\N	\N	1	\N	873	8453	\N	4	2	0
5009	2019-06-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000929	2019-10-29 14:58:30.573357	\N	\N	1	\N	126	10608	\N	4	2	0
5010	2019-06-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000146794	2019-10-29 14:58:30.573357	\N	\N	1	\N	13	12636	\N	4	2	0
5011	2019-06-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000119797	2019-10-29 14:58:30.573357	\N	\N	1	\N	1042	15411	\N	4	2	0
5002	2019-06-14	UPI-AMIT AGARWAL SO MKAG-9999900212@UPI-ORBC0100526-916508920450-NO REMARKS	0000091658229065	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	20000	\N	4	2	0
5012	2019-06-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397664	2019-10-29 14:58:30.573357	\N	\N	1	\N	78	20097	\N	4	2	0
5013	2019-06-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992688	2019-10-29 14:58:30.573357	\N	\N	1	\N	23	23011	\N	4	2	0
5014	2019-06-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000125881	2019-10-29 14:58:30.573357	\N	\N	1	\N	56	35525	\N	4	2	0
5005	2019-06-14	ACH D- MONDELEZ INDIA FOODS-DB36290477	0000000249373251	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	447221.960000000021	4	2	0
5018	2019-06-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000967170	2019-10-29 14:58:30.573357	\N	\N	1	\N	553	2311	\N	4	2	0
5017	2019-06-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000263250	2019-10-29 14:58:30.573357	\N	\N	1	\N	1125	5893	\N	4	2	0
5020	2019-06-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000594	2019-10-29 14:58:30.573357	\N	\N	1	\N	1080	10784	\N	4	2	0
5016	2019-06-15	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19166074842	VIJBH19166074842	2019-10-29 14:58:30.573357	\N	\N	1	\N	471	33857	\N	4	2	0
5019	2019-06-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397242	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	36108	\N	4	2	0
5022	2019-06-16	IMPS-916720899045-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000916720899045	2019-10-29 14:58:30.573357	\N	\N	1	\N	633	355	\N	4	2	0
5021	2019-06-16	IMPS-916720893297-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000916720893297	2019-10-29 14:58:30.573357	\N	\N	1	\N	633	14760	\N	4	2	0
5037	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000931	2019-10-29 14:58:30.573357	\N	\N	1	\N	95	3554	\N	4	2	0
5036	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000426952	2019-10-29 14:58:30.573357	\N	\N	1	\N	100	4683	\N	4	2	0
5035	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315644	2019-10-29 14:58:30.573357	\N	\N	1	\N	35	5442	\N	4	2	0
5034	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000256415	2019-10-29 14:58:30.573357	\N	\N	1	\N	101	5607	\N	4	2	0
5033	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027919	2019-10-29 14:58:30.573357	\N	\N	1	\N	24	6001	\N	4	2	0
5032	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259917	2019-10-29 14:58:30.573357	\N	\N	1	\N	1192	7500	\N	4	2	0
5031	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000124130	2019-10-29 14:58:30.573357	\N	\N	1	\N	390	8078	\N	4	2	0
5030	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000452397	2019-10-29 14:58:30.573357	\N	\N	1	\N	306	8538	\N	4	2	0
5028	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000869533	2019-10-29 14:58:30.573357	\N	\N	1	\N	31	18213	\N	4	2	0
5029	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000902677	2019-10-29 14:58:30.573357	\N	\N	1	\N	1090	9380	\N	4	2	0
5027	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000021	2019-10-29 14:58:30.573357	\N	\N	1	\N	72	18322	\N	4	2	0
5026	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042068	2019-10-29 14:58:30.573357	\N	\N	1	\N	102	32557	\N	4	2	0
5025	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000997732	2019-10-29 14:58:30.573357	\N	\N	1	\N	434	33202	\N	4	2	0
5024	2019-06-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259391	2019-10-29 14:58:30.573357	\N	\N	1	\N	1131	56885	\N	4	2	0
5038	2019-06-18	IMPS-916914609042-LALIT KUMAR-HDFC-XXXXXXXX7071-	0000916914609042	2019-10-29 14:58:30.573357	\N	\N	1	\N	52	7855	\N	4	2	0
5044	2019-06-18	CHQ DEP - TRANSFER OW 2 - NOIDA WBO	0000000000104338	2019-10-29 14:58:30.573357	\N	\N	1	\N	320	10714.1599999999999	\N	4	2	0
5045	2019-06-18	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N169190249659829	N169190249659829	2019-10-29 14:58:30.573357	\N	\N	1	\N	1070	199220	\N	4	2	0
5043	2019-06-18	CHQ DEP RET CHGS 120619-MIR1916805246503	0000000000510268	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
5041	2019-06-18	CHQ DEP RET CHGS 110619-MIR1916804000391	0000000000054974	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
5040	2019-06-18	CHQ DEP RET CHGS 110619-MIR1916803998300	0000000000000019	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
5042	2019-06-18	CHQ DEP RET CHGS 110619-MIR1916804013168	0000000000195276	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	118	4	2	0
5039	2019-06-18	ACH D- MONDELEZ INDIA FOODS-DB36330483	0000000328192605	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	374797.320000000007	4	2	0
4995	2019-06-12	POS 436303XXXXXX9204 ANIL AUTO SERVIC POS DEBIT	0000000000015439	2019-10-29 14:58:30.573357	\N	\N	1	\N	1267	\N	3385	4	2	0
4996	2019-06-13	CHQ PAID-MICR CTS-NO-LIC	0000000000000559	2019-10-29 14:58:30.573357	\N	\N	1	\N	1258	\N	24020	4	2	0
5015	2019-06-15	051030815061909197- CBDT TAX	IB15113049366393	2019-10-29 14:58:30.573357	\N	\N	1	\N	1268	\N	25000	4	2	0
5023	2019-06-17	50200004799122-TPT-J P ENT 10 JUN BILLS	0000000451984987	2019-10-29 14:58:30.573357	\N	\N	1	\N	94	9712	\N	4	2	0
4997	2019-06-13	POS 436303XXXXXX9204 UTTAR PRADESH PO POS DEBIT	0000916414172410	2019-10-29 14:58:30.573357	\N	\N	1	\N	1275	\N	7342.4399999999996	4	2	0
5048	2019-06-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957673	2019-10-29 14:58:30.573357	\N	\N	1	\N	1065	10000	\N	4	2	0
5049	2019-06-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000907171	2019-10-29 14:58:30.573357	\N	\N	1	\N	40	15057	\N	4	2	0
5050	2019-06-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000245063	2019-10-29 14:58:30.573357	\N	\N	1	\N	616	18000	\N	4	2	0
5056	2019-06-19	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19170620572	KKBKH19170620572	2019-10-29 14:58:30.573357	\N	\N	1	\N	1243	5063	\N	4	2	0
5061	2019-06-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000105094	2019-10-29 14:58:30.573357	\N	\N	1	\N	1151	7408	\N	4	2	0
5060	2019-06-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957674	2019-10-29 14:58:30.573357	\N	\N	1	\N	1065	10841	\N	4	2	0
5059	2019-06-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127117	2019-10-29 14:58:30.573357	\N	\N	1	\N	56	11918	\N	4	2	0
5058	2019-06-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121385	2019-10-29 14:58:30.573357	\N	\N	1	\N	55	18443	\N	4	2	0
5057	2019-06-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001609	2019-10-29 14:58:30.573357	\N	\N	1	\N	81	20663	\N	4	2	0
5062	2019-06-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127252	2019-10-29 14:58:30.573357	\N	\N	1	\N	656	89064	\N	4	2	0
5052	2019-06-19	CASH DEP DADRI	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1244	210000	\N	4	2	0
5053	2019-06-19	FT-N3058220156601330-CMS_ECOLL_DABUR INDIA LTD E-CM	0000000000000563	2019-10-29 14:58:30.573357	\N	\N	1	\N	1255	\N	120000	4	2	0
5054	2019-06-19	FT-N3058220156601310-CMS_ECOLL_DABUR INDIA LTD E-CM	0000000000000562	2019-10-29 14:58:30.573357	\N	\N	1	\N	1255	\N	220000	4	2	0
5076	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001075	2019-10-29 14:58:30.573357	\N	\N	1	\N	140	3265	\N	4	2	0
5074	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000510281	2019-10-29 14:58:30.573357	\N	\N	1	\N	705	3772	\N	4	2	0
5079	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000470	2019-10-29 14:58:30.573357	\N	\N	1	\N	1087	5465	\N	4	2	0
5078	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000392	2019-10-29 14:58:30.573357	\N	\N	1	\N	88	5528	\N	4	2	0
5077	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129137	2019-10-29 14:58:30.573357	\N	\N	1	\N	1041	5620	\N	4	2	0
5071	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123008	2019-10-29 14:58:30.573357	\N	\N	1	\N	873	6263	\N	4	2	0
5073	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000010178	2019-10-29 14:58:30.573357	\N	\N	1	\N	280	8029	\N	4	2	0
5069	2019-06-20	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19171013065	VIJBH19171013065	2019-10-29 14:58:30.573357	\N	\N	1	\N	471	8106	\N	4	2	0
5063	2019-06-20	IMPS-917110103212-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000917110103212	2019-10-29 14:58:30.573357	\N	\N	1	\N	586	9076	\N	4	2	0
5080	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000397	2019-10-29 14:58:30.573357	\N	\N	1	\N	9	11399	\N	4	2	0
5081	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000527	2019-10-29 14:58:30.573357	\N	\N	1	\N	661	11588	\N	4	2	0
5072	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000803	2019-10-29 14:58:30.573357	\N	\N	1	\N	908	12305	\N	4	2	0
5075	2019-06-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000172743	2019-10-29 14:58:30.573357	\N	\N	1	\N	730	13184	\N	4	2	0
5065	2019-06-20	CASH DEP DADRI	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1244	280000	\N	4	2	0
5064	2019-06-20	MARICO4254-STP-MARICO	IB20105422138140	2019-10-29 14:58:30.573357	\N	\N	1	\N	1252	\N	180000	4	2	0
5070	2019-06-20	HB3142NR1000009999-STP-GODREJ	IB20154836779255	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	247000	4	2	0
5068	2019-06-20	ACH D- MONDELEZ INDIA FOODS-DB36350360	0000000361297055	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	318341.190000000002	4	2	0
5066	2019-06-20	50100051672149-TPT-DRAWINGS	0000000380963296	2019-10-29 14:58:30.573357	\N	\N	1	\N	1258	\N	400000	4	2	0
5084	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123640	2019-10-29 14:58:30.573357	\N	\N	1	\N	663	2697	\N	4	2	0
5085	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315645	2019-10-29 14:58:30.573357	\N	\N	1	\N	35	3238	\N	4	2	0
5086	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126859	2019-10-29 14:58:30.573357	\N	\N	1	\N	68	4149	\N	4	2	0
5087	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826710	2019-10-29 14:58:30.573357	\N	\N	1	\N	858	4200	\N	4	2	0
5088	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000267263	2019-10-29 14:58:30.573357	\N	\N	1	\N	87	4292	\N	4	2	0
5089	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126752	2019-10-29 14:58:30.573357	\N	\N	1	\N	75	4542	\N	4	2	0
5090	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000847	2019-10-29 14:58:30.573357	\N	\N	1	\N	73	4686	\N	4	2	0
5098	2019-06-21	CHQ DEP - TRANSFER OW 2 - NOIDA WBO	0000000000000420	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	6019	\N	4	2	0
5091	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000043	2019-10-29 14:58:30.573357	\N	\N	1	\N	307	9426	\N	4	2	0
5092	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000819880	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	10000	\N	4	2	0
5093	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000869543	2019-10-29 14:58:30.573357	\N	\N	1	\N	31	12023	\N	4	2	0
5094	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000717769	2019-10-29 14:58:30.573357	\N	\N	1	\N	747	13829	\N	4	2	0
5095	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126143	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	15381	\N	4	2	0
5096	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957647	2019-10-29 14:58:30.573357	\N	\N	1	\N	910	32285	\N	4	2	0
5097	2019-06-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000938	2019-10-29 14:58:30.573357	\N	\N	1	\N	126	33189	\N	4	2	0
5083	2019-06-21	CASH DEP DADRI	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1244	250000	\N	4	2	0
5100	2019-06-22	UPI-ASHWANI KUMAR VERMA-9971344900@YBL-YESB0000085-917352753387-PAYMENT FROM PHONE	0000917313028354	2019-10-29 14:58:30.573357	\N	\N	1	\N	4	3927	\N	4	2	0
5104	2019-06-24	FT - CR - 50100040075467 - DEEPAK GARG	0000000000000021	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	150000	\N	4	2	0
5055	2019-06-19	FT - CR - 50100040075595 - MUKESH KUMAR GARG	0000000000000020	2019-10-29 14:58:30.573357	\N	\N	1	\N	1269	400000	\N	4	2	0
5082	2019-06-20	GST/BANK REFERENCE NO: R1917112360631/CIN NO: HDFC19060900383481	0190620090085290	2019-10-29 14:58:30.573357	\N	\N	1	\N	1259	\N	21594	4	2	0
5099	2019-06-21	POS 436303XXXXXX9204 ANIL AUTO SERVIC POS DEBIT	0000000000014619	2019-10-29 14:58:30.573357	\N	\N	1	\N	1267	\N	3570	4	2	0
5101	2019-06-23	POS 436303XXXXXX9204 SHOPPERS STOP, POS DEBIT	0000000000002899	2019-10-29 14:58:30.573357	\N	\N	1	\N	1258	\N	300	4	2	0
5102	2019-06-23	POS 436303XXXXXX9204 SHOPPERS STOP, POS DEBIT	0000000000002900	2019-10-29 14:58:30.573357	\N	\N	1	\N	1258	\N	1617.5	4	2	0
5103	2019-06-23	POS 436303XXXXXX9204 BINDAL ARCADE PV POS DEBIT	0000000000016781	2019-10-29 14:58:30.573357	\N	\N	1	\N	1258	\N	37407	4	2	0
5112	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000678	2019-10-29 14:58:30.573357	\N	\N	1	\N	1125	3845	\N	4	2	0
5113	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000260273	2019-10-29 14:58:30.573357	\N	\N	1	\N	1142	4150	\N	4	2	0
5114	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000084	2019-10-29 14:58:30.573357	\N	\N	1	\N	1039	4687	\N	4	2	0
5115	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000114	2019-10-29 14:58:30.573357	\N	\N	1	\N	17	6666	\N	4	2	0
5116	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001108	2019-10-29 14:58:30.573357	\N	\N	1	\N	1161	6916	\N	4	2	0
5117	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000169	2019-10-29 14:58:30.573357	\N	\N	1	\N	231	7331	\N	4	2	0
5118	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672643	2019-10-29 14:58:30.573357	\N	\N	1	\N	1260	7828	\N	4	2	0
5119	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000454307	2019-10-29 14:58:30.573357	\N	\N	1	\N	306	8796	\N	4	2	0
5120	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000435	2019-10-29 14:58:30.573357	\N	\N	1	\N	1083	8809	\N	4	2	0
5121	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027927	2019-10-29 14:58:30.573357	\N	\N	1	\N	24	9009	\N	4	2	0
5122	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000819881	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	9742	\N	4	2	0
5123	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000245064	2019-10-29 14:58:30.573357	\N	\N	1	\N	616	11029	\N	4	2	0
5133	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000263011	2019-10-29 14:58:30.573357	\N	\N	1	\N	1125	11886	\N	4	2	0
5124	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000622060	2019-10-29 14:58:30.573357	\N	\N	1	\N	34	12802	\N	4	2	0
5126	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058238	2019-10-29 14:58:30.573357	\N	\N	1	\N	32	14231	\N	4	2	0
5127	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000027	2019-10-29 14:58:30.573357	\N	\N	1	\N	72	18509	\N	4	2	0
5128	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001179	2019-10-29 14:58:30.573357	\N	\N	1	\N	60	20060	\N	4	2	0
5129	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000526	2019-10-29 14:58:30.573357	\N	\N	1	\N	86	25475	\N	4	2	0
5130	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000584050	2019-10-29 14:58:30.573357	\N	\N	1	\N	1049	31051	\N	4	2	0
5131	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009104	2019-10-29 14:58:30.573357	\N	\N	1	\N	105	42644	\N	4	2	0
5132	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000602403	2019-10-29 14:58:30.573357	\N	\N	1	\N	91	53178	\N	4	2	0
5109	2019-06-24	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N175190251850721	N175190251850721	2019-10-29 14:58:30.573357	\N	\N	1	\N	1070	170944	\N	4	2	0
5106	2019-06-24	50100051672149-TPT-DRAWINGS	0000000116813317	2019-10-29 14:58:30.573357	\N	\N	1	\N	1258	\N	200000	4	2	0
5107	2019-06-24	ACH D- MONDELEZ INDIA FOODS-DB36370537	0000000407813904	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	466970.669999999984	4	2	0
5141	2019-06-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000197	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	6254	\N	4	2	0
5136	2019-06-25	IMPS-917617324891-LALIT KUMAR-HDFC-XXXXXXXX7071-	0000917617324891	2019-10-29 14:58:30.573357	\N	\N	1	\N	52	6294	\N	4	2	0
5140	2019-06-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002400	2019-10-29 14:58:30.573357	\N	\N	1	\N	1061	7659	\N	4	2	0
5139	2019-06-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000119	2019-10-29 14:58:30.573357	\N	\N	1	\N	313	9184	\N	4	2	0
5138	2019-06-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000383387	2019-10-29 14:58:30.573357	\N	\N	1	\N	513	9939	\N	4	2	0
5135	2019-06-25	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19176863789	KKBKH19176863789	2019-10-29 14:58:30.573357	\N	\N	1	\N	1243	10000	\N	4	2	0
5137	2019-06-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000869544	2019-10-29 14:58:30.573357	\N	\N	1	\N	31	16998	\N	4	2	0
5134	2019-06-25	ACH D- MONDELEZ INDIA FOODS-DB36400623	0000000444210030	2019-10-29 14:58:30.573357	\N	\N	1	\N	1250	\N	201293.489999999991	4	2	0
5142	2019-06-26	IMPS-917711607742-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-COLGATE	0000917711607742	2019-10-29 14:58:30.573357	\N	\N	1	\N	128	1374	\N	4	2	0
5152	2019-06-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001114	2019-10-29 14:58:30.573357	\N	\N	1	\N	1105	6106	\N	4	2	0
5147	2019-06-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121391	2019-10-29 14:58:30.573357	\N	\N	1	\N	55	13248	\N	4	2	0
5148	2019-06-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000245067	2019-10-29 14:58:30.573357	\N	\N	1	\N	616	15000	\N	4	2	0
5149	2019-06-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127118	2019-10-29 14:58:30.573357	\N	\N	1	\N	56	16796	\N	4	2	0
5150	2019-06-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000388350	2019-10-29 14:58:30.573357	\N	\N	1	\N	359	19201	\N	4	2	0
5153	2019-06-26	IMPS-917718634421-K K STORE-HDFC-XXXXXXXXXX1250-	0000917718634421	2019-10-29 14:58:30.573357	\N	\N	1	\N	918	23065	\N	4	2	0
5151	2019-06-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108416	2019-10-29 14:58:30.573357	\N	\N	1	\N	64	28900	\N	4	2	0
5144	2019-06-26	IMPS-917713145839-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000917713145839	2019-10-29 14:58:30.573357	\N	\N	1	\N	586	31801	\N	4	2	0
5143	2019-06-26	FT - CR - 50200012102181 - OM RETAIL MART	0000000000001447	2019-10-29 14:58:30.573357	\N	\N	1	\N	57	80000	\N	4	2	0
5145	2019-06-26	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019062684355784-COLGATE	HDFCR52019062684355784	2019-10-29 14:58:30.573357	\N	\N	1	\N	1254	\N	335000	4	2	0
5157	2019-06-27	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19178070140	IOBAN19178070140	2019-10-29 14:58:30.573357	\N	\N	1	\N	30	7439	\N	4	2	0
5159	2019-06-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397686	2019-10-29 14:58:30.573357	\N	\N	1	\N	78	35384	\N	4	2	0
5154	2019-06-27	IMPS-917809650403-K K STORE-HDFC-XXXXXXXXXX1250-	0000917809650403	2019-10-29 14:58:30.573357	\N	\N	1	\N	918	30234	\N	4	2	0
5160	2019-06-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000752	2019-10-29 14:58:30.573357	\N	\N	1	\N	391	24903	\N	4	2	0
5158	2019-06-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259450	2019-10-29 14:58:30.573357	\N	\N	1	\N	1131	91138	\N	4	2	0
5155	2019-06-27	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N178190859841102-RED BULL	N178190859841102	2019-10-29 14:58:30.573357	\N	\N	1	\N	1251	\N	50000	4	2	0
5108	2019-06-24	POS REF 436303******9204-06/23 ANIL AUTO	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1267	26.7800000000000011	\N	4	2	0
5110	2019-06-24	50200004799122-TPT-J P ENT 16JUN BILL	0000000121059240	2019-10-29 14:58:30.573357	\N	\N	1	\N	94	21217	\N	4	2	0
5105	2019-06-24	FT - CR - 50100040075595 - MUKESH KUMAR GARG	0000000000000022	2019-10-29 14:58:30.573357	\N	\N	1	\N	1269	250000	\N	4	2	0
5156	2019-06-27	CASH DEP HOME BRN CHGS 210619-MIR1917414316596	MIR1917414316596	2019-10-29 14:58:30.573357	\N	\N	1	\N	1246	\N	885	4	2	0
5162	2019-06-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027928	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	5388	\N	4	2	0
5164	2019-06-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387523	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	10423	\N	4	2	0
5163	2019-06-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129146	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	12569	\N	4	2	0
5184	2019-06-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000510303	2019-10-29 14:58:30.573357	\N	\N	1	\N	705	2286	\N	4	2	0
5161	2019-06-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013817	2019-10-29 14:58:30.573357	\N	\N	1	\N	57	18444	\N	4	2	0
5181	2019-06-29	NEFT CR-INDB0000006-RAVINDRA NATH-JPENTERPRISES-000199292326	0000000199292326	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	6000	\N	4	2	0
5167	2019-06-28	FT - CR - 02782560000772 - DHARMA FOOD JUNCTION	0000000000000422	2019-10-29 14:58:30.573357	\N	\N	1	\N	25	3317	\N	4	2	0
5165	2019-06-28	IMPS-917908953630-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000917908953630	2019-10-29 14:58:30.573357	\N	\N	1	\N	633	3745	\N	4	2	0
5185	2019-06-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001465	2019-10-29 14:58:30.573357	\N	\N	1	\N	1063	8545	\N	4	2	0
5179	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126760	2019-10-29 14:58:30.573357	\N	\N	1	\N	75	4270	\N	4	2	0
5166	2019-06-28	FT - CR - 07227610000087 - SHEETAL PHARMACEUTICALS PVT LTD	0000000000003683	2019-10-29 14:58:30.573357	\N	\N	1	\N	1168	2398	\N	4	2	0
5178	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008337	2019-10-29 14:58:30.573357	\N	\N	1	\N	105	4886	\N	4	2	0
5177	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000146412	2019-10-29 14:58:30.573357	\N	\N	1	\N	766	5395	\N	4	2	0
5176	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957685	2019-10-29 14:58:30.573357	\N	\N	1	\N	1065	5925	\N	4	2	0
5174	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387524	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	10000	\N	4	2	0
5175	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000745554	2019-10-29 14:58:30.573357	\N	\N	1	\N	40	11670	\N	4	2	0
5186	2019-06-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000023830	2019-10-29 14:58:30.573357	\N	\N	1	\N	700	12817	\N	4	2	0
5173	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000607965	2019-10-29 14:58:30.573357	\N	\N	1	\N	1074	14595	\N	4	2	0
5172	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000382	2019-10-29 14:58:30.573357	\N	\N	1	\N	126	17106	\N	4	2	0
5171	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992694	2019-10-29 14:58:30.573357	\N	\N	1	\N	23	21634	\N	4	2	0
5170	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001817	2019-10-29 14:58:30.573357	\N	\N	1	\N	81	29415	\N	4	2	0
5169	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000406194	2019-10-29 14:58:30.573357	\N	\N	1	\N	1094	30482	\N	4	2	0
5168	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992705	2019-10-29 14:58:30.573357	\N	\N	1	\N	23	31402	\N	4	2	0
5180	2019-06-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000396555	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	134763	\N	4	2	0
5183	2019-06-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123647	2019-10-29 14:58:30.573357	\N	\N	1	\N	663	1191	\N	4	2	0
5187	2019-06-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000455003	2019-10-29 14:58:30.573357	\N	\N	1	\N	59	23500	\N	4	2	0
5182	2019-06-29	50200027549434-TPT-J P BILL NO 2092	0000000170224017	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	35078	\N	4	2	0
4244	2019-04-02	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19092844664	KKBKH19092844664	2019-10-29 14:58:30.573357	\N	\N	1	\N	1243	10000	\N	4	2	0
1568	2019-04-02	CHQ PAID-INWARD TRAN-GODREJ CONSUMER PRO	0000000000000223	2019-10-01 23:34:09.331984	\N	\N	1	\N	763	\N	577000	2	1	0
4246	2019-04-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001066	2019-10-29 14:58:30.573357	\N	\N	1	\N	1161	2397	\N	4	2	0
4248	2019-04-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000452323	2019-10-29 14:58:30.573357	\N	\N	1	\N	306	4324	\N	4	2	0
4249	2019-04-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000028	2019-10-29 14:58:30.573357	\N	\N	1	\N	17	10293	\N	4	2	0
4250	2019-04-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000352	2019-10-29 14:58:30.573357	\N	\N	1	\N	9	12529	\N	4	2	0
4251	2019-04-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000819	2019-10-29 14:58:30.573357	\N	\N	1	\N	95	15391	\N	4	2	0
4253	2019-04-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000258929	2019-10-29 14:58:30.573357	\N	\N	1	\N	1131	76705	\N	4	2	0
4286	2019-04-06	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010760	2019-10-29 14:58:30.573357	\N	\N	1	\N	97	38130	\N	4	2	0
4298	2019-04-08	NEFT CR-UTIB0000624-SHRI JEE GENERAL STORE-JAYPEE ENTERPRISES-AXMB190984992888	AXMB190984992888	2019-10-29 14:58:30.573357	\N	\N	1	\N	365	8781	\N	4	2	0
4332	2019-04-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000114890	2019-10-29 14:58:30.573357	\N	\N	1	\N	656	141349	\N	4	2	0
4349	2019-04-15	FT - CR - 02782560000772 - DHARMA FOOD JUNCTION	0000000000000385	2019-10-29 14:58:30.573357	\N	\N	1	\N	25	6767	\N	4	2	0
4365	2019-04-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000119772	2019-10-29 14:58:30.573357	\N	\N	1	\N	68	6003	\N	4	2	0
4372	2019-04-16	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N106190224816873	N106190224816873	2019-10-29 14:58:30.573357	\N	\N	1	\N	1070	182374	\N	4	2	0
4422	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001002	2019-10-29 14:58:30.573357	\N	\N	1	\N	60	16141	\N	4	2	0
4424	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000067	2019-10-29 14:58:30.573357	\N	\N	1	\N	1094	28029	\N	4	2	0
4461	2019-04-25	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19115521065	IOBAN19115521065	2019-10-29 14:58:30.573357	\N	\N	1	\N	30	6734	\N	4	2	0
4479	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000312044	2019-10-29 14:58:30.573357	\N	\N	1	\N	67	17608	\N	4	2	0
4483	2019-04-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000119995	2019-10-29 14:58:30.573357	\N	\N	1	\N	75	8296	\N	4	2	0
4516	2019-04-30	NEFT CR-UTIB0000624-JAI BHAWANI KIRANA STORE-JP ENTERPRISES-AXMB191201673064	AXMB191201673064	2019-10-29 14:58:30.573357	\N	\N	1	\N	52	7253	\N	4	2	0
4963	2019-06-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027914	2019-10-29 14:58:30.573357	\N	\N	1	\N	24	10000	\N	4	2	0
4242	2019-04-02	CASH DEP DADRI	000000000000000	2019-10-29 14:58:30.573357	\N	\N	1	\N	1244	500000	\N	4	2	0
5047	2019-06-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002393	2019-10-29 14:58:30.573357	\N	\N	1	\N	1061	4312	\N	4	2	0
4241	2019-04-02	8202334953-28 03 2019-HD03123849	0000903286577256	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	33505.8099999999977	\N	4	2	0
4537	2019-05-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000479	2019-10-29 14:58:30.573357	\N	\N	1	\N	661	1585	\N	4	2	0
4566	2019-05-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123607	2019-10-29 14:58:30.573357	\N	\N	1	\N	663	2108	\N	4	2	0
4599	2019-05-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002301	2019-10-29 14:58:30.573357	\N	\N	1	\N	1061	5188	\N	4	2	0
4635	2019-05-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000799	2019-10-29 14:58:30.573357	\N	\N	1	\N	73	9329	\N	4	2	0
4660	2019-05-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000015	2019-10-29 14:58:30.573357	\N	\N	1	\N	162	2479	\N	4	2	0
4662	2019-05-14	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19134097758	VIJBH19134097758	2019-10-29 14:58:30.573357	\N	\N	1	\N	471	30000	\N	4	2	0
4721	2019-05-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123619	2019-10-29 14:58:30.573357	\N	\N	1	\N	663	3568	\N	4	2	0
4245	2019-04-02	CHQ PAID-INWARD TRAN-GODREJ CONSUMER PRO	0000000000000399	2019-10-29 14:58:30.573357	\N	\N	1	\N	1249	\N	688000	4	2	0
4338	2019-04-12	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N102190800922144-COLGATE	N102190800922144	2019-10-29 14:58:30.573357	\N	\N	1	\N	1254	\N	210000	4	2	0
4381	2019-04-17	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N107190803981185-COLGATE	N107190803981185	2019-10-29 14:58:30.573357	\N	\N	1	\N	1254	\N	120000	4	2	0
4570	2019-05-06	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019050676820715-RED BULL	HDFCR52019050676820715	2019-10-29 14:58:30.573357	\N	\N	1	\N	1251	\N	200000	4	2	0
4671	2019-05-15	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N135190826662802-COLGATE	N135190826662802	2019-10-29 14:58:30.573357	\N	\N	1	\N	1254	\N	137000	4	2	0
4730	2019-05-20	GST/BANK REFERENCE NO: R1914011729661/CIN NO: HDFC19050900345618	0190520090073194	2019-10-29 14:58:30.573357	\N	\N	1	\N	1259	\N	25948	4	2	0
4767	2019-05-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000375	2019-10-29 14:58:30.573357	\N	\N	1	\N	88	1707	\N	4	2	0
4795	2019-05-25	UPI-VINEET KUMAR-9911483519@YBL-UBIN0560430-914528412558-PAYMENT FROM PHONE	0000091457533791	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	4000	\N	4	2	0
4819	2019-05-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000120241	2019-10-29 14:58:30.573357	\N	\N	1	\N	6	30000	\N	4	2	0
4830	2019-05-29	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N149190241061085	N149190241061085	2019-10-29 14:58:30.573357	\N	\N	1	\N	1070	95482	\N	4	2	0
4876	2019-06-03	UPI-SANCHIT GOEL-SANCHIT.MGOEL007@OKAXIS-SBIN0004422-915413453273-CHOCOLATE	0000915413689433	2019-10-29 14:58:30.573357	\N	\N	1	\N	1077	2617	\N	4	2	0
4897	2019-06-04	NEFT DR-DEUT0537PUN-FERRERO INDIA PVT LTD-NETBANK, MUM-N155190842455811-FERRERO	N155190842455811	2019-10-29 14:58:30.573357	\N	\N	1	\N	1253	\N	125300	4	2	0
4932	2019-06-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008985	2019-10-29 14:58:30.573357	\N	\N	1	\N	105	30623	\N	4	2	0
4937	2019-06-07	FT - CR - 50100256958061 - MANVENDRA SINGH	0000000000000011	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	7905	\N	4	2	0
4991	2019-06-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000510268	2019-10-29 14:58:30.573357	\N	\N	1	\N	705	2568	\N	4	2	0
4994	2019-06-12	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N163190247279450	N163190247279450	2019-10-29 14:58:30.573357	\N	\N	1	\N	1070	104580	\N	4	2	0
5046	2019-06-18	NEFT CR-SBIN0050830-SHRI SHYAM KIRANA STORE-J P ENTERPRISES-SBIN519169260982	SBIN519169260982	2019-10-29 14:58:30.573357	\N	\N	1	\N	62	8870	\N	4	2	0
5051	2019-06-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387510	2019-10-29 14:58:30.573357	\N	\N	1	\N	83	16824	\N	4	2	0
5067	2019-06-20	UPI-S. KUMAR PROVISION A-SONU.MITTAL100584@SBI-SBIN0008866-917114447007-PAY TO ACCOUNT XXX	0000917114712457	2019-10-29 14:58:30.573357	\N	\N	1	\N	1245	12275	\N	4	2	0
5111	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000967177	2019-10-29 14:58:30.573357	\N	\N	1	\N	553	1986	\N	4	2	0
5125	2019-06-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000125799	2019-10-29 14:58:30.573357	\N	\N	1	\N	1134	13065	\N	4	2	0
5146	2019-06-26	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N177190859517279-COLGATE	N177190859517279	2019-10-29 14:58:30.573357	\N	\N	1	\N	1254	\N	30000	4	2	0
1595	2019-04-12	ADHOC STMT CHGS INCL GST 030419-MIR1910091887369	MIR1910091887369	2019-10-01 23:34:09.331984	\N	\N	1	\N	776	\N	118	2	1	0
1638	2019-04-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000838454	2019-10-01 23:34:09.331984	\N	\N	1	\N	322	3157	\N	2	1	0
1833	2019-06-04	EMI 58456073 CHQ S58456073112 061958456073	000000000000000	2019-10-01 23:34:09.331984	\N	\N	1	\N	774	\N	87242	2	1	0
5192	2019-04-12	50100040075595-TPT-DRAWINGS	0000000276194746	2019-11-16 07:26:20.885476	\N	\N	1	\N	772	\N	30000	3	1	0
5193	2019-04-15	CASH DEP DADRI	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	773	400000	\N	3	1	0
5194	2019-04-15	50200007138822-TPT-TTC OD TO JP OD	0000000297670445	2019-11-16 07:26:20.885476	\N	\N	1	\N	232	\N	250000	3	1	0
5195	2019-04-16	HB3142NR1000007858-STP-GODREJ	IB16120212695945	2019-11-16 07:26:20.885476	\N	\N	1	\N	763	\N	192000	3	1	0
1658	2019-04-29	RTGS CR-VIJB0006005-BABU RAM KHACHEDOOMAL  SONS-TUSHAR TRADING CO-VIJBR52019042900020904	VIJBR52019042900020904	2019-10-01 23:34:09.331984	\N	\N	1	\N	781	634312	\N	2	1	0
2024	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000094564	2019-10-01 23:34:09.331984	\N	\N	1	\N	789	3500	\N	2	1	0
5188	2019-04-07	O/S INTEREST RECOVERY FROM A/C XXXXXXXXXX9210	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	776	16207	\N	3	1	0
5191	2019-04-12	IMPS-910216524409-MUNSHILAL-HDFC-XXXXXXXXXX1383-JP	0000910216524409	2019-11-16 07:26:20.885476	\N	\N	1	\N	805	15000	\N	3	1	0
5198	2019-04-19	SGST - SERVICECHARGE-STAX UPLOAD - NCB1910918870555	NCB1910918870555	2019-11-16 07:26:20.885476	\N	\N	1	\N	778	\N	450	3	1	0
5199	2019-04-20	CASH DEP DADRI	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	773	250000	\N	3	1	0
5196	2019-04-18	RF 50200029853444 83589370 TUSHAR TRAD	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	\N	5000	3	1	0
5204	2019-05-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	776	\N	15974	3	1	0
5197	2019-04-19	CGST - SERVICECHARGE-STAX UPLOAD - NCB1910918870555	NCB1910918870555	2019-11-16 07:26:20.885476	\N	\N	1	\N	778	\N	450	3	1	0
5200	2019-04-20	HB3142NR1000007858-STP-GODREJ	IB20143900253851	2019-11-16 07:26:20.885476	\N	\N	1	\N	763	\N	230000	3	1	0
5201	2019-04-29	CASH DEP DADRI	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	773	300000	\N	3	1	0
5202	2019-04-29	50200029537650-TPT-TTC OD TO JP OD	0000000225906815	2019-11-16 07:26:20.885476	\N	\N	1	\N	232	\N	100000	3	1	0
5203	2019-04-30	RTGS DR-KKBK0000272-BAJAJ CORP LTD-NETBANK, MUM-HDFCR52019043076051829-BAJAJ	HDFCR52019043076051829	2019-11-16 07:26:20.885476	\N	\N	1	\N	767	\N	200000	3	1	0
5205	2019-05-01	IMPS-912118198433-ATUL CHAUHAN-HDFC-XXXXXXXX6456-BILL PAYMENT	0000912118198433	2019-11-16 07:26:20.885476	\N	\N	1	\N	806	3188	\N	3	1	0
5210	2019-06-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	776	\N	16511	3	1	0
5206	2019-05-07	O/S INTEREST RECOVERY FROM A/C XXXXXXXXXX9210	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	776	12786	\N	3	1	0
5207	2019-05-08	IMPS-912820552935-AMIR -HDFC-XXXXXXXX7977-	0000912820552935	2019-11-16 07:26:20.885476	\N	\N	1	\N	779	8000	\N	3	1	0
5208	2019-05-15	IMPS-913516796277-AMIR -HDFC-XXXXXXXX7977-	0000913516796277	2019-11-16 07:26:20.885476	\N	\N	1	\N	779	6500	\N	3	1	0
5211	2019-06-04	50200007138822-TPT-TTC OD TO JP CA	0000000114900786	2019-11-16 07:26:20.885476	\N	\N	1	\N	232	\N	50000	3	1	0
5212	2019-06-05	IMPS-915610486658-MS SINGHAL TRADING C-HDFC-XXXXXXXXXX0155-TUSHAR	0000915610486658	2019-11-16 07:26:20.885476	\N	\N	1	\N	595	34800	\N	3	1	0
5213	2019-06-06	50100273568851-TPT-TUSHAR TRADING CO	0000000415584362	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	5000	\N	3	1	0
5214	2019-06-07	RDMCGHA0090-STP-RDM	IB07143027254335	2019-11-16 07:26:20.885476	\N	\N	1	\N	765	\N	29617	3	1	0
5215	2019-06-13	50100273568851-TPT-TUSHAR TRADING CO	0000000237796774	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	2506	\N	3	1	0
5219	2019-06-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129127	2019-11-16 07:26:20.885476	\N	\N	1	\N	142	3662	\N	3	1	0
5218	2019-06-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000172741	2019-11-16 07:26:20.885476	\N	\N	1	\N	565	6254	\N	3	1	0
5217	2019-06-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008950	2019-11-16 07:26:20.885476	\N	\N	1	\N	23	9540	\N	3	1	0
5220	2019-06-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000524	2019-11-16 07:26:20.885476	\N	\N	1	\N	628	16530	\N	3	1	0
5216	2019-06-13	CASH DEP DADRI	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	773	64000	\N	3	1	0
5221	2019-06-14	50100040075595-TPT-DRAWINGS	0000000228323765	2019-11-16 07:26:20.885476	\N	\N	1	\N	772	\N	1000	3	1	0
5222	2019-06-17	CASH DEP DADRI	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	773	131000	\N	3	1	0
5223	2019-06-19	50100040075595-TPT-DRAWINGS	0000000369622786	2019-11-16 07:26:20.885476	\N	\N	1	\N	772	\N	200000	3	1	0
5224	2019-06-20	GST/BANK REFERENCE NO: R1917112362406/CIN NO: HDFC19060900384558	0190620090086243	2019-11-16 07:26:20.885476	\N	\N	1	\N	774	\N	19287	3	1	0
5225	2019-06-22	50100273568851-TPT-TUSHAR TRADING CO	0000000261480232	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	3643	\N	3	1	0
5226	2019-06-24	CASH DEP DADRI	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	773	250000	\N	3	1	0
5228	2019-06-24	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-N175190857621169-COLGATE	N175190857621169	2019-11-16 07:26:20.885476	\N	\N	1	\N	764	\N	10000	3	1	0
5227	2019-06-24	50100040075595-TPT-DRAWINGS	0000000114738720	2019-11-16 07:26:20.885476	\N	\N	1	\N	772	\N	250000	3	1	0
5229	2019-06-28	50200012390552-TPT-TUSHAR TRADING CO	0000000276245963	2019-11-16 07:26:20.885476	\N	\N	1	\N	780	2843	\N	3	1	0
5237	2019-07-10	2521851-83868027-279-1-2-1-5020002985344-SAW1919137298629	SAW1919137298629	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	\N	675	3	1	0
5233	2019-07-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000486139	2019-11-16 07:26:20.885476	\N	\N	1	\N	646	1409	\N	3	1	0
5234	2019-07-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039807	2019-11-16 07:26:20.885476	\N	\N	1	\N	23	2879	\N	3	1	0
5232	2019-07-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000073346	2019-11-16 07:26:20.885476	\N	\N	1	\N	6	2906	\N	3	1	0
5231	2019-07-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000040156	2019-11-16 07:26:20.885476	\N	\N	1	\N	97	3550	\N	3	1	0
5235	2019-07-07	O/S INTEREST RECOVERY FROM A/C XXXXXXXXXX9210	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	776	15792	\N	3	1	0
5230	2019-06-30	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	776	\N	15792	3	1	0
5236	2019-07-10	2521849-83868027-279-1-2-1-5020002985344-SAW1919137298629	SAW1919137298629	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	\N	675	3	1	0
5239	2019-07-10	2521855-83868027-279-1-2-2-5020002985344-.	000000000000000.	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	\N	4402	3	1	0
5238	2019-07-10	2521853-83868027-279-1-2-1-5020002985344-SAW1919137298629	SAW1919137298629	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	\N	7500	3	1	0
5240	2019-07-11	NEFT DR-CITI0000002-PERFETTI VAN MELLE INDIA PVT LTD-NETBANK, MUM-N192190874118300-PERFETTI	N192190874118300	2019-11-16 07:26:20.885476	\N	\N	1	\N	766	\N	105000	3	1	0
5241	2019-07-15	50100040075595-TPT-DRAWINGS	0000000549194919	2019-11-16 07:26:20.885476	\N	\N	1	\N	772	\N	500000	3	1	0
5190	2019-04-12	ADHOC STMT CHGS INCL GST 030419-MIR1910091913871	MIR1910091913871	2019-11-16 07:26:20.885476	\N	\N	1	\N	778	\N	118	3	1	0
5286	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003855	2019-11-16 07:47:15.638883	\N	\N	1	\N	101	2979	\N	4	2	0
5287	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001198	2019-11-16 07:47:15.638883	\N	\N	1	\N	60	3340	\N	4	2	0
5288	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000993086	2019-11-16 07:47:15.638883	\N	\N	1	\N	1092	5700	\N	4	2	0
5289	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000004	2019-11-16 07:47:15.638883	\N	\N	1	\N	376	5897	\N	4	2	0
5290	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027935	2019-11-16 07:47:15.638883	\N	\N	1	\N	24	6487	\N	4	2	0
5291	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127141	2019-11-16 07:47:15.638883	\N	\N	1	\N	56	6740	\N	4	2	0
5292	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042073	2019-11-16 07:47:15.638883	\N	\N	1	\N	102	7975	\N	4	2	0
5293	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000876	2019-11-16 07:47:15.638883	\N	\N	1	\N	1010	8260	\N	4	2	0
5282	2019-07-01	UPI RB-20190629-918052645829	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	10000	\N	4	2	0
5294	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000120	2019-11-16 07:47:15.638883	\N	\N	1	\N	17	10187	\N	4	2	0
5295	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000038	2019-11-16 07:47:15.638883	\N	\N	1	\N	72	12552	\N	4	2	0
5296	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000023831	2019-11-16 07:47:15.638883	\N	\N	1	\N	700	12817	\N	4	2	0
5297	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001463	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	15000	\N	4	2	0
5298	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000016050	2019-11-16 07:47:15.638883	\N	\N	1	\N	5	15601	\N	4	2	0
5277	2019-07-01	UPI-AMIT AGARWAL SO MKAG-9999900212@UPI-ORBC0100526-918212935206-GREEN GROCERIES	0000918212853113	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	20000	\N	4	2	0
5283	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397298	2019-11-16 07:47:15.638883	\N	\N	1	\N	6	30000	\N	4	2	0
5284	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000330880	2019-11-16 07:47:15.638883	\N	\N	1	\N	1049	37150	\N	4	2	0
5276	2019-07-01	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010713	2019-11-16 07:47:15.638883	\N	\N	1	\N	97	77952	\N	4	2	0
5279	2019-07-01	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000510303	2019-11-16 07:47:15.638883	\N	\N	1	\N	705	\N	2286	4	2	0
5280	2019-07-01	ACH D- MONDELEZ INDIA FOODS-DB36450383	0000000559989300	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	212392.679999999993	4	2	0
5278	2019-07-01	HB3142NR1000009999-STP-GODREJ	IB01131255778739	2019-11-16 07:47:15.638883	\N	\N	1	\N	1249	\N	274000	4	2	0
5281	2019-07-01	ACH D- MONDELEZ INDIA FOODS-DB36440214	0000000559989291	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	647639.969999999972	4	2	0
5243	2019-07-19	BCCLTDGT69776-STP-BAJAJ	IB19141639745522	2019-11-16 07:26:20.885476	\N	\N	1	\N	767	\N	75000	3	1	0
5244	2019-07-20	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-HDFCR52019072087841768-COLGATE	HDFCR52019072087841768	2019-11-16 07:26:20.885476	\N	\N	1	\N	764	\N	260000	3	1	0
5245	2019-07-20	GST/BANK REFERENCE NO: R1920112991431/CIN NO: HDFC19070900486604	0190720090076040	2019-11-16 07:26:20.885476	\N	\N	1	\N	783	\N	1282	3	1	0
5246	2019-07-24	CASH DEP DADRI	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	773	430000	\N	3	1	0
5247	2019-07-25	CASH DEP DADRI	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	773	300000	\N	3	1	0
5248	2019-07-25	09272000000230-TPT-FAN BILL NO 1273	0000000123921834	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	\N	1800	3	1	0
5249	2019-07-26	FT - CR - 50200006539210 - TUSHAR TRADING COMPANY	0000000000000198	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	300000	\N	3	1	0
5250	2019-07-29	FT-HB3142NR1000007858-GODREJ CONSUMER PRODUCTS LIMIT	0000000000000057	2019-11-16 07:26:20.885476	\N	\N	1	\N	763	\N	1081677.87000000011	3	1	0
5251	2019-07-31	50200029537650-TPT-JP OD TO TTC OD	0000000224047528	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	25000	\N	3	1	0
5252	2019-08-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	776	\N	20694	3	1	0
5253	2019-08-07	O/S INTEREST RECOVERY FROM A/C XXXXXXXXXX9210	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	776	20694	\N	3	1	0
5254	2019-08-07	RDMCGHA0090-STP-R.D.M. CARE	IB07131957618238	2019-11-16 07:26:20.885476	\N	\N	1	\N	765	\N	29400	3	1	0
5255	2019-08-13	CASH DEP DADRI	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	773	150000	\N	3	1	0
5256	2019-08-13	BCCLTDGT69776-STP-BAJAJ	IB13153829279793	2019-11-16 07:26:20.885476	\N	\N	1	\N	767	\N	125000	3	1	0
5257	2019-08-19	IMPS-923116103452-SANGRAM TRADING AND -HDFC-XXXXXXXX1071-NO1 SOAP PAYMENT	0000923116103452	2019-11-16 07:26:20.885476	\N	\N	1	\N	807	2100	\N	3	1	0
5258	2019-08-21	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-N233190906644697-COLGATE	N233190906644697	2019-11-16 07:26:20.885476	\N	\N	1	\N	764	\N	150000	3	1	0
5259	2019-08-24	IMPS-923610899850-JBM ENTERPRISES-HDFC-XXXXXXXXXX0686-OBC	0000923610899850	2019-11-16 07:26:20.885476	\N	\N	1	\N	232	5760	\N	3	1	0
5260	2019-08-25	IMPS-923712411029-SANGRAM TRADING AND -HDFC-XXXXXXXX1071-OREOANDBOURNVITAPAYMENT	0000923712411029	2019-11-16 07:26:20.885476	\N	\N	1	\N	807	2044	\N	3	1	0
5261	2019-08-27	CASH DEP DADRI	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	773	300000	\N	3	1	0
5262	2019-08-27	FT - DR - 50200006539210 - TUSHAR TRADING COMPANY	0000000000000066	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	\N	300000	3	1	0
5263	2019-08-28	CHQ PAID-MICR CTS-NO-MANOJ KUAR	0000000000000059	2019-11-16 07:26:20.885476	\N	\N	1	\N	808	\N	8000	3	1	0
5265	2019-09-01	UPI-NAVIN YADAV-9457577900@PAYTM-HDFC0003966-924439966076-NA	0000924415842146	2019-11-16 07:26:20.885476	\N	\N	1	\N	809	20871	\N	3	1	0
5264	2019-09-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	776	\N	27436	3	1	0
5266	2019-09-03	UPI-BHUPENDRA PATHAK-PATHAK.BHUPENDRA98@OKHDFCBANK-HDFC0003966-924612244507-UPI	0000924612343905	2019-11-16 07:26:20.885476	\N	\N	1	\N	810	5000	\N	3	1	0
5267	2019-09-06	RDMCGHA0090-STP-RDM	IB06153420689991	2019-11-16 07:26:20.885476	\N	\N	1	\N	765	\N	44546	3	1	0
5268	2019-09-07	O/S INTEREST RECOVERY FROM A/C XXXXXXXXXX9210	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	776	1565	\N	3	1	0
5269	2019-09-07	50200029537650-TPT-JP OD TO TTC OD	0000000238393361	2019-11-16 07:26:20.885476	\N	\N	1	\N	761	140000	\N	3	1	0
5271	2019-09-07	CASH DEP DADRI	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	773	169000	\N	3	1	0
5270	2019-09-07	50200007138822-TPT-TTC OD TO JP CA	0000000238423545	2019-11-16 07:26:20.885476	\N	\N	1	\N	232	\N	140000	3	1	0
5272	2019-09-10	IMPS-925316978816-SANGRAM TRADING AND -HDFC-XXXXXXXX1071-DEEPAKCOLGET	0000925316978816	2019-11-16 07:26:20.885476	\N	\N	1	\N	807	1846	\N	3	1	0
5273	2019-09-11	50200007138822-TPT-TTC OD TO JP CA	0000000274792018	2019-11-16 07:26:20.885476	\N	\N	1	\N	232	\N	150000	3	1	0
5274	2019-09-21	IMPS-926412431088-SANGRAM TRADING AND -HDFC-XXXXXXXX1071-NO1SOAP	0000926412431088	2019-11-16 07:26:20.885476	\N	\N	1	\N	807	1740	\N	3	1	0
5275	2019-10-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:26:20.885476	\N	\N	1	\N	776	\N	27286	3	1	0
5300	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002014	2019-11-16 07:47:15.638883	\N	\N	1	\N	67	16073	\N	4	2	0
5301	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000039649	2019-11-16 07:47:15.638883	\N	\N	1	\N	977	16137	\N	4	2	0
5302	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000902690	2019-11-16 07:47:15.638883	\N	\N	1	\N	1090	16747	\N	4	2	0
5303	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126254	2019-11-16 07:47:15.638883	\N	\N	1	\N	6	21295	\N	4	2	0
5304	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000351648	2019-11-16 07:47:15.638883	\N	\N	1	\N	508	25165	\N	4	2	0
5315	2019-07-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002409	2019-11-16 07:47:15.638883	\N	\N	1	\N	1061	2452	\N	4	2	0
5314	2019-07-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000023191	2019-11-16 07:47:15.638883	\N	\N	1	\N	796	4467	\N	4	2	0
5306	2019-07-02	IMPS-918312732093-LALIT KUMAR-HDFC-XXXXXXXX7071-	0000918312732093	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	6151	\N	4	2	0
5310	2019-07-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000946	2019-11-16 07:47:15.638883	\N	\N	1	\N	95	8388	\N	4	2	0
5313	2019-07-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000756662	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	10737	\N	4	2	0
5312	2019-07-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000380134	2019-11-16 07:47:15.638883	\N	\N	1	\N	968	11890	\N	4	2	0
5311	2019-07-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000245068	2019-11-16 07:47:15.638883	\N	\N	1	\N	616	13380	\N	4	2	0
5316	2019-07-02	CHQ DEP - MICR CLG - NOIDA WBO	0000000000001464	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	15000	\N	4	2	0
5308	2019-07-02	CASH DEP DADRI	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1244	39000	\N	4	2	0
5317	2019-07-02	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N183190255813977	N183190255813977	2019-11-16 07:47:15.638883	\N	\N	1	\N	1070	182149	\N	4	2	0
5309	2019-07-02	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000039649	2019-11-16 07:47:15.638883	\N	\N	1	\N	977	\N	16137	4	2	0
5307	2019-07-02	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019070285271796-COLGATE	HDFCR52019070285271796	2019-11-16 07:47:15.638883	\N	\N	1	\N	1254	\N	292000	4	2	0
5319	2019-07-03	IMPS-918411692299-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-COLGATE	0000918411692299	2019-11-16 07:47:15.638883	\N	\N	1	\N	128	1472	\N	4	2	0
5323	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000692851	2019-11-16 07:47:15.638883	\N	\N	1	\N	901	3164	\N	4	2	0
5320	2019-07-03	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19184606582	KKBKH19184606582	2019-11-16 07:47:15.638883	\N	\N	1	\N	1243	5000	\N	4	2	0
5324	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315648	2019-11-16 07:47:15.638883	\N	\N	1	\N	35	6218	\N	4	2	0
5334	2019-07-04	50200006539210-TPT-FT JP CA TO TTC CA	0000000134341748	2019-11-16 07:47:15.638883	\N	\N	1	\N	422	\N	150000	4	2	0
5327	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000054250	2019-11-16 07:47:15.638883	\N	\N	1	\N	1042	11472	\N	4	2	0
5326	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058242	2019-11-16 07:47:15.638883	\N	\N	1	\N	32	11790	\N	4	2	0
5328	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000395	2019-11-16 07:47:15.638883	\N	\N	1	\N	88	12789	\N	4	2	0
5329	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000586648	2019-11-16 07:47:15.638883	\N	\N	1	\N	46	12935	\N	4	2	0
5330	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108420	2019-11-16 07:47:15.638883	\N	\N	1	\N	64	18241	\N	4	2	0
5321	2019-07-03	NEFT CR-UBIN0560430-GSS TRADING CO-J P ENTERPRISES-000014440840	0000000014440840	2019-11-16 07:47:15.638883	\N	\N	1	\N	632	18279	\N	4	2	0
5331	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259468	2019-11-16 07:47:15.638883	\N	\N	1	\N	1042	22134	\N	4	2	0
5318	2019-07-03	50200004799122-TPT-J P ENT 23 24JUN	0000000117766734	2019-11-16 07:47:15.638883	\N	\N	1	\N	94	23839	\N	4	2	0
5322	2019-07-03	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010714	2019-11-16 07:47:15.638883	\N	\N	1	\N	97	77863	\N	4	2	0
5332	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000762	2019-11-16 07:47:15.638883	\N	\N	1	\N	98	99943	\N	4	2	0
5340	2019-07-04	IMPS-918520690958-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000918520690958	2019-11-16 07:47:15.638883	\N	\N	1	\N	633	1210	\N	4	2	0
5336	2019-07-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000536	2019-11-16 07:47:15.638883	\N	\N	1	\N	661	12174	\N	4	2	0
5339	2019-07-04	IMPS-918519070095-CLASSICMEDICOS-HDFC-XXXXXXXXXX0518-FROMCLASSICMEDICOS	0000918519070095	2019-11-16 07:47:15.638883	\N	\N	1	\N	1191	5755	\N	4	2	0
5337	2019-07-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387532	2019-11-16 07:47:15.638883	\N	\N	1	\N	1066	11928	\N	4	2	0
5338	2019-07-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000142075	2019-11-16 07:47:15.638883	\N	\N	1	\N	46	19914	\N	4	2	0
5333	2019-07-04	EMI 45070519 CHQ S45070519129 071945070519	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1256	\N	69821	4	2	0
5335	2019-07-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131505	2019-11-16 07:47:15.638883	\N	\N	1	\N	1040	4982	\N	4	2	0
5345	2019-07-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000160913	2019-11-16 07:47:15.638883	\N	\N	1	\N	280	3884	\N	4	2	0
5344	2019-07-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000756680	2019-11-16 07:47:15.638883	\N	\N	1	\N	1270	6927	\N	4	2	0
5342	2019-07-05	EMI 52012431 CHQ S52012431120 071952012431	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1257	\N	16495	4	2	0
5341	2019-07-05	MARICO4254-STP-MARICO	IB05113107217534	2019-11-16 07:47:15.638883	\N	\N	1	\N	1252	\N	200000	4	2	0
5346	2019-07-06	IMPS-918710595149-K K STORE-HDFC-XXXXXXXXXX1250-	0000918710595149	2019-11-16 07:47:15.638883	\N	\N	1	\N	918	21144	\N	4	2	0
5347	2019-07-07	IMPS-918810631360-35959771-HDFC-XXXXXXXX8519-	0000918810631360	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	6000	\N	4	2	0
5348	2019-07-07	IMPS-918810107975-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000918810107975	2019-11-16 07:47:15.638883	\N	\N	1	\N	586	8210	\N	4	2	0
5351	2019-07-08	8201560329-06 07 2019-HD03123849	0000907068582385	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	11934.0799999999999	\N	4	2	0
5352	2019-07-08	50200004799122-TPT-J P ENT 30JUN BILL	0000000185480555	2019-11-16 07:47:15.638883	\N	\N	1	\N	94	43909	\N	4	2	0
5350	2019-07-08	MARICO4254-STP-MARICO	IB08101729585451	2019-11-16 07:47:15.638883	\N	\N	1	\N	1252	\N	100000	4	2	0
5349	2019-07-08	HB3142NR1000009999-STP-GODREJ	IB08101629779112	2019-11-16 07:47:15.638883	\N	\N	1	\N	1249	\N	200000	4	2	0
5355	2019-07-09	FT - CR - 50100040075595 - MUKESH KUMAR GARG	0000000000000023	2019-11-16 07:47:15.638883	\N	\N	1	\N	1269	500000	\N	4	2	0
5325	2019-07-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000114252	2019-11-16 07:47:15.638883	\N	\N	1	\N	685	7504	\N	4	2	0
5354	2019-07-09	FT - CR - 50100040075467 - DEEPAK GARG	0000000000000022	2019-11-16 07:47:15.638883	\N	\N	1	\N	1280	500000	\N	4	2	0
5353	2019-07-09	CHQ PAID-MICR CTS-NO-MANOJ K	0000000000000561	2019-11-16 07:47:15.638883	\N	\N	1	\N	1276	\N	10000	4	2	0
5361	2019-07-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000623	2019-11-16 07:47:15.638883	\N	\N	1	\N	1080	15654	\N	4	2	0
5360	2019-07-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001576	2019-11-16 07:47:15.638883	\N	\N	1	\N	513	20087	\N	4	2	0
5357	2019-07-09	CHQ DEP RET CHGS 010719-MIR1918832507420	0000000000510303	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5358	2019-07-09	CHQ DEP RET CHGS 020719-MIR1918932889526	0000000000039649	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5356	2019-07-09	N3058220156601310-STP-DABUR	IB09122557318415	2019-11-16 07:47:15.638883	\N	\N	1	\N	1255	\N	120000	4	2	0
5362	2019-07-10	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN219191957559	SBIN219191957559	2019-11-16 07:47:15.638883	\N	\N	1	\N	52	5344	\N	4	2	0
5363	2019-07-10	FT - CR - 50100040075595 - MUKESH KUMAR GARG	0000000000000024	2019-11-16 07:47:15.638883	\N	\N	1	\N	1269	500000	\N	4	2	0
5364	2019-07-10	FT - CR - 50100040075595 - MUKESH KUMAR GARG	0000000000000025	2019-11-16 07:47:15.638883	\N	\N	1	\N	1269	500000	\N	4	2	0
5366	2019-07-10	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000071740	2019-11-16 07:47:15.638883	\N	\N	1	\N	207	\N	5264	4	2	0
5368	2019-07-11	IMPS-919218153316-RED BULL INDIA PVT LTD-HSBC-XXXXXXXX1001-RED BULL	0000919218153316	2019-11-16 07:47:15.638883	\N	\N	1	\N	1251	\N	200000	4	2	0
5367	2019-07-11	ACH D- MONDELEZ INDIA FOODS-DB36560477	0000000788857966	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	450300.549999999988	4	2	0
5369	2019-07-12	50100051672149-TPT-DRAWINGS	0000000331406661	2019-11-16 07:47:15.638883	\N	\N	1	\N	1258	\N	25000	4	2	0
5371	2019-07-13	UPI-KULDEEP-8860682190@PAYTM-PUNB0460300-919435956688-NA	0000919411106762	2019-11-16 07:47:15.638883	\N	\N	1	\N	41	5000	\N	4	2	0
5370	2019-07-13	IMPS-919408466593-35959771-HDFC-XXXXXXXX8519-	0000919408466593	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	7000	\N	4	2	0
5372	2019-07-13	N3058220156601330-STP-DABUR HC	IB13115305308037	2019-11-16 07:47:15.638883	\N	\N	1	\N	1255	\N	171000	4	2	0
5374	2019-07-14	IMPS-919520847615-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-THM	0000919520847615	2019-11-16 07:47:15.638883	\N	\N	1	\N	633	1166	\N	4	2	0
5373	2019-07-14	IMPS-919514429223-K K STORE-HDFC-XXXXXXXXXX1250-	0000919514429223	2019-11-16 07:47:15.638883	\N	\N	1	\N	918	8485	\N	4	2	0
5376	2019-07-15	UPI-KULDEEP-8860682190@PAYTM-PUNB0460300-919635286795-NA	0000919611905645	2019-11-16 07:47:15.638883	\N	\N	1	\N	41	1707	\N	4	2	0
5375	2019-07-15	NEFT CR-UTIB0000624-SHRI JEE GENERAL STORE-JAYPEE ENTERPRISES-AXMB191968013306	AXMB191968013306	2019-11-16 07:47:15.638883	\N	\N	1	\N	365	7530	\N	4	2	0
5381	2019-07-15	50200004799122-TPT-J P ENT 7JULY BILL	0000000555790530	2019-11-16 07:47:15.638883	\N	\N	1	\N	94	22925	\N	4	2	0
5382	2019-07-15	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N196190261566815	N196190261566815	2019-11-16 07:47:15.638883	\N	\N	1	\N	1070	114159	\N	4	2	0
5383	2019-07-15	POS 436303XXXXXX9204 TATA SKY LIMITED POS DEBIT	0000919680079716	2019-11-16 07:47:15.638883	\N	\N	1	\N	1258	\N	4246	4	2	0
5380	2019-07-15	ACH D- MONDELEZ INDIA FOODS-DB36580548	0000000833399210	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	199692	4	2	0
5377	2019-07-15	FT - DR - 50100040075595 - MUKESH KUMAR GARG	0000000000000459	2019-11-16 07:47:15.638883	\N	\N	1	\N	1269	\N	200000	4	2	0
5385	2019-07-16	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN319197054417	SBIN319197054417	2019-11-16 07:47:15.638883	\N	\N	1	\N	52	3638	\N	4	2	0
5389	2019-07-16	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19197753358	KKBKH19197753358	2019-11-16 07:47:15.638883	\N	\N	1	\N	1243	5000	\N	4	2	0
5390	2019-07-16	NEFT CR-SBIN0006070-FUTURE RETAIL LIMITED-J P ENTERPRISES-SBIN319197546944	SBIN319197546944	2019-11-16 07:47:15.638883	\N	\N	1	\N	852	103668.580000000002	\N	4	2	0
5384	2019-07-16	CHQ DEP RET CHGS 100719-MIR1919444172774	0000000000071740	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5388	2019-07-16	ACH D- MONDELEZ INDIA FOODS-DB36610564	0000000859419192	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	136899.660000000003	4	2	0
5386	2019-07-16	HB3142NR1000009999-STP-GODREJ	IB16125909307898	2019-11-16 07:47:15.638883	\N	\N	1	\N	1249	\N	170000	4	2	0
5397	2019-07-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000255121	2019-11-16 07:47:15.638883	\N	\N	1	\N	58	2995	\N	4	2	0
5396	2019-07-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000400	2019-11-16 07:47:15.638883	\N	\N	1	\N	88	4995	\N	4	2	0
5395	2019-07-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000510329	2019-11-16 07:47:15.638883	\N	\N	1	\N	705	7605	\N	4	2	0
5393	2019-07-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000879627	2019-11-16 07:47:15.638883	\N	\N	1	\N	1074	15941	\N	4	2	0
5394	2019-07-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000114267	2019-11-16 07:47:15.638883	\N	\N	1	\N	685	10018	\N	4	2	0
5392	2019-07-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108425	2019-11-16 07:47:15.638883	\N	\N	1	\N	64	18997	\N	4	2	0
5391	2019-07-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000134	2019-11-16 07:47:15.638883	\N	\N	1	\N	17	26247	\N	4	2	0
5399	2019-07-18	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19199317080	IOBAN19199317080	2019-11-16 07:47:15.638883	\N	\N	1	\N	30	3336	\N	4	2	0
5405	2019-07-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000902710	2019-11-16 07:47:15.638883	\N	\N	1	\N	1090	4547	\N	4	2	0
5404	2019-07-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131530	2019-11-16 07:47:15.638883	\N	\N	1	\N	1041	6465	\N	4	2	0
5403	2019-07-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000455	2019-11-16 07:47:15.638883	\N	\N	1	\N	9	6543	\N	4	2	0
5402	2019-07-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001092	2019-11-16 07:47:15.638883	\N	\N	1	\N	140	7751	\N	4	2	0
5401	2019-07-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387549	2019-11-16 07:47:15.638883	\N	\N	1	\N	1066	13289	\N	4	2	0
5398	2019-07-18	ACH D- MONDELEZ INDIA FOODS-DB36630374	0000000890586574	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	350975.119999999995	4	2	0
5407	2019-07-19	FT - CR - 50100256958108 - HABBIB	0000000000000008	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	11450	\N	4	2	0
5406	2019-07-19	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19200096007	VIJBH19200096007	2019-11-16 07:47:15.638883	\N	\N	1	\N	471	37451	\N	4	2	0
5409	2019-07-19	CHQ DEP - MICR CLG - NOIDA WBO	0000000000127272	2019-11-16 07:47:15.638883	\N	\N	1	\N	656	465777	\N	4	2	0
5410	2019-07-20	NEFT CR-INDB0000006-RAVINDRA NATH-JPENTERPRISES-000203427618	0000000203427618	2019-11-16 07:47:15.638883	\N	\N	1	\N	340	6000	\N	4	2	0
5411	2019-07-20	UPI-AMIT AGARWAL SO MKAG-9999900212@UPI-ORBC0100526-920111439103-NO REMARKS	0000920111741413	2019-11-16 07:47:15.638883	\N	\N	1	\N	670	10000	\N	4	2	0
5379	2019-07-15	50200006539210-TPT-JP CA TO TTC CA	0000000552692671	2019-11-16 07:47:15.638883	\N	\N	1	\N	422	\N	150000	4	2	0
5378	2019-07-15	FT - DR - 50100040075467 - DEEPAK GARG	0000000000000560	2019-11-16 07:47:15.638883	\N	\N	1	\N	1280	\N	500000	4	2	0
5387	2019-07-16	.IMPS P2P 919218153316#11/07/2019 120719-MIR1919645900181	MIR1919645900181	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	\N	17.6999999999999993	4	2	0
5408	2019-07-19	50200027549434-TPT-BILL NO 2668 JP ENTE	0000000399613027	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	8709	\N	4	2	0
5413	2019-07-21	IMPS-920212474073-K K STORE-HDFC-XXXXXXXXXX1250-	0000920212474073	2019-11-16 07:47:15.638883	\N	\N	1	\N	918	14166	\N	4	2	0
5416	2019-07-22	8201605281-17 07 2019-HD03123849	0000907178366512	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	3827.5300000000002	\N	4	2	0
5414	2019-07-22	N3058220156601330-STP-DABUR HC	IB22124207091364	2019-11-16 07:47:15.638883	\N	\N	1	\N	1255	\N	80000	4	2	0
5415	2019-07-22	ACH D- MONDELEZ INDIA FOODS-DB36660275	0000000960906636	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	289967.049999999988	4	2	0
5419	2019-07-23	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N204190264636881	N204190264636881	2019-11-16 07:47:15.638883	\N	\N	1	\N	1070	146243	\N	4	2	0
5418	2019-07-23	N3058220156601310-STP-DABUR HPC	IB23180508878571	2019-11-16 07:47:15.638883	\N	\N	1	\N	1255	\N	200000	4	2	0
5421	2019-07-24	50200004799122-TPT-J P ENT 14 15AUG	0000000350258003	2019-11-16 07:47:15.638883	\N	\N	1	\N	94	13326	\N	4	2	0
5420	2019-07-24	NEFT CR-CORP0003167-ARN MEGA MART LLP-J P ENTERPRISES-000126660030	0000000126660030	2019-11-16 07:47:15.638883	\N	\N	1	\N	3	33795	\N	4	2	0
5422	2019-07-24	POS 436303XXXXXX9204 INDIAN OIL POS DEBIT	0000000000001771	2019-11-16 07:47:15.638883	\N	\N	1	\N	1267	\N	3265	4	2	0
5424	2019-07-25	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19206579277	IOBAN19206579277	2019-11-16 07:47:15.638883	\N	\N	1	\N	30	3579	\N	4	2	0
5423	2019-07-25	ACH D- MONDELEZ INDIA FOODS-DB36700207	0000001024358390	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	309278.440000000002	4	2	0
5427	2019-07-26	POS REF 436303******9204-07/26 INDIAN OI	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1267	24.4899999999999984	\N	4	2	0
5428	2019-07-26	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19207005753	VIJBH19207005753	2019-11-16 07:47:15.638883	\N	\N	1	\N	471	2551	\N	4	2	0
5438	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315654	2019-11-16 07:47:15.638883	\N	\N	1	\N	35	2638	\N	4	2	0
5437	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126894	2019-11-16 07:47:15.638883	\N	\N	1	\N	68	3594	\N	4	2	0
5436	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000884	2019-11-16 07:47:15.638883	\N	\N	1	\N	73	3972	\N	4	2	0
5435	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000699	2019-11-16 07:47:15.638883	\N	\N	1	\N	42	5965	\N	4	2	0
5434	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001623	2019-11-16 07:47:15.638883	\N	\N	1	\N	513	10000	\N	4	2	0
5433	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957677	2019-11-16 07:47:15.638883	\N	\N	1	\N	910	12175	\N	4	2	0
5432	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131539	2019-11-16 07:47:15.638883	\N	\N	1	\N	1041	12416	\N	4	2	0
5425	2019-07-26	IMPS-920710197839-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000920710197839	2019-11-16 07:47:15.638883	\N	\N	1	\N	586	16318	\N	4	2	0
5426	2019-07-26	IMPS-920710426496-K K STORE-HDFC-XXXXXXXXXX1250-	0000920710426496	2019-11-16 07:47:15.638883	\N	\N	1	\N	918	18580	\N	4	2	0
5431	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000997220	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	31314	\N	4	2	0
5430	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992738	2019-11-16 07:47:15.638883	\N	\N	1	\N	23	38601	\N	4	2	0
5429	2019-07-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000818	2019-11-16 07:47:15.638883	\N	\N	1	\N	98	76199	\N	4	2	0
5439	2019-07-26	NEFT CR-SBIN0006070-FUTURE RETAIL LIMITED-J P ENTERPRISES-SBIN119207261758	SBIN119207261758	2019-11-16 07:47:15.638883	\N	\N	1	\N	852	156823.829999999987	\N	4	2	0
5440	2019-07-27	IMPS-920809223868-35959771-HDFC-XXXXXXXX8519-	0000920809223868	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	3000	\N	4	2	0
5441	2019-07-27	UPI-KULDEEP-8860682190@PAYTM-PUNB0460300-920835032785-NA	0000920811216889	2019-11-16 07:47:15.638883	\N	\N	1	\N	41	4563	\N	4	2	0
5442	2019-07-27	UPI-AMIT AGARWAL SO MKAG-9999900212@UPI-ORBC0100526-920811928851-NO REMARKS	0000920811291752	2019-11-16 07:47:15.638883	\N	\N	1	\N	670	10000	\N	4	2	0
5444	2019-07-29	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN119210749540	SBIN119210749540	2019-11-16 07:47:15.638883	\N	\N	1	\N	52	10844	\N	4	2	0
5446	2019-07-29	CASH DEP DADRI	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1244	400000	\N	4	2	0
5445	2019-07-29	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000997220	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	\N	31314	4	2	0
5443	2019-07-29	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N210190885846214-REDBULL	N210190885846214	2019-11-16 07:47:15.638883	\N	\N	1	\N	1251	\N	150000	4	2	0
5447	2019-07-29	N3058220156601310-STP-DABUR	IB29161756371410	2019-11-16 07:47:15.638883	\N	\N	1	\N	1255	\N	490000	4	2	0
5465	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000407493	2019-11-16 07:47:15.638883	\N	\N	1	\N	1129	2936	\N	4	2	0
5466	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002467	2019-11-16 07:47:15.638883	\N	\N	1	\N	1061	2958	\N	4	2	0
5464	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000454345	2019-11-16 07:47:15.638883	\N	\N	1	\N	306	3835	\N	4	2	0
5463	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000114283	2019-11-16 07:47:15.638883	\N	\N	1	\N	685	4273	\N	4	2	0
5454	2019-07-30	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19211894083	KKBKH19211894083	2019-11-16 07:47:15.638883	\N	\N	1	\N	1243	5775	\N	4	2	0
5462	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000165	2019-11-16 07:47:15.638883	\N	\N	1	\N	1144	7200	\N	4	2	0
5461	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000157957	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	9836	\N	4	2	0
5460	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810359	2019-11-16 07:47:15.638883	\N	\N	1	\N	83	12230	\N	4	2	0
5459	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000016077	2019-11-16 07:47:15.638883	\N	\N	1	\N	5	15000	\N	4	2	0
5458	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000745576	2019-11-16 07:47:15.638883	\N	\N	1	\N	40	20085	\N	4	2	0
5457	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000902863	2019-11-16 07:47:15.638883	\N	\N	1	\N	31	20805	\N	4	2	0
5456	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001701	2019-11-16 07:47:15.638883	\N	\N	1	\N	81	22335	\N	4	2	0
5455	2019-07-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108432	2019-11-16 07:47:15.638883	\N	\N	1	\N	64	31282	\N	4	2	0
5452	2019-07-30	CASH DEP DADRI	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1244	105000	\N	4	2	0
5450	2019-07-30	POS 436303XXXXXX9204 SHREE MAHAKALESH POS DEBIT	0000921103351003	2019-11-16 07:47:15.638883	\N	\N	1	\N	1258	\N	100	4	2	0
5449	2019-07-30	POS 436303XXXXXX9204 SHREE MAHAKALESH POS DEBIT	0000921103345612	2019-11-16 07:47:15.638883	\N	\N	1	\N	1258	\N	100	4	2	0
5448	2019-07-30	POS 436303XXXXXX9204 SHREE MAHAKALESH POS DEBIT	0000921103343984	2019-11-16 07:47:15.638883	\N	\N	1	\N	1258	\N	500	4	2	0
5451	2019-07-30	ACH D- MONDELEZ INDIA FOODS-DB36730192	0000001100178627	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	187269.459999999992	4	2	0
6205	2019-05-15	CHQ PAID-MICR CTS-NO-LIC OF INDIA	0000000000000112	2019-11-16 07:57:42.531945	\N	\N	1	\N	1277	\N	17194	5	2	0
5472	2019-07-31	50200004799122-TPT-J P ENT 21JULY BILL	0000000221028082	2019-11-16 07:47:15.638883	\N	\N	1	\N	94	13877	\N	4	2	0
5471	2019-07-31	CASH DEP DADRI	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1244	40000	\N	4	2	0
5469	2019-07-31	ACH D- MONDELEZ INDIA FOODS-DB36750370	0000001116591106	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	365810.869999999995	4	2	0
5470	2019-07-31	ACH D- MONDELEZ INDIA FOODS-DB36760517	0000001116591093	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	602649.119999999995	4	2	0
5473	2019-08-01	IMPS-921315988634-GROWGREEN PRODUCTS-HDFC-XXXXXXXXXXX0684-GROWGREEN	0000921315988634	2019-11-16 07:47:15.638883	\N	\N	1	\N	71	2000	\N	4	2	0
5479	2019-08-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000260969	2019-11-16 07:47:15.638883	\N	\N	1	\N	42	2817	\N	4	2	0
5480	2019-08-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131549	2019-11-16 07:47:15.638883	\N	\N	1	\N	1041	6109	\N	4	2	0
5481	2019-08-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001307	2019-11-16 07:47:15.638883	\N	\N	1	\N	140	12130	\N	4	2	0
5482	2019-08-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131263	2019-11-16 07:47:15.638883	\N	\N	1	\N	55	14714	\N	4	2	0
5477	2019-08-01	8201660258-29 07 2019-HD03123849	0000907297450000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	17275.4599999999991	\N	4	2	0
5483	2019-08-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000565	2019-11-16 07:47:15.638883	\N	\N	1	\N	661	20472	\N	4	2	0
5476	2019-08-01	CHQ DEP RET CHGS 290719-MIR1921383636576	0000000000997220	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5474	2019-08-01	ACH D- MONDELEZ INDIA FOODS-DB36770365	0000001138686586	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	210723.510000000009	4	2	0
5492	2019-08-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121803	2019-11-16 07:47:15.638883	\N	\N	1	\N	68	4076	\N	4	2	0
5493	2019-08-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000116	2019-11-16 07:47:15.638883	\N	\N	1	\N	1039	4274	\N	4	2	0
5494	2019-08-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000146419	2019-11-16 07:47:15.638883	\N	\N	1	\N	766	4747	\N	4	2	0
5484	2019-08-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155059	2019-11-16 07:47:15.638883	\N	\N	1	\N	620	5037	\N	4	2	0
5491	2019-08-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000461	2019-11-16 07:47:15.638883	\N	\N	1	\N	9	8533	\N	4	2	0
5487	2019-08-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058267	2019-11-16 07:47:15.638883	\N	\N	1	\N	32	9568	\N	4	2	0
5488	2019-08-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000245113	2019-11-16 07:47:15.638883	\N	\N	1	\N	616	10000	\N	4	2	0
5489	2019-08-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000238	2019-11-16 07:47:15.638883	\N	\N	1	\N	1066	11603	\N	4	2	0
5490	2019-08-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992747	2019-11-16 07:47:15.638883	\N	\N	1	\N	23	25357	\N	4	2	0
5486	2019-08-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957687	2019-11-16 07:47:15.638883	\N	\N	1	\N	910	26660	\N	4	2	0
5485	2019-08-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009375	2019-11-16 07:47:15.638883	\N	\N	1	\N	105	62401	\N	4	2	0
5495	2019-08-03	NEFT CR-INDB0000006-RAVINDRA NATH-JPENTERPRISES-000206001398	0000000206001398	2019-11-16 07:47:15.638883	\N	\N	1	\N	340	5000	\N	4	2	0
5498	2019-08-03	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000155059	2019-11-16 07:47:15.638883	\N	\N	1	\N	620	\N	5037	4	2	0
5497	2019-08-03	ACH D- MONDELEZ INDIA FOODS-DB36790246	0000001184156968	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	22071.3400000000001	4	2	0
5499	2019-08-03	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000957687	2019-11-16 07:47:15.638883	\N	\N	1	\N	910	\N	26660	4	2	0
5496	2019-08-03	N3058220156601330-STP-DABUR HC	IB03132435236865	2019-11-16 07:47:15.638883	\N	\N	1	\N	1255	\N	170000	4	2	0
5500	2019-08-04	EMI 45070519 CHQ S45070519130 081945070519	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1256	\N	69821	4	2	0
5505	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000454353	2019-11-16 07:47:15.638883	\N	\N	1	\N	306	1015	\N	4	2	0
5524	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000256441	2019-11-16 07:47:15.638883	\N	\N	1	\N	101	5355	\N	4	2	0
5523	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027971	2019-11-16 07:47:15.638883	\N	\N	1	\N	24	7358	\N	4	2	0
5522	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126798	2019-11-16 07:47:15.638883	\N	\N	1	\N	75	7419	\N	4	2	0
5521	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001176	2019-11-16 07:47:15.638883	\N	\N	1	\N	1105	7481	\N	4	2	0
5520	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042506	2019-11-16 07:47:15.638883	\N	\N	1	\N	102	9000	\N	4	2	0
5519	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000157	2019-11-16 07:47:15.638883	\N	\N	1	\N	17	9270	\N	4	2	0
5518	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000146827	2019-11-16 07:47:15.638883	\N	\N	1	\N	13	9466	\N	4	2	0
5517	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000053457	2019-11-16 07:47:15.638883	\N	\N	1	\N	1065	10000	\N	4	2	0
5516	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000114694	2019-11-16 07:47:15.638883	\N	\N	1	\N	46	11894	\N	4	2	0
5515	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000681	2019-11-16 07:47:15.638883	\N	\N	1	\N	1080	12000	\N	4	2	0
5513	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001000	2019-11-16 07:47:15.638883	\N	\N	1	\N	95	12624	\N	4	2	0
5514	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000067228	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	13993	\N	4	2	0
5512	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000084	2019-11-16 07:47:15.638883	\N	\N	1	\N	1262	14714	\N	4	2	0
5501	2019-08-05	FT - CR - 50200010626700 - HARI OM DEPARTMENTAL STORE	0000000000000547	2019-11-16 07:47:15.638883	\N	\N	1	\N	26	15542	\N	4	2	0
5511	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000073	2019-11-16 07:47:15.638883	\N	\N	1	\N	72	29114	\N	4	2	0
5510	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000150520	2019-11-16 07:47:15.638883	\N	\N	1	\N	3	32724	\N	4	2	0
5509	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259807	2019-11-16 07:47:15.638883	\N	\N	1	\N	1131	33841	\N	4	2	0
5508	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001267	2019-11-16 07:47:15.638883	\N	\N	1	\N	60	34003	\N	4	2	0
5507	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101347	2019-11-16 07:47:15.638883	\N	\N	1	\N	434	50000	\N	4	2	0
5506	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000602484	2019-11-16 07:47:15.638883	\N	\N	1	\N	91	66888	\N	4	2	0
5504	2019-08-05	CHQ DEP - MICR CLG - NOIDA WBO	0000000000127294	2019-11-16 07:47:15.638883	\N	\N	1	\N	656	467300	\N	4	2	0
5503	2019-08-05	EMI 52012431 CHQ S52012431121 081952012431	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1257	\N	16495	4	2	0
5502	2019-08-05	ACH D- MONDELEZ INDIA FOODS-DB36800288	0000001212748650	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	129356.699999999997	4	2	0
5467	2019-07-31	FT - CR - 50200029537650 - J P ENTERPRISES	0000000000000166	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	500000	\N	4	2	0
5478	2019-08-01	QHDF7822206317/BILLDKSTATEBANKCOLLE	0000192139134354	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	\N	3005.90000000000009	4	2	0
5528	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000407500	2019-11-16 07:47:15.638883	\N	\N	1	\N	1129	1280	\N	4	2	0
5527	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000765950	2019-11-16 07:47:15.638883	\N	\N	1	\N	1270	2092	\N	4	2	0
5526	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000895	2019-11-16 07:47:15.638883	\N	\N	1	\N	73	4086	\N	4	2	0
5525	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000146	2019-11-16 07:47:15.638883	\N	\N	1	\N	501	4500	\N	4	2	0
5531	2019-08-05	CHQ DEP - MICR CLG - NOIDA WBO	0000000000315656	2019-11-16 07:47:15.638883	\N	\N	1	\N	35	6403	\N	4	2	0
5530	2019-08-05	CHQ DEP - MICR CLG - NOIDA WBO	0000000000001718	2019-11-16 07:47:15.638883	\N	\N	1	\N	81	38990	\N	4	2	0
5533	2019-08-06	IMPS-921809746814-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000921809746814	2019-11-16 07:47:15.638883	\N	\N	1	\N	633	3901	\N	4	2	0
5532	2019-08-06	IMPS-921809743365-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000921809743365	2019-11-16 07:47:15.638883	\N	\N	1	\N	633	14686	\N	4	2	0
5534	2019-08-06	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010874	2019-11-16 07:47:15.638883	\N	\N	1	\N	97	243653	\N	4	2	0
5536	2019-08-06	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000150520	2019-11-16 07:47:15.638883	\N	\N	1	\N	3	\N	32724	4	2	0
5537	2019-08-06	HB3142NR1000009999-STP-GODREJ	IB06224214352152	2019-11-16 07:47:15.638883	\N	\N	1	\N	1249	\N	100000	4	2	0
5547	2019-08-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000118787	2019-11-16 07:47:15.638883	\N	\N	1	\N	1096	3768	\N	4	2	0
5546	2019-08-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000137	2019-11-16 07:47:15.638883	\N	\N	1	\N	313	7754	\N	4	2	0
5541	2019-08-07	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19219707003	KKBKH19219707003	2019-11-16 07:47:15.638883	\N	\N	1	\N	1243	8000	\N	4	2	0
5545	2019-08-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810367	2019-11-16 07:47:15.638883	\N	\N	1	\N	83	8160	\N	4	2	0
5543	2019-08-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000210	2019-11-16 07:47:15.638883	\N	\N	1	\N	1094	16008	\N	4	2	0
5544	2019-08-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108434	2019-11-16 07:47:15.638883	\N	\N	1	\N	64	17354	\N	4	2	0
5542	2019-08-07	NEFT CR-CORP0003167-ARN MEGA MART LLP-J P ENTERPRISES-000129137242	0000000129137242	2019-11-16 07:47:15.638883	\N	\N	1	\N	3	32724	\N	4	2	0
5539	2019-08-07	50200004799122-TPT-J P ENT 27 28JULY	0000000302743509	2019-11-16 07:47:15.638883	\N	\N	1	\N	94	33261	\N	4	2	0
5540	2019-08-07	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019080790349439-COLGATE	HDFCR52019080790349439	2019-11-16 07:47:15.638883	\N	\N	1	\N	1254	\N	515000	4	2	0
5551	2019-08-08	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19220321267	IOBAN19220321267	2019-11-16 07:47:15.638883	\N	\N	1	\N	30	2996	\N	4	2	0
5549	2019-08-08	MARICO4254-STP-MARICO	IB08121115680447	2019-11-16 07:47:15.638883	\N	\N	1	\N	1252	\N	350000	4	2	0
5550	2019-08-08	ACH D- MONDELEZ INDIA FOODS-DB36840463	0000001311719895	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	354889.320000000007	4	2	0
5562	2019-08-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000900	2019-11-16 07:47:15.638883	\N	\N	1	\N	73	3071	\N	4	2	0
5561	2019-08-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132002	2019-11-16 07:47:15.638883	\N	\N	1	\N	75	5197	\N	4	2	0
5560	2019-08-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002030	2019-11-16 07:47:15.638883	\N	\N	1	\N	67	6652	\N	4	2	0
5559	2019-08-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058274	2019-11-16 07:47:15.638883	\N	\N	1	\N	32	9941	\N	4	2	0
5558	2019-08-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000245121	2019-11-16 07:47:15.638883	\N	\N	1	\N	616	10000	\N	4	2	0
5557	2019-08-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000550	2019-11-16 07:47:15.638883	\N	\N	1	\N	86	22468	\N	4	2	0
5563	2019-08-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101348	2019-11-16 07:47:15.638883	\N	\N	1	\N	434	45421	\N	4	2	0
5553	2019-08-09	CASH DEP DADRI	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1244	250000	\N	4	2	0
5555	2019-08-09	CHQ DEP RET CHGS 030819-MIR1922194664005	0000000000155059	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5554	2019-08-09	CHQ DEP RET CHGS 030819-MIR1922194297896	0000000000957687	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5556	2019-08-09	ACH D- MONDELEZ INDIA FOODS-DB36850464	0000001343038705	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	346918.840000000026	4	2	0
5566	2019-08-10	UPI-KULDEEP-8860682190@PAYTM-PUNB0460300-922235429663-NA	0000922211068184	2019-11-16 07:47:15.638883	\N	\N	1	\N	41	7948	\N	4	2	0
5564	2019-08-10	IMPS-922210432452-35959771-HDFC-XXXXXXXX8519-	0000922210432452	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	8000	\N	4	2	0
5567	2019-08-10	UPI-GUPTA GROCERY STORE-8744800800@YBL-BARB0GNOIDA-922228685457-PAYMENT FROM PHONE	0000922214811001	2019-11-16 07:47:15.638883	\N	\N	1	\N	12	10000	\N	4	2	0
5565	2019-08-10	IMPS-922211165301-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000922211165301	2019-11-16 07:47:15.638883	\N	\N	1	\N	586	26429	\N	4	2	0
5581	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127543	2019-11-16 07:47:15.638883	\N	\N	1	\N	390	13327	\N	4	2	0
5580	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000383172	2019-11-16 07:47:15.638883	\N	\N	1	\N	31	13595	\N	4	2	0
5579	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001019	2019-11-16 07:47:15.638883	\N	\N	1	\N	95	14933	\N	4	2	0
5578	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029003	2019-11-16 07:47:15.638883	\N	\N	1	\N	24	15000	\N	4	2	0
5577	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101349	2019-11-16 07:47:15.638883	\N	\N	1	\N	434	16127	\N	4	2	0
5576	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001474	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	16286	\N	4	2	0
5575	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000717802	2019-11-16 07:47:15.638883	\N	\N	1	\N	747	17769	\N	4	2	0
5574	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000902727	2019-11-16 07:47:15.638883	\N	\N	1	\N	1090	19546	\N	4	2	0
5573	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001289	2019-11-16 07:47:15.638883	\N	\N	1	\N	60	23702	\N	4	2	0
5572	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001732	2019-11-16 07:47:15.638883	\N	\N	1	\N	81	24327	\N	4	2	0
5571	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000161953	2019-11-16 07:47:15.638883	\N	\N	1	\N	34	25383	\N	4	2	0
5570	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000128282	2019-11-16 07:47:15.638883	\N	\N	1	\N	6	26512	\N	4	2	0
5568	2019-08-13	CASH DEP DADRI	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1244	400000	\N	4	2	0
5552	2019-08-09	CHQ PAID-MICR CTS-NO-RAMAKRIHAN TARDERS	0000000000000565	2019-11-16 07:47:15.638883	\N	\N	1	\N	1278	\N	24550	4	2	0
5569	2019-08-13	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000245121	2019-11-16 07:47:15.638883	\N	\N	1	\N	616	\N	10000	4	2	0
5548	2019-08-08	CHQ PAID-MICR CTS-NO-MANOJ KUMAR	0000000000000564	2019-11-16 07:47:15.638883	\N	\N	1	\N	1276	\N	10000	4	2	0
5538	2019-08-07	O/S INTEREST RECOVERY FOR A/C XXXXXXXXXX7650	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1279	\N	13904	4	2	0
5583	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000245122	2019-11-16 07:47:15.638883	\N	\N	1	\N	513	10000	\N	4	2	0
5584	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000421972	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	25821	\N	4	2	0
5586	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131387	2019-11-16 07:47:15.638883	\N	\N	1	\N	56	26982	\N	4	2	0
5587	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397446	2019-11-16 07:47:15.638883	\N	\N	1	\N	6	30000	\N	4	2	0
5588	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108438	2019-11-16 07:47:15.638883	\N	\N	1	\N	64	31405	\N	4	2	0
5589	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131343	2019-11-16 07:47:15.638883	\N	\N	1	\N	56	34651	\N	4	2	0
5590	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007358	2019-11-16 07:47:15.638883	\N	\N	1	\N	728	37802	\N	4	2	0
5591	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000978621	2019-11-16 07:47:15.638883	\N	\N	1	\N	1049	42210	\N	4	2	0
5592	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000455023	2019-11-16 07:47:15.638883	\N	\N	1	\N	59	45035	\N	4	2	0
5593	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254977	2019-11-16 07:47:15.638883	\N	\N	1	\N	19	48370	\N	4	2	0
5594	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000602497	2019-11-16 07:47:15.638883	\N	\N	1	\N	91	58977	\N	4	2	0
5595	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042516	2019-11-16 07:47:15.638883	\N	\N	1	\N	102	62208	\N	4	2	0
5598	2019-08-13	50200004799122-TPT-J P ENT 31JUL 4AUG	0000000174650628	2019-11-16 07:47:15.638883	\N	\N	1	\N	621	68059	\N	4	2	0
5596	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259874	2019-11-16 07:47:15.638883	\N	\N	1	\N	1131	78195	\N	4	2	0
5597	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000875	2019-11-16 07:47:15.638883	\N	\N	1	\N	98	130486	\N	4	2	0
5599	2019-08-14	IMPS-922610500006-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-COLGATE	0000922610500006	2019-11-16 07:47:15.638883	\N	\N	1	\N	128	1274	\N	4	2	0
5601	2019-08-14	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19226853066	KKBKH19226853066	2019-11-16 07:47:15.638883	\N	\N	1	\N	1243	10000	\N	4	2	0
5605	2019-08-14	IMPS-922615527250-K K STORE-HDFC-XXXXXXXXXX1250-	0000922615527250	2019-11-16 07:47:15.638883	\N	\N	1	\N	918	25000	\N	4	2	0
5600	2019-08-14	CASH DEP DADRI	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1244	50000	\N	4	2	0
5602	2019-08-14	CHQ DEP RET CHGS 060819-MIR1922298490584	0000000000150520	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5606	2019-08-14	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000259221	2019-11-16 07:47:15.638883	\N	\N	1	\N	513	\N	10000	4	2	0
5607	2019-08-14	50100051672149-TPT-DRAWINGS	0000000186295039	2019-11-16 07:47:15.638883	\N	\N	1	\N	1258	\N	25000	4	2	0
5603	2019-08-14	ACH D- MONDELEZ INDIA FOODS-DB36900197	0000001424811476	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	179622.119999999995	4	2	0
5604	2019-08-14	ACH D- MONDELEZ INDIA FOODS-DB36890383	0000001424811477	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	497949.460000000021	4	2	0
5609	2019-08-16	IMPS-922809141752-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000922809141752	2019-11-16 07:47:15.638883	\N	\N	1	\N	633	694	\N	4	2	0
5621	2019-08-16	IMPS-922818733608-GROWGREEN PRODUCTS-HDFC-XXXXXXXXXXX0684-GROWGREEN	0000922818733608	2019-11-16 07:47:15.638883	\N	\N	1	\N	71	2000	\N	4	2	0
5618	2019-08-16	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19228695051	IOBAN19228695051	2019-11-16 07:47:15.638883	\N	\N	1	\N	30	5913	\N	4	2	0
5610	2019-08-16	UPI-AMIT AGARWAL SO MKAG-9999900212@UPI-ORBC0100526-922810036634-NO REMARKS	0000922810218717	2019-11-16 07:47:15.638883	\N	\N	1	\N	670	10000	\N	4	2	0
5619	2019-08-16	IMPS-922817197570-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000922817197570	2019-11-16 07:47:15.638883	\N	\N	1	\N	586	15994	\N	4	2	0
5611	2019-08-16	50200027549434-TPT-J PBILL NO 3371 3175	0000000497785566	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	27790	\N	4	2	0
5617	2019-08-16	RTGS CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-YESBR52019081665867606	YESBR52019081665867606	2019-11-16 07:47:15.638883	\N	\N	1	\N	1070	239051	\N	4	2	0
5614	2019-08-16	NEFT CR-KKBK0000958-OM EVERGREEN SWEETS-JP ENTERPRISES-KKBKH19228771521	KKBKH19228771521	2019-11-16 07:47:15.638883	\N	\N	1	\N	126	249154	\N	4	2	0
5616	2019-08-16	CHQ DEP RET CHGS 140819-MIR1922809339470	0000000000259221	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5612	2019-08-16	CHQ DEP RET CHGS 130819-MIR1922808601427	0000000000245121	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5620	2019-08-16	GST/BANK REFERENCE NO: R1922813330973/CIN NO: HDFC19080900204352	0190816090019406	2019-11-16 07:47:15.638883	\N	\N	1	\N	1259	\N	7138	4	2	0
5622	2019-08-16	GST/BANK REFERENCE NO: R1922813332640/CIN NO: HDFC19080900205853	0190816090020341	2019-11-16 07:47:15.638883	\N	\N	1	\N	1259	\N	21394	4	2	0
5613	2019-08-16	ACH D- MONDELEZ INDIA FOODS-DB36910412	0000001458183362	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	214522.059999999998	4	2	0
5625	2019-08-17	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19229035350	VIJBH19229035350	2019-11-16 07:47:15.638883	\N	\N	1	\N	471	40000	\N	4	2	0
5627	2019-08-17	NEFT CR-SYNB0008689-SHRI JI  ENTERPRISES-J P ENTERPRISES-P19081797001873	0P19081797001873	2019-11-16 07:47:15.638883	\N	\N	1	\N	1162	80000	\N	4	2	0
5624	2019-08-17	ACH D- MONDELEZ INDIA FOODS-DB36930399	0000001487311591	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	132173.329999999987	4	2	0
5626	2019-08-17	N3058220156601310-STP-DABUR HPC	IB17151458619897	2019-11-16 07:47:15.638883	\N	\N	1	\N	1255	\N	170000	4	2	0
5623	2019-08-17	N3058220156601330-STP-DABUR HC	IB17123020670945	2019-11-16 07:47:15.638883	\N	\N	1	\N	1255	\N	170000	4	2	0
5628	2019-08-18	IMPS-923017418170-K K STORE-HDFC-XXXXXXXXXX1250-	0000923017418170	2019-11-16 07:47:15.638883	\N	\N	1	\N	918	6222	\N	4	2	0
5630	2019-08-18	IMPS-923019577293-35959771-HDFC-XXXXXXXX8519-	0000923019577293	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	8000	\N	4	2	0
5629	2019-08-18	IMPS-923017418239-K K STORE-HDFC-XXXXXXXXXX1250-	0000923017418239	2019-11-16 07:47:15.638883	\N	\N	1	\N	918	14624	\N	4	2	0
5637	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001007	2019-11-16 07:47:15.638883	\N	\N	1	\N	1161	1464	\N	4	2	0
5635	2019-08-19	FT - CR - 50200010626700 - HARI OM DEPARTMENTAL STORE	0000000000000556	2019-11-16 07:47:15.638883	\N	\N	1	\N	26	16956	\N	4	2	0
5631	2019-08-19	50200027362542-TPT-TFJPENTERP	0000000121850519	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	43217	\N	4	2	0
5636	2019-08-19	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010912	2019-11-16 07:47:15.638883	\N	\N	1	\N	97	187195	\N	4	2	0
5633	2019-08-19	MARICO4254-STP-MARICO	IB19144422576352	2019-11-16 07:47:15.638883	\N	\N	1	\N	1252	\N	30000	4	2	0
5634	2019-08-19	RTGS DR-ICIC0001917-SHRI TRADING COMPANY-DADRI-HDFCR52019081991795353	0000000000000566	2019-11-16 07:47:15.638883	\N	\N	1	\N	1215	\N	300000	4	2	0
5632	2019-08-19	ACH D- MONDELEZ INDIA FOODS-DB36940357	0000001514127953	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	331655.090000000026	4	2	0
5608	2019-08-15	POS 436303XXXXXX9204 UTTAR PRADESH PO POS DEBIT	0000922802578330	2019-11-16 07:47:15.638883	\N	\N	1	\N	1275	\N	1300	4	2	0
5639	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000263383	2019-11-16 07:47:15.638883	\N	\N	1	\N	42	6601	\N	4	2	0
5641	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001026	2019-11-16 07:47:15.638883	\N	\N	1	\N	701	8698	\N	4	2	0
5640	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007363	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	7857	\N	4	2	0
5642	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259223	2019-11-16 07:47:15.638883	\N	\N	1	\N	513	10000	\N	4	2	0
5643	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000020260	2019-11-16 07:47:15.638883	\N	\N	1	\N	460	11662	\N	4	2	0
5644	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672764	2019-11-16 07:47:15.638883	\N	\N	1	\N	1260	12254	\N	4	2	0
5645	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155561	2019-11-16 07:47:15.638883	\N	\N	1	\N	512	12306	\N	4	2	0
5646	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024364	2019-11-16 07:47:15.638883	\N	\N	1	\N	700	16290	\N	4	2	0
5647	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000082	2019-11-16 07:47:15.638883	\N	\N	1	\N	72	16825	\N	4	2	0
5648	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131362	2019-11-16 07:47:15.638883	\N	\N	1	\N	56	19720	\N	4	2	0
5649	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000421973	2019-11-16 07:47:15.638883	\N	\N	1	\N	114	21469	\N	4	2	0
5650	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000383189	2019-11-16 07:47:15.638883	\N	\N	1	\N	31	22136	\N	4	2	0
5651	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992763	2019-11-16 07:47:15.638883	\N	\N	1	\N	23	23254	\N	4	2	0
5652	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810381	2019-11-16 07:47:15.638883	\N	\N	1	\N	83	25572	\N	4	2	0
5653	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001209	2019-11-16 07:47:15.638883	\N	\N	1	\N	60	25950	\N	4	2	0
5654	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000171	2019-11-16 07:47:15.638883	\N	\N	1	\N	17	25976	\N	4	2	0
5655	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397461	2019-11-16 07:47:15.638883	\N	\N	1	\N	6	34381	\N	4	2	0
5656	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259940	2019-11-16 07:47:15.638883	\N	\N	1	\N	1131	39214	\N	4	2	0
5657	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101350	2019-11-16 07:47:15.638883	\N	\N	1	\N	434	52627	\N	4	2	0
5669	2019-08-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000154	2019-11-16 07:47:15.638883	\N	\N	1	\N	501	4165	\N	4	2	0
5668	2019-08-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002503	2019-11-16 07:47:15.638883	\N	\N	1	\N	1061	5967	\N	4	2	0
5667	2019-08-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132014	2019-11-16 07:47:15.638883	\N	\N	1	\N	75	9994	\N	4	2	0
5666	2019-08-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029013	2019-11-16 07:47:15.638883	\N	\N	1	\N	24	13008	\N	4	2	0
5665	2019-08-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000745589	2019-11-16 07:47:15.638883	\N	\N	1	\N	40	47408	\N	4	2	0
5664	2019-08-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131388	2019-11-16 07:47:15.638883	\N	\N	1	\N	56	52656	\N	4	2	0
5658	2019-08-20	CASH DEP DADRI	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1244	200000	\N	4	2	0
5662	2019-08-20	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000155561	2019-11-16 07:47:15.638883	\N	\N	1	\N	512	\N	12306	4	2	0
5663	2019-08-20	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000024364	2019-11-16 07:47:15.638883	\N	\N	1	\N	700	\N	16290	4	2	0
5660	2019-08-20	NEFT DR-DEUT0537PUN-FERRERO INDIA PVT LTD-NETBANK, MUM-N232190905799028-FERRERO	N232190905799028	2019-11-16 07:47:15.638883	\N	\N	1	\N	1253	\N	122100	4	2	0
5661	2019-08-20	HB3142NR1000009999-STP-GODREJ	IB20140500340175	2019-11-16 07:47:15.638883	\N	\N	1	\N	1249	\N	300000	4	2	0
5684	2019-08-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000723777	2019-11-16 07:47:15.638883	\N	\N	1	\N	42	2290	\N	4	2	0
5672	2019-08-21	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19233643101	KKBKH19233643101	2019-11-16 07:47:15.638883	\N	\N	1	\N	1243	3100	\N	4	2	0
5683	2019-08-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000474275	2019-11-16 07:47:15.638883	\N	\N	1	\N	58	4145	\N	4	2	0
5682	2019-08-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000114306	2019-11-16 07:47:15.638883	\N	\N	1	\N	685	5548	\N	4	2	0
5681	2019-08-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000565038	2019-11-16 07:47:15.638883	\N	\N	1	\N	601	7545	\N	4	2	0
5679	2019-08-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259224	2019-11-16 07:47:15.638883	\N	\N	1	\N	513	10000	\N	4	2	0
5680	2019-08-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029014	2019-11-16 07:47:15.638883	\N	\N	1	\N	24	7930	\N	4	2	0
5678	2019-08-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131279	2019-11-16 07:47:15.638883	\N	\N	1	\N	55	11654	\N	4	2	0
5677	2019-08-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000227	2019-11-16 07:47:15.638883	\N	\N	1	\N	1094	16982	\N	4	2	0
5676	2019-08-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000410883	2019-11-16 07:47:15.638883	\N	\N	1	\N	359	17214	\N	4	2	0
5675	2019-08-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000553	2019-11-16 07:47:15.638883	\N	\N	1	\N	86	23255	\N	4	2	0
5670	2019-08-21	50200004799122-TPT-J P ENT 11 12AUG	0000000444564364	2019-11-16 07:47:15.638883	\N	\N	1	\N	94	50653	\N	4	2	0
5674	2019-08-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133556	2019-11-16 07:47:15.638883	\N	\N	1	\N	656	227349	\N	4	2	0
5671	2019-08-21	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019082192069843-RED BULL	HDFCR52019082192069843	2019-11-16 07:47:15.638883	\N	\N	1	\N	1251	\N	200000	4	2	0
5692	2019-08-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000408408	2019-11-16 07:47:15.638883	\N	\N	1	\N	78	2771	\N	4	2	0
5690	2019-08-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001328	2019-11-16 07:47:15.638883	\N	\N	1	\N	140	3620	\N	4	2	0
5694	2019-08-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000054229	2019-11-16 07:47:15.638883	\N	\N	1	\N	643	6000	\N	4	2	0
5693	2019-08-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000053480	2019-11-16 07:47:15.638883	\N	\N	1	\N	1065	13135	\N	4	2	0
5686	2019-08-22	IMPS-923412165549-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000923412165549	2019-11-16 07:47:15.638883	\N	\N	1	\N	586	21979	\N	4	2	0
5691	2019-08-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000408409	2019-11-16 07:47:15.638883	\N	\N	1	\N	78	76767	\N	4	2	0
5687	2019-08-22	CHQ DEP RET CHGS 200819-MIR1923421030843	0000000000024364	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5688	2019-08-22	CHQ DEP RET CHGS 200819-MIR1923421023962	0000000000155561	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5685	2019-08-22	MARICO4254-STP-MARICO	IB22103852095242	2019-11-16 07:47:15.638883	\N	\N	1	\N	1252	\N	210000	4	2	0
5689	2019-08-22	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000029014	2019-11-16 07:47:15.638883	\N	\N	1	\N	24	\N	7930	4	2	0
5697	2019-08-23	UPI-SHITALA PRASAD-9918617705@PAYTM-PYTM0123456-923535767675-NA	0000923511255737	2019-11-16 07:47:15.638883	\N	\N	1	\N	1168	3000	\N	4	2	0
5698	2019-08-23	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19235298695	IOBAN19235298695	2019-11-16 07:47:15.638883	\N	\N	1	\N	30	4142	\N	4	2	0
5699	2019-08-24	IMPS-923610422273-35959771-HDFC-XXXXXXXX8519-	0000923610422273	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	7000	\N	4	2	0
5703	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129031	2019-11-16 07:47:15.638883	\N	\N	1	\N	663	4577	\N	4	2	0
5704	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259225	2019-11-16 07:47:15.638883	\N	\N	1	\N	513	10000	\N	4	2	0
5700	2019-08-26	50200027549434-TPT-JP BILL NO 3634	0000000488143097	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	12801	\N	4	2	0
5705	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000468	2019-11-16 07:47:15.638883	\N	\N	1	\N	9	13280	\N	4	2	0
5706	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024365	2019-11-16 07:47:15.638883	\N	\N	1	\N	700	13716	\N	4	2	0
5707	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810389	2019-11-16 07:47:15.638883	\N	\N	1	\N	83	14120	\N	4	2	0
5708	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001478	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	15000	\N	4	2	0
5709	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000588	2019-11-16 07:47:15.638883	\N	\N	1	\N	661	21165	\N	4	2	0
5701	2019-08-26	UPI-AMIT AGARWAL SO MKAG-9999900212@UPI-ORBC0100526-923810854691-NO REMARKS	0000923810282191	2019-11-16 07:47:15.638883	\N	\N	1	\N	670	18227	\N	4	2	0
5713	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000059	2019-11-16 07:47:15.638883	\N	\N	1	\N	307	16677	\N	4	2	0
5710	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000383194	2019-11-16 07:47:15.638883	\N	\N	1	\N	31	23053	\N	4	2	0
5711	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009533	2019-11-16 07:47:15.638883	\N	\N	1	\N	105	50864	\N	4	2	0
5712	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000451131	2019-11-16 07:47:15.638883	\N	\N	1	\N	91	75015	\N	4	2	0
5714	2019-08-27	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN319239165241	SBIN319239165241	2019-11-16 07:47:15.638883	\N	\N	1	\N	52	12440	\N	4	2	0
5724	2019-08-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000722	2019-11-16 07:47:15.638883	\N	\N	1	\N	1080	13965	\N	4	2	0
5723	2019-08-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000145	2019-11-16 07:47:15.638883	\N	\N	1	\N	313	16765	\N	4	2	0
5722	2019-08-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000175	2019-11-16 07:47:15.638883	\N	\N	1	\N	17	17549	\N	4	2	0
5721	2019-08-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000093	2019-11-16 07:47:15.638883	\N	\N	1	\N	1262	35892	\N	4	2	0
5717	2019-08-27	RTGS CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-YESBR52019082766166590	YESBR52019082766166590	2019-11-16 07:47:15.638883	\N	\N	1	\N	1070	201317	\N	4	2	0
5715	2019-08-27	CHQ DEP RET CHGS 220819-MIR1923625217741	0000000000029014	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5719	2019-08-27	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000024365	2019-11-16 07:47:15.638883	\N	\N	1	\N	700	\N	13716	4	2	0
5720	2019-08-27	CHQ DEP RET- CHEQUE IRREGULARLY DRAWN	0000000000000059	2019-11-16 07:47:15.638883	\N	\N	1	\N	307	\N	16677	4	2	0
5716	2019-08-27	ACH D- MONDELEZ INDIA FOODS-DB37030616	0000001652891657	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	324530.090000000026	4	2	0
5733	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000505	2019-11-16 07:47:15.638883	\N	\N	1	\N	1087	5196	\N	4	2	0
5734	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000204725	2019-11-16 07:47:15.638883	\N	\N	1	\N	28	3500	\N	4	2	0
5736	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000431	2019-11-16 07:47:15.638883	\N	\N	1	\N	88	8099	\N	4	2	0
5732	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024367	2019-11-16 07:47:15.638883	\N	\N	1	\N	700	8229	\N	4	2	0
5731	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131283	2019-11-16 07:47:15.638883	\N	\N	1	\N	55	8415	\N	4	2	0
5730	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000135	2019-11-16 07:47:15.638883	\N	\N	1	\N	49	9482	\N	4	2	0
5729	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000385871	2019-11-16 07:47:15.638883	\N	\N	1	\N	1074	13872	\N	4	2	0
5728	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000128407	2019-11-16 07:47:15.638883	\N	\N	1	\N	6	16409	\N	4	2	0
5737	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000236	2019-11-16 07:47:15.638883	\N	\N	1	\N	31	16982	\N	4	2	0
5735	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133477	2019-11-16 07:47:15.638883	\N	\N	1	\N	56	35531	\N	4	2	0
5727	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000060307	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	20000	\N	4	2	0
5726	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108444	2019-11-16 07:47:15.638883	\N	\N	1	\N	64	48165	\N	4	2	0
5738	2019-08-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133565	2019-11-16 07:47:15.638883	\N	\N	1	\N	656	121913	\N	4	2	0
5725	2019-08-28	N3058220156601310-STP-DABUR	IB28145220961160	2019-11-16 07:47:15.638883	\N	\N	1	\N	1255	\N	150000	4	2	0
5746	2019-08-29	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19241305929	IOBAN19241305929	2019-11-16 07:47:15.638883	\N	\N	1	\N	30	4431	\N	4	2	0
5750	2019-08-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000269091	2019-11-16 07:47:15.638883	\N	\N	1	\N	1091	15790	\N	4	2	0
5749	2019-08-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000461916	2019-11-16 07:47:15.638883	\N	\N	1	\N	31	16944	\N	4	2	0
5748	2019-08-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000745596	2019-11-16 07:47:15.638883	\N	\N	1	\N	40	20020	\N	4	2	0
5747	2019-08-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810404	2019-11-16 07:47:15.638883	\N	\N	1	\N	83	24605	\N	4	2	0
5741	2019-08-29	CHQ DEP RET CHGS 270819-MIR1924133152460	0000000000024365	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5745	2019-08-29	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000060307	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	\N	20000	4	2	0
5743	2019-08-29	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N241190912706587-REDBULL	N241190912706587	2019-11-16 07:47:15.638883	\N	\N	1	\N	1251	\N	100000	4	2	0
5742	2019-08-29	HB3142NR1000009999-STP-GODREJ	IB29145812861263	2019-11-16 07:47:15.638883	\N	\N	1	\N	1249	\N	137000	4	2	0
5744	2019-08-29	ACH D- MONDELEZ INDIA FOODS-DB37050379	0000001700361650	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	650001.430000000051	4	2	0
5696	2019-08-23	50200027549434-TPT-JP BILL NO 3535	0000000267391084	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	737	\N	4	2	0
5718	2019-08-27	FT - CR - 50200029537650 - J P ENTERPRISES	0000000000000168	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	150000	\N	4	2	0
5740	2019-08-28	50100167543571-TPT-SHWETA TO JP ENTERPR	0000000521598402	2019-11-16 07:47:15.638883	\N	\N	1	\N	1281	90000	\N	4	2	0
5739	2019-08-28	50100040075467-TPT-DEEPAK TO JP ENTERPR	0000000521595712	2019-11-16 07:47:15.638883	\N	\N	1	\N	1280	100000	\N	4	2	0
5753	2019-08-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000232316	2019-11-16 07:47:15.638883	\N	\N	1	\N	62	4783	\N	4	2	0
5751	2019-08-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000146826	2019-11-16 07:47:15.638883	\N	\N	1	\N	13	6205	\N	4	2	0
5760	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000267588	2019-11-16 07:47:15.638883	\N	\N	1	\N	1125	1505	\N	4	2	0
5764	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129035	2019-11-16 07:47:15.638883	\N	\N	1	\N	663	1964	\N	4	2	0
5765	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000010189	2019-11-16 07:47:15.638883	\N	\N	1	\N	280	2182	\N	4	2	0
5766	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000267345	2019-11-16 07:47:15.638883	\N	\N	1	\N	87	3435	\N	4	2	0
5761	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000970	2019-11-16 07:47:15.638883	\N	\N	1	\N	73	6285	\N	4	2	0
5767	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134288	2019-11-16 07:47:15.638883	\N	\N	1	\N	1041	11289	\N	4	2	0
5768	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001016	2019-11-16 07:47:15.638883	\N	\N	1	\N	1186	14396	\N	4	2	0
5763	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992779	2019-11-16 07:47:15.638883	\N	\N	1	\N	23	41078	\N	4	2	0
5762	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002043	2019-11-16 07:47:15.638883	\N	\N	1	\N	67	25005	\N	4	2	0
5769	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000104518	2019-11-16 07:47:15.638883	\N	\N	1	\N	14	47967	\N	4	2	0
5757	2019-08-30	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010931	2019-11-16 07:47:15.638883	\N	\N	1	\N	97	89591	\N	4	2	0
5756	2019-08-30	DEBIT CARD ANNUAL FEE-AUG-2019 270819-MIR1924134822919	MIR1924134822919	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	\N	885	4	2	0
5759	2019-08-30	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000472	2019-11-16 07:47:15.638883	\N	\N	1	\N	9	\N	6005	4	2	0
5758	2019-08-30	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000269091	2019-11-16 07:47:15.638883	\N	\N	1	\N	1091	\N	15790	4	2	0
5778	2019-08-31	IMPS-924321947782-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-JPENT	0000924321947782	2019-11-16 07:47:15.638883	\N	\N	1	\N	633	1340	\N	4	2	0
5777	2019-08-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000010190	2019-11-16 07:47:15.638883	\N	\N	1	\N	280	2409	\N	4	2	0
5770	2019-08-31	NEFT CR-INDB0000006-RAVINDRA NATH-JPENTERPRISES-000210678015	0000000210678015	2019-11-16 07:47:15.638883	\N	\N	1	\N	340	5000	\N	4	2	0
5772	2019-08-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672782	2019-11-16 07:47:15.638883	\N	\N	1	\N	1260	5338	\N	4	2	0
5773	2019-08-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121843	2019-11-16 07:47:15.638883	\N	\N	1	\N	68	7729	\N	4	2	0
5776	2019-08-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000245121	2019-11-16 07:47:15.638883	\N	\N	1	\N	616	10000	\N	4	2	0
5779	2019-08-31	IMPS-924321952209-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-JPENT	0000924321952209	2019-11-16 07:47:15.638883	\N	\N	1	\N	633	12500	\N	4	2	0
5774	2019-08-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001843	2019-11-16 07:47:15.638883	\N	\N	1	\N	81	37533	\N	4	2	0
5775	2019-08-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009590	2019-11-16 07:47:15.638883	\N	\N	1	\N	105	39615	\N	4	2	0
5771	2019-08-31	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000001016	2019-11-16 07:47:15.638883	\N	\N	1	\N	1186	\N	14396	4	2	0
5780	2019-09-01	UPI-AAKASH KUMAR-9555180007@PAYTM-PUNB0460300-924434492111-NA	0000924410344733	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	2500	\N	4	2	0
5781	2019-09-01	UPI-SHIV PRASAD UPADHYAY-USHIV84@OKICICI-ICIC0001031-924421383723-UPI	0000924421699929	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	14000	\N	4	2	0
5783	2019-09-02	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19245051381	VIJBH19245051381	2019-11-16 07:47:15.638883	\N	\N	1	\N	471	3520	\N	4	2	0
5793	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000454387	2019-11-16 07:47:15.638883	\N	\N	1	\N	306	4226	\N	4	2	0
5792	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000054232	2019-11-16 07:47:15.638883	\N	\N	1	\N	643	4974	\N	4	2	0
5790	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000146865	2019-11-16 07:47:15.638883	\N	\N	1	\N	13	6000	\N	4	2	0
5791	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000981	2019-11-16 07:47:15.638883	\N	\N	1	\N	73	6475	\N	4	2	0
5789	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038200	2019-11-16 07:47:15.638883	\N	\N	1	\N	5	8433	\N	4	2	0
5788	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000042	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	9824	\N	4	2	0
5786	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259276	2019-11-16 07:47:15.638883	\N	\N	1	\N	513	10000	\N	4	2	0
5798	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029029	2019-11-16 07:47:15.638883	\N	\N	1	\N	24	13305	\N	4	2	0
5797	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002044	2019-11-16 07:47:15.638883	\N	\N	1	\N	67	13608	\N	4	2	0
5796	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000520618	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	15000	\N	4	2	0
5795	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000357217	2019-11-16 07:47:15.638883	\N	\N	1	\N	1090	16000	\N	4	2	0
5801	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000100	2019-11-16 07:47:15.638883	\N	\N	1	\N	72	17638	\N	4	2	0
5800	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042560	2019-11-16 07:47:15.638883	\N	\N	1	\N	102	19340	\N	4	2	0
5799	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000188	2019-11-16 07:47:15.638883	\N	\N	1	\N	1144	20000	\N	4	2	0
5784	2019-09-02	IMPS-924516550736-K K STORE-HDFC-XXXXXXXXXX1250-	0000924516550736	2019-11-16 07:47:15.638883	\N	\N	1	\N	918	30858	\N	4	2	0
5794	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000148	2019-11-16 07:47:15.638883	\N	\N	1	\N	313	20911	\N	4	2	0
5785	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000151454	2019-11-16 07:47:15.638883	\N	\N	1	\N	3	36503	\N	4	2	0
5803	2019-09-02	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N245190281251025	N245190281251025	2019-11-16 07:47:15.638883	\N	\N	1	\N	1070	133145	\N	4	2	0
5802	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259989	2019-11-16 07:47:15.638883	\N	\N	1	\N	1131	186138	\N	4	2	0
5782	2019-09-02	ACH D- MONDELEZ INDIA FOODS-DB37080270	0000001782713293	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	154519.690000000002	4	2	0
5805	2019-09-03	NEFT CR-SBIN0006070-FUTURE RETAIL LIMITED-J P ENTERPRISES-SBIN319246959662	SBIN319246959662	2019-11-16 07:47:15.638883	\N	\N	1	\N	852	788366.560000000056	\N	4	2	0
5804	2019-09-03	N3058220156601330-STP-DABUR	IB03123156771628	2019-11-16 07:47:15.638883	\N	\N	1	\N	1255	\N	240000	4	2	0
5807	2019-09-03	HB3142NR1000009999-STP-GODREJ	IB03150631238688	2019-11-16 07:47:15.638883	\N	\N	1	\N	1249	\N	267000	4	2	0
5755	2019-08-29	50200004799122-TPT-JP 18 AUG	0000000332672498	2019-11-16 07:47:15.638883	\N	\N	1	\N	94	54507	\N	4	2	0
5806	2019-09-03	RTGS DR-CNRB0002159-JP ENTERPRISES-NETBANK, MUM-HDFCR52019090393930070-JP CA JP CANARA	HDFCR52019090393930070	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	\N	200000	4	2	0
5809	2019-09-04	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN419247618322	SBIN419247618322	2019-11-16 07:47:15.638883	\N	\N	1	\N	52	3088	\N	4	2	0
5811	2019-09-04	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19247611953	KKBKH19247611953	2019-11-16 07:47:15.638883	\N	\N	1	\N	1243	10000	\N	4	2	0
5810	2019-09-04	EMI 45070519 CHQ S45070519131 091945070519	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1256	\N	69821	4	2	0
5812	2019-09-04	ACH D- MONDELEZ INDIA FOODS-DB37110570	0000001836991202	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	236672.98000000001	4	2	0
5820	2019-09-05	IMPS-924817232811-GROWGREEN PRODUCTS-HDFC-XXXXXXXXXXX0684-GROWGREEN	0000924817232811	2019-11-16 07:47:15.638883	\N	\N	1	\N	71	1100	\N	4	2	0
5815	2019-09-05	CHQ DEP RET CHGS 300819-MIR1924738936226	0000000000000472	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5816	2019-09-05	CHQ DEP RET CHGS 300819-MIR1924738938391	0000000000269091	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5818	2019-09-05	CHQ DEP RET CHGS 310819-MIR1924739032040	0000000000001016	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5814	2019-09-05	CHQ DEP RET CHGS 290819-MIR1924738778596	0000000000060307	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5819	2019-09-05	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N248190919673948-COLGATE	N248190919673948	2019-11-16 07:47:15.638883	\N	\N	1	\N	1254	\N	121000	4	2	0
5817	2019-09-05	EMI 52012431 CHQ S52012431122 091952012431	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1257	\N	16495	4	2	0
5813	2019-09-05	MARICO4254-STP-MARICO	IB05101115856295	2019-11-16 07:47:15.638883	\N	\N	1	\N	1252	\N	400000	4	2	0
5822	2019-09-06	8201822297-04 09 2019-HD03123849	0000909055282799	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	451.970000000000027	\N	4	2	0
5834	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000556940	2019-11-16 07:47:15.638883	\N	\N	1	\N	553	1139	\N	4	2	0
5833	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000820556	2019-11-16 07:47:15.638883	\N	\N	1	\N	1270	3070	\N	4	2	0
5832	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315662	2019-11-16 07:47:15.638883	\N	\N	1	\N	35	3839	\N	4	2	0
5831	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123647	2019-11-16 07:47:15.638883	\N	\N	1	\N	68	4512	\N	4	2	0
5835	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000052929	2019-11-16 07:47:15.638883	\N	\N	1	\N	310	7804	\N	4	2	0
5830	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155071	2019-11-16 07:47:15.638883	\N	\N	1	\N	620	8627	\N	4	2	0
5829	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992788	2019-11-16 07:47:15.638883	\N	\N	1	\N	23	15991	\N	4	2	0
5821	2019-09-06	IMPS-924909277867-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-JPENT	0000924909277867	2019-11-16 07:47:15.638883	\N	\N	1	\N	633	9080	\N	4	2	0
5828	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810410	2019-11-16 07:47:15.638883	\N	\N	1	\N	83	16349	\N	4	2	0
5827	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785630	2019-11-16 07:47:15.638883	\N	\N	1	\N	910	17528	\N	4	2	0
5826	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000461924	2019-11-16 07:47:15.638883	\N	\N	1	\N	31	19575	\N	4	2	0
5825	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001308	2019-11-16 07:47:15.638883	\N	\N	1	\N	60	28047	\N	4	2	0
5824	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000260021	2019-11-16 07:47:15.638883	\N	\N	1	\N	1131	52452	\N	4	2	0
5823	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000408467	2019-11-16 07:47:15.638883	\N	\N	1	\N	78	93492	\N	4	2	0
5841	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127036	2019-11-16 07:47:15.638883	\N	\N	1	\N	89	3413	\N	4	2	0
5843	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132039	2019-11-16 07:47:15.638883	\N	\N	1	\N	75	3594	\N	4	2	0
5837	2019-09-07	50200027549434-TPT-JP BILL NO 3870	0000000235077753	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	3720	\N	4	2	0
5847	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000195281	2019-11-16 07:47:15.638883	\N	\N	1	\N	28	6500	\N	4	2	0
5842	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058292	2019-11-16 07:47:15.638883	\N	\N	1	\N	32	5567	\N	4	2	0
5839	2019-09-07	NEFT CR-INDB0000006-RAVINDRA NATH-JPENTERPRISES-000212265590	0000000212265590	2019-11-16 07:47:15.638883	\N	\N	1	\N	340	8000	\N	4	2	0
5845	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810411	2019-11-16 07:47:15.638883	\N	\N	1	\N	83	15000	\N	4	2	0
5844	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002052	2019-11-16 07:47:15.638883	\N	\N	1	\N	67	18224	\N	4	2	0
5850	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000520640	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	20382	\N	4	2	0
5849	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000455037	2019-11-16 07:47:15.638883	\N	\N	1	\N	59	21266	\N	4	2	0
5848	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009637	2019-11-16 07:47:15.638883	\N	\N	1	\N	105	26883	\N	4	2	0
5838	2019-09-07	IMPS-925011523012-K K STORE-HDFC-XXXXXXXXXX1250-	0000925011523012	2019-11-16 07:47:15.638883	\N	\N	1	\N	918	33823	\N	4	2	0
5857	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000510394	2019-11-16 07:47:15.638883	\N	\N	1	\N	705	2944	\N	4	2	0
5858	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000177	2019-11-16 07:47:15.638883	\N	\N	1	\N	501	3000	\N	4	2	0
5859	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000267597	2019-11-16 07:47:15.638883	\N	\N	1	\N	1125	5203	\N	4	2	0
5860	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003911	2019-11-16 07:47:15.638883	\N	\N	1	\N	101	5507	\N	4	2	0
5861	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042571	2019-11-16 07:47:15.638883	\N	\N	1	\N	102	9073	\N	4	2	0
5862	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000443	2019-11-16 07:47:15.638883	\N	\N	1	\N	616	10000	\N	4	2	0
5863	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001208	2019-11-16 07:47:15.638883	\N	\N	1	\N	1105	10301	\N	4	2	0
5864	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000193	2019-11-16 07:47:15.638883	\N	\N	1	\N	17	10503	\N	4	2	0
5855	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009701	2019-11-16 07:47:15.638883	\N	\N	1	\N	105	33762	\N	4	2	0
5854	2019-09-09	CHQ DEP - MICR CLG - NOIDA WBO	0000000000001861	2019-11-16 07:47:15.638883	\N	\N	1	\N	81	46024	\N	4	2	0
5856	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000151475	2019-11-16 07:47:15.638883	\N	\N	1	\N	3	46588	\N	4	2	0
5852	2019-09-09	50200004799122-TPT-J P ENT 25AUG 2SEP B	0000000258581963	2019-11-16 07:47:15.638883	\N	\N	1	\N	94	59376	\N	4	2	0
5853	2019-09-09	HB3142NR1000009999-STP-GODREJ	IB09161923248651	2019-11-16 07:47:15.638883	\N	\N	1	\N	1249	\N	263000	4	2	0
5851	2019-09-09	ACH D- MONDELEZ INDIA FOODS-DB37150168	0000001956867441	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	875048.069999999949	4	2	0
5846	2019-09-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259278	2019-11-16 07:47:15.638883	\N	\N	1	\N	513	10250	\N	4	2	0
5840	2019-09-07	50200029853444-TPT-TTC OD TO JP CA	0000000238423545	2019-11-16 07:47:15.638883	\N	\N	1	\N	422	140000	\N	4	2	0
5866	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000514	2019-11-16 07:47:15.638883	\N	\N	1	\N	1083	14182	\N	4	2	0
5867	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029039	2019-11-16 07:47:15.638883	\N	\N	1	\N	24	16612	\N	4	2	0
5868	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000130375	2019-11-16 07:47:15.638883	\N	\N	1	\N	6	25000	\N	4	2	0
5869	2019-09-10	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19253836706	KKBKH19253836706	2019-11-16 07:47:15.638883	\N	\N	1	\N	1243	10000	\N	4	2	0
5870	2019-09-10	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000151475	2019-11-16 07:47:15.638883	\N	\N	1	\N	3	\N	46588	4	2	0
5885	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000692872	2019-11-16 07:47:15.638883	\N	\N	1	\N	63	2125	\N	4	2	0
5873	2019-09-11	IMPS-925410416195-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-PARASUT	0000925410416195	2019-11-16 07:47:15.638883	\N	\N	1	\N	128	2156	\N	4	2	0
5884	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000310031	2019-11-16 07:47:15.638883	\N	\N	1	\N	87	3555	\N	4	2	0
5883	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000723793	2019-11-16 07:47:15.638883	\N	\N	1	\N	1125	4025	\N	4	2	0
5876	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000184670	2019-11-16 07:47:15.638883	\N	\N	1	\N	50	4992	\N	4	2	0
5887	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101499	2019-11-16 07:47:15.638883	\N	\N	1	\N	434	8136	\N	4	2	0
5886	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000510	2019-11-16 07:47:15.638883	\N	\N	1	\N	1087	7960	\N	4	2	0
5888	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001060	2019-11-16 07:47:15.638883	\N	\N	1	\N	95	8152	\N	4	2	0
5877	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002544	2019-11-16 07:47:15.638883	\N	\N	1	\N	1061	8297	\N	4	2	0
5878	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000434	2019-11-16 07:47:15.638883	\N	\N	1	\N	88	11506	\N	4	2	0
5879	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000098	2019-11-16 07:47:15.638883	\N	\N	1	\N	1262	15690	\N	4	2	0
5889	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000146	2019-11-16 07:47:15.638883	\N	\N	1	\N	1039	18028	\N	4	2	0
5890	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000745603	2019-11-16 07:47:15.638883	\N	\N	1	\N	40	24211	\N	4	2	0
5882	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000023721	2019-11-16 07:47:15.638883	\N	\N	1	\N	313	24062	\N	4	2	0
5880	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000114335	2019-11-16 07:47:15.638883	\N	\N	1	\N	685	30986	\N	4	2	0
5881	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133531	2019-11-16 07:47:15.638883	\N	\N	1	\N	56	31042	\N	4	2	0
5891	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000270188	2019-11-16 07:47:15.638883	\N	\N	1	\N	19	68246	\N	4	2	0
5892	2019-09-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000451176	2019-11-16 07:47:15.638883	\N	\N	1	\N	91	142277	\N	4	2	0
5875	2019-09-11	ADHOC STMT CHGS INCL GST 070919-MIR1925354842785	MIR1925354842785	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5899	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137852	2019-11-16 07:47:15.638883	\N	\N	1	\N	1041	1209	\N	4	2	0
5898	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000407533	2019-11-16 07:47:15.638883	\N	\N	1	\N	1129	1404	\N	4	2	0
5911	2019-09-12	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19255230150	IOBAN19255230150	2019-11-16 07:47:15.638883	\N	\N	1	\N	30	1970	\N	4	2	0
5895	2019-09-12	ACH D- MONDELEZ INDIA FOODS-DB37190322	0000002019389975	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	284830.099999999977	4	2	0
5910	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001349	2019-11-16 07:47:15.638883	\N	\N	1	\N	140	3150	\N	4	2	0
5909	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000260080	2019-11-16 07:47:15.638883	\N	\N	1	\N	1131	3518	\N	4	2	0
5908	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000717826	2019-11-16 07:47:15.638883	\N	\N	1	\N	747	6257	\N	4	2	0
5907	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810420	2019-11-16 07:47:15.638883	\N	\N	1	\N	83	7358	\N	4	2	0
5906	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000025108	2019-11-16 07:47:15.638883	\N	\N	1	\N	831	7515	\N	4	2	0
5905	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000356957	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	8009	\N	4	2	0
5904	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000298	2019-11-16 07:47:15.638883	\N	\N	1	\N	1066	11191	\N	4	2	0
5903	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000601	2019-11-16 07:47:15.638883	\N	\N	1	\N	661	12940	\N	4	2	0
5902	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397528	2019-11-16 07:47:15.638883	\N	\N	1	\N	6	25607	\N	4	2	0
5901	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131295	2019-11-16 07:47:15.638883	\N	\N	1	\N	55	34426	\N	4	2	0
5900	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000408489	2019-11-16 07:47:15.638883	\N	\N	1	\N	78	36494	\N	4	2	0
5894	2019-09-12	CASH DEP DADRI	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1244	590000	\N	4	2	0
5893	2019-09-12	CHQ DEP RET CHGS 100919-MIR1925558512531	0000000000151475	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
5897	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000406480	2019-11-16 07:47:15.638883	\N	\N	1	\N	264	2182	\N	4	2	0
5896	2019-09-12	MARICO4254-STP-MARICO	IB12145811236556	2019-11-16 07:47:15.638883	\N	\N	1	\N	1252	\N	300000	4	2	0
5914	2019-09-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000901	2019-11-16 07:47:15.638883	\N	\N	1	\N	73	3279	\N	4	2	0
5915	2019-09-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133960	2019-11-16 07:47:15.638883	\N	\N	1	\N	68	4433	\N	4	2	0
5912	2019-09-13	FT - CR - 50200028672680 - ALPHA 2 UNIT OF S H PROF  M PVT LTD	0000000000000959	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	4696	\N	4	2	0
5916	2019-09-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000069151	2019-11-16 07:47:15.638883	\N	\N	1	\N	187	6379	\N	4	2	0
5917	2019-09-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000885904	2019-11-16 07:47:15.638883	\N	\N	1	\N	513	10000	\N	4	2	0
5918	2019-09-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000161978	2019-11-16 07:47:15.638883	\N	\N	1	\N	34	11272	\N	4	2	0
5919	2019-09-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000064	2019-11-16 07:47:15.638883	\N	\N	1	\N	307	20000	\N	4	2	0
5920	2019-09-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785637	2019-11-16 07:47:15.638883	\N	\N	1	\N	910	21978	\N	4	2	0
5913	2019-09-13	ACH D- MONDELEZ INDIA FOODS-DB37200235	0000002035062925	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	364778.070000000007	4	2	0
5921	2019-09-14	IMPS-925710722607-35959771-HDFC-XXXXXXXX8519-	0000925710722607	2019-11-16 07:47:15.638883	\N	\N	1	\N	340	6000	\N	4	2	0
5871	2019-09-11	50200029853444-TPT-TTC OD TO JP CA	0000000274792018	2019-11-16 07:47:15.638883	\N	\N	1	\N	422	150000	\N	4	2	0
5872	2019-09-11	50200006539210-TPT-JP CA TO TTC CA	0000000274805290	2019-11-16 07:47:15.638883	\N	\N	1	\N	422	\N	50000	4	2	0
5923	2019-09-14	UPI-AMIT AGARWAL SO MKAG-9999900212@UPI-ORBC0100526-925714568030-NO REMARKS	0000925714248123	2019-11-16 07:47:15.638883	\N	\N	1	\N	670	20000	\N	4	2	0
5931	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000267314	2019-11-16 07:47:15.638883	\N	\N	1	\N	1142	1457	\N	4	2	0
5932	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826742	2019-11-16 07:47:15.638883	\N	\N	1	\N	858	1669	\N	4	2	0
5933	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000556941	2019-11-16 07:47:15.638883	\N	\N	1	\N	553	2595	\N	4	2	0
5947	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000204728	2019-11-16 07:47:15.638883	\N	\N	1	\N	28	3477	\N	4	2	0
5934	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129045	2019-11-16 07:47:15.638883	\N	\N	1	\N	663	3625	\N	4	2	0
5948	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000820579	2019-11-16 07:47:15.638883	\N	\N	1	\N	1270	4715	\N	4	2	0
5949	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003925	2019-11-16 07:47:15.638883	\N	\N	1	\N	101	4930	\N	4	2	0
5950	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000184	2019-11-16 07:47:15.638883	\N	\N	1	\N	501	6000	\N	4	2	0
5951	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315667	2019-11-16 07:47:15.638883	\N	\N	1	\N	35	6243	\N	4	2	0
5953	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134254	2019-11-16 07:47:15.638883	\N	\N	1	\N	75	7241	\N	4	2	0
5954	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000053543	2019-11-16 07:47:15.638883	\N	\N	1	\N	1065	9000	\N	4	2	0
5929	2019-09-16	IMPS-925918668134-K K STORE-HDFC-XXXXXXXXXX1250-	0000925918668134	2019-11-16 07:47:15.638883	\N	\N	1	\N	918	11212	\N	4	2	0
5955	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029046	2019-11-16 07:47:15.638883	\N	\N	1	\N	24	9835	\N	4	2	0
5956	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000685133	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	11978	\N	4	2	0
5928	2019-09-16	CHQ DEP - MICR CLG - NOIDA WBO	0000000000283794	2019-11-16 07:47:15.638883	\N	\N	1	\N	478	13394	\N	4	2	0
5936	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000120	2019-11-16 07:47:15.638883	\N	\N	1	\N	72	13644	\N	4	2	0
5937	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000182	2019-11-16 07:47:15.638883	\N	\N	1	\N	231	14511	\N	4	2	0
5938	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000461935	2019-11-16 07:47:15.638883	\N	\N	1	\N	31	14561	\N	4	2	0
5939	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001073	2019-11-16 07:47:15.638883	\N	\N	1	\N	95	14640	\N	4	2	0
5940	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127040	2019-11-16 07:47:15.638883	\N	\N	1	\N	89	15470	\N	4	2	0
5941	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132390	2019-11-16 07:47:15.638883	\N	\N	1	\N	390	16044	\N	4	2	0
5942	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397550	2019-11-16 07:47:15.638883	\N	\N	1	\N	6	24466	\N	4	2	0
5943	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000056	2019-11-16 07:47:15.638883	\N	\N	1	\N	1064	24949	\N	4	2	0
5944	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007401	2019-11-16 07:47:15.638883	\N	\N	1	\N	514	25281	\N	4	2	0
5945	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001319	2019-11-16 07:47:15.638883	\N	\N	1	\N	60	25330	\N	4	2	0
5946	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101485	2019-11-16 07:47:15.638883	\N	\N	1	\N	434	25823	\N	4	2	0
5957	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001127	2019-11-16 07:47:15.638883	\N	\N	1	\N	12	28107	\N	4	2	0
5958	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132301	2019-11-16 07:47:15.638883	\N	\N	1	\N	64	36064	\N	4	2	0
5927	2019-09-16	50200004799122-TPT-J P ENT 8 9 SEP	0000000532992167	2019-11-16 07:47:15.638883	\N	\N	1	\N	94	32790	\N	4	2	0
5925	2019-09-16	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19259070884	VIJBH19259070884	2019-11-16 07:47:15.638883	\N	\N	1	\N	471	30000	\N	4	2	0
5959	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101500	2019-11-16 07:47:15.638883	\N	\N	1	\N	434	53350	\N	4	2	0
5935	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000977	2019-11-16 07:47:15.638883	\N	\N	1	\N	126	94045	\N	4	2	0
5960	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992799	2019-11-16 07:47:15.638883	\N	\N	1	\N	23	74546	\N	4	2	0
5926	2019-09-16	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019091695660024-RED BULL	HDFCR52019091695660024	2019-11-16 07:47:15.638883	\N	\N	1	\N	1251	\N	250000	4	2	0
5969	2019-09-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000031	2019-11-16 07:47:15.638883	\N	\N	1	\N	1195	10532	\N	4	2	0
5968	2019-09-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000022951	2019-11-16 07:47:15.638883	\N	\N	1	\N	700	15409	\N	4	2	0
5967	2019-09-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101487	2019-11-16 07:47:15.638883	\N	\N	1	\N	434	26000	\N	4	2	0
5965	2019-09-17	NEFT CR-BARB0KHURJA-J K TRADERS-J P ENTEPRISES-BARBY19260653653	BARBY19260653653	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	95700	\N	4	2	0
5966	2019-09-17	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N260190929902916-COLGATE	N260190929902916	2019-11-16 07:47:15.638883	\N	\N	1	\N	1254	\N	24000	4	2	0
5961	2019-09-17	MARICO4254-STP-MARICO	IB17104911085613	2019-11-16 07:47:15.638883	\N	\N	1	\N	1252	\N	90000	4	2	0
5964	2019-09-17	NEFT DR-DEUT0537PUN-FERRERO INDIA PVT LTD-NETBANK, MUM-N260190929898419-FERRERO	N260190929898419	2019-11-16 07:47:15.638883	\N	\N	1	\N	1253	\N	90000	4	2	0
5962	2019-09-17	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N260190929677372-COLGATE	N260190929677372	2019-11-16 07:47:15.638883	\N	\N	1	\N	1254	\N	146000	4	2	0
5963	2019-09-17	ACH D- MONDELEZ INDIA FOODS-DB37240455	0000002091754948	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	250731.25	4	2	0
5972	2019-09-18	IMPS-926111461131-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-COLGATE	0000926111461131	2019-11-16 07:47:15.638883	\N	\N	1	\N	128	1032	\N	4	2	0
5975	2019-09-18	CHQ DEP - MICR CLG - NOIDA WBO	0000000000745608	2019-11-16 07:47:15.638883	\N	\N	1	\N	40	25540	\N	4	2	0
5974	2019-09-18	NEFT CR-SYNB0008690-K K STORE-J P ENTERPRISES-P19091813929027	0P19091813929027	2019-11-16 07:47:15.638883	\N	\N	1	\N	918	26690	\N	4	2	0
5977	2019-09-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000256	2019-11-16 07:47:15.638883	\N	\N	1	\N	1094	56970	\N	4	2	0
5976	2019-09-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000413404	2019-11-16 07:47:15.638883	\N	\N	1	\N	359	66682	\N	4	2	0
5971	2019-09-18	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N261190930566848-RED BULL	N261190930566848	2019-11-16 07:47:15.638883	\N	\N	1	\N	1251	\N	180000	4	2	0
5973	2019-09-18	ACH D- MONDELEZ INDIA FOODS-DB37250393	0000002115093044	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	570683.680000000051	4	2	0
5924	2019-09-15	051030815091926748- CBDT TAX	IB15230841192621	2019-11-16 07:47:15.638883	\N	\N	1	\N	1268	\N	50000	4	2	0
5970	2019-09-18	50200006539210-TPT-TTC CA TO JP CA	0000000251810802	2019-11-16 07:47:15.638883	\N	\N	1	\N	422	150000	\N	4	2	0
5982	2019-09-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000885905	2019-11-16 07:47:15.638883	\N	\N	1	\N	513	10000	\N	4	2	0
5980	2019-09-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000166469	2019-11-16 07:47:15.638883	\N	\N	1	\N	14	15367	\N	4	2	0
5979	2019-09-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000775638	2019-11-16 07:47:15.638883	\N	\N	1	\N	1074	20438	\N	4	2	0
5978	2019-09-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001726	2019-11-16 07:47:15.638883	\N	\N	1	\N	81	34505	\N	4	2	0
5984	2019-09-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133579	2019-11-16 07:47:15.638883	\N	\N	1	\N	656	228640	\N	4	2	0
5986	2019-09-19	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19262510121	IOBAN19262510121	2019-11-16 07:47:15.638883	\N	\N	1	\N	30	2992	\N	4	2	0
5991	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785649	2019-11-16 07:47:15.638883	\N	\N	1	\N	910	7965	\N	4	2	0
5992	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000455	2019-11-16 07:47:15.638883	\N	\N	1	\N	616	8393	\N	4	2	0
5990	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001355	2019-11-16 07:47:15.638883	\N	\N	1	\N	140	8434	\N	4	2	0
5989	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000053544	2019-11-16 07:47:15.638883	\N	\N	1	\N	1065	9818	\N	4	2	0
5993	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000685131	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	15000	\N	4	2	0
5994	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810432	2019-11-16 07:47:15.638883	\N	\N	1	\N	83	15294	\N	4	2	0
5995	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000022952	2019-11-16 07:47:15.638883	\N	\N	1	\N	700	15409	\N	4	2	0
5987	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000565	2019-11-16 07:47:15.638883	\N	\N	1	\N	86	25608	\N	4	2	0
5988	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009743	2019-11-16 07:47:15.638883	\N	\N	1	\N	105	71294	\N	4	2	0
5996	2019-09-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013447	2019-11-16 07:47:15.638883	\N	\N	1	\N	57	108597	\N	4	2	0
5985	2019-09-19	MARICO4254-STP-MARICO	IB19142242137496	2019-11-16 07:47:15.638883	\N	\N	1	\N	1252	\N	200000	4	2	0
5998	2019-09-20	UPI-PUNB0447600-9650834417@YBL-PUNB0447600-926345302062-PAYMENT FROM PHONE	0000926315505088	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	6000	\N	4	2	0
6006	2019-09-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000477	2019-11-16 07:47:15.638883	\N	\N	1	\N	9	11603	\N	4	2	0
5997	2019-09-20	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19263008035	VIJBH19263008035	2019-11-16 07:47:15.638883	\N	\N	1	\N	471	14687	\N	4	2	0
6005	2019-09-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000885906	2019-11-16 07:47:15.638883	\N	\N	1	\N	513	14765	\N	4	2	0
6004	2019-09-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000685132	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	15000	\N	4	2	0
6003	2019-09-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000982	2019-11-16 07:47:15.638883	\N	\N	1	\N	126	23998	\N	4	2	0
6002	2019-09-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992805	2019-11-16 07:47:15.638883	\N	\N	1	\N	23	34800	\N	4	2	0
6001	2019-09-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000408499	2019-11-16 07:47:15.638883	\N	\N	1	\N	78	51425	\N	4	2	0
6007	2019-09-20	GST/BANK REFERENCE NO: R1926314257345/CIN NO: HDFC19090900364929	0190920090084252	2019-11-16 07:47:15.638883	\N	\N	1	\N	1259	\N	21164	4	2	0
6000	2019-09-20	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000565	2019-11-16 07:47:15.638883	\N	\N	1	\N	86	\N	25608	4	2	0
6012	2019-09-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382370	2019-11-16 07:47:15.638883	\N	\N	1	\N	773	4086	\N	4	2	0
6013	2019-09-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672814	2019-11-16 07:47:15.638883	\N	\N	1	\N	1260	9255	\N	4	2	0
6014	2019-09-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810433	2019-11-16 07:47:15.638883	\N	\N	1	\N	83	10000	\N	4	2	0
6008	2019-09-21	IMPS-926416625044-K K STORE-HDFC-XXXXXXXXXX1250-	0000926416625044	2019-11-16 07:47:15.638883	\N	\N	1	\N	918	14528	\N	4	2	0
6011	2019-09-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000578586	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	13800	\N	4	2	0
6015	2019-09-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000022953	2019-11-16 07:47:15.638883	\N	\N	1	\N	700	15409	\N	4	2	0
6016	2019-09-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000520	2019-11-16 07:47:15.638883	\N	\N	1	\N	1083	19748	\N	4	2	0
6017	2019-09-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001320	2019-11-16 07:47:15.638883	\N	\N	1	\N	60	23390	\N	4	2	0
6010	2019-09-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155864	2019-11-16 07:47:15.638883	\N	\N	1	\N	3	46588	\N	4	2	0
6009	2019-09-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000451196	2019-11-16 07:47:15.638883	\N	\N	1	\N	91	120000	\N	4	2	0
6020	2019-09-22	UPI-AMIT KUMAR RAJPUT-GOWIDRAJPUT-1@OKHDFCBANK-YESB0000133-926517622362-UPI	0000926517033987	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	1000	\N	4	2	0
6019	2019-09-22	UPI-ANIL KUMAR-9711524308@PAYTM-PYTM0123456-926534150242-NA	0000926510259852	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	3000	\N	4	2	0
6018	2019-09-22	IMPS-926510904980-35959771-HDFC-XXXXXXXX8519-	0000926510904980	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	6000	\N	4	2	0
6025	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133971	2019-11-16 07:47:15.638883	\N	\N	1	\N	68	3419	\N	4	2	0
6026	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129049	2019-11-16 07:47:15.638883	\N	\N	1	\N	663	3642	\N	4	2	0
6027	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315671	2019-11-16 07:47:15.638883	\N	\N	1	\N	35	3846	\N	4	2	0
6028	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000451708	2019-11-16 07:47:15.638883	\N	\N	1	\N	306	5467	\N	4	2	0
6029	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001082	2019-11-16 07:47:15.638883	\N	\N	1	\N	95	8056	\N	4	2	0
6030	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000454	2019-11-16 07:47:15.638883	\N	\N	1	\N	616	10000	\N	4	2	0
6031	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029055	2019-11-16 07:47:15.638883	\N	\N	1	\N	24	10552	\N	4	2	0
6032	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000892	2019-11-16 07:47:15.638883	\N	\N	1	\N	1010	13411	\N	4	2	0
6033	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000161984	2019-11-16 07:47:15.638883	\N	\N	1	\N	34	14723	\N	4	2	0
6034	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000022954	2019-11-16 07:47:15.638883	\N	\N	1	\N	700	15409	\N	4	2	0
6023	2019-09-23	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010984	2019-11-16 07:47:15.638883	\N	\N	1	\N	97	97193	\N	4	2	0
6021	2019-09-23	CHQ DEP RET CHGS 200919-MIR1926586695078	0000000000000565	2019-11-16 07:47:15.638883	\N	\N	1	\N	1246	\N	118	4	2	0
6022	2019-09-23	ACH D- MONDELEZ INDIA FOODS-DB37290296	0000002229285453	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	621179.640000000014	4	2	0
6024	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003938	2019-11-16 07:47:15.638883	\N	\N	1	\N	101	5248	\N	4	2	0
6035	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000461946	2019-11-16 07:47:15.638883	\N	\N	1	\N	31	25521	\N	4	2	0
6036	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000203	2019-11-16 07:47:15.638883	\N	\N	1	\N	17	26607	\N	4	2	0
6037	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000130442	2019-11-16 07:47:15.638883	\N	\N	1	\N	6	30000	\N	4	2	0
6038	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397567	2019-11-16 07:47:15.638883	\N	\N	1	\N	6	32513	\N	4	2	0
6039	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000454186	2019-11-16 07:47:15.638883	\N	\N	1	\N	1049	49223	\N	4	2	0
6040	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042589	2019-11-16 07:47:15.638883	\N	\N	1	\N	102	89173	\N	4	2	0
6042	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259638	2019-11-16 07:47:15.638883	\N	\N	1	\N	1131	105400	\N	4	2	0
6046	2019-09-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000196	2019-11-16 07:47:15.638883	\N	\N	1	\N	501	5000	\N	4	2	0
6045	2019-09-24	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN119267228764	SBIN119267228764	2019-11-16 07:47:15.638883	\N	\N	1	\N	52	5607	\N	4	2	0
6048	2019-09-24	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19267031663	VIJBH19267031663	2019-11-16 07:47:15.638883	\N	\N	1	\N	471	16104	\N	4	2	0
6047	2019-09-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000104	2019-11-16 07:47:15.638883	\N	\N	1	\N	1262	21658	\N	4	2	0
6043	2019-09-24	CHQ DEP RET- SIGNATURE NOT AS PER THE MA	0000000000454186	2019-11-16 07:47:15.638883	\N	\N	1	\N	1049	\N	49223	4	2	0
6051	2019-09-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000443	2019-11-16 07:47:15.638883	\N	\N	1	\N	88	4759	\N	4	2	0
6056	2019-09-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000049130	2019-11-16 07:47:15.638883	\N	\N	1	\N	58	6545	\N	4	2	0
6055	2019-09-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000156080	2019-11-16 07:47:15.638883	\N	\N	1	\N	13	9407	\N	4	2	0
6054	2019-09-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000067	2019-11-16 07:47:15.638883	\N	\N	1	\N	307	10374	\N	4	2	0
6053	2019-09-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000754294	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	15000	\N	4	2	0
6052	2019-09-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132312	2019-11-16 07:47:15.638883	\N	\N	1	\N	64	41341	\N	4	2	0
6050	2019-09-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133590	2019-11-16 07:47:15.638883	\N	\N	1	\N	656	301131	\N	4	2	0
6057	2019-09-25	051030825091914918- CBDT TAX	IB25212949158891	2019-11-16 07:47:15.638883	\N	\N	1	\N	1268	\N	179600	4	2	0
6049	2019-09-25	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019092597077036-COLGATE	HDFCR52019092597077036	2019-11-16 07:47:15.638883	\N	\N	1	\N	1254	\N	280000	4	2	0
6061	2019-09-26	UPI-PRADEEP KUMAR BEHERA-9338083275@YBL-BKID0007120-926952631756-PAYMENT FROM PHONE	0000926913977425	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	1000	\N	4	2	0
6070	2019-09-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123359	2019-11-16 07:47:15.638883	\N	\N	1	\N	1134	6574	\N	4	2	0
6069	2019-09-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137871	2019-11-16 07:47:15.638883	\N	\N	1	\N	1041	7199	\N	4	2	0
6068	2019-09-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000357242	2019-11-16 07:47:15.638883	\N	\N	1	\N	1090	7840	\N	4	2	0
6067	2019-09-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810438	2019-11-16 07:47:15.638883	\N	\N	1	\N	83	9370	\N	4	2	0
6066	2019-09-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000609	2019-11-16 07:47:15.638883	\N	\N	1	\N	661	12538	\N	4	2	0
6065	2019-09-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000754295	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	15182	\N	4	2	0
6058	2019-09-26	50200004799122-TPT-J P ENT 15 16SEP BIL	0000000138642775	2019-11-16 07:47:15.638883	\N	\N	1	\N	94	25939	\N	4	2	0
6064	2019-09-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000745611	2019-11-16 07:47:15.638883	\N	\N	1	\N	40	28845	\N	4	2	0
6063	2019-09-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001761	2019-11-16 07:47:15.638883	\N	\N	1	\N	81	43505	\N	4	2	0
6060	2019-09-26	CASH DEP DADRI	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1244	350000	\N	4	2	0
6059	2019-09-26	MARICO4254-STP-MARICO	IB26125517386877	2019-11-16 07:47:15.638883	\N	\N	1	\N	1252	\N	120000	4	2	0
6062	2019-09-26	ACH D- MONDELEZ INDIA FOODS-DB37330410	0000002289341951	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	422003.809999999998	4	2	0
6076	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000692877	2019-11-16 07:47:15.638883	\N	\N	1	\N	901	1876	\N	4	2	0
6077	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137004	2019-11-16 07:47:15.638883	\N	\N	1	\N	663	2048	\N	4	2	0
6078	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000267615	2019-11-16 07:47:15.638883	\N	\N	1	\N	1125	3227	\N	4	2	0
6079	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000025122	2019-11-16 07:47:15.638883	\N	\N	1	\N	831	3236	\N	4	2	0
6080	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001243	2019-11-16 07:47:15.638883	\N	\N	1	\N	1105	3626	\N	4	2	0
6081	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000310050	2019-11-16 07:47:15.638883	\N	\N	1	\N	87	4474	\N	4	2	0
6082	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002061	2019-11-16 07:47:15.638883	\N	\N	1	\N	67	10149	\N	4	2	0
6083	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000925418	2019-11-16 07:47:15.638883	\N	\N	1	\N	67	12898	\N	4	2	0
6084	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785659	2019-11-16 07:47:15.638883	\N	\N	1	\N	910	19485	\N	4	2	0
6085	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000565053	2019-11-16 07:47:15.638883	\N	\N	1	\N	601	22274	\N	4	2	0
6086	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000416306	2019-11-16 07:47:15.638883	\N	\N	1	\N	78	43738	\N	4	2	0
6087	2019-09-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992814	2019-11-16 07:47:15.638883	\N	\N	1	\N	23	44749	\N	4	2	0
6071	2019-09-27	CHQ PAID-MICR CTS-NO-MANOJ KUMAR	0000000000000568	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	\N	10000	4	2	0
6074	2019-09-27	N3058220156601330-STP-DABUR HC	IB27115258955895	2019-11-16 07:47:15.638883	\N	\N	1	\N	1255	\N	150000	4	2	0
6073	2019-09-27	N3058220156601310-STP-DABUR HPC	IB27115219336453	2019-11-16 07:47:15.638883	\N	\N	1	\N	1255	\N	200000	4	2	0
6075	2019-09-27	ACH D- MONDELEZ INDIA FOODS-DB37340348	0000002307081168	2019-11-16 07:47:15.638883	\N	\N	1	\N	1250	\N	427351.340000000026	4	2	0
6088	2019-09-28	IMPS-927110176016-35959771-HDFC-XXXXXXXX8519-	0000927110176016	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	5300	\N	4	2	0
6089	2019-09-29	UPI-SHIV PRASAD UPADHYAY-USHIV84@OKICICI-ICIC0001031-927217140809-UPI	0000927217030851	2019-11-16 07:47:15.638883	\N	\N	1	\N	1245	9599	\N	4	2	0
6090	2019-09-30	CASH DEP DADRI	000000000000000	2019-11-16 07:47:15.638883	\N	\N	1	\N	1244	50000	\N	4	2	0
6072	2019-09-27	FT - CR - 50200004708608 - MITTAL PROVISION STORE	0000000000000734	2019-11-16 07:47:15.638883	\N	\N	1	\N	56	93901	\N	4	2	0
6130	2019-04-03	NEFT CR-ICIC0SF0002-JAGROSHNI ENTERPRISES-JP ENTERPRISES-21125417441DC	00021125417441DC	2019-11-16 07:57:42.531945	\N	\N	1	\N	1063	10373	\N	5	2	0
6128	2019-04-03	NEFT CR-UTIB0000624-MAHAVEERA GENERAL STORE-JP ENTERPRISES-AXMB190933067928	AXMB190933067928	2019-11-16 07:57:42.531945	\N	\N	1	\N	54	11146	\N	5	2	0
6129	2019-04-03	HB3142NR1000009999-STP-GODREJ	IB03132228153777	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	125000	5	2	0
6097	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000043	2019-11-16 07:47:15.638883	\N	\N	1	\N	1196	1263	\N	4	2	0
6096	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000204731	2019-11-16 07:47:15.638883	\N	\N	1	\N	28	2207	\N	4	2	0
6095	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000205	2019-11-16 07:47:15.638883	\N	\N	1	\N	501	3000	\N	4	2	0
6094	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000551043	2019-11-16 07:47:15.638883	\N	\N	1	\N	1270	3140	\N	4	2	0
6093	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000556950	2019-11-16 07:47:15.638883	\N	\N	1	\N	553	3687	\N	4	2	0
6126	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134271	2019-11-16 07:47:15.638883	\N	\N	1	\N	75	3977	\N	4	2	0
6125	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000766833	2019-11-16 07:47:15.638883	\N	\N	1	\N	1065	4934	\N	4	2	0
6124	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000766831	2019-11-16 07:47:15.638883	\N	\N	1	\N	1065	5000	\N	4	2	0
6123	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000766832	2019-11-16 07:47:15.638883	\N	\N	1	\N	1065	5000	\N	4	2	0
6122	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001091	2019-11-16 07:47:15.638883	\N	\N	1	\N	95	5576	\N	4	2	0
6121	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003948	2019-11-16 07:47:15.638883	\N	\N	1	\N	101	6220	\N	4	2	0
6098	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133988	2019-11-16 07:47:15.638883	\N	\N	1	\N	68	7280	\N	4	2	0
6105	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000510421	2019-11-16 07:47:15.638883	\N	\N	1	\N	705	8320	\N	4	2	0
6104	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000168	2019-11-16 07:47:15.638883	\N	\N	1	\N	1039	9150	\N	4	2	0
6102	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000421886	2019-11-16 07:47:15.638883	\N	\N	1	\N	114	10979	\N	4	2	0
6101	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029065	2019-11-16 07:47:15.638883	\N	\N	1	\N	24	13872	\N	4	2	0
6092	2019-09-30	FT - CR - 50200010626700 - HARI OM DEPARTMENTAL STORE	0000000000000577	2019-11-16 07:47:15.638883	\N	\N	1	\N	26	18463	\N	4	2	0
6103	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000215116	2019-11-16 07:47:15.638883	\N	\N	1	\N	1192	10735	\N	4	2	0
6100	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000421885	2019-11-16 07:47:15.638883	\N	\N	1	\N	114	15065	\N	4	2	0
6099	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000130	2019-11-16 07:47:15.638883	\N	\N	1	\N	72	15582	\N	4	2	0
6118	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134577	2019-11-16 07:47:15.638883	\N	\N	1	\N	31	15714	\N	4	2	0
6117	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001338	2019-11-16 07:47:15.638883	\N	\N	1	\N	60	18370	\N	4	2	0
6116	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000212	2019-11-16 07:47:15.638883	\N	\N	1	\N	17	19026	\N	4	2	0
6115	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000062728	2019-11-16 07:47:15.638883	\N	\N	1	\N	32	20343	\N	4	2	0
6114	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000463450	2019-11-16 07:47:15.638883	\N	\N	1	\N	1271	20899	\N	4	2	0
6113	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000026016	2019-11-16 07:47:15.638883	\N	\N	1	\N	1177	21186	\N	4	2	0
6112	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001357	2019-11-16 07:47:15.638883	\N	\N	1	\N	60	22520	\N	4	2	0
6111	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000063	2019-11-16 07:47:15.638883	\N	\N	1	\N	1064	22811	\N	4	2	0
6110	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000161985	2019-11-16 07:47:15.638883	\N	\N	1	\N	34	26044	\N	4	2	0
6109	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042598	2019-11-16 07:47:15.638883	\N	\N	1	\N	102	27871	\N	4	2	0
6108	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259670	2019-11-16 07:47:15.638883	\N	\N	1	\N	1131	36552	\N	4	2	0
6106	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009784	2019-11-16 07:47:15.638883	\N	\N	1	\N	105	50171	\N	4	2	0
6120	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001768	2019-11-16 07:47:15.638883	\N	\N	1	\N	81	51925	\N	4	2	0
6119	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000211383	2019-11-16 07:47:15.638883	\N	\N	1	\N	91	59491	\N	4	2	0
6132	2019-04-04	IMPS-909417823388-VEDPRAKASH -HDFC-XXXXXXXX1956-	0000909417823388	2019-11-16 07:57:42.531945	\N	\N	1	\N	733	7000	\N	5	2	0
6139	2019-04-10	UPI-RAJEEV CHAURASIYA-8800123901@PAYTM-UTIB0000884-910034383383-NA	0000910010276921	2019-11-16 07:57:42.531945	\N	\N	1	\N	1075	5000	\N	5	2	0
6133	2019-04-05	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	600000	\N	5	2	0
6134	2019-04-05	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019040572729302-COLGATE	HDFCR52019040572729302	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	400000	5	2	0
6136	2019-04-06	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	200000	\N	5	2	0
6135	2019-04-06	CHQ DEP RET CHGS 290319-MIR1909177411423	0000000000039038	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6137	2019-04-06	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019040672836015-COLGATE	HDFCR52019040672836015	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	427027.630000000005	5	2	0
6142	2019-04-12	IMPS-910215906998-VEDPRAKASH -HDFC-XXXXXXXX1956-	0000910215906998	2019-11-16 07:57:42.531945	\N	\N	1	\N	733	6000	\N	5	2	0
6138	2019-04-10	CHQ PAID-MICR CTS-NO-LIC OF INDIA	0000000000000110	2019-11-16 07:57:42.531945	\N	\N	1	\N	1277	\N	13864	5	2	0
6140	2019-04-12	NEFT CR-BARB0SURGAU-SWASTIK SUPER BAZAR-J P ENTERPRISES-BARBX19102884711	BARBX19102884711	2019-11-16 07:57:42.531945	\N	\N	1	\N	661	4905	\N	5	2	0
6145	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000649	2019-11-16 07:57:42.531945	\N	\N	1	\N	1186	13881	\N	5	2	0
6144	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000368824	2019-11-16 07:57:42.531945	\N	\N	1	\N	31	24243	\N	5	2	0
6143	2019-04-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000907122	2019-11-16 07:57:42.531945	\N	\N	1	\N	40	25032	\N	5	2	0
6141	2019-04-12	ADHOC STMT CHGS INCL GST 030419-MIR1910091656923	MIR1910091656923	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6146	2019-04-16	NEFT CR-UTIB0000624-MAHAVEERA GENERAL STORE-JP ENTERPRISES-AXMB191067869326	AXMB191067869326	2019-11-16 07:57:42.531945	\N	\N	1	\N	54	13212	\N	5	2	0
6147	2019-04-16	HB3142NR1000009999-STP-GODREJ	IB16135916315967	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	100000	5	2	0
6131	2019-04-04	UPI-917557532561-7557532561@PAYTM-909437669606-NA	0000909413514166	2019-11-16 07:57:42.531945	\N	\N	1	\N	1114	6368	\N	5	2	0
6163	2019-04-23	IMPS-911316998518-ANUPAM KUMARI-HDFC-XXXXXX2480-COMMENTS	0000911316998518	2019-11-16 07:57:42.531945	\N	\N	1	\N	93	7391	\N	5	2	0
6149	2019-04-18	UPI-RAJEEV CHAURASIYA-8800123901@PAYTM-UTIB0000884-910835260473-NA	0000910811138943	2019-11-16 07:57:42.531945	\N	\N	1	\N	1075	5000	\N	5	2	0
6151	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000120139	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	34463	\N	5	2	0
6152	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397054	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	35000	\N	5	2	0
6153	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000399994	2019-11-16 07:57:42.531945	\N	\N	1	\N	78	44659	\N	5	2	0
6154	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001377	2019-11-16 07:57:42.531945	\N	\N	1	\N	471	60070	\N	5	2	0
6155	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008577	2019-11-16 07:57:42.531945	\N	\N	1	\N	105	91762	\N	5	2	0
6156	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000267	2019-11-16 07:57:42.531945	\N	\N	1	\N	126	96799	\N	5	2	0
6157	2019-04-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013996	2019-11-16 07:57:42.531945	\N	\N	1	\N	57	125837	\N	5	2	0
6158	2019-04-22	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	60000	\N	5	2	0
6159	2019-04-22	HB3142NR1000009999-STP-GODREJ	IB22151544301104	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	80000	5	2	0
6166	2019-04-29	50200029853444-TPT-TTC OD TO JP OD	0000000225906815	2019-11-16 07:57:42.531945	\N	\N	1	\N	422	100000	\N	5	2	0
6160	2019-04-23	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N113190807379793-RED BULL	N113190807379793	2019-11-16 07:57:42.531945	\N	\N	1	\N	1251	\N	50000	5	2	0
6162	2019-04-23	HB3142NR1000009999-STP-GODREJ	IB23145811207128	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	250000	5	2	0
6164	2019-04-25	MARICO4254-STP-MARICO	IB25132134686968	2019-11-16 07:57:42.531945	\N	\N	1	\N	1252	\N	200000	5	2	0
6150	2019-04-18	IMPS-910816564296-YOGINDER YADAV-HDFC-XXXXXX9070-COMMENTS	0000910816564296	2019-11-16 07:57:42.531945	\N	\N	1	\N	733	5500	\N	5	2	0
6165	2019-04-29	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	139000	\N	5	2	0
6167	2019-04-29	HB3142NR1000009999-STP-GODREJ	IB29133654698827	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	200000	5	2	0
6168	2019-04-30	IMPS-912016875373-ANUPAM KUMARI-HDFC-XXXXXX2480-COMMENTS	0000912016875373	2019-11-16 07:57:42.531945	\N	\N	1	\N	93	6265	\N	5	2	0
6177	2019-05-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000358	2019-11-16 07:57:42.531945	\N	\N	1	\N	88	1707	\N	5	2	0
6176	2019-05-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000294297	2019-11-16 07:57:42.531945	\N	\N	1	\N	901	2627	\N	5	2	0
6175	2019-05-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000366	2019-11-16 07:57:42.531945	\N	\N	1	\N	88	3620	\N	5	2	0
6174	2019-05-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000089648	2019-11-16 07:57:42.531945	\N	\N	1	\N	629	4378	\N	5	2	0
6173	2019-05-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038118	2019-11-16 07:57:42.531945	\N	\N	1	\N	108	5610	\N	5	2	0
6172	2019-05-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121332	2019-11-16 07:57:42.531945	\N	\N	1	\N	55	9700	\N	5	2	0
6181	2019-05-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000021080	2019-11-16 07:57:42.531945	\N	\N	1	\N	1186	10655	\N	5	2	0
6180	2019-05-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108396	2019-11-16 07:57:42.531945	\N	\N	1	\N	64	13044	\N	5	2	0
6179	2019-05-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000507	2019-11-16 07:57:42.531945	\N	\N	1	\N	86	16302	\N	5	2	0
6170	2019-05-01	FT - CR - 50200004708608 - MITTAL PROVISION STORE	0000000000000722	2019-11-16 07:57:42.531945	\N	\N	1	\N	56	86661	\N	5	2	0
6171	2019-05-01	FT - CR - 50200012102181 - OM RETAIL MART	0000000000001437	2019-11-16 07:57:42.531945	\N	\N	1	\N	57	108517	\N	5	2	0
6178	2019-05-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000455	2019-11-16 07:57:42.531945	\N	\N	1	\N	342	26716	\N	5	2	0
6182	2019-05-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000124705	2019-11-16 07:57:42.531945	\N	\N	1	\N	656	232845	\N	5	2	0
6169	2019-05-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1279	\N	19835	5	2	0
6183	2019-05-02	NEFT CR-BARB0SURGAU-GOYAL TRADERS-J P ENTERPRISES-BARBU19122969809	BARBU19122969809	2019-11-16 07:57:42.531945	\N	\N	1	\N	920	25080	\N	5	2	0
6185	2019-05-02	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000455	2019-11-16 07:57:42.531945	\N	\N	1	\N	342	\N	26716	5	2	0
6184	2019-05-02	HB3142NR1000009999-STP-GODREJ	IB02140218587307	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	203000	5	2	0
6192	2019-05-06	IMPS-912616433692-37774768-HDFC-XXXXXXXX0859-	0000912616433692	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	7783	\N	5	2	0
6186	2019-05-03	50200006539210-TPT-JP OD TO TTC CA	0000000275147790	2019-11-16 07:57:42.531945	\N	\N	1	\N	422	\N	200000	5	2	0
6188	2019-05-04	HB3142NR1000009999-STP-GODREJ	IB04131158383686	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	150000	5	2	0
6189	2019-05-05	IMPS-912512454513-UNREGISTERED-HDFC-XXXXXXXXXXXXX0002-	0000912512454513	2019-11-16 07:57:42.531945	\N	\N	1	\N	616	5000	\N	5	2	0
6187	2019-05-03	IMPS-912317350030-UNREGISTERED-HDFC-XXXXXXXXXXXXX0002-	0000912317350030	2019-11-16 07:57:42.531945	\N	\N	1	\N	616	15000	\N	5	2	0
6190	2019-05-06	FT - CR - 50200004708608 - MITTAL PROVISION STORE	0000000000000723	2019-11-16 07:57:42.531945	\N	\N	1	\N	56	38312	\N	5	2	0
6191	2019-05-06	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010805	2019-11-16 07:57:42.531945	\N	\N	1	\N	97	125845	\N	5	2	0
6194	2019-05-07	IMPS-912714319451-ANUPAM KUMARI-HDFC-XXXXXX2480-COMMENTS	0000912714319451	2019-11-16 07:57:42.531945	\N	\N	1	\N	93	3036	\N	5	2	0
6193	2019-05-07	HB3142NR1000009999-STP-GODREJ	IB07143615598520	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	180000	5	2	0
6195	2019-05-08	CHQ DEP RET CHGS 020519-MIR1912843214454	0000000000000455	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6200	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000716191	2019-11-16 07:57:42.531945	\N	\N	1	\N	128	532	\N	5	2	0
6196	2019-05-09	UPI-PRAVEEN KUMAR-PRAVEENKUMARBHRUV1234@OKAXIS-UTIB0000624-912907325975-UPI	0000091297158088	2019-11-16 07:57:42.531945	\N	\N	1	\N	50	10000	\N	5	2	0
6197	2019-05-09	IMPS-912918041101-GAURAVSINGHAL-HDFC-XXXXXXXXXX7239-IMPSP2A	0000912918041101	2019-11-16 07:57:42.531945	\N	\N	1	\N	72	12483	\N	5	2	0
6198	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007116	2019-11-16 07:57:42.531945	\N	\N	1	\N	514	52508	\N	5	2	0
6201	2019-05-11	IMPS-913111414056-DEEPAK BANSAL-HDFC-XXXXXX3640-COMMENTS	0000913111414056	2019-11-16 07:57:42.531945	\N	\N	1	\N	339	4000	\N	5	2	0
6202	2019-05-12	IMPS-913213210839-JBM ENTERPRISES-HDFC-XXXXXXXXXX0593-	0000913213210839	2019-11-16 07:57:42.531945	\N	\N	1	\N	1112	28050	\N	5	2	0
6203	2019-05-13	NEFT CR-BARB0SURGAU-GOYAL TRADERS-J P ENTERPRISES-BARBZ19133890875	BARBZ19133890875	2019-11-16 07:57:42.531945	\N	\N	1	\N	920	16835	\N	5	2	0
6199	2019-05-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126567	2019-11-16 07:57:42.531945	\N	\N	1	\N	1040	2453	\N	5	2	0
6204	2019-05-14	IMPS-913416767048-ANUPAM KUMARI-HDFC-XXXXXX2480-COMMENTS	0000913416767048	2019-11-16 07:57:42.531945	\N	\N	1	\N	93	3205	\N	5	2	0
6208	2019-05-16	IMPS-913617235909-GAURAVSINGHAL-HDFC-XXXXXXXXXX7239-IMPSP2A	0000913617235909	2019-11-16 07:57:42.531945	\N	\N	1	\N	72	12587	\N	5	2	0
6207	2019-05-16	HB3142NR1000009999-STP-GODREJ	IB16163100773679	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	75000	5	2	0
6209	2019-05-17	DD ISSUE  - HDFC BANK LT - NEW DELHI -  - 007717 - 092713006916 - *****DABUR INDIA LTD*****	0000000000000113	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	2500	5	2	0
6211	2019-05-20	NEFT CR-BARB0SURGAU-GOYAL TRADERS-J P ENTERPRISES-BARBR19140724569	BARBR19140724569	2019-11-16 07:57:42.531945	\N	\N	1	\N	920	21642	\N	5	2	0
6210	2019-05-20	ADDISTRO TECHN-J P ENTERPRIS COL09	0000088476000004	2019-11-16 07:57:42.531945	\N	\N	1	\N	1073	139085	\N	5	2	0
6213	2019-05-21	UPI-SAHIDUL MIA-SAHIDULISLAM9@YBL-PYTM0123456-914172835632-PAYMENT FROM PHONE	0000914118349496	2019-11-16 07:57:42.531945	\N	\N	1	\N	1010	2800	\N	5	2	0
6214	2019-05-22	IMPS-914215248922-AMIR -HDFC-XXXXXXXX7977-	0000914215248922	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	9620	\N	5	2	0
6216	2019-05-23	IMPS-914311955196-INDRESH THAKUR-HDFC-XXXXXX7770-COMMENTS	0000914311955196	2019-11-16 07:57:42.531945	\N	\N	1	\N	47	2000	\N	5	2	0
6217	2019-05-23	UPI-PRAVIN KUMAR-8447997290@PAYTM-PYTM0123456-914337147581-NA	0000914313893283	2019-11-16 07:57:42.531945	\N	\N	1	\N	1133	3680	\N	5	2	0
6215	2019-05-23	UPI-SANJAY CHAURASIYA-7557532561@PAYTM-PYTM0123456-914335543382-NA	0000914311658920	2019-11-16 07:57:42.531945	\N	\N	1	\N	1114	5559	\N	5	2	0
6218	2019-05-23	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	400000	\N	5	2	0
6219	2019-05-23	FT-N3058220156601330-CMS_ECOLL_DABUR INDIA LTD E-CM	0000000000000115	2019-11-16 07:57:42.531945	\N	\N	1	\N	1255	\N	600000	5	2	0
6220	2019-05-27	CHQ PAID-MICR CTS-NO-MANOJ	0000000000000114	2019-11-16 07:57:42.531945	\N	\N	1	\N	1276	\N	10000	5	2	0
6221	2019-05-28	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	300000	\N	5	2	0
6222	2019-05-28	FT-N3058220156601310-CMS_ECOLL_DABUR INDIA LTD E-CM	0000000000000120	2019-11-16 07:57:42.531945	\N	\N	1	\N	1255	\N	200000	5	2	0
6223	2019-05-29	FT-N3058220156601330-CMS_ECOLL_DABUR INDIA LTD E-CM	0000000000000121	2019-11-16 07:57:42.531945	\N	\N	1	\N	1255	\N	60000	5	2	0
6226	2019-05-30	IMPS-915018683901-GAURAVSINGHAL-HDFC-XXXXXXXXXX7239-IMPSP2A	0000915018683901	2019-11-16 07:57:42.531945	\N	\N	1	\N	72	11279	\N	5	2	0
6227	2019-06-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1279	\N	20155	5	2	0
6229	2019-06-03	NEFT CR-BKDN0721172-THE FAMILY MART-JP ENTERPRISES-SDC112676418	0000SDC112676418	2019-11-16 07:57:42.531945	\N	\N	1	\N	108	1225	\N	5	2	0
6230	2019-06-04	NEFT CR-BARB0SURGAU-GOYAL TRADERS-J P ENTERPRISES-BARBX19155309276	BARBX19155309276	2019-11-16 07:57:42.531945	\N	\N	1	\N	920	32594	\N	5	2	0
6231	2019-06-04	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N155190842789329-COLGATE	N155190842789329	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	100000	5	2	0
6232	2019-06-06	IMPS-915718342747-GAURAVSINGHAL-HDFC-XXXXXXXXXX0525-IMPSP2A	0000915718342747	2019-11-16 07:57:42.531945	\N	\N	1	\N	72	18020	\N	5	2	0
6228	2019-06-01	IMPS-915211306714-HARENDRA KUMAR TEWA-HDFC-XXXXXXXX8761-	0000915211306714	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	10497	\N	5	2	0
6235	2019-06-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000255112	2019-11-16 07:57:42.531945	\N	\N	1	\N	58	7000	\N	5	2	0
6233	2019-06-11	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-916238728358-NA	0000916214012718	2019-11-16 07:57:42.531945	\N	\N	1	\N	93	4896	\N	5	2	0
6236	2019-06-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002385	2019-11-16 07:57:42.531945	\N	\N	1	\N	1061	7000	\N	5	2	0
6237	2019-06-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108410	2019-11-16 07:57:42.531945	\N	\N	1	\N	64	8557	\N	5	2	0
6234	2019-06-12	IMPS-916316566301-SHIV CHANDILA-HDFC-XXXXXX3661-COMMENTS	0000916316566301	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	10000	\N	5	2	0
6238	2019-06-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001449	2019-11-16 07:57:42.531945	\N	\N	1	\N	1063	15000	\N	5	2	0
6239	2019-06-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000062	2019-11-16 07:57:42.531945	\N	\N	1	\N	1262	15414	\N	5	2	0
6240	2019-06-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001583	2019-11-16 07:57:42.531945	\N	\N	1	\N	81	16017	\N	5	2	0
6241	2019-06-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000114	2019-11-16 07:57:42.531945	\N	\N	1	\N	313	31669	\N	5	2	0
6242	2019-06-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000124748	2019-11-16 07:57:42.531945	\N	\N	1	\N	656	44586	\N	5	2	0
6243	2019-06-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000505962	2019-11-16 07:57:42.531945	\N	\N	1	\N	1074	60914	\N	5	2	0
6244	2019-06-13	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-916435843223-NA	0000916411343609	2019-11-16 07:57:42.531945	\N	\N	1	\N	47	3500	\N	5	2	0
6252	2019-06-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000756623	2019-11-16 07:57:42.531945	\N	\N	1	\N	1270	4562	\N	5	2	0
6246	2019-06-13	IMPS-916417377571-SUNIL KUMAR YADAV-HDFC-XXXXXX3883-COMMENTS	0000916417377571	2019-11-16 07:57:42.531945	\N	\N	1	\N	1096	4863	\N	5	2	0
6251	2019-06-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123156	2019-11-16 07:57:42.531945	\N	\N	1	\N	1173	8664	\N	5	2	0
6250	2019-06-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129126	2019-11-16 07:57:42.531945	\N	\N	1	\N	1040	9360	\N	5	2	0
6249	2019-06-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387509	2019-11-16 07:57:42.531945	\N	\N	1	\N	83	20000	\N	5	2	0
6248	2019-06-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000421540	2019-11-16 07:57:42.531945	\N	\N	1	\N	114	38709	\N	5	2	0
6247	2019-06-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009044	2019-11-16 07:57:42.531945	\N	\N	1	\N	105	48719	\N	5	2	0
6245	2019-06-13	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010661	2019-11-16 07:57:42.531945	\N	\N	1	\N	97	149819	\N	5	2	0
6256	2019-06-14	50100051672149-TPT-DRAWINGS	0000000228306917	2019-11-16 07:57:42.531945	\N	\N	1	\N	1258	\N	25000	5	2	0
6255	2019-06-14	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N165190851202756-COLGATE	N165190851202756	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	75000	5	2	0
6257	2019-06-17	UPI-RAJEEV KUMAR CHAURAS-8800123901@PAYTM-UTIB0000884-916837000722-NA	0000916813226248	2019-11-16 07:57:42.531945	\N	\N	1	\N	1075	5000	\N	5	2	0
6258	2019-06-18	NEFT CR-UTIB0000624-MAHAVEERA GENERAL STORE-JP ENTERPRISES-AXMB191698879670	AXMB191698879670	2019-11-16 07:57:42.531945	\N	\N	1	\N	54	6744	\N	5	2	0
6259	2019-06-19	NEFT CR-BARB0SURGAU-GOYAL TRADERS-J P ENTERPRISES-BARBR19170888015	BARBR19170888015	2019-11-16 07:57:42.531945	\N	\N	1	\N	920	30109	\N	5	2	0
6212	2019-05-21	IMPS-914116364145-ANUPAM KUMARI-HDFC-XXXXXX2480-COMMENTS	0000914116364145	2019-11-16 07:57:42.531945	\N	\N	1	\N	1284	5906	\N	5	2	0
6225	2019-05-30	UPI-SANTOSH CHANDRA MISH-9643212479@PAYTM-PYTM0123456-915035737994-NA	0000915011277248	2019-11-16 07:57:42.531945	\N	\N	1	\N	1293	2500	\N	5	2	0
6253	2019-06-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000523	2019-11-16 07:57:42.531945	\N	\N	1	\N	661	2218	\N	5	2	0
6263	2019-06-20	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-917136714111-NA	0000917112244400	2019-11-16 07:57:42.531945	\N	\N	1	\N	47	1000	\N	5	2	0
6262	2019-06-20	UPI-SANTOSH CHANDRA MISH-9643212479@PAYTM-PYTM0123456-917136617562-NA	0000917112222314	2019-11-16 07:57:42.531945	\N	\N	1	\N	1168	2000	\N	5	2	0
6264	2019-06-20	UPI-PRAVIN KUMAR-8447997290@PAYTM-PYTM0123456-917136071063-NA	0000917112395441	2019-11-16 07:57:42.531945	\N	\N	1	\N	1133	3000	\N	5	2	0
6265	2019-06-23	UPI-HARENDRA KUMAR TEWAT-7678658761@PAYTM-SBIN0004324-917433176173-NA	0000091749303580	2019-11-16 07:57:42.531945	\N	\N	1	\N	1082	8002	\N	5	2	0
6266	2019-06-24	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	138000	\N	5	2	0
6267	2019-06-24	50100051672149-TPT-DRAWINGS	0000000116789732	2019-11-16 07:57:42.531945	\N	\N	1	\N	1258	\N	200000	5	2	0
6268	2019-06-27	UPI-SANTOSH CHANDRA MISH-9643212479@PAYTM-PYTM0123456-917841792256-NA	0000917817580122	2019-11-16 07:57:42.531945	\N	\N	1	\N	1168	2000	\N	5	2	0
6269	2019-06-30	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1279	\N	19583	5	2	0
6270	2019-07-02	IMPS-918318961581-DHARMENDER SINGH-HDFC-XXXXXX0090-COMMENTS	0000918318961581	2019-11-16 07:57:42.531945	\N	\N	1	\N	627	3955	\N	5	2	0
6280	2019-07-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126767	2019-11-16 07:57:42.531945	\N	\N	1	\N	75	3336	\N	5	2	0
6272	2019-07-04	UPI-PRAVIN KUMAR-8447997290@PAYTM-PYTM0123456-918538175255-NA	0000918514517073	2019-11-16 07:57:42.531945	\N	\N	1	\N	1133	3700	\N	5	2	0
6271	2019-07-03	UPI-AMIR-9716577977@PAYTM-PYTM0123456-918439871311-NA	0000918415521229	2019-11-16 07:57:42.531945	\N	\N	1	\N	782	12000	\N	5	2	0
6278	2019-07-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126872	2019-11-16 07:57:42.531945	\N	\N	1	\N	68	4112	\N	5	2	0
6279	2019-07-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000145884	2019-11-16 07:57:42.531945	\N	\N	1	\N	620	4251	\N	5	2	0
6276	2019-07-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000245072	2019-11-16 07:57:42.531945	\N	\N	1	\N	616	5934	\N	5	2	0
6273	2019-07-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123013	2019-11-16 07:57:42.531945	\N	\N	1	\N	873	8297	\N	5	2	0
6275	2019-07-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000069	2019-11-16 07:57:42.531945	\N	\N	1	\N	1262	21293	\N	5	2	0
6277	2019-07-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992713	2019-11-16 07:57:42.531945	\N	\N	1	\N	23	27124	\N	5	2	0
6274	2019-07-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254918	2019-11-16 07:57:42.531945	\N	\N	1	\N	19	30583	\N	5	2	0
6286	2019-07-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000717780	2019-11-16 07:57:42.531945	\N	\N	1	\N	747	2063	\N	5	2	0
6281	2019-07-06	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-918733984723-DAILY NEED	0000091879638343	2019-11-16 07:57:42.531945	\N	\N	1	\N	339	2400	\N	5	2	0
6287	2019-07-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387533	2019-11-16 07:57:42.531945	\N	\N	1	\N	83	10000	\N	5	2	0
6293	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000407467	2019-11-16 07:57:42.531945	\N	\N	1	\N	1129	2154	\N	5	2	0
6283	2019-07-06	NEFT CR-BARB0SURGAU-GOYAL TRADERS-J P ENTERPRISES-BARBP19187203147	BARBP19187203147	2019-11-16 07:57:42.531945	\N	\N	1	\N	920	20657	\N	5	2	0
6288	2019-07-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000145583	2019-11-16 07:57:42.531945	\N	\N	1	\N	14	24300	\N	5	2	0
6284	2019-07-06	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010715	2019-11-16 07:57:42.531945	\N	\N	1	\N	97	24658	\N	5	2	0
6289	2019-07-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000602427	2019-11-16 07:57:42.531945	\N	\N	1	\N	91	51921	\N	5	2	0
6285	2019-07-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000386	2019-11-16 07:57:42.531945	\N	\N	1	\N	126	58955	\N	5	2	0
6282	2019-07-06	UPI-HARENDRA KUMAR TEWAT-7678658761@PAYTM-SBIN0004324-918735928978-NA	0000918711159342	2019-11-16 07:57:42.531945	\N	\N	1	\N	1283	6601	\N	5	2	0
6290	2019-07-07	UPI-SATYA PAL SINGH S O -9891988521@YBL-PUNB0460300-918830161708-PAYMENT FROM PHONE	0000918810063606	2019-11-16 07:57:42.531945	\N	\N	1	\N	1282	4000	\N	5	2	0
6294	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000692	2019-11-16 07:57:42.531945	\N	\N	1	\N	1125	3039	\N	5	2	0
6292	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382353	2019-11-16 07:57:42.531945	\N	\N	1	\N	773	3410	\N	5	2	0
6295	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027943	2019-11-16 07:57:42.531945	\N	\N	1	\N	24	4141	\N	5	2	0
6296	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001132	2019-11-16 07:57:42.531945	\N	\N	1	\N	1105	5077	\N	5	2	0
6297	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000959	2019-11-16 07:57:42.531945	\N	\N	1	\N	95	5280	\N	5	2	0
6298	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000161935	2019-11-16 07:57:42.531945	\N	\N	1	\N	34	6192	\N	5	2	0
6299	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155549	2019-11-16 07:57:42.531945	\N	\N	1	\N	512	7592	\N	5	2	0
6300	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000324	2019-11-16 07:57:42.531945	\N	\N	1	\N	1	8181	\N	5	2	0
6301	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000047	2019-11-16 07:57:42.531945	\N	\N	1	\N	72	10153	\N	5	2	0
6304	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000160281	2019-11-16 07:57:42.531945	\N	\N	1	\N	365	11150	\N	5	2	0
6303	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000622	2019-11-16 07:57:42.531945	\N	\N	1	\N	1081	15654	\N	5	2	0
6302	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126284	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	20000	\N	5	2	0
6305	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397319	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	21702	\N	5	2	0
6306	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001111	2019-11-16 07:57:42.531945	\N	\N	1	\N	60	22249	\N	5	2	0
6307	2019-07-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000021	2019-11-16 07:57:42.531945	\N	\N	1	\N	1197	25438	\N	5	2	0
6312	2019-07-09	IMPS-919017776280-ANUPAM KUMARI-HDFC-XXXXXX2480-COMMENTS	0000919017776280	2019-11-16 07:57:42.531945	\N	\N	1	\N	1284	8800	\N	5	2	0
6310	2019-07-09	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000160281	2019-11-16 07:57:42.531945	\N	\N	1	\N	365	\N	11150	5	2	0
6309	2019-07-09	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000622	2019-11-16 07:57:42.531945	\N	\N	1	\N	1081	\N	15654	5	2	0
6311	2019-07-09	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000021	2019-11-16 07:57:42.531945	\N	\N	1	\N	1197	\N	25438	5	2	0
6313	2019-07-10	UPI-AMIR-9716577977@PAYTM-PYTM0123456-919139572770-NA	0000919115050066	2019-11-16 07:57:42.531945	\N	\N	1	\N	1285	8000	\N	5	2	0
6315	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000122	2019-11-16 07:57:42.531945	\N	\N	1	\N	313	23948	\N	5	2	0
6314	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101245	2019-11-16 07:57:42.531945	\N	\N	1	\N	434	32154	\N	5	2	0
6308	2019-07-09	50200006539210-TPT-JP OD TO TUSHAR CA	0000000293471208	2019-11-16 07:57:42.531945	\N	\N	1	\N	422	\N	200000	5	2	0
6325	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000631621	2019-11-16 07:57:42.531945	\N	\N	1	\N	62	2387	\N	5	2	0
6324	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000399	2019-11-16 07:57:42.531945	\N	\N	1	\N	88	5453	\N	5	2	0
6323	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000211	2019-11-16 07:57:42.531945	\N	\N	1	\N	1066	5575	\N	5	2	0
6322	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000114259	2019-11-16 07:57:42.531945	\N	\N	1	\N	685	8615	\N	5	2	0
6321	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101249	2019-11-16 07:57:42.531945	\N	\N	1	\N	434	16510	\N	5	2	0
6320	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001647	2019-11-16 07:57:42.531945	\N	\N	1	\N	81	19217	\N	5	2	0
6319	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121398	2019-11-16 07:57:42.531945	\N	\N	1	\N	55	20000	\N	5	2	0
6318	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127171	2019-11-16 07:57:42.531945	\N	\N	1	\N	56	20416	\N	5	2	0
6317	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000745560	2019-11-16 07:57:42.531945	\N	\N	1	\N	40	22250	\N	5	2	0
6316	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000408322	2019-11-16 07:57:42.531945	\N	\N	1	\N	78	23263	\N	5	2	0
6330	2019-07-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000765890	2019-11-16 07:57:42.531945	\N	\N	1	\N	1270	1017	\N	5	2	0
6327	2019-07-11	IMPS-919213033164-PRAVIN KUMAR-HDFC-XXXXXXXX7290-	0000919213033164	2019-11-16 07:57:42.531945	\N	\N	1	\N	1286	4150	\N	5	2	0
6329	2019-07-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131514	2019-11-16 07:57:42.531945	\N	\N	1	\N	1040	4500	\N	5	2	0
6328	2019-07-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000055219	2019-11-16 07:57:42.531945	\N	\N	1	\N	470	4960	\N	5	2	0
6335	2019-07-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000955243	2019-11-16 07:57:42.531945	\N	\N	1	\N	1063	10000	\N	5	2	0
6331	2019-07-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000993097	2019-11-16 07:57:42.531945	\N	\N	1	\N	1092	12000	\N	5	2	0
6334	2019-07-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000451	2019-11-16 07:57:42.531945	\N	\N	1	\N	9	12160	\N	5	2	0
6333	2019-07-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000083398	2019-11-16 07:57:42.531945	\N	\N	1	\N	1065	13830	\N	5	2	0
6332	2019-07-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000387541	2019-11-16 07:57:42.531945	\N	\N	1	\N	83	19922	\N	5	2	0
6353	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000868	2019-11-16 07:57:42.531945	\N	\N	1	\N	73	1619	\N	5	2	0
6352	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000145893	2019-11-16 07:57:42.531945	\N	\N	1	\N	620	4040	\N	5	2	0
6336	2019-07-12	FT - CR - 50200028672680 - ALPHA 2 UNIT OF S H PROF  M PVT LTD	0000000000000881	2019-11-16 07:57:42.531945	\N	\N	1	\N	1287	4885	\N	5	2	0
6351	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129002	2019-11-16 07:57:42.531945	\N	\N	1	\N	663	5459	\N	5	2	0
6350	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126770	2019-11-16 07:57:42.531945	\N	\N	1	\N	75	5541	\N	5	2	0
6349	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259930	2019-11-16 07:57:42.531945	\N	\N	1	\N	1192	8879	\N	5	2	0
6348	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058253	2019-11-16 07:57:42.531945	\N	\N	1	\N	32	9280	\N	5	2	0
6347	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000161941	2019-11-16 07:57:42.531945	\N	\N	1	\N	34	9430	\N	5	2	0
6346	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000955244	2019-11-16 07:57:42.531945	\N	\N	1	\N	1063	10000	\N	5	2	0
6345	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000049	2019-11-16 07:57:42.531945	\N	\N	1	\N	307	12713	\N	5	2	0
6343	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992721	2019-11-16 07:57:42.531945	\N	\N	1	\N	23	23596	\N	5	2	0
6342	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000602444	2019-11-16 07:57:42.531945	\N	\N	1	\N	91	40397	\N	5	2	0
6354	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259518	2019-11-16 07:57:42.531945	\N	\N	1	\N	1131	113382	\N	5	2	0
6338	2019-07-12	2534145-83931940-279-1-2-1-5020002953765-SAW1919341154095	SAW1919341154095	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	1125	5	2	0
6339	2019-07-12	2534147-83931940-279-1-2-1-5020002953765-SAW1919341154095	SAW1919341154095	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	1125	5	2	0
6341	2019-07-12	2534151-83931940-279-1-2-2-5020002953765-.	000000000000000.	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	4709	5	2	0
6337	2019-07-12	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000993097	2019-11-16 07:57:42.531945	\N	\N	1	\N	1092	\N	12000	5	2	0
6340	2019-07-12	2534149-83931940-279-1-2-1-5020002953765-SAW1919341154095	SAW1919341154095	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	12500	5	2	0
6355	2019-07-14	IMPS-919514358878-JBM ENTERPRISES-HDFC-XXXXXXXXXX0686-OBC	0000919514358878	2019-11-16 07:57:42.531945	\N	\N	1	\N	1112	5850	\N	5	2	0
6356	2019-07-15	CHQ DEP # 000099 DTD 12.07.2019	0000000000000099	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	7694	\N	5	2	0
6357	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672680	2019-11-16 07:57:42.531945	\N	\N	1	\N	1260	9441	\N	5	2	0
6358	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000966	2019-11-16 07:57:42.531945	\N	\N	1	\N	95	10693	\N	5	2	0
6359	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042094	2019-11-16 07:57:42.531945	\N	\N	1	\N	102	10966	\N	5	2	0
6360	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000056	2019-11-16 07:57:42.531945	\N	\N	1	\N	72	11400	\N	5	2	0
6361	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127586	2019-11-16 07:57:42.531945	\N	\N	1	\N	390	11564	\N	5	2	0
6362	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000993098	2019-11-16 07:57:42.531945	\N	\N	1	\N	1092	12300	\N	5	2	0
6363	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000888320	2019-11-16 07:57:42.531945	\N	\N	1	\N	31	17594	\N	5	2	0
6364	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042087	2019-11-16 07:57:42.531945	\N	\N	1	\N	102	22972	\N	5	2	0
6365	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127172	2019-11-16 07:57:42.531945	\N	\N	1	\N	56	28898	\N	5	2	0
6366	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397333	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	30000	\N	5	2	0
6367	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000150468	2019-11-16 07:57:42.531945	\N	\N	1	\N	3	33795	\N	5	2	0
6368	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000421773	2019-11-16 07:57:42.531945	\N	\N	1	\N	1192	36287	\N	5	2	0
6369	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009272	2019-11-16 07:57:42.531945	\N	\N	1	\N	105	40062	\N	5	2	0
6372	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013839	2019-11-16 07:57:42.531945	\N	\N	1	\N	57	60071	\N	5	2	0
6370	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254647	2019-11-16 07:57:42.531945	\N	\N	1	\N	1162	50000	\N	5	2	0
6371	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007287	2019-11-16 07:57:42.531945	\N	\N	1	\N	514	99305	\N	5	2	0
6374	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127015	2019-11-16 07:57:42.531945	\N	\N	1	\N	89	3983	\N	5	2	0
6375	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000539250	2019-11-16 07:57:42.531945	\N	\N	1	\N	46	4875	\N	5	2	0
6376	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000326	2019-11-16 07:57:42.531945	\N	\N	1	\N	1	6159	\N	5	2	0
6377	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315651	2019-11-16 07:57:42.531945	\N	\N	1	\N	35	6242	\N	5	2	0
6378	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000267289	2019-11-16 07:57:42.531945	\N	\N	1	\N	87	6950	\N	5	2	0
6379	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000454324	2019-11-16 07:57:42.531945	\N	\N	1	\N	306	7142	\N	5	2	0
6380	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000955245	2019-11-16 07:57:42.531945	\N	\N	1	\N	1063	7466	\N	5	2	0
6381	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003874	2019-11-16 07:57:42.531945	\N	\N	1	\N	101	7787	\N	5	2	0
6382	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000083415	2019-11-16 07:57:42.531945	\N	\N	1	\N	1065	8000	\N	5	2	0
6383	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001666	2019-11-16 07:57:42.531945	\N	\N	1	\N	81	8228	\N	5	2	0
6384	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027951	2019-11-16 07:57:42.531945	\N	\N	1	\N	24	9244	\N	5	2	0
6392	2019-07-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002441	2019-11-16 07:57:42.531945	\N	\N	1	\N	1060	962	\N	5	2	0
6393	2019-07-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259551	2019-11-16 07:57:42.531945	\N	\N	1	\N	1131	7302	\N	5	2	0
6394	2019-07-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000648	2019-11-16 07:57:42.531945	\N	\N	1	\N	1081	16034	\N	5	2	0
6395	2019-07-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000499	2019-11-16 07:57:42.531945	\N	\N	1	\N	342	24085	\N	5	2	0
6385	2019-07-16	CHQ DEP RET CHGS 090719-MIR1919443941307	0000000000160281	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6386	2019-07-16	CHQ DEP RET CHGS 090719-MIR1919443941300	0000000000000622	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6387	2019-07-16	CHQ DEP RET CHGS 090719-MIR1919443941313	0000000000000021	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6390	2019-07-16	CHQ DEP RET CHGS 120719-MIR1919646084927	0000000000993097	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6391	2019-07-16	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000150468	2019-11-16 07:57:42.531945	\N	\N	1	\N	3	\N	33795	5	2	0
6388	2019-07-16	N3058220156601310-STP-DABUR HPC	IB16130348956177	2019-11-16 07:57:42.531945	\N	\N	1	\N	1255	\N	170000	5	2	0
6389	2019-07-16	MARICO4254-STP-MARICO	IB16130640209494	2019-11-16 07:57:42.531945	\N	\N	1	\N	1252	\N	250000	5	2	0
6399	2019-07-18	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019071887612532-COLGATE	HDFCR52019071887612532	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	300000	5	2	0
6396	2019-07-18	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019071887470630-RED BULL	HDFCR52019071887470630	2019-11-16 07:57:42.531945	\N	\N	1	\N	1251	\N	300000	5	2	0
6397	2019-07-18	MARICO4254-STP-MARICO	IB18093225616828	2019-11-16 07:57:42.531945	\N	\N	1	\N	1252	\N	330000	5	2	0
6406	2019-07-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121801	2019-11-16 07:57:42.531945	\N	\N	1	\N	68	4026	\N	5	2	0
6405	2019-07-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000219	2019-11-16 07:57:42.531945	\N	\N	1	\N	83	4824	\N	5	2	0
6404	2019-07-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000245096	2019-11-16 07:57:42.531945	\N	\N	1	\N	616	8928	\N	5	2	0
6403	2019-07-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000483	2019-11-16 07:57:42.531945	\N	\N	1	\N	1087	12498	\N	5	2	0
6402	2019-07-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000602455	2019-11-16 07:57:42.531945	\N	\N	1	\N	91	19814	\N	5	2	0
6401	2019-07-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000102327	2019-11-16 07:57:42.531945	\N	\N	1	\N	1109	28951	\N	5	2	0
6400	2019-07-19	N3058220156601310-STP-DABUR HPC	IB19155855752535	2019-11-16 07:57:42.531945	\N	\N	1	\N	1255	\N	100000	5	2	0
6411	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000087195	2019-11-16 07:57:42.531945	\N	\N	1	\N	553	1081	\N	5	2	0
6410	2019-07-20	IMPS-920118536122-UMESH KUMAR-HDFC-XXXXXXXXXXX8918-STOR	0000920118536122	2019-11-16 07:57:42.531945	\N	\N	1	\N	1289	2000	\N	5	2	0
6412	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000118782	2019-11-16 07:57:42.531945	\N	\N	1	\N	1096	4116	\N	5	2	0
6413	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126782	2019-11-16 07:57:42.531945	\N	\N	1	\N	75	5401	\N	5	2	0
6407	2019-07-20	IMPS-920113572142-HARENDRA KUMAR TEWA-HDFC-XXXXXXXX8761-	0000920113572142	2019-11-16 07:57:42.531945	\N	\N	1	\N	1283	6000	\N	5	2	0
6414	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000023857	2019-11-16 07:57:42.531945	\N	\N	1	\N	700	15790	\N	5	2	0
6415	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000557	2019-11-16 07:57:42.531945	\N	\N	1	\N	661	16034	\N	5	2	0
6416	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000464	2019-11-16 07:57:42.531945	\N	\N	1	\N	1083	16192	\N	5	2	0
6417	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126335	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	22479	\N	5	2	0
6418	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009326	2019-11-16 07:57:42.531945	\N	\N	1	\N	105	24223	\N	5	2	0
6419	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992731	2019-11-16 07:57:42.531945	\N	\N	1	\N	23	35491	\N	5	2	0
6420	2019-07-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000408341	2019-11-16 07:57:42.531945	\N	\N	1	\N	1	51773	\N	5	2	0
6421	2019-07-20	GST/BANK REFERENCE NO: R1920112991883/CIN NO: HDFC19070900486931	0190720090076790	2019-11-16 07:57:42.531945	\N	\N	1	\N	1259	\N	26626	5	2	0
6409	2019-07-20	HB3142NR1000009999-STP-GODREJ	IB20143443767231	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	300000	5	2	0
6408	2019-07-20	MARICO4254-STP-MARICO	IB20143355766987	2019-11-16 07:57:42.531945	\N	\N	1	\N	1252	\N	400000	5	2	0
6423	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000145	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	1060	\N	5	2	0
6424	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027956	2019-11-16 07:57:42.531945	\N	\N	1	\N	24	11311	\N	5	2	0
6425	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058258	2019-11-16 07:57:42.531945	\N	\N	1	\N	32	12074	\N	5	2	0
6426	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001135	2019-11-16 07:57:42.531945	\N	\N	1	\N	60	14809	\N	5	2	0
6427	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000023858	2019-11-16 07:57:42.531945	\N	\N	1	\N	700	15790	\N	5	2	0
6428	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000126304	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	23737	\N	5	2	0
6429	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001681	2019-11-16 07:57:42.531945	\N	\N	1	\N	81	35650	\N	5	2	0
6422	2019-07-22	ADDISTRO TECHN-J P ENTERPRIS COL09	0000133530900004	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	47480	\N	5	2	0
6432	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000873	2019-11-16 07:57:42.531945	\N	\N	1	\N	73	2235	\N	5	2	0
6433	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000454338	2019-11-16 07:57:42.531945	\N	\N	1	\N	306	3314	\N	5	2	0
6434	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000129	2019-11-16 07:57:42.531945	\N	\N	1	\N	501	3556	\N	5	2	0
6436	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000036	2019-11-16 07:57:42.531945	\N	\N	1	\N	1037	4000	\N	5	2	0
6437	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000331	2019-11-16 07:57:42.531945	\N	\N	1	\N	1	6049	\N	5	2	0
6438	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315652	2019-11-16 07:57:42.531945	\N	\N	1	\N	35	6104	\N	5	2	0
6439	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000976	2019-11-16 07:57:42.531945	\N	\N	1	\N	95	6914	\N	5	2	0
6440	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000879	2019-11-16 07:57:42.531945	\N	\N	1	\N	1010	7118	\N	5	2	0
6441	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000180030	2019-11-16 07:57:42.531945	\N	\N	1	\N	1290	7388	\N	5	2	0
6442	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000083427	2019-11-16 07:57:42.531945	\N	\N	1	\N	1065	8607	\N	5	2	0
6443	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672701	2019-11-16 07:57:42.531945	\N	\N	1	\N	1260	9638	\N	5	2	0
6430	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000745570	2019-11-16 07:57:42.531945	\N	\N	1	\N	40	39958	\N	5	2	0
6444	2019-07-23	NEFT CR-UTIB0000624-MAHAVEERA GENERAL STORE-JP ENTERPRISES-AXMB192040678919	AXMB192040678919	2019-11-16 07:57:42.531945	\N	\N	1	\N	54	6731	\N	5	2	0
6450	2019-07-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001622	2019-11-16 07:57:42.531945	\N	\N	1	\N	513	10000	\N	5	2	0
6451	2019-07-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000372952	2019-11-16 07:57:42.531945	\N	\N	1	\N	629	10604	\N	5	2	0
6449	2019-07-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127200	2019-11-16 07:57:42.531945	\N	\N	1	\N	56	24831	\N	5	2	0
6448	2019-07-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000127	2019-11-16 07:57:42.531945	\N	\N	1	\N	313	44929	\N	5	2	0
6447	2019-07-23	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000263268	2019-11-16 07:57:42.531945	\N	\N	1	\N	42	\N	3863	5	2	0
6446	2019-07-23	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000023858	2019-11-16 07:57:42.531945	\N	\N	1	\N	700	\N	15790	5	2	0
6445	2019-07-23	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019072388297634-COLGATE	HDFCR52019072388297634	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	285000	5	2	0
6465	2019-07-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000717787	2019-11-16 07:57:42.531945	\N	\N	1	\N	747	9508	\N	5	2	0
6453	2019-07-24	UPI-AMIR-9716577977@PAYTM-PYTM0123456-920540759334-NA	0000920516410803	2019-11-16 07:57:42.531945	\N	\N	1	\N	1285	10000	\N	5	2	0
6466	2019-07-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000191	2019-11-16 07:57:42.531945	\N	\N	1	\N	1094	10626	\N	5	2	0
6467	2019-07-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000184661	2019-11-16 07:57:42.531945	\N	\N	1	\N	50	12163	\N	5	2	0
6457	2019-07-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000902854	2019-11-16 07:57:42.531945	\N	\N	1	\N	31	12230	\N	5	2	0
6455	2019-07-24	FT - CR - 50100033209576 - RAVISH KUMAR SINGH	0000000000000145	2019-11-16 07:57:42.531945	\N	\N	1	\N	1291	15567	\N	5	2	0
6458	2019-07-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000254944	2019-11-16 07:57:42.531945	\N	\N	1	\N	19	18335	\N	5	2	0
6459	2019-07-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108428	2019-11-16 07:57:42.531945	\N	\N	1	\N	64	18629	\N	5	2	0
6460	2019-07-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000757	2019-11-16 07:57:42.531945	\N	\N	1	\N	391	19355	\N	5	2	0
6461	2019-07-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131254	2019-11-16 07:57:42.531945	\N	\N	1	\N	55	20200	\N	5	2	0
6462	2019-07-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397373	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	20514	\N	5	2	0
6463	2019-07-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000540	2019-11-16 07:57:42.531945	\N	\N	1	\N	86	54243	\N	5	2	0
6464	2019-07-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000113135	2019-11-16 07:57:42.531945	\N	\N	1	\N	79	65742	\N	5	2	0
6456	2019-07-24	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000372952	2019-11-16 07:57:42.531945	\N	\N	1	\N	629	\N	10604	5	2	0
6468	2019-07-25	UPI-PRAVIN KUMAR-8447997290@PAYTM-PYTM0123456-920638011875-NA	0000920614646941	2019-11-16 07:57:42.531945	\N	\N	1	\N	1286	2180	\N	5	2	0
6473	2019-07-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000055225	2019-11-16 07:57:42.531945	\N	\N	1	\N	470	2591	\N	5	2	0
6474	2019-07-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000231	2019-11-16 07:57:42.531945	\N	\N	1	\N	1066	3488	\N	5	2	0
6475	2019-07-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001302	2019-11-16 07:57:42.531945	\N	\N	1	\N	140	4449	\N	5	2	0
6476	2019-07-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000457	2019-11-16 07:57:42.531945	\N	\N	1	\N	9	8151	\N	5	2	0
6469	2019-07-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000408362	2019-11-16 07:57:42.531945	\N	\N	1	\N	78	14391	\N	5	2	0
6471	2019-07-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000286366	2019-11-16 07:57:42.531945	\N	\N	1	\N	1128	19771	\N	5	2	0
6470	2019-07-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810358	2019-11-16 07:57:42.531945	\N	\N	1	\N	83	15000	\N	5	2	0
6472	2019-07-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000079	2019-11-16 07:57:42.531945	\N	\N	1	\N	1262	28430	\N	5	2	0
6477	2019-07-25	CHQ DEP RET CHGS 160719-MIR1920169668584	0000000000150468	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6483	2019-07-26	UPI-SAHIDUL MIA-SAHIDULISLAM9@YBL-DBSS0IN0811-920776934394-PAYMENT FROM PHONE	0000920719519296	2019-11-16 07:57:42.531945	\N	\N	1	\N	1292	900	\N	5	2	0
6479	2019-07-26	FT - CR - 50200031829519 - PAWAN CHAURASIA PAAN SHOP	0000000000000186	2019-11-16 07:57:42.531945	\N	\N	1	\N	1181	8850	\N	5	2	0
6480	2019-07-26	FT - CR - 02782560000772 - DHARMA FOOD JUNCTION	0000000000000431	2019-11-16 07:57:42.531945	\N	\N	1	\N	25	11929	\N	5	2	0
6481	2019-07-26	CHQ DEP # 000145 DTD 22.07.2019	0000000000000145	2019-11-16 07:57:42.531945	\N	\N	1	\N	936	10601	\N	5	2	0
6482	2019-07-26	ENTRY RECTIFIED # 000145	0000000000045880	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	1060	5	2	0
6478	2019-07-26	50100051672149-TPT-DRAWINGS	0000000166151501	2019-11-16 07:57:42.531945	\N	\N	1	\N	1258	\N	620000	5	2	0
6484	2019-07-27	UPI-SATYA PAL SINGH S O -9891988521@YBL-PUNB0460300-920830158207-PAYMENT FROM PHONE	0000920810991950	2019-11-16 07:57:42.531945	\N	\N	1	\N	1282	5000	\N	5	2	0
6485	2019-07-29	CHQ DEP RET CHGS 230719-MIR1920877953902	0000000000263268	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6486	2019-07-29	CHQ DEP RET CHGS 230719-MIR1920878371727	0000000000023858	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6454	2019-07-24	50200006539210-TPT-JP OD TO TTC CA	0000000349620032	2019-11-16 07:57:42.531945	\N	\N	1	\N	422	\N	100000	5	2	0
6508	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000079174	2019-11-16 07:57:42.531945	\N	\N	1	\N	314	1850	\N	5	2	0
6493	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000267305	2019-11-16 07:57:42.531945	\N	\N	1	\N	87	3783	\N	5	2	0
6494	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000083440	2019-11-16 07:57:42.531945	\N	\N	1	\N	1065	5000	\N	5	2	0
6495	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003892	2019-11-16 07:57:42.531945	\N	\N	1	\N	101	6183	\N	5	2	0
6490	2019-07-29	IMPS-921016565860-AGGARWAL KIRANA STOR-HDFC-XXXXXXXXXX1602-JP ENTERPRISES	0000921016565860	2019-11-16 07:57:42.531945	\N	\N	1	\N	577	5000	\N	5	2	0
6489	2019-07-29	CHQ DEP - TRANSFER OW 2 - NOIDA WBO	0000000000000541	2019-11-16 07:57:42.531945	\N	\N	1	\N	26	6329	\N	5	2	0
6496	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000152	2019-11-16 07:57:42.531945	\N	\N	1	\N	17	6341	\N	5	2	0
6497	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129011	2019-11-16 07:57:42.531945	\N	\N	1	\N	663	6404	\N	5	2	0
6498	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000985	2019-11-16 07:57:42.531945	\N	\N	1	\N	95	6689	\N	5	2	0
6492	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000584083	2019-11-16 07:57:42.531945	\N	\N	1	\N	1049	2994	\N	5	2	0
6499	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382358	2019-11-16 07:57:42.531945	\N	\N	1	\N	773	6997	\N	5	2	0
6501	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000161946	2019-11-16 07:57:42.531945	\N	\N	1	\N	34	7295	\N	5	2	0
6502	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001624	2019-11-16 07:57:42.531945	\N	\N	1	\N	513	8528	\N	5	2	0
6509	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000593144	2019-11-16 07:57:42.531945	\N	\N	1	\N	77	10000	\N	5	2	0
6500	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000465	2019-11-16 07:57:42.531945	\N	\N	1	\N	1083	19604	\N	5	2	0
6503	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000027964	2019-11-16 07:57:42.531945	\N	\N	1	\N	24	12425	\N	5	2	0
6504	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000902715	2019-11-16 07:57:42.531945	\N	\N	1	\N	1090	20000	\N	5	2	0
6505	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000602470	2019-11-16 07:57:42.531945	\N	\N	1	\N	91	23120	\N	5	2	0
6506	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009174	2019-11-16 07:57:42.531945	\N	\N	1	\N	105	33270	\N	5	2	0
6507	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013351	2019-11-16 07:57:42.531945	\N	\N	1	\N	57	44763	\N	5	2	0
6510	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000955	2019-11-16 07:57:42.531945	\N	\N	1	\N	126	143158	\N	5	2	0
6488	2019-07-29	FT-HB3142NR1000009999-GODREJ CONSUMER PRODUCTS LIMIT	0000000000000159	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	1073592.3899999999	5	2	0
6511	2019-07-30	FT - DR - 01208630000165 - FAIR DEAL CARS PVT LTD	0000000000000160	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	5000	5	2	0
6512	2019-07-30	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000593144	2019-11-16 07:57:42.531945	\N	\N	1	\N	77	\N	10000	5	2	0
6514	2019-07-31	50200029853444-TPT-JP OD TO TTC OD	0000000224047528	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	25000	5	2	0
6513	2019-07-31	FT - DR - 50200007138822 - J P ENTERPRISES	0000000000000166	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	500000	5	2	0
6515	2019-08-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	21504	5	2	0
6516	2019-08-03	UPI-YATENDER KUMAR SHARM-9999566025@YBL-PYTM0123456-921520087136-PAYMENT FROM PHONE	0000921510245453	2019-11-16 07:57:42.531945	\N	\N	1	\N	1294	2500	\N	5	2	0
6517	2019-08-03	HB3142NR1000009999-STP-GODREJ	IB03132326691703	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	100000	5	2	0
6519	2019-08-04	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-921643793900-NA	0000921619513346	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	1100	\N	5	2	0
6518	2019-08-04	IMPS-921609936926-HARENDRA KUMAR TEWA-HDFC-XXXXXXXX8761-	0000921609936926	2019-11-16 07:57:42.531945	\N	\N	1	\N	1283	4000	\N	5	2	0
6520	2019-08-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002482	2019-11-16 07:57:42.531945	\N	\N	1	\N	1061	7911	\N	5	2	0
6521	2019-08-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000406431	2019-11-16 07:57:42.531945	\N	\N	1	\N	264	9173	\N	5	2	0
6522	2019-08-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672735	2019-11-16 07:57:42.531945	\N	\N	1	\N	1260	10895	\N	5	2	0
6524	2019-08-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024330	2019-11-16 07:57:42.531945	\N	\N	1	\N	700	13216	\N	5	2	0
6525	2019-08-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000745580	2019-11-16 07:57:42.531945	\N	\N	1	\N	40	35682	\N	5	2	0
6526	2019-08-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000166454	2019-11-16 07:57:42.531945	\N	\N	1	\N	14	61930	\N	5	2	0
6527	2019-08-07	O/S INTEREST RECOVERY FROM A/C XXXXXXXXXX8822	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	13904	\N	5	2	0
6528	2019-08-07	CHQ DEP RET CHGS 300719-MIR1921484122201	0000000000593144	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6523	2019-08-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000682	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	12185	\N	5	2	0
6540	2019-08-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134260	2019-11-16 07:57:42.531945	\N	\N	1	\N	1041	1147	\N	5	2	0
6539	2019-08-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000338	2019-11-16 07:57:42.531945	\N	\N	1	\N	1	4256	\N	5	2	0
6538	2019-08-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000406452	2019-11-16 07:57:42.531945	\N	\N	1	\N	264	4321	\N	5	2	0
6530	2019-08-08	UPI-RAJEEV KUMAR CHAURAS-RAJEEVCHAURASIYA1@OKAXIS-UTIB0000884-922011207294-UPI	0000922011905942	2019-11-16 07:57:42.531945	\N	\N	1	\N	1288	5000	\N	5	2	0
6537	2019-08-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000462	2019-11-16 07:57:42.531945	\N	\N	1	\N	9	6307	\N	5	2	0
6536	2019-08-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000232295	2019-11-16 07:57:42.531945	\N	\N	1	\N	62	6734	\N	5	2	0
6535	2019-08-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000010187	2019-11-16 07:57:42.531945	\N	\N	1	\N	280	9370	\N	5	2	0
6534	2019-08-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001475	2019-11-16 07:57:42.531945	\N	\N	1	\N	1063	9757	\N	5	2	0
6533	2019-08-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024332	2019-11-16 07:57:42.531945	\N	\N	1	\N	700	12226	\N	5	2	0
6531	2019-08-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000011961	2019-11-16 07:57:42.531945	\N	\N	1	\N	1074	21768	\N	5	2	0
6532	2019-08-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000995	2019-11-16 07:57:42.531945	\N	\N	1	\N	1186	15500	\N	5	2	0
6541	2019-08-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000957694	2019-11-16 07:57:42.531945	\N	\N	1	\N	910	26660	\N	5	2	0
6542	2019-08-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101367	2019-11-16 07:57:42.531945	\N	\N	1	\N	434	28000	\N	5	2	0
6529	2019-08-07	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000024330	2019-11-16 07:57:42.531945	\N	\N	1	\N	700	\N	13216	5	2	0
6547	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129023	2019-11-16 07:57:42.531945	\N	\N	1	\N	663	2390	\N	5	2	0
6559	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000016092	2019-11-16 07:57:42.531945	\N	\N	1	\N	5	2762	\N	5	2	0
6558	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000419	2019-11-16 07:57:42.531945	\N	\N	1	\N	88	4002	\N	5	2	0
6557	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000267318	2019-11-16 07:57:42.531945	\N	\N	1	\N	87	4468	\N	5	2	0
6556	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003962	2019-11-16 07:57:42.531945	\N	\N	1	\N	101	4954	\N	5	2	0
6555	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000405494	2019-11-16 07:57:42.531945	\N	\N	1	\N	1170	6000	\N	5	2	0
6553	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000204722	2019-11-16 07:57:42.531945	\N	\N	1	\N	28	6500	\N	5	2	0
6552	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000114298	2019-11-16 07:57:42.531945	\N	\N	1	\N	685	6850	\N	5	2	0
6551	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000706	2019-11-16 07:57:42.531945	\N	\N	1	\N	1125	7636	\N	5	2	0
6549	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000184668	2019-11-16 07:57:42.531945	\N	\N	1	\N	50	9051	\N	5	2	0
6546	2019-08-13	IMPS-922517323377-UNREGISTERED-HDFC-XXXXXXXXXXXXX0002-	0000922517323377	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	10000	\N	5	2	0
6548	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000372952	2019-11-16 07:57:42.531945	\N	\N	1	\N	629	10604	\N	5	2	0
6545	2019-08-13	HB3142NR1000009999-STP-GODREJ	IB13104445373136	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	120000	5	2	0
6544	2019-08-13	MARICO4254-STP-MARICO	IB13104411268213	2019-11-16 07:57:42.531945	\N	\N	1	\N	1252	\N	200000	5	2	0
6563	2019-08-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002494	2019-11-16 07:57:42.531945	\N	\N	1	\N	1060	4825	\N	5	2	0
6566	2019-08-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000496	2019-11-16 07:57:42.531945	\N	\N	1	\N	1087	8065	\N	5	2	0
6565	2019-08-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000053467	2019-11-16 07:57:42.531945	\N	\N	1	\N	1065	10000	\N	5	2	0
6564	2019-08-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007388	2019-11-16 07:57:42.531945	\N	\N	1	\N	514	18458	\N	5	2	0
6561	2019-08-14	UPI-AMIR-9716577977@PAYTM-PYTM0123456-922638232202-NA	0000922614698532	2019-11-16 07:57:42.531945	\N	\N	1	\N	1285	19000	\N	5	2	0
6560	2019-08-14	CHQ DEP RET CHGS 070819-MIR1922399005595	0000000000024330	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6562	2019-08-14	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000372952	2019-11-16 07:57:42.531945	\N	\N	1	\N	629	\N	10604	5	2	0
6570	2019-08-16	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-922836046004-NA	0000922812690959	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	2100	\N	5	2	0
6574	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826728	2019-11-16 07:57:42.531945	\N	\N	1	\N	858	2234	\N	5	2	0
6575	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134269	2019-11-16 07:57:42.531945	\N	\N	1	\N	1041	2516	\N	5	2	0
6567	2019-08-16	FT - CR - 50100209140242 - INDRESH	0000000000000053	2019-11-16 07:57:42.531945	\N	\N	1	\N	1297	4882	\N	5	2	0
6576	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001320	2019-11-16 07:57:42.531945	\N	\N	1	\N	140	6117	\N	5	2	0
6577	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000579	2019-11-16 07:57:42.531945	\N	\N	1	\N	661	6157	\N	5	2	0
6578	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000849718	2019-11-16 07:57:42.531945	\N	\N	1	\N	730	7590	\N	5	2	0
6579	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000245123	2019-11-16 07:57:42.531945	\N	\N	1	\N	616	9078	\N	5	2	0
6569	2019-08-16	IMPS-922812355940-GOURAV JAIN-HDFC-XXXXXX8749-COMMENTS	0000922812355940	2019-11-16 07:57:42.531945	\N	\N	1	\N	1298	9900	\N	5	2	0
6580	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000053468	2019-11-16 07:57:42.531945	\N	\N	1	\N	1065	10000	\N	5	2	0
6581	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259222	2019-11-16 07:57:42.531945	\N	\N	1	\N	513	10000	\N	5	2	0
6582	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000178	2019-11-16 07:57:42.531945	\N	\N	1	\N	231	10607	\N	5	2	0
6583	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000017627	2019-11-16 07:57:42.531945	\N	\N	1	\N	1057	10709	\N	5	2	0
6568	2019-08-16	FT - CR - 50200031829519 - PAWAN CHAURASIA PAAN SHOP	0000000000000163	2019-11-16 07:57:42.531945	\N	\N	1	\N	1181	11351	\N	5	2	0
6584	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000341	2019-11-16 07:57:42.531945	\N	\N	1	\N	1	12648	\N	5	2	0
6585	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007387	2019-11-16 07:57:42.531945	\N	\N	1	\N	514	25281	\N	5	2	0
6586	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131361	2019-11-16 07:57:42.531945	\N	\N	1	\N	56	26099	\N	5	2	0
6587	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000151437	2019-11-16 07:57:42.531945	\N	\N	1	\N	3	29897	\N	5	2	0
6573	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013376	2019-11-16 07:57:42.531945	\N	\N	1	\N	57	107062	\N	5	2	0
6571	2019-08-16	CHQ DEP RET CHGS 140819-MIR1922809330481	0000000000372952	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6593	2019-08-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000087218	2019-11-16 07:57:42.531945	\N	\N	1	\N	553	3260	\N	5	2	0
6589	2019-08-17	IMPS-922911200852-HARENDRA KUMAR TEWAT-HDFC-XXXXXXXX8761-	0000922911200852	2019-11-16 07:57:42.531945	\N	\N	1	\N	1283	4177	\N	5	2	0
6592	2019-08-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121824	2019-11-16 07:57:42.531945	\N	\N	1	\N	68	4388	\N	5	2	0
6595	2019-08-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002035	2019-11-16 07:57:42.531945	\N	\N	1	\N	67	14659	\N	5	2	0
6594	2019-08-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001800	2019-11-16 07:57:42.531945	\N	\N	1	\N	81	60176	\N	5	2	0
6590	2019-08-17	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000007387	2019-11-16 07:57:42.531945	\N	\N	1	\N	514	\N	25281	5	2	0
6591	2019-08-17	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000151437	2019-11-16 07:57:42.531945	\N	\N	1	\N	3	\N	29897	5	2	0
6596	2019-08-19	IMPS-923111880781-GOYAL TRADERS-HDFC-XXXXXX4136-MB: PAYMENT	0000923111880781	2019-11-16 07:57:42.531945	\N	\N	1	\N	920	241	\N	5	2	0
6597	2019-08-19	IMPS-923114085142-GOYAL TRADERS-HDFC-XXXXXX4136-MB: PAYMENT	0000923114085142	2019-11-16 07:57:42.531945	\N	\N	1	\N	920	23000	\N	5	2	0
6598	2019-08-19	CHQ DEP RET CHGS 170819-MIR1923014279560	0000000000007387	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6599	2019-08-19	CHQ DEP RET CHGS 170819-MIR1923014277422	0000000000151437	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6601	2019-08-19	MARICO4254-STP-MARICO	IB19144357337904	2019-11-16 07:57:42.531945	\N	\N	1	\N	1252	\N	200000	5	2	0
6600	2019-08-19	HB3142NR1000009999-STP-GODREJ	IB19144309137366	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	250000	5	2	0
6572	2019-08-16	UPI-DHARAM KUMAR SHARMA-DHARM1246SHARMA@OKHDFCBANK-HDFC0000278-922816212766-UPI	0000922816735543	2019-11-16 07:57:42.531945	\N	\N	1	\N	1300	3501	\N	5	2	0
6604	2019-08-20	NEFT CR-UTIB0000624-MAHAVEERA GENERAL STORE-JP ENTERPRISES-AXMB192320838417	AXMB192320838417	2019-11-16 07:57:42.531945	\N	\N	1	\N	54	7606	\N	5	2	0
6605	2019-08-20	NEFT CR-ORBC0101228-MBKCHNL-JBMENTERPRISES-JPENTERPRISES-SAA73683748	00000SAA73683748	2019-11-16 07:57:42.531945	\N	\N	1	\N	1112	10977	\N	5	2	0
6603	2019-08-20	I/W CHQ RETURN-MICR CTS-NOIDA WBO	0000000000000154	2019-11-16 07:57:42.531945	\N	\N	1	\N	1253	122100	\N	5	2	0
6602	2019-08-20	I/W CHQ RETURN-MICR -FERRERO INDIA	0000000000000154	2019-11-16 07:57:42.531945	\N	\N	1	\N	1253	\N	122100	5	2	0
6608	2019-08-21	IMPS-923316842261-DAKOTI EVER GREEN BA-HDFC-XXXXXXXXXXX0454-NA	0000923316842261	2019-11-16 07:57:42.531945	\N	\N	1	\N	1151	1	\N	5	2	0
6609	2019-08-21	IMPS-923316845706-DAKOTI EVER GREEN BA-HDFC-XXXXXXXXXXX0454-NA	0000923316845706	2019-11-16 07:57:42.531945	\N	\N	1	\N	1151	5713	\N	5	2	0
6610	2019-08-21	UPI-AMIR-9716577977@PAYTM-PYTM0123456-923340013339-NA	0000923316413895	2019-11-16 07:57:42.531945	\N	\N	1	\N	1285	6000	\N	5	2	0
6607	2019-08-21	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019082192069709-COLGATE	HDFCR52019082192069709	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	505000	5	2	0
6611	2019-08-22	CHQ RETURN CHGS INCL GST 200819-MIR1923420986078	0000000000000154	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	590	5	2	0
6612	2019-08-23	UPI-SANJAY CHAURASIYA-7557532561@PAYTM-PYTM0123456-923536975215-NA	0000923512365002	2019-11-16 07:57:42.531945	\N	\N	1	\N	1299	2701	\N	5	2	0
6613	2019-08-23	UPI-DHARAM KUMAR SHARMA-DHARM1246SHARMA@OKHDFCBANK-HDFC0000278-923516053402-JP	0000923516379195	2019-11-16 07:57:42.531945	\N	\N	1	\N	1300	12919	\N	5	2	0
6617	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000959	2019-11-16 07:57:42.531945	\N	\N	1	\N	73	1769	\N	5	2	0
6618	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000162	2019-11-16 07:57:42.531945	\N	\N	1	\N	501	2000	\N	5	2	0
6619	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000820518	2019-11-16 07:57:42.531945	\N	\N	1	\N	1270	3413	\N	5	2	0
6620	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001038	2019-11-16 07:57:42.531945	\N	\N	1	\N	1065	3887	\N	5	2	0
6621	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132023	2019-11-16 07:57:42.531945	\N	\N	1	\N	75	4641	\N	5	2	0
6622	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000121835	2019-11-16 07:57:42.531945	\N	\N	1	\N	68	4830	\N	5	2	0
6623	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000271	2019-11-16 07:57:42.531945	\N	\N	1	\N	1066	5322	\N	5	2	0
6624	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000053502	2019-11-16 07:57:42.531945	\N	\N	1	\N	1065	7000	\N	5	2	0
6625	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003987	2019-11-16 07:57:42.531945	\N	\N	1	\N	101	7398	\N	5	2	0
6626	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001479	2019-11-16 07:57:42.531945	\N	\N	1	\N	1063	7720	\N	5	2	0
6627	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024366	2019-11-16 07:57:42.531945	\N	\N	1	\N	700	10000	\N	5	2	0
6628	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029021	2019-11-16 07:57:42.531945	\N	\N	1	\N	24	11056	\N	5	2	0
6629	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000717808	2019-11-16 07:57:42.531945	\N	\N	1	\N	747	11470	\N	5	2	0
6630	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000094	2019-11-16 07:57:42.531945	\N	\N	1	\N	72	13081	\N	5	2	0
6631	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259226	2019-11-16 07:57:42.531945	\N	\N	1	\N	513	14249	\N	5	2	0
6632	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001225	2019-11-16 07:57:42.531945	\N	\N	1	\N	60	15330	\N	5	2	0
6633	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315659	2019-11-16 07:57:42.531945	\N	\N	1	\N	35	16837	\N	5	2	0
6634	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058283	2019-11-16 07:57:42.531945	\N	\N	1	\N	32	17350	\N	5	2	0
6635	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000161961	2019-11-16 07:57:42.531945	\N	\N	1	\N	34	19095	\N	5	2	0
6636	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001822	2019-11-16 07:57:42.531945	\N	\N	1	\N	81	23415	\N	5	2	0
6637	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000304802	2019-11-16 07:57:42.531945	\N	\N	1	\N	46	25016	\N	5	2	0
6638	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042535	2019-11-16 07:57:42.531945	\N	\N	1	\N	102	30939	\N	5	2	0
6639	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000515	2019-11-16 07:57:42.531945	\N	\N	1	\N	1301	33081	\N	5	2	0
6640	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397488	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	45987	\N	5	2	0
6641	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992773	2019-11-16 07:57:42.531945	\N	\N	1	\N	23	48198	\N	5	2	0
6642	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001824	2019-11-16 07:57:42.531945	\N	\N	1	\N	81	48888	\N	5	2	0
6643	2019-08-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000128408	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	53550	\N	5	2	0
6616	2019-08-26	NEFT CR-ICIC0003488-BAKERS ZONE-JP ENTERPRISES-000072244161	0000000072244161	2019-11-16 07:57:42.531945	\N	\N	1	\N	79	131023	\N	5	2	0
6615	2019-08-26	NEFT DR-DEUT0537PUN-FERRERO INDIA PVT LTD-NETBANK, MUM-N238190909531782-FERRERO	N238190909531782	2019-11-16 07:57:42.531945	\N	\N	1	\N	1253	\N	115000	5	2	0
6646	2019-08-27	UPI-PRAVEEN KUMAR-9213274978@YBL-UTIB0000624-923945574901-PAYMENT FROM PHONE	0000923915696011	2019-11-16 07:57:42.531945	\N	\N	1	\N	1286	7491	\N	5	2	0
6647	2019-08-27	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-923939563669-NA	0000923915775282	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	11242	\N	5	2	0
6644	2019-08-27	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	33000	\N	5	2	0
6645	2019-08-27	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	150000	\N	5	2	0
6649	2019-08-27	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000024366	2019-11-16 07:57:42.531945	\N	\N	1	\N	700	\N	10000	5	2	0
6652	2019-08-28	UPI-AMIR-9716577977@PAYTM-PYTM0123456-924039566903-NA	0000924015989984	2019-11-16 07:57:42.531945	\N	\N	1	\N	1285	15000	\N	5	2	0
6648	2019-08-27	FT - DR - 50200007138822 - J P ENTERPRISES	0000000000000168	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	150000	5	2	0
6651	2019-08-28	N3058220156601310-STP-DABUR	IB28145248570245	2019-11-16 07:57:42.531945	\N	\N	1	\N	1255	\N	150000	5	2	0
6656	2019-08-29	ADDISTRO TECHN-J P ENTERPRIS COL09	0000160116600003	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	61929	\N	5	2	0
6654	2019-08-29	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	200000	\N	5	2	0
6653	2019-08-29	CHQ DEP RET CHGS 270819-MIR1924133144535	0000000000024366	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6655	2019-08-29	HB3142NR1000009999-STP-GODREJ	IB29145727319919	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	250000	5	2	0
6657	2019-08-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007387	2019-11-16 07:57:42.531945	\N	\N	1	\N	514	25281	\N	5	2	0
6660	2019-09-01	UPI-AJAB SINGH-9891913099@PAYTM-PYTM0123456-924434554184-NA	0000924410377484	2019-11-16 07:57:42.531945	\N	\N	1	\N	1296	3200	\N	5	2	0
6659	2019-09-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1279	\N	37940	5	2	0
6661	2019-09-02	UPI-SANTOSH CHANDRA MISH-9643212479@PAYTM-PYTM0123456-924538113915-NA	0000924514276345	2019-11-16 07:57:42.531945	\N	\N	1	\N	1293	6000	\N	5	2	0
6662	2019-09-03	NEFT CR-UTIB0000624-MAHAVEERA GENERAL STORE-JP ENTERPRISES-AXMB192464954044	AXMB192464954044	2019-11-16 07:57:42.531945	\N	\N	1	\N	54	10322	\N	5	2	0
6675	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000053517	2019-11-16 07:57:42.531945	\N	\N	1	\N	1065	6229	\N	5	2	0
6676	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000474279	2019-11-16 07:57:42.531945	\N	\N	1	\N	58	7482	\N	5	2	0
6677	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132030	2019-11-16 07:57:42.531945	\N	\N	1	\N	75	8171	\N	5	2	0
6674	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000313	2019-11-16 07:57:42.531945	\N	\N	1	\N	233	9469	\N	5	2	0
6673	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000442	2019-11-16 07:57:42.531945	\N	\N	1	\N	616	11990	\N	5	2	0
6679	2019-09-04	CHQ DEP - MICR CLG - NOIDA WBO	0000000000283782	2019-11-16 07:57:42.531945	\N	\N	1	\N	478	13128	\N	5	2	0
6672	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000154254	2019-11-16 07:57:42.531945	\N	\N	1	\N	304	14852	\N	5	2	0
6669	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000520619	2019-11-16 07:57:42.531945	\N	\N	1	\N	1063	15000	\N	5	2	0
6678	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000520617	2019-11-16 07:57:42.531945	\N	\N	1	\N	1063	15000	\N	5	2	0
6670	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000572148	2019-11-16 07:57:42.531945	\N	\N	1	\N	1274	19248	\N	5	2	0
6666	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000058288	2019-11-16 07:57:42.531945	\N	\N	1	\N	32	20743	\N	5	2	0
6665	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000461917	2019-11-16 07:57:42.531945	\N	\N	1	\N	31	25868	\N	5	2	0
6663	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108449	2019-11-16 07:57:42.531945	\N	\N	1	\N	64	39034	\N	5	2	0
6664	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000410906	2019-11-16 07:57:42.531945	\N	\N	1	\N	359	77172	\N	5	2	0
6667	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008102	2019-11-16 07:57:42.531945	\N	\N	1	\N	728	82923	\N	5	2	0
6668	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000243	2019-11-16 07:57:42.531945	\N	\N	1	\N	1094	84262	\N	5	2	0
6687	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000820538	2019-11-16 07:57:42.531945	\N	\N	1	\N	1270	4431	\N	5	2	0
6688	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000350	2019-11-16 07:57:42.531945	\N	\N	1	\N	1	7247	\N	5	2	0
6689	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002533	2019-11-16 07:57:42.531945	\N	\N	1	\N	1061	8000	\N	5	2	0
6690	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134294	2019-11-16 07:57:42.531945	\N	\N	1	\N	1041	8094	\N	5	2	0
6680	2019-09-05	FT - CR - 50200013033414 - CROWNE PLAZA A UNIT OF AHPL	0000000000104934	2019-11-16 07:57:42.531945	\N	\N	1	\N	320	8571.32999999999993	\N	5	2	0
6691	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000594	2019-11-16 07:57:42.531945	\N	\N	1	\N	661	9388	\N	5	2	0
6692	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259277	2019-11-16 07:57:42.531945	\N	\N	1	\N	513	9930	\N	5	2	0
6695	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000745601	2019-11-16 07:57:42.531945	\N	\N	1	\N	40	11137	\N	5	2	0
6694	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000520620	2019-11-16 07:57:42.531945	\N	\N	1	\N	1063	12216	\N	5	2	0
6693	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123334	2019-11-16 07:57:42.531945	\N	\N	1	\N	1134	10691	\N	5	2	0
6682	2019-09-05	UPI-ARUN  GOYAL  SO  LAT-9599961300@PAYTM-UBIN0550507-924838499295-NA	0000924814847292	2019-11-16 07:57:42.531945	\N	\N	1	\N	1302	20705	\N	5	2	0
6686	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000558	2019-11-16 07:57:42.531945	\N	\N	1	\N	86	21359	\N	5	2	0
6696	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000161966	2019-11-16 07:57:42.531945	\N	\N	1	\N	34	21959	\N	5	2	0
6683	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000128428	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	45345	\N	5	2	0
6684	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397512	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	46000	\N	5	2	0
6681	2019-09-05	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010942	2019-11-16 07:57:42.531945	\N	\N	1	\N	97	58161	\N	5	2	0
6685	2019-09-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000927	2019-11-16 07:57:42.531945	\N	\N	1	\N	98	95314	\N	5	2	0
6697	2019-09-06	UPI-RAJEEV KUMAR CHAURAS-RAJEEVCHAURASIYA1@OKAXIS-UTIB0000884-924910350234-UPI	0000924910608346	2019-11-16 07:57:42.531945	\N	\N	1	\N	1288	4457	\N	5	2	0
6698	2019-09-06	UPI-DHARAM KUMAR SHARMA-DHARM1246SHARMA@OKHDFCBANK-HDFC0000278-924919707137-VIMAL	0000924919785865	2019-11-16 07:57:42.531945	\N	\N	1	\N	1300	6363	\N	5	2	0
6701	2019-09-07	UPI-GOURAV JAIN-9711228749@YBL-ICIC0000548-925020507850-PAYMENT FROM PHONE	0000925010679780	2019-11-16 07:57:42.531945	\N	\N	1	\N	1298	10000	\N	5	2	0
6702	2019-09-07	50200029853444-TPT-JP OD TO TTC OD	0000000238393361	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	140000	5	2	0
6699	2019-09-07	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019090794526004-RED BULL	HDFCR52019090794526004	2019-11-16 07:57:42.531945	\N	\N	1	\N	1251	\N	250000	5	2	0
6703	2019-09-08	UPI-RAVISH KUMAR SINGH-8586088603@YBL-HDFC0002845-925145969657-PAYMENT FROM PHONE	0000925115782607	2019-11-16 07:57:42.531945	\N	\N	1	\N	1291	13114	\N	5	2	0
6705	2019-09-09	NEFT CR-ORBC0101228-MBKCHNL-JBMENTERPRISES-JPENTERPRISES-SAA74435830	00000SAA74435830	2019-11-16 07:57:42.531945	\N	\N	1	\N	1112	9618	\N	5	2	0
6704	2019-09-09	CHQ PAID-MICR CTS-NO-MANOJ KUMAR	0000000000000169	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	10000	5	2	0
6707	2019-09-09	N3058220156601330-STP-DABUR HC	IB09162151352588	2019-11-16 07:57:42.531945	\N	\N	1	\N	1255	\N	170000	5	2	0
6706	2019-09-09	N3058220156601310-STP-DABUR HPC	IB09162110951121	2019-11-16 07:57:42.531945	\N	\N	1	\N	1255	\N	230000	5	2	0
6709	2019-09-11	UPI-AMIR-9716577977@PAYTM-PYTM0123456-925439880301-NA	0000925415882235	2019-11-16 07:57:42.531945	\N	\N	1	\N	1285	24242	\N	5	2	0
6708	2019-09-11	50200006539210-TPT-JP OD TO TTC CA	0000000274796633	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	100000	5	2	0
6711	2019-09-12	UPI-SACHIN SHESHRAO DAKH-9971979489@YBL-ORBC0100180-925534658911-PAYMENT FROM PHONE	0000925517150594	2019-11-16 07:57:42.531945	\N	\N	1	\N	1303	5000	\N	5	2	0
6712	2019-09-12	UPI-DHARAM KUMAR SHARMA-DHARM1246SHARMA@OKHDFCBANK-HDFC0000278-925519018649-DHARMKUMAR	0000925519649021	2019-11-16 07:57:42.531945	\N	\N	1	\N	1300	6313	\N	5	2	0
6710	2019-09-12	UPI-ARUN  GOYAL  SO  LAT-9599961300@PAYTM-UBIN0550507-925536297239-NA	0000925512574954	2019-11-16 07:57:42.531945	\N	\N	1	\N	1302	12749	\N	5	2	0
6715	2019-09-17	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-926039498777-NA	0000926015732429	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	18849	\N	5	2	0
6717	2019-09-18	IMPS-926122843086-DAKOTI EVER GREEN BA-HDFC-XXXXXXXXXXX0454-NA	0000926122843086	2019-11-16 07:57:42.531945	\N	\N	1	\N	1151	3764	\N	5	2	0
6716	2019-09-18	NEFT CR-ORBC0101228-MBKCHNL-JBMENTERPRISES-JPENTERPRISES-SAA74835706	00000SAA74835706	2019-11-16 07:57:42.531945	\N	\N	1	\N	1112	5848	\N	5	2	0
6718	2019-09-19	UPI-ARUN  GOYAL  SO  LAT-9599961300@PAYTM-UBIN0550507-926236527948-NA	0000926212178013	2019-11-16 07:57:42.531945	\N	\N	1	\N	1302	6058	\N	5	2	0
6720	2019-09-19	UPI-DHARAM KUMAR SHARMA-DHARM1246SHARMA@OKHDFCBANK-HDFC0000278-926216980241-BILLPAY	0000926216372569	2019-11-16 07:57:42.531945	\N	\N	1	\N	1300	6822	\N	5	2	0
6721	2019-09-19	IMPS-926220480744-GOURAV JAIN-HDFC-XXXXXX8749-COMMENTS	0000926220480744	2019-11-16 07:57:42.531945	\N	\N	1	\N	1298	10673	\N	5	2	0
6719	2019-09-19	NEFT CR-ICIC0003488-BAKERS ZONE-J P ENTERPRISES-000073723560	0000000073723560	2019-11-16 07:57:42.531945	\N	\N	1	\N	79	87621	\N	5	2	0
6723	2019-09-20	IMPS-926310115460-SPAY TECHNOLOGY PVT-HDFC-XXXXXX4120-IMPS TO ACCOUNT 50200029537650 FOR 1000011079	0000926310115460	2019-11-16 07:57:42.531945	\N	\N	1	\N	1304	2080	\N	5	2	0
6726	2019-09-20	UPI-ICIC0000548-9711228749@YBL-ICIC0000548-926319143106-PAYMENT FROM PHONE	0000926319570829	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	5630	\N	5	2	0
6725	2019-09-20	UPI-ISRAIL SAIFI-ISRAIL.NAWAB@HDFCBANK-HDFC0002359-926318570565-CASH	0000926318504743	2019-11-16 07:57:42.531945	\N	\N	1	\N	1305	8000	\N	5	2	0
6722	2019-09-20	NEFT CR-UTIB0000066-AIRPLAZA RETAIL HOLDINGS PVT LTD F-J P  ENTERPRISES-AXISP00072384523	AXISP00072384523	2019-11-16 07:57:42.531945	\N	\N	1	\N	1223	37076	\N	5	2	0
6724	2019-09-20	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019092096402780-RED BULL	HDFCR52019092096402780	2019-11-16 07:57:42.531945	\N	\N	1	\N	1251	\N	200000	5	2	0
6727	2019-09-21	IMPS-926411254370-HARENDRA KUMAR TEWAT-HDFC-XXXXXXXX8761-	0000926411254370	2019-11-16 07:57:42.531945	\N	\N	1	\N	1283	5648	\N	5	2	0
6728	2019-09-22	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-926541286666-NA	0000926517151227	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	4014	\N	5	2	0
6729	2019-09-24	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-926739921251-NA	0000926715177347	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	5000	\N	5	2	0
6730	2019-09-24	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-926739316487-NA	0000926715347927	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	10000	\N	5	2	0
6731	2019-09-25	UPI-RAJEEV KUMAR CHAURAS-RAJEEVCHAURASIYA1@OKICICI-PUNB0160300-926810471283-UPI	0000926810223782	2019-11-16 07:57:42.531945	\N	\N	1	\N	1288	5000	\N	5	2	0
6732	2019-09-25	UPI-PRAVEEN KUMAR-PRAVEENKUMARBHRUV1234@OKAXIS-UTIB0000624-926822843287-BANK	0000926822939871	2019-11-16 07:57:42.531945	\N	\N	1	\N	1286	6107	\N	5	2	0
6733	2019-09-26	UPI-ARUN  GOYAL  SO  LAT-9599961300@PAYTM-UBIN0550507-926937288864-NA	0000926913804585	2019-11-16 07:57:42.531945	\N	\N	1	\N	1302	5601	\N	5	2	0
6734	2019-09-26	ADDISTRO TECHN-J P ENTERPRIS COL09	0000180668200008	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	52242	\N	5	2	0
6736	2019-09-27	IMPS-927017644319-GOYAL TRADERS-HDFC-XXXXXX4136-MB: PAYMENT	0000927017644319	2019-11-16 07:57:42.531945	\N	\N	1	\N	920	6471	\N	5	2	0
6735	2019-09-27	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N270190937679753-COLGATE	N270190937679753	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	100000	5	2	0
6737	2019-09-30	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	350000	\N	5	2	0
6738	2019-09-30	PTW8808979896/HDFCERGOGENERALINSUR	0000192738111878	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	\N	1456	5	2	0
6742	2019-10-01	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-927438591710-NA	0000927414674052	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	9000	\N	5	2	0
6741	2019-10-01	UPI-PRAVEEN KUMAR-PRAVEENKUMARBHRUV1234@OKAXIS-UTIB0000624-927414372847-BANK	0000927414525531	2019-11-16 07:57:42.531945	\N	\N	1	\N	1286	9610	\N	5	2	0
6740	2019-10-01	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	170000	\N	5	2	0
6739	2019-10-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1279	\N	39307	5	2	0
6744	2019-10-02	UPI-RAJEEV KUMAR CHAURAS-RAJEEVCHAURASIYA1@OKAXIS-UTIB0000884-927509849356-UPI	0000092759281372	2019-11-16 07:57:42.531945	\N	\N	1	\N	1288	5000	\N	5	2	0
6745	2019-10-02	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-927540720657-NA	0000927516593803	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	5900	\N	5	2	0
6746	2019-10-02	UPI-AMIR-9716577977@PAYTM-PYTM0123456-927540776702-NA	0000927516631924	2019-11-16 07:57:42.531945	\N	\N	1	\N	1285	26926	\N	5	2	0
6747	2019-10-03	UPI-ARUN  GOYAL  SO  LAT-9599961300@PAYTM-UBIN0550507-927636456255-NA	0000927612277615	2019-11-16 07:57:42.531945	\N	\N	1	\N	1302	6361	\N	5	2	0
6748	2019-10-04	IMPS-927718008964-RESILIENT INNOVATION-HDFC-XXXXXXXXXXX0061-VERIFY	0000927718008964	2019-11-16 07:57:42.531945	\N	\N	1	\N	1306	1	\N	5	2	0
6750	2019-10-05	UPI-RAJEEV KUMAR CHAURAS-RAJEEVCHAURASIYA1@OKAXIS-UTIB0000884-927814144075-UPI	0000927814912997	2019-11-16 07:57:42.531945	\N	\N	1	\N	1288	2400	\N	5	2	0
6749	2019-10-05	IMPS-927812861525-HARENDRA KUMAR TEWAT-HDFC-XXXXXXXX8761-	0000927812861525	2019-11-16 07:57:42.531945	\N	\N	1	\N	1283	5000	\N	5	2	0
6751	2019-10-05	NEFT CR-IOBA0001556-M/S KUMAR ENTERPRISES-J P ENTERPRISES-IOBAN19278530538	IOBAN19278530538	2019-11-16 07:57:42.531945	\N	\N	1	\N	1066	15631	\N	5	2	0
6752	2019-10-06	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-927903523696-BHARATPE9020004894	0000092793319005	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	1721	\N	5	2	0
6754	2019-10-06	UPI-RAVISH KUMAR SINGH-8586088603@YBL-HDFC0002845-927936653320-PAYMENT FROM PHONE	0000927918284287	2019-11-16 07:57:42.531945	\N	\N	1	\N	1291	10000	\N	5	2	0
6753	2019-10-06	IMPS-927911982693-JBM ENTERPRISES-HDFC-XXXXXXXXXX0593-TRFJPENTERPRISES	0000927911982693	2019-11-16 07:57:42.531945	\N	\N	1	\N	1112	29219	\N	5	2	0
6755	2019-10-07	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-928003082362-BHARATPE9020004894	0000092803142745	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	3500	\N	5	2	0
6757	2019-10-08	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-928138768967-NA	0000928114316634	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	3000	\N	5	2	0
6756	2019-10-08	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-928137285849-NA	0000928113024509	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	11000	\N	5	2	0
6759	2019-10-09	UPI-AMIR-9716577977@PAYTM-PYTM0123456-928239418434-NA	0000928215330137	2019-11-16 07:57:42.531945	\N	\N	1	\N	1285	7593	\N	5	2	0
6758	2019-10-09	CASH DEP DADRI	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1244	600000	\N	5	2	0
6760	2019-10-09	HB3142NR1000009999-STP-GODREJ	IB09193651101831	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	400000	5	2	0
6761	2019-10-10	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-928311692135-BHARATPE9020004894	0000928311376394	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	5353	\N	5	2	0
6762	2019-10-10	IMPS-928312754160-LIFE CARE PHARMACY-HDFC-XXXXXXXXXXXX0593-	0000928312754160	2019-11-16 07:57:42.531945	\N	\N	1	\N	1125	9806	\N	5	2	0
6763	2019-10-10	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N283190950448326-COLGATE	N283190950448326	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	40000	5	2	0
6765	2019-10-11	MARICO4254-STP-MARICO	IB11073741661059	2019-11-16 07:57:42.531945	\N	\N	1	\N	1252	\N	360000	5	2	0
6766	2019-10-12	IMPS-928512104839-HARENDRA KUMAR TEWAT-HDFC-XXXXXXXX8761-	0000928512104839	2019-11-16 07:57:42.531945	\N	\N	1	\N	1283	8000	\N	5	2	0
6769	2019-10-15	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-928842517253-NA	0000928818717205	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	4790	\N	5	2	0
6767	2019-10-15	UPI-PRAVEEN KUMAR-PRAVEENKUMARBHRUV1234@OKAXIS-UTIB0000624-928812840723-BANK	0000928812758766	2019-11-16 07:57:42.531945	\N	\N	1	\N	1286	6119	\N	5	2	0
6768	2019-10-15	NEFT CR-UTIB0000624-MAHAVEERA GENERAL STORE-JP ENTERPRISES-AXMB192889721815	AXMB192889721815	2019-11-16 07:57:42.531945	\N	\N	1	\N	54	13518	\N	5	2	0
6770	2019-10-16	UPI-BHARATPE MERCHANT-BHARATPE.PAYOUT@YESBANK-YESB0000480-928909436904-CASHBACK	0000092899101556	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	11	\N	5	2	0
6771	2019-10-16	UPI-AMIR-9716577977@PAYTM-PYTM0123456-928940382609-NA	0000928916382067	2019-11-16 07:57:42.531945	\N	\N	1	\N	1285	12880	\N	5	2	0
6773	2019-10-17	UPI-BHARATPE MERCHANT-BHARATPE.PAYOUT@YESBANK-YESB0000480-929012069436-CASHBACK	0000929012320474	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	11	\N	5	2	0
6772	2019-10-17	IMPS-929004360601-RESILIENT INNOVATION-HDFC-XXXXXXXXXXX0061-BHARATPE9020004894520191016	0000929004360601	2019-11-16 07:57:42.531945	\N	\N	1	\N	1306	4368	\N	5	2	0
6775	2019-10-17	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-929036134534-NA	0000929012474057	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	8361	\N	5	2	0
6774	2019-10-17	UPI-ARUN  GOYAL  SO  LAT-9599961300@PAYTM-UBIN0550507-929036110085-NA	0000929012458272	2019-11-16 07:57:42.531945	\N	\N	1	\N	1302	14221	\N	5	2	0
6778	2019-10-18	IMPS-929115417282-T N ENTERPRISES-HDFC-XXXXXXXX4853-J P ENTERPRISES	0000929115417282	2019-11-16 07:57:42.531945	\N	\N	1	\N	1081	15000	\N	5	2	0
6776	2019-10-18	IMPS-929109493271-RESILIENT INNOVATION-HDFC-XXXXXXXXXXX0061-BHARATPE9020004894520191017	0000929109493271	2019-11-16 07:57:42.531945	\N	\N	1	\N	1306	28250	\N	5	2	0
6777	2019-10-18	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N291190957448326-REDBULL	N291190957448326	2019-11-16 07:57:42.531945	\N	\N	1	\N	1251	\N	100000	5	2	0
6780	2019-10-19	IMPS-929210769650-HARENDRA KUMAR TEWAT-HDFC-XXXXXXXX8761-	0000929210769650	2019-11-16 07:57:42.531945	\N	\N	1	\N	1283	1183	\N	5	2	0
6781	2019-10-19	IMPS-929211467508-T N ENTERPRISES-HDFC-XXXXXXXX4853-J P ENTERPRISES	0000929211467508	2019-11-16 07:57:42.531945	\N	\N	1	\N	1081	1455	\N	5	2	0
6779	2019-10-19	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-929203941485-BHARATPE9020004894	0000092923245696	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	2159	\N	5	2	0
6782	2019-10-21	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-929403879525-BHARATPE9020004894	0000092943950403	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	3635	\N	5	2	0
6783	2019-10-22	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-929503346328-BHARATPE9020004894	0000092953515019	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	506	\N	5	2	0
6785	2019-10-22	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-929545759718-NA	0000929521443996	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	2432	\N	5	2	0
6784	2019-10-22	NEFT CR-UTIB0000624-MAHAVEERA GENERAL STORE-JP ENTERPRISES-AXMB192951996699	AXMB192951996699	2019-11-16 07:57:42.531945	\N	\N	1	\N	54	5120	\N	5	2	0
6786	2019-10-23	UPI-AMIR-9716577977@PAYTM-PYTM0123456-929639716443-NA	0000929615502984	2019-11-16 07:57:42.531945	\N	\N	1	\N	1285	9938	\N	5	2	0
6787	2019-10-24	UPI-BHARATPE MERCHANT-BHARATPE.PAYOUT@YESBANK-YESB0000480-929716666858-CASHBACK	0000929716038757	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	11	\N	5	2	0
6788	2019-10-25	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-929802950325-BHARATPE9020004894	0000092982833098	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	6247	\N	5	2	0
6789	2019-10-26	IMPS-929911853485-HARENDRA KUMAR TEWAT-HDFC-XXXXXXXX8761-	0000929911853485	2019-11-16 07:57:42.531945	\N	\N	1	\N	1283	500	\N	5	2	0
6790	2019-10-27	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-930003176027-BHARATPE9020004894	0000093003376523	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	1800	\N	5	2	0
6793	2019-10-29	NEFT CR-UTIB0000624-MAHAVEERA GENERAL STORE-JP ENTERPRISES-AXMB193024170173	AXMB193024170173	2019-11-16 07:57:42.531945	\N	\N	1	\N	54	736	\N	5	2	0
6791	2019-10-29	NEFT CR-UTIB0000066-AIRPLAZA RETAIL HOLDINGS PVT LTD F-J P  ENTERPRISES-AXISP00079244955	AXISP00079244955	2019-11-16 07:57:42.531945	\N	\N	1	\N	1223	7118	\N	5	2	0
6792	2019-10-29	NEFT CR-UTIB0000066-AIRPLAZA RETAIL HOLDINGS PVT LTD F-J P  ENTERPRISES-AXISP00079244956	AXISP00079244956	2019-11-16 07:57:42.531945	\N	\N	1	\N	1223	34641	\N	5	2	0
6794	2019-10-30	UPI-AMIR-9716577977@PAYTM-PYTM0123456-930339991487-NA	0000930315120989	2019-11-16 07:57:42.531945	\N	\N	1	\N	1285	17926	\N	5	2	0
6795	2019-10-30	NEFT CR-SBIN0050830-KALIKA PROVISION STORE-J P ENTERPRISES-SBIN319303237916	SBIN319303237916	2019-11-16 07:57:42.531945	\N	\N	1	\N	40	38000	\N	5	2	0
6798	2019-10-31	UPI-GOURAV JAIN-9711228749@YBL-ICIC0000548-930488314585-PAYMENT FROM PHONE	0000930422294584	2019-11-16 07:57:42.531945	\N	\N	1	\N	1298	2400	\N	5	2	0
6797	2019-10-31	IMPS-930413049664-T N ENTERPRISES-HDFC-XXXXXX3925-MB SENT TO J 50200029537650 IMPS	0000930413049664	2019-11-16 07:57:42.531945	\N	\N	1	\N	1081	13404	\N	5	2	0
6810	2019-11-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001388	2019-11-16 07:57:42.531945	\N	\N	1	\N	1240	3900	\N	5	2	0
6809	2019-11-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001012	2019-11-16 07:57:42.531945	\N	\N	1	\N	73	5080	\N	5	2	0
6808	2019-11-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000162011	2019-11-16 07:57:42.531945	\N	\N	1	\N	1065	8329	\N	5	2	0
6807	2019-11-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000488	2019-11-16 07:57:42.531945	\N	\N	1	\N	9	10694	\N	5	2	0
6801	2019-11-01	IMPS-930515705109-DAKOTI EVER GREEN BA-HDFC-XXXXXXXXXXX0454-NA	0000930515705109	2019-11-16 07:57:42.531945	\N	\N	1	\N	1151	11520	\N	5	2	0
6800	2019-11-01	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-930503778037-BHARATPE9020004894	0000093053204220	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	27083	\N	5	2	0
6806	2019-11-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785695	2019-11-16 07:57:42.531945	\N	\N	1	\N	910	45783	\N	5	2	0
6802	2019-11-01	ADDISTRO TECHN-J P ENTERPRIS COL09	0000207043300008	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	59082	\N	5	2	0
6805	2019-11-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001476	2019-11-16 07:57:42.531945	\N	\N	1	\N	60	67672	\N	5	2	0
6803	2019-11-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000211444	2019-11-16 07:57:42.531945	\N	\N	1	\N	91	160800	\N	5	2	0
6804	2019-11-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000545	2019-11-16 07:57:42.531945	\N	\N	1	\N	126	207735	\N	5	2	0
6799	2019-11-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-11-16 07:57:42.531945	\N	\N	1	\N	1279	\N	41321	5	2	0
6811	2019-11-03	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-930703813137-BHARATPE9020004894	0000093073155253	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	10165	\N	5	2	0
6812	2019-11-05	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-930938146859-NA	0000930914072363	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	2861	\N	5	2	0
6813	2019-11-05	UPI-PRAVEEN KUMAR-PRAVEENKUMARBHRUV1234@OKAXIS-UTIB0000624-930918646214-BANK	0000930918725486	2019-11-16 07:57:42.531945	\N	\N	1	\N	1286	9316	\N	5	2	0
6816	2019-11-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000065	2019-11-16 07:57:42.531945	\N	\N	1	\N	313	23823	\N	5	2	0
6815	2019-11-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001522	2019-11-16 07:57:42.531945	\N	\N	1	\N	1063	27720	\N	5	2	0
6814	2019-11-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001948	2019-11-16 07:57:42.531945	\N	\N	1	\N	81	48363	\N	5	2	0
6818	2019-11-06	IMPS-931008055580-MANOJ -HDFC-XXXXXXXX8697-	0000931008055580	2019-11-16 07:57:42.531945	\N	\N	1	\N	1276	2407	\N	5	2	0
6821	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826772	2019-11-16 07:57:42.531945	\N	\N	1	\N	858	4440	\N	5	2	0
6822	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000469	2019-11-16 07:57:42.531945	\N	\N	1	\N	88	4994	\N	5	2	0
6823	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000471	2019-11-16 07:57:42.531945	\N	\N	1	\N	88	5339	\N	5	2	0
6824	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000294885	2019-11-16 07:57:42.531945	\N	\N	1	\N	616	8102	\N	5	2	0
6825	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000538	2019-11-16 07:57:42.531945	\N	\N	1	\N	1087	12559	\N	5	2	0
6820	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132334	2019-11-16 07:57:42.531945	\N	\N	1	\N	64	18176	\N	5	2	0
6826	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000369443	2019-11-16 07:57:42.531945	\N	\N	1	\N	57	20152	\N	5	2	0
6827	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000006851	2019-11-16 07:57:42.531945	\N	\N	1	\N	31	20661	\N	5	2	0
6828	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000410767	2019-11-16 07:57:42.531945	\N	\N	1	\N	1094	22642	\N	5	2	0
6829	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000422200	2019-11-16 07:57:42.531945	\N	\N	1	\N	114	31586	\N	5	2	0
6830	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133282	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	43940	\N	5	2	0
6831	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137210	2019-11-16 07:57:42.531945	\N	\N	1	\N	56	58419	\N	5	2	0
6832	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019432	2019-11-16 07:57:42.531945	\N	\N	1	\N	102	70380	\N	5	2	0
6835	2019-11-07	UPI-PRAVIN KUMAR-8447997290@PAYTM-PYTM0123456-931138454580-NA	0000931114395365	2019-11-16 07:57:42.531945	\N	\N	1	\N	1286	1500	\N	5	2	0
6833	2019-11-07	IMPS-931106083866-RESILIENT INNOVATION-HDFC-XXXXXXXXXXX0061-BHARATPE9020004894520191106YES	0000931106083866	2019-11-16 07:57:42.531945	\N	\N	1	\N	1306	1800	\N	5	2	0
6837	2019-11-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000690470	2019-11-16 07:57:42.531945	\N	\N	1	\N	1201	2376	\N	5	2	0
6838	2019-11-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024640	2019-11-16 07:57:42.531945	\N	\N	1	\N	831	3538	\N	5	2	0
6839	2019-11-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000013	2019-11-16 07:57:42.531945	\N	\N	1	\N	1090	5000	\N	5	2	0
6840	2019-11-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101589	2019-11-16 07:57:42.531945	\N	\N	1	\N	434	17625	\N	5	2	0
6836	2019-11-07	UPI-DHARAM KUMAR SHARMA-DHARM1246SHARMA@OKHDFCBANK-HDFC0000278-931116475518-UPI	0000931116051324	2019-11-16 07:57:42.531945	\N	\N	1	\N	1300	24477	\N	5	2	0
6841	2019-11-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785700	2019-11-16 07:57:42.531945	\N	\N	1	\N	910	26761	\N	5	2	0
6834	2019-11-07	HB3142NR1000009999-STP-GODREJ	IB07123619679021	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	202616.420000000013	5	2	0
6842	2019-11-08	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-931218809081-BHARATPE9020004894	0000931218972114	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	3000	\N	5	2	0
6843	2019-11-09	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-931303009185-BHARATPE9020004894	0000093133101302	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	2776	\N	5	2	0
6844	2019-11-09	IMPS-931309168542-HARENDRA KUMAR TEWAT-HDFC-XXXXXXXX8761-	0000931309168542	2019-11-16 07:57:42.531945	\N	\N	1	\N	1283	4000	\N	5	2	0
6847	2019-11-11	NEFT CR-ORBC0105014-IBUSER-LIFE LINE INDIA-JP ENTERPRISES-SAA76976700	00000SAA76976700	2019-11-16 07:57:42.531945	\N	\N	1	\N	1308	2691	\N	5	2	0
6845	2019-11-11	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-931504860681-BHARATPE9020004894	0000093154239004	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	5835	\N	5	2	0
6846	2019-11-11	HB3142NR1000009999-STP-GODREJ	IB11114907303836	2019-11-16 07:57:42.531945	\N	\N	1	\N	1249	\N	521000	5	2	0
6851	2019-11-12	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-931641198876-NA	0000931617217809	2019-11-16 07:57:42.531945	\N	\N	1	\N	1295	6134	\N	5	2	0
6848	2019-11-12	IMPS-931611678820-JBM ENTERPRISES-HDFC-XXXXXXXXXX0593-OBC	0000931611678820	2019-11-16 07:57:42.531945	\N	\N	1	\N	1112	11605	\N	5	2	0
6849	2019-11-12	NEFT CR-UTIB0000624-MAHAVEERA GENERAL STORE-JP ENTERPRISES-AXMB193169441146	AXMB193169441146	2019-11-16 07:57:42.531945	\N	\N	1	\N	54	16888	\N	5	2	0
6850	2019-11-12	ADDISTRO TECHN-J P ENTERPRIS COL09	0000214749100003	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	73482	\N	5	2	0
6854	2019-11-13	UPI-GOURAV JAIN-9711228749@YBL-ICIC0000548-931734710357-PAYMENT FROM PHONE	0000931717782233	2019-11-16 07:57:42.531945	\N	\N	1	\N	1298	2000	\N	5	2	0
6855	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000477	2019-11-16 07:57:42.531945	\N	\N	1	\N	88	3740	\N	5	2	0
6856	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136177	2019-11-16 07:57:42.531945	\N	\N	1	\N	55	6189	\N	5	2	0
6857	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000135823	2019-11-16 07:57:42.531945	\N	\N	1	\N	89	8252	\N	5	2	0
6858	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000012	2019-11-16 07:57:42.531945	\N	\N	1	\N	1090	15000	\N	5	2	0
6859	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000067	2019-11-16 07:57:42.531945	\N	\N	1	\N	313	16939	\N	5	2	0
6860	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000590700	2019-11-16 07:57:42.531945	\N	\N	1	\N	1175	18353	\N	5	2	0
6861	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132336	2019-11-16 07:57:42.531945	\N	\N	1	\N	64	25530	\N	5	2	0
6862	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000185441	2019-11-16 07:57:42.531945	\N	\N	1	\N	46	30152	\N	5	2	0
6863	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000028750	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	71036	\N	5	2	0
6864	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136738	2019-11-16 07:57:42.531945	\N	\N	1	\N	656	295187	\N	5	2	0
6853	2019-11-13	N3058220156601310-STP-DABUR HPC	IB13131927247575	2019-11-16 07:57:42.531945	\N	\N	1	\N	1255	\N	150000	5	2	0
6866	2019-11-14	UPI-RAJEEV KUMAR CHAURAS-RAJEEVCHAURASIYA1@OKAXIS-UTIB0000884-931811928669-UPI	0000931811450751	2019-11-16 07:57:42.531945	\N	\N	1	\N	1288	3030	\N	5	2	0
6865	2019-11-14	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-931803585800-BHARATPE9020004894	0000093183133535	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	7427	\N	5	2	0
6887	2019-10-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000451714	2019-11-16 08:03:34.463397	\N	\N	1	\N	306	5569	\N	4	2	0
6888	2019-10-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315673	2019-11-16 08:03:34.463397	\N	\N	1	\N	35	6044	\N	4	2	0
6882	2019-10-01	IMPS-927409165275-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000927409165275	2019-11-16 08:03:34.463397	\N	\N	1	\N	633	6519	\N	4	2	0
6889	2019-10-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155081	2019-11-16 08:03:34.463397	\N	\N	1	\N	620	11323	\N	4	2	0
6890	2019-10-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000203	2019-11-16 08:03:34.463397	\N	\N	1	\N	1144	13000	\N	4	2	0
6884	2019-10-01	CASH DEP DADRI	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1244	27000	\N	4	2	0
6885	2019-10-01	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000510421	2019-11-16 08:03:34.463397	\N	\N	1	\N	705	\N	8320	4	2	0
6886	2019-10-01	CHQ DEP RET- CONNECTIVITY NOT ESTABLISHE	0000000000000063	2019-11-16 08:03:34.463397	\N	\N	1	\N	1064	\N	22811	4	2	0
6891	2019-10-02	IMPS-927510145351-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000927510145351	2019-11-16 08:03:34.463397	\N	\N	1	\N	586	3002	\N	4	2	0
6892	2019-10-02	UPI-LAXMI KUMARI-9650834417@YBL-PUNB0447600-927513939936-PAYMENT FROM PHONE	0000927513551313	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	4000	\N	4	2	0
6897	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000753	2019-11-16 08:03:34.463397	\N	\N	1	\N	890	2750	\N	4	2	0
6898	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000631668	2019-11-16 08:03:34.463397	\N	\N	1	\N	1215	5105	\N	4	2	0
6899	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000052951	2019-11-16 08:03:34.463397	\N	\N	1	\N	310	5667	\N	4	2	0
6900	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000450	2019-11-16 08:03:34.463397	\N	\N	1	\N	88	7114	\N	4	2	0
6894	2019-10-03	FT - CR - 50100256958061 - MANVENDRA SINGH	0000000000000022	2019-11-16 08:03:34.463397	\N	\N	1	\N	1272	5953	\N	4	2	0
6901	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000810444	2019-11-16 08:03:34.463397	\N	\N	1	\N	83	7851	\N	4	2	0
6911	2019-10-03	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19276574655	IOBAN19276574655	2019-11-16 08:03:34.463397	\N	\N	1	\N	30	8298	\N	4	2	0
6902	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000156081	2019-11-16 08:03:34.463397	\N	\N	1	\N	13	9000	\N	4	2	0
6903	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155895	2019-11-16 08:03:34.463397	\N	\N	1	\N	3	10573	\N	4	2	0
6904	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000471	2019-11-16 08:03:34.463397	\N	\N	1	\N	616	13156	\N	4	2	0
6905	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000885953	2019-11-16 08:03:34.463397	\N	\N	1	\N	513	15000	\N	4	2	0
6906	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000617	2019-11-16 08:03:34.463397	\N	\N	1	\N	661	17091	\N	4	2	0
6907	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132314	2019-11-16 08:03:34.463397	\N	\N	1	\N	64	17107	\N	4	2	0
6895	2019-10-03	CHQ DEP - MICR - MICR CLG - NOIDA WBO	0000000000000063	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	22811	\N	4	2	0
6908	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000416324	2019-11-16 08:03:34.463397	\N	\N	1	\N	78	23113	\N	4	2	0
6909	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000266	2019-11-16 08:03:34.463397	\N	\N	1	\N	1094	54808	\N	4	2	0
6896	2019-10-03	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000766833	2019-11-16 08:03:34.463397	\N	\N	1	\N	1065	\N	4934	4	2	0
6910	2019-10-03	CHQ PAID-INWARD TRAN-GODREJ CONSUMER PRO	0000000000000398	2019-11-16 08:03:34.463397	\N	\N	1	\N	1249	\N	635000	4	2	0
6920	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134277	2019-11-16 08:03:34.463397	\N	\N	1	\N	75	2883	\N	4	2	0
6919	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000882470	2019-11-16 08:03:34.463397	\N	\N	1	\N	1051	3757	\N	4	2	0
6918	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826760	2019-11-16 08:03:34.463397	\N	\N	1	\N	858	3817	\N	4	2	0
6913	2019-10-04	50200004799122-TPT-J P ENT 22SEP BILL	0000000238303939	2019-11-16 08:03:34.463397	\N	\N	1	\N	94	23514	\N	4	2	0
6917	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000319	2019-11-16 08:03:34.463397	\N	\N	1	\N	1066	15631	\N	4	2	0
6921	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000745617	2019-11-16 08:03:34.463397	\N	\N	1	\N	40	29000	\N	4	2	0
6916	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000506	2019-11-16 08:03:34.463397	\N	\N	1	\N	126	119938	\N	4	2	0
6914	2019-10-04	EMI 45070519 CHQ S45070519132 101945070519	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1256	\N	69821	4	2	0
6915	2019-10-04	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019100498420177-RED BULL	HDFCR52019100498420177	2019-11-16 08:03:34.463397	\N	\N	1	\N	1251	\N	225000	4	2	0
6893	2019-10-03	50200006539210-TPT-TTC CA TO JP CA	0000000522266018	2019-11-16 08:03:34.463397	\N	\N	1	\N	422	100000	\N	4	2	0
6867	2019-11-14	UPI-SANJAY CHAURASIYA-7557532561@PAYTM-PYTM0123456-931836008131-NA	0000931812537207	2019-11-16 07:57:42.531945	\N	\N	1	\N	1299	2400	\N	5	2	0
6869	2019-11-15	UPI-AJAB SINGH-9891913099@PAYTM-PYTM0123456-931941683839-NA	0000931917774447	2019-11-16 07:57:42.531945	\N	\N	1	\N	1296	2500	\N	5	2	0
6881	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000786	2019-11-16 07:57:42.531945	\N	\N	1	\N	890	2589	\N	5	2	0
6880	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000310108	2019-11-16 07:57:42.531945	\N	\N	1	\N	87	2615	\N	5	2	0
6879	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137030	2019-11-16 07:57:42.531945	\N	\N	1	\N	663	3308	\N	5	2	0
6878	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000127	2019-11-16 07:57:42.531945	\N	\N	1	\N	1196	6107	\N	5	2	0
6877	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000016	2019-11-16 07:57:42.531945	\N	\N	1	\N	1309	7144	\N	5	2	0
6876	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001505	2019-11-16 07:57:42.531945	\N	\N	1	\N	140	9133	\N	5	2	0
6875	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000881076	2019-11-16 07:57:42.531945	\N	\N	1	\N	83	19946	\N	5	2	0
6874	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785707	2019-11-16 07:57:42.531945	\N	\N	1	\N	910	20492	\N	5	2	0
6873	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992863	2019-11-16 07:57:42.531945	\N	\N	1	\N	23	37754	\N	5	2	0
6872	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397706	2019-11-16 07:57:42.531945	\N	\N	1	\N	6	48106	\N	5	2	0
6871	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000010123	2019-11-16 07:57:42.531945	\N	\N	1	\N	105	49598	\N	5	2	0
6870	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000260190	2019-11-16 07:57:42.531945	\N	\N	1	\N	1131	107922	\N	5	2	0
6868	2019-11-15	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000011071	2019-11-16 07:57:42.531945	\N	\N	1	\N	97	279056	\N	5	2	0
6127	2019-04-02	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019040272001857-RED BULL	HDFCR52019040272001857	2019-11-16 07:57:42.531945	\N	\N	1	\N	94	\N	250000	5	2	0
6923	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992821	2019-11-16 08:03:34.463397	\N	\N	1	\N	23	33410	\N	4	2	0
6922	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000155	2019-11-16 08:03:34.463397	\N	\N	1	\N	313	69772	\N	4	2	0
6926	2019-10-04	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000052951	2019-11-16 08:03:34.463397	\N	\N	1	\N	310	\N	5667	4	2	0
6927	2019-10-04	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000156081	2019-11-16 08:03:34.463397	\N	\N	1	\N	13	\N	9000	4	2	0
6928	2019-10-04	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000885953	2019-11-16 08:03:34.463397	\N	\N	1	\N	513	\N	15000	4	2	0
6934	2019-10-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000533412	2019-11-16 08:03:34.463397	\N	\N	1	\N	747	4297	\N	4	2	0
6929	2019-10-05	NEFT CR-INDB0000006-RAVINDRA NATH-JPENTERPRISES-000217428504	0000000217428504	2019-11-16 08:03:34.463397	\N	\N	1	\N	340	6000	\N	4	2	0
6935	2019-10-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000357248	2019-11-16 08:03:34.463397	\N	\N	1	\N	1090	9999	\N	4	2	0
6936	2019-10-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000510	2019-11-16 08:03:34.463397	\N	\N	1	\N	1083	14182	\N	4	2	0
6937	2019-10-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000127047	2019-11-16 08:03:34.463397	\N	\N	1	\N	89	14262	\N	4	2	0
6938	2019-10-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009816	2019-11-16 08:03:34.463397	\N	\N	1	\N	105	32981	\N	4	2	0
6939	2019-10-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000998	2019-11-16 08:03:34.463397	\N	\N	1	\N	98	53099	\N	4	2	0
6940	2019-10-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000211403	2019-11-16 08:03:34.463397	\N	\N	1	\N	91	91134	\N	4	2	0
6931	2019-10-05	CASH DEP DADRI	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1244	300000	\N	4	2	0
6941	2019-10-05	NEFT CR-SYNB0008689-SHRI SHYAM TRADING-J P ENTERPRISES-P19100520616506	0P19100520616506	2019-11-16 08:03:34.463397	\N	\N	1	\N	62	107598	\N	4	2	0
6933	2019-10-05	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000319	2019-11-16 08:03:34.463397	\N	\N	1	\N	1066	\N	15631	4	2	0
6932	2019-10-05	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000790	2019-11-16 08:03:34.463397	\N	\N	1	\N	1081	\N	16455	4	2	0
6930	2019-10-05	EMI 52012431 CHQ S52012431123 101952012431	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1257	\N	16495	4	2	0
6943	2019-10-06	POS 436303XXXXXX9204 AGGARWALSAREEPAL POS DEBIT	0000927916654161	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	\N	19405	4	2	0
6942	2019-10-06	UPI-ASHWANI KUMAR VERMA-9971344900@YBL-YESB0000085-927927911961-PAYMENT FROM PHONE	0000092799809408	2019-11-16 08:03:34.463397	\N	\N	1	\N	4	5172	\N	4	2	0
6947	2019-10-07	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19280006545	VIJBH19280006545	2019-11-16 08:03:34.463397	\N	\N	1	\N	471	50000	\N	4	2	0
6945	2019-10-07	BULK TXN CHGS INCL GST 300919-MIR1927702944352	MIR1927702944352	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	11.8000000000000007	4	2	0
6948	2019-10-07	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000127047	2019-11-16 08:03:34.463397	\N	\N	1	\N	89	\N	14262	4	2	0
6946	2019-10-07	ACH D- MONDELEZ INDIA FOODS-DB37430294	0000002525477173	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	1245923.02000000002	4	2	0
6973	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000551076	2019-11-16 08:03:34.463397	\N	\N	1	\N	1270	917	\N	4	2	0
6949	2019-10-09	IMPS-928210574537-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-COLGATE	0000928210574537	2019-11-16 08:03:34.463397	\N	\N	1	\N	128	2196	\N	4	2	0
6974	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000451728	2019-11-16 08:03:34.463397	\N	\N	1	\N	306	3553	\N	4	2	0
6975	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000118811	2019-11-16 08:03:34.463397	\N	\N	1	\N	1096	3700	\N	4	2	0
6976	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000510431	2019-11-16 08:03:34.463397	\N	\N	1	\N	705	4435	\N	4	2	0
6977	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000754329	2019-11-16 08:03:34.463397	\N	\N	1	\N	1063	8724	\N	4	2	0
6978	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000455	2019-11-16 08:03:34.463397	\N	\N	1	\N	88	11244	\N	4	2	0
6972	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000472	2019-11-16 08:03:34.463397	\N	\N	1	\N	616	12000	\N	4	2	0
6971	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029072	2019-11-16 08:03:34.463397	\N	\N	1	\N	24	13034	\N	4	2	0
6955	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000754327	2019-11-16 08:03:34.463397	\N	\N	1	\N	1063	15000	\N	4	2	0
6956	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000754328	2019-11-16 08:03:34.463397	\N	\N	1	\N	1063	15000	\N	4	2	0
6954	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000754326	2019-11-16 08:03:34.463397	\N	\N	1	\N	1063	15000	\N	4	2	0
6951	2019-10-09	NEFT CR-UTBI0GND561-ANTARIKSH ENTERPRISES-J P ENTERPRISES-UTBIN19282140715	UTBIN19282140715	2019-11-16 08:03:34.463397	\N	\N	1	\N	513	15000	\N	4	2	0
6957	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000046881	2019-11-16 08:03:34.463397	\N	\N	1	\N	5	16441	\N	4	2	0
6958	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000791	2019-11-16 08:03:34.463397	\N	\N	1	\N	1081	16455	\N	4	2	0
6959	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000135135	2019-11-16 08:03:34.463397	\N	\N	1	\N	390	16912	\N	4	2	0
6960	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000406515	2019-11-16 08:03:34.463397	\N	\N	1	\N	264	19170	\N	4	2	0
6961	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001098	2019-11-16 08:03:34.463397	\N	\N	1	\N	95	19310	\N	4	2	0
6953	2019-10-09	CHQ DEP - MICR CLG - NOIDA WBO	0000000000043260	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	20395	\N	4	2	0
6962	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134584	2019-11-16 08:03:34.463397	\N	\N	1	\N	31	20543	\N	4	2	0
6963	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000141	2019-11-16 08:03:34.463397	\N	\N	1	\N	72	21957	\N	4	2	0
6964	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001795	2019-11-16 08:03:34.463397	\N	\N	1	\N	81	23287	\N	4	2	0
6965	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000113	2019-11-16 08:03:34.463397	\N	\N	1	\N	1262	23387	\N	4	2	0
6966	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000135627	2019-11-16 08:03:34.463397	\N	\N	1	\N	56	23614	\N	4	2	0
6967	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019405	2019-11-16 08:03:34.463397	\N	\N	1	\N	102	25561	\N	4	2	0
6968	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132320	2019-11-16 08:03:34.463397	\N	\N	1	\N	64	26774	\N	4	2	0
6969	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007494	2019-11-16 08:03:34.463397	\N	\N	1	\N	514	38913	\N	4	2	0
6970	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000023	2019-11-16 08:03:34.463397	\N	\N	1	\N	359	69639	\N	4	2	0
6952	2019-10-09	CHQ DEP - MICR CLG - NOIDA WBO	0000000000259723	2019-11-16 08:03:34.463397	\N	\N	1	\N	1131	75280	\N	4	2	0
7150	2019-10-24	50200006539210-TPT-TTC CA JP CA	0000000264575212	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	100000	\N	4	2	0
6944	2019-10-07	CHQ PAID-MICR CTS-NO-MANOJ KUMAR	0000000000000570	2019-11-16 08:03:34.463397	\N	\N	1	\N	1276	\N	10000	4	2	0
6980	2019-10-10	FT - CR - 50100256958061 - MANVENDRA SINGH	0000000000000024	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	3058	\N	4	2	0
6990	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382376	2019-11-16 08:03:34.463397	\N	\N	1	\N	773	5239	\N	4	2	0
6985	2019-10-10	CHQ DEP - MICR CLG - NOIDA WBO	0000000000285101	2019-11-16 08:03:34.463397	\N	\N	1	\N	55	7010	\N	4	2	0
6989	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000215128	2019-11-16 08:03:34.463397	\N	\N	1	\N	1192	7185	\N	4	2	0
6988	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137889	2019-11-16 08:03:34.463397	\N	\N	1	\N	1041	8915	\N	4	2	0
6983	2019-10-10	NEFT CR-UTBI0GND561-ANTARIKSH ENTERPRISES-J P ENTERPRISES-UTBIN19283189582	UTBIN19283189582	2019-11-16 08:03:34.463397	\N	\N	1	\N	513	15000	\N	4	2	0
6987	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000621	2019-11-16 08:03:34.463397	\N	\N	1	\N	661	23641	\N	4	2	0
6986	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013880	2019-11-16 08:03:34.463397	\N	\N	1	\N	57	86848	\N	4	2	0
6982	2019-10-10	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000011015	2019-11-16 08:03:34.463397	\N	\N	1	\N	97	109920	\N	4	2	0
6979	2019-10-10	CHQ DEP RET CHGS 011019-MIR1927910778757	0000000000510421	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
6981	2019-10-10	ACH D- MONDELEZ INDIA FOODS-DB37470584	0000002606340525	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	40405.7099999999991	4	2	0
7011	2019-10-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133996	2019-11-16 08:03:34.463397	\N	\N	1	\N	68	4728	\N	4	2	0
7002	2019-10-11	NEFT CR-SYNB0008690-K K STORE-J P ENTERPRISES-P19101122695554	0P19101122695554	2019-11-16 08:03:34.463397	\N	\N	1	\N	918	13290	\N	4	2	0
7010	2019-10-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000663310	2019-11-16 08:03:34.463397	\N	\N	1	\N	1074	17072	\N	4	2	0
7001	2019-10-11	NEFT CR-SYNB0008689-SHRI SHYAM TRADING-J P ENTERPRISES-P19101122664570	0P19101122664570	2019-11-16 08:03:34.463397	\N	\N	1	\N	1215	22877	\N	4	2	0
7009	2019-10-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002065	2019-11-16 08:03:34.463397	\N	\N	1	\N	67	25187	\N	4	2	0
7008	2019-10-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155926	2019-11-16 08:03:34.463397	\N	\N	1	\N	3	25665	\N	4	2	0
7007	2019-10-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992831	2019-11-16 08:03:34.463397	\N	\N	1	\N	23	30320	\N	4	2	0
7005	2019-10-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009876	2019-11-16 08:03:34.463397	\N	\N	1	\N	105	41517	\N	4	2	0
7006	2019-10-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000340000	2019-11-16 08:03:34.463397	\N	\N	1	\N	78	74301	\N	4	2	0
7004	2019-10-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000518	2019-11-16 08:03:34.463397	\N	\N	1	\N	126	98454	\N	4	2	0
7003	2019-10-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136701	2019-11-16 08:03:34.463397	\N	\N	1	\N	656	289489	\N	4	2	0
6993	2019-10-11	CHQ DEP RET CHGS 041019-MIR1928114955611	0000000000156081	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
6992	2019-10-11	CHQ DEP RET CHGS 031019-MIR1928114679786	0000000000766833	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
6994	2019-10-11	CHQ DEP RET CHGS 041019-MIR1928115000590	0000000000052951	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
6995	2019-10-11	CHQ DEP RET CHGS 041019-MIR1928114955618	0000000000885953	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
6996	2019-10-11	CHQ DEP RET CHGS 051019-MIR1928115338152	0000000000000319	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
6997	2019-10-11	CHQ DEP RET CHGS 051019-MIR1928115321567	0000000000000790	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
6999	2019-10-11	CHQ DEP RET CHGS 071019-MIR1928419760373	0000000000127047	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
6998	2019-10-11	N3058220156601310-STP-DABUR HPC	IB11133038381357	2019-11-16 08:03:34.463397	\N	\N	1	\N	1255	\N	130000	4	2	0
7000	2019-10-11	ACH D- MONDELEZ INDIA FOODS-DB37480671	0000002638559029	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	137394.48000000001	4	2	0
7012	2019-10-12	IMPS-928510609902-35959771-HDFC-XXXXXXXX8519-	0000928510609902	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	7000	\N	4	2	0
7015	2019-10-13	IMPS-928621383691-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000928621383691	2019-11-16 08:03:34.463397	\N	\N	1	\N	633	865	\N	4	2	0
7014	2019-10-13	UPI-SUNIL KUMAR-8810261706@PAYTM-PYTM0123456-928638624769-NA	0000928614345494	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	11000	\N	4	2	0
7021	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002582	2019-11-16 08:03:34.463397	\N	\N	1	\N	1061	7647	\N	4	2	0
7022	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000510446	2019-11-16 08:03:34.463397	\N	\N	1	\N	705	8320	\N	4	2	0
7023	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000528	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	8709	\N	4	2	0
7024	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000147	2019-11-16 08:03:34.463397	\N	\N	1	\N	72	10000	\N	4	2	0
7026	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000263286	2019-11-16 08:03:34.463397	\N	\N	1	\N	42	10411	\N	4	2	0
7025	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000484	2019-11-16 08:03:34.463397	\N	\N	1	\N	616	10000	\N	4	2	0
7027	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000185	2019-11-16 08:03:34.463397	\N	\N	1	\N	1039	13572	\N	4	2	0
7028	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000026018	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	16453	\N	4	2	0
7029	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000754371	2019-11-16 08:03:34.463397	\N	\N	1	\N	1063	16791	\N	4	2	0
7030	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029079	2019-11-16 08:03:34.463397	\N	\N	1	\N	24	17557	\N	4	2	0
7031	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000070	2019-11-16 08:03:34.463397	\N	\N	1	\N	1064	19663	\N	4	2	0
7032	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000525777	2019-11-16 08:03:34.463397	\N	\N	1	\N	1181	20000	\N	4	2	0
7033	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134597	2019-11-16 08:03:34.463397	\N	\N	1	\N	31	25000	\N	4	2	0
7034	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001912	2019-11-16 08:03:34.463397	\N	\N	1	\N	81	25724	\N	4	2	0
7035	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000130540	2019-11-16 08:03:34.463397	\N	\N	1	\N	6	30000	\N	4	2	0
7016	2019-10-14	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000011016	2019-11-16 08:03:34.463397	\N	\N	1	\N	97	70000	\N	4	2	0
7019	2019-10-14	50100051672149-TPT-DRAWINGS	0000000159316278	2019-11-16 08:03:34.463397	\N	\N	1	\N	1258	\N	30000	4	2	0
7018	2019-10-14	ACH D- MONDELEZ INDIA FOODS-DB37490723	0000002672215233	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	247278.049999999988	4	2	0
7017	2019-10-14	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019101499558072-RED BULL	HDFCR52019101499558072	2019-11-16 08:03:34.463397	\N	\N	1	\N	1251	\N	300000	4	2	0
7013	2019-10-12	POS 436303XXXXXX9204 UTTAR PRADESH PO POS DEBIT	0000928519475947	2019-11-16 08:03:34.463397	\N	\N	1	\N	1275	\N	7042.97000000000025	4	2	0
7040	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000004021	2019-11-16 08:03:34.463397	\N	\N	1	\N	101	2662	\N	4	2	0
7041	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000216	2019-11-16 08:03:34.463397	\N	\N	1	\N	24	3000	\N	4	2	0
7042	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000407552	2019-11-16 08:03:34.463397	\N	\N	1	\N	1129	4260	\N	4	2	0
7043	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134281	2019-11-16 08:03:34.463397	\N	\N	1	\N	75	4637	\N	4	2	0
7044	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000355	2019-11-16 08:03:34.463397	\N	\N	1	\N	1	5691	\N	4	2	0
7045	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000327687	2019-11-16 08:03:34.463397	\N	\N	1	\N	1051	7000	\N	4	2	0
7046	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000161995	2019-11-16 08:03:34.463397	\N	\N	1	\N	34	7528	\N	4	2	0
7036	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000745626	2019-11-16 08:03:34.463397	\N	\N	1	\N	40	33680	\N	4	2	0
7037	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397632	2019-11-16 08:03:34.463397	\N	\N	1	\N	6	38468	\N	4	2	0
7038	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001394	2019-11-16 08:03:34.463397	\N	\N	1	\N	60	41796	\N	4	2	0
7057	2019-10-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672859	2019-11-16 08:03:34.463397	\N	\N	1	\N	1260	4562	\N	4	2	0
7058	2019-10-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000485	2019-11-16 08:03:34.463397	\N	\N	1	\N	616	9572	\N	4	2	0
7052	2019-10-15	IMPS-928812572206-K K STORE-HDFC-XXXXXXXXXX1250-	0000928812572206	2019-11-16 08:03:34.463397	\N	\N	1	\N	918	14590	\N	4	2	0
7060	2019-10-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000885957	2019-11-16 08:03:34.463397	\N	\N	1	\N	513	15000	\N	4	2	0
7050	2019-10-15	NEFT CR-UTIB0000624-MITTAL TRADERS-J P ENTERPRISES-AXMB192889711423	AXMB192889711423	2019-11-16 08:03:34.463397	\N	\N	1	\N	359	37798	\N	4	2	0
7059	2019-10-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000166478	2019-11-16 08:03:34.463397	\N	\N	1	\N	14	41107	\N	4	2	0
7051	2019-10-15	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19288012582	VIJBH19288012582	2019-11-16 08:03:34.463397	\N	\N	1	\N	471	39691	\N	4	2	0
7055	2019-10-15	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000510446	2019-11-16 08:03:34.463397	\N	\N	1	\N	705	\N	8320	4	2	0
7047	2019-10-15	MARICO4254-STP-MARICO	IB15110523981225	2019-11-16 08:03:34.463397	\N	\N	1	\N	1252	\N	100000	4	2	0
7049	2019-10-15	N3058220156601330-STP-DABUR HC	IB15110831092943	2019-11-16 08:03:34.463397	\N	\N	1	\N	1255	\N	120000	4	2	0
7048	2019-10-15	N3058220156601310-STP-DABUR HPC	IB15110802742335	2019-11-16 08:03:34.463397	\N	\N	1	\N	1255	\N	190000	4	2	0
7053	2019-10-15	HB3142NR1000009999-STP-GODREJ	IB15155337749676	2019-11-16 08:03:34.463397	\N	\N	1	\N	1249	\N	198000	4	2	0
7056	2019-10-15	ACH D- MONDELEZ INDIA FOODS-DB37520639	0000002721299146	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	198257.76999999999	4	2	0
7054	2019-10-15	HB3142NR1000009999-STP-GODREJ	IB15165246936295	2019-11-16 08:03:34.463397	\N	\N	1	\N	1249	\N	340000	4	2	0
7063	2019-10-16	50200027549434-TPT-BILL NO 4614 J P	0000000278035031	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	698	\N	4	2	0
7066	2019-10-16	50200027549434-TPT-BILL NO 4986 J P	0000000279024585	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	2232	\N	4	2	0
7076	2019-10-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000253529	2019-11-16 08:03:34.463397	\N	\N	1	\N	83	4586	\N	4	2	0
7075	2019-10-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000327688	2019-11-16 08:03:34.463397	\N	\N	1	\N	1051	7400	\N	4	2	0
7074	2019-10-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000590690	2019-11-16 08:03:34.463397	\N	\N	1	\N	1175	7906	\N	4	2	0
7073	2019-10-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132322	2019-11-16 08:03:34.463397	\N	\N	1	\N	64	14991	\N	4	2	0
7069	2019-10-16	NEFT CR-UTBI0GND561-ANTARIKSH ENTERPRISES-J P ENTERPRISES-UTBIN19289377689	UTBIN19289377689	2019-11-16 08:03:34.463397	\N	\N	1	\N	513	15000	\N	4	2	0
7079	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000141304	2019-11-16 08:03:34.463397	\N	\N	1	\N	1041	1396	\N	4	2	0
7064	2019-10-16	50200004799122-TPT-J P ENTERPRISES 6OCT	0000000278090012	2019-11-16 08:03:34.463397	\N	\N	1	\N	94	33007	\N	4	2	0
7065	2019-10-16	50200027549434-TPT-BILL 3870 4338 4064	0000000278087340	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	42454	\N	4	2	0
7068	2019-10-16	NEFT CR-ICIC0003488-MODIS CAKE N CAFE-JP ENTERPRISES-000075312969	0000000075312969	2019-11-16 08:03:34.463397	\N	\N	1	\N	86	60000	\N	4	2	0
7071	2019-10-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136710	2019-11-16 08:03:34.463397	\N	\N	1	\N	656	107407	\N	4	2	0
7070	2019-10-16	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000885957	2019-11-16 08:03:34.463397	\N	\N	1	\N	513	\N	15000	4	2	0
7067	2019-10-16	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N289190955660895-COLGATE	N289190955660895	2019-11-16 08:03:34.463397	\N	\N	1	\N	1254	\N	140000	4	2	0
7072	2019-10-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024404	2019-11-16 08:03:34.463397	\N	\N	1	\N	700	18721	\N	4	2	0
7082	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001386	2019-11-16 08:03:34.463397	\N	\N	1	\N	140	5816	\N	4	2	0
7081	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000849737	2019-11-16 08:03:34.463397	\N	\N	1	\N	730	7118	\N	4	2	0
7080	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136157	2019-11-16 08:03:34.463397	\N	\N	1	\N	55	9508	\N	4	2	0
7084	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000160	2019-11-16 08:03:34.463397	\N	\N	1	\N	313	15109	\N	4	2	0
7088	2019-10-18	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19291699234	KKBKH19291699234	2019-11-16 08:03:34.463397	\N	\N	1	\N	1243	10000	\N	4	2	0
7083	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136911	2019-11-16 08:03:34.463397	\N	\N	1	\N	56	46888	\N	4	2	0
7085	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397631	2019-11-16 08:03:34.463397	\N	\N	1	\N	6	53657	\N	4	2	0
7087	2019-10-17	CHQ DEP RET- CHEQUE IRREGULARLY DRAWN	0000000000024404	2019-11-16 08:03:34.463397	\N	\N	1	\N	700	\N	18721	4	2	0
7077	2019-10-17	ACH D- MONDELEZ INDIA FOODS-DB37540387	0000002791706210	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	386763.330000000016	4	2	0
7092	2019-10-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000947	2019-11-16 08:03:34.463397	\N	\N	1	\N	73	3933	\N	4	2	0
7086	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000486	2019-11-16 08:03:34.463397	\N	\N	1	\N	616	8461	\N	4	2	0
7091	2019-10-18	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000486	2019-11-16 08:03:34.463397	\N	\N	1	\N	616	\N	8461	4	2	0
7089	2019-10-18	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N291190957448744-RED BULL	N291190957448744	2019-11-16 08:03:34.463397	\N	\N	1	\N	1251	\N	100000	4	2	0
7090	2019-10-18	ACH D- MONDELEZ INDIA FOODS-DB37550425	0000002827679568	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	154842.339999999997	4	2	0
7078	2019-10-17	CASH DEP DADRI	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1244	162500	\N	4	2	0
7061	2019-10-16	CHQ PAID-MICR CTS-NO-TATA AIG GENERAL	0000000000000569	2019-11-16 08:03:34.463397	\N	\N	1	\N	1277	\N	11425	4	2	0
7094	2019-10-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000162005	2019-11-16 08:03:34.463397	\N	\N	1	\N	34	11855	\N	4	2	0
7096	2019-10-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024405	2019-11-16 08:03:34.463397	\N	\N	1	\N	700	18721	\N	4	2	0
7095	2019-10-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992838	2019-11-16 08:03:34.463397	\N	\N	1	\N	577	16988	\N	4	2	0
7097	2019-10-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785681	2019-11-16 08:03:34.463397	\N	\N	1	\N	910	46041	\N	4	2	0
7108	2019-10-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137015	2019-11-16 08:03:34.463397	\N	\N	1	\N	663	4048	\N	4	2	0
7107	2019-10-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000075	2019-11-16 08:03:34.463397	\N	\N	1	\N	1196	6217	\N	4	2	0
7106	2019-10-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000310073	2019-11-16 08:03:34.463397	\N	\N	1	\N	87	6609	\N	4	2	0
7102	2019-10-19	FT - CR - 50200013033414 - CROWNE PLAZA A UNIT OF AHPL	0000000000105844	2019-11-16 08:03:34.463397	\N	\N	1	\N	320	10714.1599999999999	\N	4	2	0
7105	2019-10-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000533423	2019-11-16 08:03:34.463397	\N	\N	1	\N	747	12608	\N	4	2	0
7101	2019-10-19	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19292077634	VIJBH19292077634	2019-11-16 08:03:34.463397	\N	\N	1	\N	471	22301	\N	4	2	0
7103	2019-10-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134604	2019-11-16 08:03:34.463397	\N	\N	1	\N	31	24574	\N	4	2	0
7104	2019-10-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009930	2019-11-16 08:03:34.463397	\N	\N	1	\N	105	29309	\N	4	2	0
7100	2019-10-19	50200004799122-TPT-J P ENT 29SEPBILL	0000000117363945	2019-11-16 08:03:34.463397	\N	\N	1	\N	94	42978	\N	4	2	0
7098	2019-10-19	CHQ DEP RET CHGS 151019-MIR1929049394644	0000000000510446	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
7099	2019-10-19	CHQ DEP RET CHGS 161019-MIR1929151109569	0000000000885957	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
7122	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000004033	2019-11-16 08:03:34.463397	\N	\N	1	\N	101	2012	\N	4	2	0
7123	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000195	2019-11-16 08:03:34.463397	\N	\N	1	\N	1039	5025	\N	4	2	0
7113	2019-10-21	CHQ DEP - MICR CLG - NOIDA WBO	0000000000616877	2019-11-16 08:03:34.463397	\N	\N	1	\N	643	5784	\N	4	2	0
7117	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315680	2019-11-16 08:03:34.463397	\N	\N	1	\N	35	6399	\N	4	2	0
7124	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019415	2019-11-16 08:03:34.463397	\N	\N	1	\N	102	6653	\N	4	2	0
7109	2019-10-21	IMPS-929408109177-MANOJ -HDFC-XXXXXXXX8697-	0000929408109177	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	1711	\N	4	2	0
7125	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002597	2019-11-16 08:03:34.463397	\N	\N	1	\N	1061	9378	\N	4	2	0
7120	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029083	2019-11-16 08:03:34.463397	\N	\N	1	\N	24	11090	\N	4	2	0
7118	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000152	2019-11-16 08:03:34.463397	\N	\N	1	\N	72	14672	\N	4	2	0
7116	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000072	2019-11-16 08:03:34.463397	\N	\N	1	\N	1064	19602	\N	4	2	0
7119	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001115	2019-11-16 08:03:34.463397	\N	\N	1	\N	95	15573	\N	4	2	0
7115	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000547	2019-11-16 08:03:34.463397	\N	\N	1	\N	1083	20000	\N	4	2	0
7126	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000536	2019-11-16 08:03:34.463397	\N	\N	1	\N	342	22810	\N	4	2	0
7127	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013898	2019-11-16 08:03:34.463397	\N	\N	1	\N	57	51658	\N	4	2	0
7114	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000211428	2019-11-16 08:03:34.463397	\N	\N	1	\N	91	129419	\N	4	2	0
7110	2019-10-21	ACH D- MONDELEZ INDIA FOODS-DB37570389	0000002889062631	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	64563.0599999999977	4	2	0
7112	2019-10-21	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N294190959695909-COLGATE	N294190959695909	2019-11-16 08:03:34.463397	\N	\N	1	\N	1254	\N	300000	4	2	0
7135	2019-10-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000359	2019-11-16 08:03:34.463397	\N	\N	1	\N	83	9370	\N	4	2	0
7131	2019-10-22	FT - CR - 50200043145131 - SHRI JEE GENERAL STORE	0000000000000026	2019-11-16 08:03:34.463397	\N	\N	1	\N	365	10175	\N	4	2	0
7136	2019-10-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134911	2019-11-16 08:03:34.463397	\N	\N	1	\N	390	10241	\N	4	2	0
7132	2019-10-22	IMPS-929516574253-MUNSHILAL-HDFC-XXXXXXXXXX1383-TUSHAR	0000929516574253	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	11200	\N	4	2	0
7134	2019-10-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000135807	2019-11-16 08:03:34.463397	\N	\N	1	\N	89	14262	\N	4	2	0
7133	2019-10-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672901	2019-11-16 08:03:34.463397	\N	\N	1	\N	1260	28116	\N	4	2	0
7128	2019-10-22	UPI-BHARATPE MERCHANT-BHARATPE90100017889@YESBANKLTD-YESB0000004-929501289648-TUSHAR TRADING	0000092951475494	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	\N	1	4	2	0
7129	2019-10-22	CHQ DEP RET CHGS 181019-MIR1929356248902	0000000000000486	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
7130	2019-10-22	ACH D- MONDELEZ INDIA FOODS-DB37590480	0000002913399538	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	336696.349999999977	4	2	0
7139	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000551106	2019-11-16 08:03:34.463397	\N	\N	1	\N	1270	8290	\N	4	2	0
7140	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000565062	2019-11-16 08:03:34.463397	\N	\N	1	\N	601	8802	\N	4	2	0
7141	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000464	2019-11-16 08:03:34.463397	\N	\N	1	\N	88	10349	\N	4	2	0
7138	2019-10-23	IMPS-929613607379-AGGARWAL KIRANA STOR-HDFC-XXXXXXXXXX1602-JP ENTERPRISE	0000929613607379	2019-11-16 08:03:34.463397	\N	\N	1	\N	577	10557	\N	4	2	0
7137	2019-10-23	IMPS-929612124192-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARG	0000929612124192	2019-11-16 08:03:34.463397	\N	\N	1	\N	586	20346	\N	4	2	0
7146	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001927	2019-11-16 08:03:34.463397	\N	\N	1	\N	81	22290	\N	4	2	0
7142	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132328	2019-11-16 08:03:34.463397	\N	\N	1	\N	64	23662	\N	4	2	0
7143	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019424	2019-11-16 08:03:34.463397	\N	\N	1	\N	102	35743	\N	4	2	0
7144	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000293	2019-11-16 08:03:34.463397	\N	\N	1	\N	1094	40262	\N	4	2	0
7145	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136912	2019-11-16 08:03:34.463397	\N	\N	1	\N	56	41995	\N	4	2	0
7148	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000340024	2019-11-16 08:03:34.463397	\N	\N	1	\N	78	110386	\N	4	2	0
7147	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000260113	2019-11-16 08:03:34.463397	\N	\N	1	\N	1131	141181	\N	4	2	0
7111	2019-10-21	CASH DEP DADRI	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1244	207500	\N	4	2	0
7149	2019-10-24	CHQ PAID-MICR CTS-NO-MANOJ KUMAR	0000000000000462	2019-11-16 08:03:34.463397	\N	\N	1	\N	1276	\N	10000	4	2	0
7157	2019-10-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024637	2019-11-16 08:03:34.463397	\N	\N	1	\N	831	1551	\N	4	2	0
7158	2019-10-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826762	2019-11-16 08:03:34.463397	\N	\N	1	\N	858	1772	\N	4	2	0
7159	2019-10-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000160915	2019-11-16 08:03:34.463397	\N	\N	1	\N	280	4095	\N	4	2	0
7160	2019-10-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000022	2019-11-16 08:03:34.463397	\N	\N	1	\N	1273	5142	\N	4	2	0
7161	2019-10-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001389	2019-11-16 08:03:34.463397	\N	\N	1	\N	140	5243	\N	4	2	0
7162	2019-10-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000141315	2019-11-16 08:03:34.463397	\N	\N	1	\N	1041	5699	\N	4	2	0
7163	2019-10-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382380	2019-11-16 08:03:34.463397	\N	\N	1	\N	773	9996	\N	4	2	0
7155	2019-10-24	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19297059082	VIJBH19297059082	2019-11-16 08:03:34.463397	\N	\N	1	\N	471	30000	\N	4	2	0
7164	2019-10-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000422199	2019-11-16 08:03:34.463397	\N	\N	1	\N	114	31048	\N	4	2	0
7165	2019-10-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000270226	2019-11-16 08:03:34.463397	\N	\N	1	\N	19	40686	\N	4	2	0
7156	2019-10-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000539	2019-11-16 08:03:34.463397	\N	\N	1	\N	126	132377	\N	4	2	0
7151	2019-10-24	POS 436303XXXXXX9204 CHAUDHARY  SERVI POS DEBIT	0000929712780290	2019-11-16 08:03:34.463397	\N	\N	1	\N	1267	\N	3405	4	2	0
7152	2019-10-24	ACH D- MONDELEZ INDIA FOODS-DB37610387	0000002973710295	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	641179.869999999995	4	2	0
7175	2019-10-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000207	2019-11-16 08:03:34.463397	\N	\N	1	\N	1144	13332	\N	4	2	0
7173	2019-10-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000021	2019-11-16 08:03:34.463397	\N	\N	1	\N	1081	13404	\N	4	2	0
7172	2019-10-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000357257	2019-11-16 08:03:34.463397	\N	\N	1	\N	1090	15000	\N	4	2	0
7174	2019-10-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134605	2019-11-16 08:03:34.463397	\N	\N	1	\N	31	15746	\N	4	2	0
7168	2019-10-25	CASH DEP DADRI	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1244	200000	\N	4	2	0
7169	2019-10-25	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000160915	2019-11-16 08:03:34.463397	\N	\N	1	\N	280	\N	4095	4	2	0
7166	2019-10-25	N3058220156601310-STP-DABUR HPC	IB25074329697171	2019-11-16 08:03:34.463397	\N	\N	1	\N	1255	\N	290000	4	2	0
7170	2019-10-25	ACH D- MONDELEZ INDIA FOODS-DB37620466	0000003002925425	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	295926.979999999981	4	2	0
7167	2019-10-25	N3058220156601330-STP-DABUR HC	IB25134105563595	2019-11-16 08:03:34.463397	\N	\N	1	\N	1255	\N	300000	4	2	0
7177	2019-10-26	IMPS-929909242869-35959771-HDFC-XXXXXXXX8519-	0000929909242869	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	8000	\N	4	2	0
7180	2019-10-28	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000021	2019-11-16 08:03:34.463397	\N	\N	1	\N	1081	\N	13404	4	2	0
7179	2019-10-28	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000357257	2019-11-16 08:03:34.463397	\N	\N	1	\N	1090	\N	15000	4	2	0
7178	2019-10-28	ACH D- MONDELEZ INDIA FOODS-DB37630618	0000003049381423	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	167402.790000000008	4	2	0
7182	2019-10-29	CRV POS 436303******9204 1024 CHAUDHARY	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	25.5399999999999991	\N	4	2	0
7181	2019-10-29	CHQ DEP RET CHGS 251019-MIR1929966646265	0000000000160915	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
7192	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000004041	2019-11-16 08:03:34.463397	\N	\N	1	\N	101	3342	\N	4	2	0
7191	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000237	2019-11-16 08:03:34.463397	\N	\N	1	\N	501	3455	\N	4	2	0
7186	2019-10-30	UPI-LAXMI KUMARI-9650834417@YBL-PUNB0447600-930315616160-PAYMENT FROM PHONE	0000930315127377	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	4000	\N	4	2	0
7190	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000135813	2019-11-16 08:03:34.463397	\N	\N	1	\N	89	4408	\N	4	2	0
7189	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000310086	2019-11-16 08:03:34.463397	\N	\N	1	\N	87	6239	\N	4	2	0
7188	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000631685	2019-11-16 08:03:34.463397	\N	\N	1	\N	62	6447	\N	4	2	0
7187	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137021	2019-11-16 08:03:34.463397	\N	\N	1	\N	663	7506	\N	4	2	0
7200	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001261	2019-11-16 08:03:34.463397	\N	\N	1	\N	1105	7601	\N	4	2	0
7199	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029091	2019-11-16 08:03:34.463397	\N	\N	1	\N	24	10269	\N	4	2	0
7198	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000122	2019-11-16 08:03:34.463397	\N	\N	1	\N	1262	12744	\N	4	2	0
7197	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000022	2019-11-16 08:03:34.463397	\N	\N	1	\N	1081	13404	\N	4	2	0
7196	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001120	2019-11-16 08:03:34.463397	\N	\N	1	\N	95	17083	\N	4	2	0
7195	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000062761	2019-11-16 08:03:34.463397	\N	\N	1	\N	32	17311	\N	4	2	0
7194	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000079	2019-11-16 08:03:34.463397	\N	\N	1	\N	307	18256	\N	4	2	0
7208	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000548	2019-11-16 08:03:34.463397	\N	\N	1	\N	1083	20000	\N	4	2	0
7154	2019-10-24	NEFT CR-CNRB0002159-J.P.ENTERPRISES-JP ENTERPRISES-P19102412570502	0P19102412570502	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	500000	\N	4	2	0
7207	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002085	2019-11-16 08:03:34.463397	\N	\N	1	\N	67	22019	\N	4	2	0
7206	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136169	2019-11-16 08:03:34.463397	\N	\N	1	\N	55	22244	\N	4	2	0
7205	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134616	2019-11-16 08:03:34.463397	\N	\N	1	\N	31	25000	\N	4	2	0
7204	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133266	2019-11-16 08:03:34.463397	\N	\N	1	\N	6	31189	\N	4	2	0
7202	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101583	2019-11-16 08:03:34.463397	\N	\N	1	\N	434	35000	\N	4	2	0
7203	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101582	2019-11-16 08:03:34.463397	\N	\N	1	\N	434	35000	\N	4	2	0
7201	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397654	2019-11-16 08:03:34.463397	\N	\N	1	\N	6	36445	\N	4	2	0
7185	2019-10-30	CASH DEP DADRI	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1244	100000	\N	4	2	0
7184	2019-10-30	CHQ DEP RET CHGS 281019-MIR1930369920764	0000000000357257	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
7183	2019-10-30	CHQ DEP RET CHGS 281019-MIR1930369923693	0000000000000021	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
7193	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024404	2019-11-16 08:03:34.463397	\N	\N	1	\N	700	18721	\N	4	2	0
7176	2019-10-25	50200006539210-TPT-JP CA TO TTC CA	0000000387393925	2019-11-16 08:03:34.463397	\N	\N	1	\N	422	\N	200000	4	2	0
7212	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013919	2019-11-16 08:03:34.463397	\N	\N	1	\N	57	41461	\N	4	2	0
7211	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992846	2019-11-16 08:03:34.463397	\N	\N	1	\N	23	55668	\N	4	2	0
7209	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009982	2019-11-16 08:03:34.463397	\N	\N	1	\N	105	89204	\N	4	2	0
7215	2019-10-30	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N303190309708086	N303190309708086	2019-11-16 08:03:34.463397	\N	\N	1	\N	1070	177969	\N	4	2	0
7217	2019-10-31	IMPS-930411626092-LALIT-HDFC-XXXXXXXXXXX0268-JP	0000930411626092	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	97	\N	4	2	0
7214	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136726	2019-11-16 08:03:34.463397	\N	\N	1	\N	656	129695	\N	4	2	0
7226	2019-10-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137023	2019-11-16 08:03:34.463397	\N	\N	1	\N	663	3460	\N	4	2	0
7224	2019-10-31	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19304574838	IOBAN19304574838	2019-11-16 08:03:34.463397	\N	\N	1	\N	30	3679	\N	4	2	0
7227	2019-10-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000023	2019-11-16 08:03:34.463397	\N	\N	1	\N	1273	5142	\N	4	2	0
7228	2019-10-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001397	2019-11-16 08:03:34.463397	\N	\N	1	\N	140	6274	\N	4	2	0
7229	2019-10-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000123381	2019-11-16 08:03:34.463397	\N	\N	1	\N	1134	10457	\N	4	2	0
7225	2019-10-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000196	2019-11-16 08:03:34.463397	\N	\N	1	\N	231	12125	\N	4	2	0
7230	2019-10-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000644	2019-11-16 08:03:34.463397	\N	\N	1	\N	661	25279	\N	4	2	0
7218	2019-10-31	NEFT CR-CORP0003167-ARN MEGA MART LLP-JP ENTERPRISES-000143663464	0000000143663464	2019-11-16 08:03:34.463397	\N	\N	1	\N	3	30000	\N	4	2	0
7223	2019-10-31	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N304190310254129	N304190310254129	2019-11-16 08:03:34.463397	\N	\N	1	\N	1070	142084	\N	4	2	0
7216	2019-10-31	POS 436303XXXXXX9204 SATISH CHANDRA G POS DEBIT	0000930409633534	2019-11-16 08:03:34.463397	\N	\N	1	\N	1267	\N	1300	4	2	0
7222	2019-10-31	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000022	2019-11-16 08:03:34.463397	\N	\N	1	\N	1081	\N	13404	4	2	0
7219	2019-10-31	ACH D- MONDELEZ INDIA FOODS-DB37660350	0000003105717630	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	28647.2400000000016	4	2	0
7220	2019-10-31	ACH D- MONDELEZ INDIA FOODS-DB37670295	0000003105717629	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	301886.090000000026	4	2	0
7221	2019-10-31	ACH D- MONDELEZ INDIA FOODS-DB37680357	0000003105717628	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	303493.419999999984	4	2	0
7233	2019-11-01	NEFT CR-INDB0000006-RAVINDRA NATH-JPENTERPRISES-000222357293	0000000222357293	2019-11-16 08:03:34.463397	\N	\N	1	\N	340	6200	\N	4	2	0
7232	2019-11-01	IMPS-930511191210-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARG	0000930511191210	2019-11-16 08:03:34.463397	\N	\N	1	\N	586	15033	\N	4	2	0
7235	2019-11-01	UPI-AMIT AGARWAL SO MKAG-9999900212@UPI-ORBC0100526-930518130510-NO REMARKS	0000930518492517	2019-11-16 08:03:34.463397	\N	\N	1	\N	670	20000	\N	4	2	0
7231	2019-11-01	NEFT DR-ORBC0100616-SHRI TRADING COMPANY-NETBANK, MUM-N305190969289549-SHRI TRADING COMPA	N305190969289549	2019-11-16 08:03:34.463397	\N	\N	1	\N	1215	\N	70000	4	2	0
7234	2019-11-01	ACH D- MONDELEZ INDIA FOODS-DB37690684	0000003131934883	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	212381.720000000001	4	2	0
7246	2019-11-02	CRV POS 436303******9204 1031 SATISH CHA	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1267	9.75	\N	4	2	0
7239	2019-11-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382383	2019-11-16 08:03:34.463397	\N	\N	1	\N	773	3320	\N	4	2	0
7238	2019-11-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000351660	2019-11-16 08:03:34.463397	\N	\N	1	\N	508	8260	\N	4	2	0
7245	2019-11-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000202	2019-11-16 08:03:34.463397	\N	\N	1	\N	1039	8329	\N	4	2	0
7244	2019-11-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000327722	2019-11-16 08:03:34.463397	\N	\N	1	\N	1051	9000	\N	4	2	0
7243	2019-11-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155099	2019-11-16 08:03:34.463397	\N	\N	1	\N	620	10592	\N	4	2	0
7242	2019-11-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001519	2019-11-16 08:03:34.463397	\N	\N	1	\N	1063	25000	\N	4	2	0
7241	2019-11-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000260163	2019-11-16 08:03:34.463397	\N	\N	1	\N	1131	76559	\N	4	2	0
7240	2019-11-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001947	2019-11-16 08:03:34.463397	\N	\N	1	\N	81	80373	\N	4	2	0
7237	2019-11-02	ACH D- MONDELEZ INDIA FOODS-DB37700287	0000003160307922	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	36355.1500000000015	4	2	0
7247	2019-11-03	50200004799122-TPT-J P EN 13 14 OCT	0000000376208589	2019-11-16 08:03:34.463397	\N	\N	1	\N	94	100610	\N	4	2	0
7257	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000451749	2019-11-16 08:03:34.463397	\N	\N	1	\N	306	2566	\N	4	2	0
7258	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001125	2019-11-16 08:03:34.463397	\N	\N	1	\N	95	4018	\N	4	2	0
7259	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000723817	2019-11-16 08:03:34.463397	\N	\N	1	\N	42	5068	\N	4	2	0
7260	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000004049	2019-11-16 08:03:34.463397	\N	\N	1	\N	101	5127	\N	4	2	0
7261	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000727	2019-11-16 08:03:34.463397	\N	\N	1	\N	42	5953	\N	4	2	0
7262	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000292341	2019-11-16 08:03:34.463397	\N	\N	1	\N	643	6206	\N	4	2	0
7263	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000376	2019-11-16 08:03:34.463397	\N	\N	1	\N	1066	8411	\N	4	2	0
7264	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000327723	2019-11-16 08:03:34.463397	\N	\N	1	\N	1051	9279	\N	4	2	0
7249	2019-11-04	FT - CR - 50100254992630 - AMIT NAGAR	0000000000000018	2019-11-16 08:03:34.463397	\N	\N	1	\N	1272	10239	\N	4	2	0
7248	2019-11-04	UPI-VINEET KUMAR-9911483519@YBL-UBIN0560430-930832738978-PAYMENT FROM PHONE	0000093088564591	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	30000	\N	4	2	0
7256	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397677	2019-11-16 08:03:34.463397	\N	\N	1	\N	6	124903	\N	4	2	0
7255	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003587	2019-11-16 08:03:34.463397	\N	\N	1	\N	97	130431	\N	4	2	0
7254	2019-11-04	NEFT CR-YESB0000001-FRESHLEE RETAIL-JP ENTERPRISES-N308190312650175	N308190312650175	2019-11-16 08:03:34.463397	\N	\N	1	\N	1070	191727	\N	4	2	0
7253	2019-11-04	NEFT CR-ICIC0003488-BAKERS ZONE-JP ENTERPRISES-000076500157	0000000076500157	2019-11-16 08:03:34.463397	\N	\N	1	\N	79	200000	\N	4	2	0
7251	2019-11-04	CHQ DEP RET CHGS 311019-MIR1930875210942	0000000000000022	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
7250	2019-11-04	EMI 45070519 CHQ S45070519133 111945070519	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1256	\N	69821	4	2	0
7252	2019-11-04	ACH D- MONDELEZ INDIA FOODS-DB37710297	0000003184520072	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	410405.070000000007	4	2	0
7265	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000029095	2019-11-16 08:03:34.463397	\N	\N	1	\N	616	10000	\N	4	2	0
7267	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000572183	2019-11-16 08:03:34.463397	\N	\N	1	\N	1274	10909	\N	4	2	0
7268	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000795615	2019-11-16 08:03:34.463397	\N	\N	1	\N	1215	12843	\N	4	2	0
7269	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013536	2019-11-16 08:03:34.463397	\N	\N	1	\N	1180	13761	\N	4	2	0
7270	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000473348	2019-11-16 08:03:34.463397	\N	\N	1	\N	46	17089	\N	4	2	0
7272	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001521	2019-11-16 08:03:34.463397	\N	\N	1	\N	1063	25000	\N	4	2	0
7271	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001520	2019-11-16 08:03:34.463397	\N	\N	1	\N	1063	25000	\N	4	2	0
7273	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002089	2019-11-16 08:03:34.463397	\N	\N	1	\N	67	27713	\N	4	2	0
7274	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000101588	2019-11-16 08:03:34.463397	\N	\N	1	\N	434	30000	\N	4	2	0
7276	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000010017	2019-11-16 08:03:34.463397	\N	\N	1	\N	105	39864	\N	4	2	0
7275	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000545	2019-11-16 08:03:34.463397	\N	\N	1	\N	342	39647	\N	4	2	0
7280	2019-11-05	NEFT CR-UTBI0GND561-ANTARIKSH ENTERPRISES-J P ENTERPRISES-UTBIN19309319609	UTBIN19309319609	2019-11-16 08:03:34.463397	\N	\N	1	\N	513	50000	\N	4	2	0
7278	2019-11-05	EMI 52012431 CHQ S52012431124 111952012431	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1257	\N	16495	4	2	0
7279	2019-11-05	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000545	2019-11-16 08:03:34.463397	\N	\N	1	\N	342	\N	39647	4	2	0
7282	2019-11-06	NEFT CR-UTBI0GND561-ANTARIKSH ENTERPRISES-J P ENTERPRISES-UTBIN19310364318	UTBIN19310364318	2019-11-16 08:03:34.463397	\N	\N	1	\N	513	15000	\N	4	2	0
7283	2019-11-06	IMPS-931015308950-K K STORE-HDFC-XXXXXXXXXX1250-MB  TRANSFER TO JP	0000931015308950	2019-11-16 08:03:34.463397	\N	\N	1	\N	918	49327	\N	4	2	0
7281	2019-11-06	N3058220156601310-STP-DABUR HPC	IB06112259163218	2019-11-16 08:03:34.463397	\N	\N	1	\N	1255	\N	220000	4	2	0
7288	2019-11-07	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19311522080	IOBAN19311522080	2019-11-16 08:03:34.463397	\N	\N	1	\N	30	2282	\N	4	2	0
7285	2019-11-07	50200027549434-TPT-JP BILL NO 5354	0000000127792437	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	2391	\N	4	2	0
7286	2019-11-07	IMPS-931111187888-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARG	0000931111187888	2019-11-16 08:03:34.463397	\N	\N	1	\N	586	13657	\N	4	2	0
7284	2019-11-07	IMPS-931109996724-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000931109996724	2019-11-16 08:03:34.463397	\N	\N	1	\N	633	14610	\N	4	2	0
7289	2019-11-07	ACH D- MONDELEZ INDIA FOODS-DB37750477	0000003269215881	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	114817.740000000005	4	2	0
7287	2019-11-07	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N311190975633947-COLGATE	N311190975633947	2019-11-16 08:03:34.463397	\N	\N	1	\N	1254	\N	185000	4	2	0
7296	2019-11-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000310099	2019-11-16 08:03:34.463397	\N	\N	1	\N	87	3170	\N	4	2	0
7297	2019-11-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672919	2019-11-16 08:03:34.463397	\N	\N	1	\N	1260	3367	\N	4	2	0
7292	2019-11-08	NEFT CR-INDB0000006-RAVINDRA NATH-JPENTERPRISES-000224040736	0000000224040736	2019-11-16 08:03:34.463397	\N	\N	1	\N	340	7000	\N	4	2	0
7298	2019-11-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002092	2019-11-16 08:03:34.463397	\N	\N	1	\N	67	17176	\N	4	2	0
7299	2019-11-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000102178	2019-11-16 08:03:34.463397	\N	\N	1	\N	1063	20000	\N	4	2	0
7300	2019-11-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000010073	2019-11-16 08:03:34.463397	\N	\N	1	\N	105	24653	\N	4	2	0
7301	2019-11-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992857	2019-11-16 08:03:34.463397	\N	\N	1	\N	23	24881	\N	4	2	0
7295	2019-11-08	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19312066217	VIJBH19312066217	2019-11-16 08:03:34.463397	\N	\N	1	\N	471	34040	\N	4	2	0
7293	2019-11-08	N3058220156601310-STP-DABUR HPC	IB08121657154847	2019-11-16 08:03:34.463397	\N	\N	1	\N	1255	\N	180000	4	2	0
7294	2019-11-08	N3058220156601330-STP-DABUR HC	IB08121726234865	2019-11-16 08:03:34.463397	\N	\N	1	\N	1255	\N	210000	4	2	0
7302	2019-11-09	UPI-AMIT AGARWAL SO MKAG-9999900212@UPI-ORBC0100526-931319644706-NO REMARKS	0000931319037697	2019-11-16 08:03:34.463397	\N	\N	1	\N	670	9496	\N	4	2	0
7320	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002614	2019-11-16 08:03:34.463397	\N	\N	1	\N	1061	3859	\N	4	2	0
7319	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000361	2019-11-16 08:03:34.463397	\N	\N	1	\N	1	4508	\N	4	2	0
7318	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000251	2019-11-16 08:03:34.463397	\N	\N	1	\N	501	5000	\N	4	2	0
7317	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000451764	2019-11-16 08:03:34.463397	\N	\N	1	\N	306	5178	\N	4	2	0
7316	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002615	2019-11-16 08:03:34.463397	\N	\N	1	\N	1061	6141	\N	4	2	0
7314	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000932308	2019-11-16 08:03:34.463397	\N	\N	1	\N	1270	7417	\N	4	2	0
7315	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000030454	2019-11-16 08:03:34.463397	\N	\N	1	\N	24	7245	\N	4	2	0
7313	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000185849	2019-11-16 08:03:34.463397	\N	\N	1	\N	434	7794	\N	4	2	0
7312	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000049148	2019-11-16 08:03:34.463397	\N	\N	1	\N	58	10466	\N	4	2	0
7311	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000315687	2019-11-16 08:03:34.463397	\N	\N	1	\N	35	10576	\N	4	2	0
7310	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001141	2019-11-16 08:03:34.463397	\N	\N	1	\N	1065	11990	\N	4	2	0
7309	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000004214	2019-11-16 08:03:34.463397	\N	\N	1	\N	101	12542	\N	4	2	0
7304	2019-11-11	NEFT CR-KKBK0000958-OM EVERGREEN SWEETS-JP ENTERPRISES-KKBKH19315695655	KKBKH19315695655	2019-11-16 08:03:34.463397	\N	\N	1	\N	88	77831	\N	4	2	0
7305	2019-11-11	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000011058	2019-11-16 08:03:34.463397	\N	\N	1	\N	97	100851	\N	4	2	0
7308	2019-11-11	NEFT CR-YESB0000001-FRESHLEE RETAIL-JP ENTERPRISES-N315190316514551	N315190316514551	2019-11-16 08:03:34.463397	\N	\N	1	\N	1070	215610	\N	4	2	0
7303	2019-11-11	CASH DEP DADRI	000000000000000	2019-11-16 08:03:34.463397	\N	\N	1	\N	1244	600000	\N	4	2	0
7306	2019-11-11	CHQ DEP RET CHGS 051119-MIR1931391070051	0000000000000545	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
7307	2019-11-11	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000992857	2019-11-16 08:03:34.463397	\N	\N	1	\N	23	\N	24881	4	2	0
7290	2019-11-08	CHQ PAID-MICR CTS-NO-MANOJ KUMAR	0000000000000571	2019-11-16 08:03:34.463397	\N	\N	1	\N	1276	\N	10000	4	2	0
7291	2019-11-08	IMPS-931210196093-MANOJ -HDFC-XXXXXXXX8697-	0000931210196093	2019-11-16 08:03:34.463397	\N	\N	1	\N	1276	9965	\N	4	2	0
5285	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000631612	2019-11-16 07:47:15.638883	\N	\N	1	\N	1215	1779	\N	4	2	0
5299	2019-07-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042078	2019-11-16 07:47:15.638883	\N	\N	1	\N	102	15992	\N	4	2	0
5305	2019-07-01	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N182190255289867	N182190255289867	2019-11-16 07:47:15.638883	\N	\N	1	\N	1070	96831	\N	4	2	0
5343	2019-07-05	NEFT CR-SBIN0006070-FUTURE RETAIL LIMITED-J P ENTERPRISES-SBIN419186248449	SBIN419186248449	2019-11-16 07:47:15.638883	\N	\N	1	\N	852	173057.920000000013	\N	4	2	0
5359	2019-07-09	CHQ DEP - MICR CLG - NOIDA WBO	0000000000071740	2019-11-16 07:47:15.638883	\N	\N	1	\N	207	5264	\N	4	2	0
5365	2019-07-10	IMPS-919111515118-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-COLGATE	0000919111515118	2019-11-16 07:47:15.638883	\N	\N	1	\N	128	906	\N	4	2	0
5400	2019-07-18	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000010850	2019-11-16 07:47:15.638883	\N	\N	1	\N	97	150570	\N	4	2	0
5412	2019-07-20	IMPS-920111173937-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000920111173937	2019-11-16 07:47:15.638883	\N	\N	1	\N	586	16580	\N	4	2	0
5417	2019-07-23	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN219204851436	SBIN219204851436	2019-11-16 07:47:15.638883	\N	\N	1	\N	52	2030	\N	4	2	0
5453	2019-07-30	RTGS CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-YESBR52019073065382378	YESBR52019073065382378	2019-11-16 07:47:15.638883	\N	\N	1	\N	1070	203978	\N	4	2	0
5468	2019-07-31	IMPS-921211651616-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-COLGATE	0000921211651616	2019-11-16 07:47:15.638883	\N	\N	1	\N	128	1069	\N	4	2	0
5475	2019-08-01	RTGS CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-YESBR52019080165469765	YESBR52019080165469765	2019-11-16 07:47:15.638883	\N	\N	1	\N	1070	206103	\N	4	2	0
5529	2019-08-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000129015	2019-11-16 07:47:15.638883	\N	\N	1	\N	663	1191	\N	4	2	0
5535	2019-08-06	IMPS-921812926638-JAGROSHNI ENTERPRISE-HDFC-XXXXXXXXXXXXX0609-INETIMPS00009308948	0000921812926638	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	31314	\N	4	2	0
5582	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000259221	2019-11-16 07:47:15.638883	\N	\N	1	\N	616	10000	\N	4	2	0
5585	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009431	2019-11-16 07:47:15.638883	\N	\N	1	\N	105	26617	\N	4	2	0
5615	2019-08-16	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN219228064499	SBIN219228064499	2019-11-16 07:47:15.638883	\N	\N	1	\N	52	8550	\N	4	2	0
5638	2019-08-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000454370	2019-11-16 07:47:15.638883	\N	\N	1	\N	306	1446	\N	4	2	0
5659	2019-08-20	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19232004395	VIJBH19232004395	2019-11-16 07:47:15.638883	\N	\N	1	\N	471	19632	\N	4	2	0
5673	2019-08-21	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN419233549429	SBIN419233549429	2019-11-16 07:47:15.638883	\N	\N	1	\N	52	3409	\N	4	2	0
5695	2019-08-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001477	2019-11-16 07:47:15.638883	\N	\N	1	\N	1063	15000	\N	4	2	0
5702	2019-08-26	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019082692617052-RED BULL	HDFCR52019082692617052	2019-11-16 07:47:15.638883	\N	\N	1	\N	1251	\N	300000	4	2	0
5754	2019-08-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000718	2019-11-16 07:47:15.638883	\N	\N	1	\N	890	2879	\N	4	2	0
5752	2019-08-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000472	2019-11-16 07:47:15.638883	\N	\N	1	\N	9	6005	\N	4	2	0
5787	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000004000	2019-11-16 07:47:15.638883	\N	\N	1	\N	101	9876	\N	4	2	0
5808	2019-09-04	IMPS-924710637070-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-COLGATE	0000924710637070	2019-11-16 07:47:15.638883	\N	\N	1	\N	128	2168	\N	4	2	0
7322	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000351662	2019-11-16 08:03:34.463397	\N	\N	1	\N	508	13584	\N	4	2	0
7323	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000134957	2019-11-16 08:03:34.463397	\N	\N	1	\N	390	14253	\N	4	2	0
7324	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008179	2019-11-16 08:03:34.463397	\N	\N	1	\N	728	15999	\N	4	2	0
7325	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000154308	2019-11-16 08:03:34.463397	\N	\N	1	\N	304	18398	\N	4	2	0
7326	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000533435	2019-11-16 08:03:34.463397	\N	\N	1	\N	747	18528	\N	4	2	0
7327	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000102179	2019-11-16 08:03:34.463397	\N	\N	1	\N	1063	21817	\N	4	2	0
7328	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001487	2019-11-16 08:03:34.463397	\N	\N	1	\N	60	26262	\N	4	2	0
7329	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000129	2019-11-16 08:03:34.463397	\N	\N	1	\N	1262	28700	\N	4	2	0
7330	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000168	2019-11-16 08:03:34.463397	\N	\N	1	\N	72	30000	\N	4	2	0
7331	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000538199	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	35000	\N	4	2	0
7332	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000185848	2019-11-16 08:03:34.463397	\N	\N	1	\N	434	64113	\N	4	2	0
7340	2019-11-13	IMPS-931711483800-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-DABAR CHAVAN PIRASH	0000931711483800	2019-11-16 08:03:34.463397	\N	\N	1	\N	128	838	\N	4	2	0
7341	2019-11-13	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN219317437822	SBIN219317437822	2019-11-16 08:03:34.463397	\N	\N	1	\N	52	11963	\N	4	2	0
7343	2019-11-14	CHQ DEP RET CHGS 111119-MIR1931899064771	0000000000992857	2019-11-16 08:03:34.463397	\N	\N	1	\N	1246	\N	118	4	2	0
7342	2019-11-14	ACH D- MONDELEZ INDIA FOODS-DB37820344	0000003413630200	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	4057.86000000000013	4	2	0
7344	2019-11-14	50100051672149-TPT-DRAWINGS	0000000214257856	2019-11-16 08:03:34.463397	\N	\N	1	\N	1258	\N	25000	4	2	0
7345	2019-11-15	NEFT CR-INDB0000006-RAVINDRA NATH-JPENTERPRISES-000225163739	0000000225163739	2019-11-16 08:03:34.463397	\N	\N	1	\N	340	7000	\N	4	2	0
7346	2019-11-15	HB3142NR1000009999-STP-GODREJ	IB15120655103584	2019-11-16 08:03:34.463397	\N	\N	1	\N	1249	\N	365000	4	2	0
7347	2019-11-15	ACH D- MONDELEZ INDIA FOODS-DB37830537	0000003436034930	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	371890.340000000026	4	2	0
7334	2019-11-12	IMPS-931611432454-K K STORE-HDFC-XXXXXXXXXX1250-MB  TRANSFER TO JP	0000931611432454	2019-11-16 08:03:34.463397	\N	\N	1	\N	918	9647	\N	4	2	0
7333	2019-11-12	UPI-SHIV PRASAD UPADHYAY-USHIV84@OKICICI-ICIC0001031-931610315438-UPI	0000931610019428	2019-11-16 08:03:34.463397	\N	\N	1	\N	1245	13885	\N	4	2	0
7338	2019-11-12	POS 436303XXXXXX9204 VODAFONE MOBILE POS DEBIT	0000931607147275	2019-11-16 08:03:34.463397	\N	\N	1	\N	1258	\N	474.360000000000014	4	2	0
7339	2019-11-12	ACH D- MONDELEZ INDIA FOODS-DB37800613	0000003375133841	2019-11-16 08:03:34.463397	\N	\N	1	\N	1250	\N	877760.099999999977	4	2	0
7336	2019-11-12	POS 436303XXXXXX9204 UTTAR PRADESH PO POS DEBIT	0000931618392259	2019-11-16 08:03:34.463397	\N	\N	1	\N	1275	\N	778	4	2	0
7335	2019-11-12	POS 436303XXXXXX9204 UTTAR PRADESH PO POS DEBIT	0000931618391666	2019-11-16 08:03:34.463397	\N	\N	1	\N	1275	\N	1321	4	2	0
7337	2019-11-12	POS 436303XXXXXX9204 UTTAR PRADESH PO POS DEBIT	0000931618392871	2019-11-16 08:03:34.463397	\N	\N	1	\N	1275	\N	1494	4	2	0
5836	2019-09-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000468	2019-11-16 07:47:15.638883	\N	\N	1	\N	126	101558	\N	4	2	0
5865	2019-09-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000114	2019-11-16 07:47:15.638883	\N	\N	1	\N	72	11021	\N	4	2	0
5874	2019-09-11	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019091194941221-COLGATE	HDFCR52019091194941221	2019-11-16 07:47:15.638883	\N	\N	1	\N	1254	\N	245000	4	2	0
5922	2019-09-14	UPI-ASHWANI KUMAR VERMA-9971344900@YBL-YESB0000085-925748385994-PAYMENT FROM PHONE	0000925712815254	2019-11-16 07:47:15.638883	\N	\N	1	\N	4	1875	\N	4	2	0
5952	2019-09-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000631655	2019-11-16 07:47:15.638883	\N	\N	1	\N	62	6542	\N	4	2	0
5930	2019-09-16	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N259190287418237	N259190287418237	2019-11-16 07:47:15.638883	\N	\N	1	\N	1070	231393	\N	4	2	0
5983	2019-09-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000049127	2019-11-16 07:47:15.638883	\N	\N	1	\N	58	3632	\N	4	2	0
5981	2019-09-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132304	2019-11-16 07:47:15.638883	\N	\N	1	\N	64	12765	\N	4	2	0
5999	2019-09-20	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N263190932630765-RED BULL	N263190932630765	2019-11-16 07:47:15.638883	\N	\N	1	\N	1251	\N	100000	4	2	0
6041	2019-09-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000551029	2019-11-16 07:47:15.638883	\N	\N	1	\N	1270	3016	\N	4	2	0
6044	2019-09-24	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN119267228011	SBIN119267228011	2019-11-16 07:47:15.638883	\N	\N	1	\N	52	5607	\N	4	2	0
6091	2019-09-30	UPI-S KUMAR PROVISION AN-SONU.MITTAL100584@SBI-SBIN0008866-927312240836-PAY TO ACCOUNT XXX	0000927312455675	2019-11-16 07:47:15.638883	\N	\N	1	\N	758	6420	\N	4	2	0
6107	2019-09-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397578	2019-11-16 07:47:15.638883	\N	\N	1	\N	6	45505	\N	4	2	0
6883	2019-10-01	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN219274746098	SBIN219274746098	2019-11-16 08:03:34.463397	\N	\N	1	\N	52	439	\N	4	2	0
6912	2019-10-03	NEFT CR-YESB0000001-FRESHLEE RETAIL PRIVATE LIMITED-JP ENTERPRISES-N276190296153072	N276190296153072	2019-11-16 08:03:34.463397	\N	\N	1	\N	1070	185795	\N	4	2	0
6925	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000790	2019-11-16 08:03:34.463397	\N	\N	1	\N	1081	16455	\N	4	2	0
6924	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785667	2019-11-16 08:03:34.463397	\N	\N	1	\N	910	18309	\N	4	2	0
6950	2019-10-09	IMPS-928212119887-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-JP	0000928212119887	2019-11-16 08:03:34.463397	\N	\N	1	\N	586	8987	\N	4	2	0
6991	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000189	2019-11-16 08:03:34.463397	\N	\N	1	\N	231	2084	\N	4	2	0
6984	2019-10-10	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19283598637	IOBAN19283598637	2019-11-16 08:03:34.463397	\N	\N	1	\N	30	3529	\N	4	2	0
7039	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000451733	2019-11-16 08:03:34.463397	\N	\N	1	\N	306	2119	\N	4	2	0
7020	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000473195	2019-11-16 08:03:34.463397	\N	\N	1	\N	46	53032	\N	4	2	0
7062	2019-10-16	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN119289141709	SBIN119289141709	2019-11-16 08:03:34.463397	\N	\N	1	\N	52	1654	\N	4	2	0
7093	2019-10-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136211	2019-11-16 08:03:34.463397	\N	\N	1	\N	68	4436	\N	4	2	0
7121	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000929607	2019-11-16 08:03:34.463397	\N	\N	1	\N	28	6547	\N	4	2	0
7153	2019-10-24	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19297087341	IOBAN19297087341	2019-11-16 08:03:34.463397	\N	\N	1	\N	30	1186	\N	4	2	0
7171	2019-10-25	NEFT CR-BKID0007120-KHUSHI ENTERPRISES-JP ENTERPRISES-BKIDN19298551457	BKIDN19298551457	2019-11-16 08:03:34.463397	\N	\N	1	\N	656	300000	\N	4	2	0
7213	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000074	2019-11-16 08:03:34.463397	\N	\N	1	\N	1064	38100	\N	4	2	0
7210	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001067	2019-11-16 08:03:34.463397	\N	\N	1	\N	98	70992	\N	4	2	0
7236	2019-11-02	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019110252714040-COLGATE	HDFCR52019110252714040	2019-11-16 08:03:34.463397	\N	\N	1	\N	1254	\N	453359.359999999986	4	2	0
7266	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000294884	2019-11-16 08:03:34.463397	\N	\N	1	\N	24	10000	\N	4	2	0
7277	2019-11-05	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN319309257494	SBIN319309257494	2019-11-16 08:03:34.463397	\N	\N	1	\N	52	9870	\N	4	2	0
7321	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000407575	2019-11-16 08:03:34.463397	\N	\N	1	\N	1129	2276	\N	4	2	0
6148	2019-04-17	IMPS-910711290681-37774768-HDFC-XXXXXXXX0859-	0000910711290681	2019-11-16 07:57:42.531945	\N	\N	1	\N	1245	14447	\N	5	2	0
6161	2019-04-23	UPI-PRAVEEN KUMAR-PRAVEENKUMARBHRUV1234@OKAXIS-UTIB0000624-911313285419-UPI	0000911313276809	2019-11-16 07:57:42.531945	\N	\N	1	\N	50	9059	\N	5	2	0
6206	2019-05-15	CHQ PAID-MICR CTS-NO-LIC OF INIA	0000000000000111	2019-11-16 07:57:42.531945	\N	\N	1	\N	1277	\N	21097	5	2	0
6224	2019-05-29	NEFT CR-BARB0SURGAU-GOYAL TRADERS-J P ENTERPRISES-BARBU19149515865	BARBU19149515865	2019-11-16 07:57:42.531945	\N	\N	1	\N	920	10690	\N	5	2	0
6254	2019-06-14	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019061482545265-GODREJ	HDFCR52019061482545265	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	216000	5	2	0
6260	2019-06-19	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019061983304537-RED BULL	HDFCR52019061983304537	2019-11-16 07:57:42.531945	\N	\N	1	\N	1251	\N	200000	5	2	0
6261	2019-06-19	IMPS-917016346729-AMIR -HDFC-XXXXXXXX7977-	0000917016346729	2019-11-16 07:57:42.531945	\N	\N	1	\N	782	12000	\N	5	2	0
6291	2019-07-08	NEFT CR-UTIB0000066-AIRPLAZA RETAIL HOLDINGS PVT LTD F-J P  ENTERPRISES-AXISP00060514902	AXISP00060514902	2019-11-16 07:57:42.531945	\N	\N	1	\N	1223	108279	\N	5	2	0
6326	2019-07-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000692853	2019-11-16 07:57:42.531945	\N	\N	1	\N	63	2296	\N	5	2	0
6344	2019-07-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001084	2019-11-16 07:57:42.531945	\N	\N	1	\N	12	19452	\N	5	2	0
6373	2019-07-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000407479	2019-11-16 07:57:42.531945	\N	\N	1	\N	1129	2706	\N	5	2	0
6398	2019-07-18	UPI-RAJEEV KUMAR CHAURAS-RAJEEVCHAURASIYA1@OKICICI-PUNB0160300-919912203839-UPI	0000919912013277	2019-11-16 07:57:42.531945	\N	\N	1	\N	1288	5000	\N	5	2	0
6431	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000003879	2019-11-16 07:57:42.531945	\N	\N	1	\N	101	1810	\N	5	2	0
6435	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000263268	2019-11-16 07:57:42.531945	\N	\N	1	\N	1125	3863	\N	5	2	0
6452	2019-07-24	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N205190883156817-COLGATE	N205190883156817	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	15000	5	2	0
5189	2019-04-12	NEFT CR-BARB0SURGAU-SWASTIK SUPER BAZAR-TUSHAR TRADING CO-BARBX19102884628	BARBX19102884628	2019-11-16 07:26:20.885476	\N	\N	1	\N	628	13369	\N	3	1	0
6491	2019-07-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000998	2019-11-16 07:57:42.531945	\N	\N	1	\N	1161	1717	\N	5	2	0
6487	2019-07-29	CHQ DEP RET CHGS 240719-MIR1920878538556	0000000000372952	2019-11-16 07:57:42.531945	\N	\N	1	\N	1246	\N	118	5	2	0
6543	2019-08-11	UPI-AJAB SINGH-9891913099@PAYTM-PYTM0123456-922335849714-NA	0000922311123782	2019-11-16 07:57:42.531945	\N	\N	1	\N	1296	5500	\N	5	2	0
6550	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000267268	2019-11-16 07:57:42.531945	\N	\N	1	\N	1142	1559	\N	5	2	0
6554	2019-08-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000711	2019-11-16 07:57:42.531945	\N	\N	1	\N	1125	6042	\N	5	2	0
6588	2019-08-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000009485	2019-11-16 07:57:42.531945	\N	\N	1	\N	105	47402	\N	5	2	0
6606	2019-08-20	IMPS-923218198496-ANUPAM KUMARI-HDFC-XXXXXX2480-COMMENTS	0000923218198496	2019-11-16 07:57:42.531945	\N	\N	1	\N	1284	6500	\N	5	2	0
6614	2019-08-26	NEFT CR-ORBC0101228-APNA STORES-J P ENTERPRISES-SAA73864773	00000SAA73864773	2019-11-16 07:57:42.531945	\N	\N	1	\N	24	7930	\N	5	2	0
6650	2019-08-28	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019082892994787-COLGATE	HDFCR52019082892994787	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	472000	5	2	0
6658	2019-08-31	NEFT CR-UTIB0000066-AIRPLAZA RETAIL HOLDINGS PVT LTD F-J P  ENTERPRISES-AXISP00068786495	AXISP00068786495	2019-11-16 07:57:42.531945	\N	\N	1	\N	1223	51525	\N	5	2	0
6671	2019-09-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133478	2019-11-16 07:57:42.531945	\N	\N	1	\N	56	25461	\N	5	2	0
6700	2019-09-07	NEFT DR-DEUT0537PUN-FERRERO INDIA PVT LTD-NETBANK, MUM-N250190921893140-FERRERO	N250190921893140	2019-11-16 07:57:42.531945	\N	\N	1	\N	1253	\N	150000	5	2	0
6713	2019-09-14	50100051672149-TPT-DRAWINGS	0000000316451610	2019-11-16 07:57:42.531945	\N	\N	1	\N	1258	\N	25000	5	2	0
6714	2019-09-16	IMPS-925911706194-LIFE CARE PHARMACY-HDFC-XXXXXXXXXXXX0593-	0000925911706194	2019-11-16 07:57:42.531945	\N	\N	1	\N	1125	1143	\N	5	2	0
6743	2019-10-01	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N274190941933428-COLGATE	N274190941933428	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	491000	5	2	0
6764	2019-10-11	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-928405150337-BHARATPE9020004894	0000092845752714	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	14415	\N	5	2	0
6796	2019-10-31	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-930403204052-BHARATPE9020004894	0000093043983813	2019-11-16 07:57:42.531945	\N	\N	1	\N	1307	10322	\N	5	2	0
6817	2019-11-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000723835	2019-11-16 07:57:42.531945	\N	\N	1	\N	1125	2219	\N	5	2	0
6819	2019-11-06	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000011017	2019-11-16 07:57:42.531945	\N	\N	1	\N	97	70000	\N	5	2	0
6852	2019-11-13	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019111354172061-COLGATE	HDFCR52019111354172061	2019-11-16 07:57:42.531945	\N	\N	1	\N	1254	\N	205000	5	2	0
1710	2019-05-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036668	2019-10-01 23:34:09.331984	\N	\N	1	\N	784	11251	\N	2	1	0
2029	2019-07-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000558159	2019-10-01 23:34:09.331984	\N	\N	1	\N	790	13420	\N	2	1	0
2153	2019-08-22	NEFT CR-SBIN0003342-RAMA PROVISION STORE-TUSHAR TRADING CO-SBIN419234958408	SBIN419234958408	2019-10-01 23:34:09.331984	\N	\N	1	\N	462	120026	\N	2	1	0
2199	2019-09-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042714	2019-10-01 23:34:09.331984	\N	\N	1	\N	97	9148	\N	2	1	0
2227	2019-09-06	IMPS-924909275164-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TUSHAR	0000924909275164	2019-10-01 23:34:09.331984	\N	\N	1	\N	632	5120	\N	2	1	0
2257	2019-09-12	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000188	2019-10-01 23:34:09.331984	\N	\N	1	\N	797	1071	\N	2	1	0
2268	2019-09-16	NEFT CR-ICIC0001917-SUNIL KIRANA STORE-TUSHAR TRADING COMPANY-000073425125	0000000073425125	2019-10-01 23:34:09.331984	\N	\N	1	\N	619	56357	\N	2	1	0
2317	2019-09-26	UPI-VIKAS KUMAR SO PRASA-9953904863@PAYTM-CORP0003167-926937630924-NA	0000926913004495	2019-10-01 23:34:09.331984	\N	\N	1	\N	800	2600	\N	2	1	0
5209	2019-05-26	IMPS-914610719268-SANGRAM TRADING AND -HDFC-XXXXXXXX1071-BILL PAYMENT TUSAR AGENCY	0000914610719268	2019-11-16 07:26:20.885476	\N	\N	1	\N	807	41853	\N	3	1	0
5242	2019-07-15	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-HDFCR52019071586971360-COLGATE	HDFCR52019071586971360	2019-11-16 07:26:20.885476	\N	\N	1	\N	764	\N	225000	3	1	0
7350	2019-11-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000327757	2019-12-09 07:30:11.228434	\N	\N	1	\N	1051	7810	\N	4	2	0
7351	2019-11-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136272	2019-12-09 07:30:11.228434	\N	\N	1	\N	75	9552	\N	4	2	0
7348	2019-11-16	FT - CR - 50200031829519 - PAWAN CHAURASIA PAAN SHOP	0000000000000213	2019-12-09 07:30:11.228434	\N	\N	1	\N	431	12428	\N	4	2	0
7352	2019-11-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002099	2019-12-09 07:30:11.228434	\N	\N	1	\N	67	16050	\N	4	2	0
7353	2019-11-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000273509	2019-12-09 07:30:11.228434	\N	\N	1	\N	42	17047	\N	4	2	0
7354	2019-11-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137952	2019-12-09 07:30:11.228434	\N	\N	1	\N	68	18832	\N	4	2	0
7355	2019-11-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001991	2019-12-09 07:30:11.228434	\N	\N	1	\N	81	34500	\N	4	2	0
7356	2019-11-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000796	2019-12-09 07:30:11.228434	\N	\N	1	\N	391	41969	\N	4	2	0
7357	2019-11-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000211473	2019-12-09 07:30:11.228434	\N	\N	1	\N	246	88543	\N	4	2	0
7349	2019-11-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000340071	2019-12-09 07:30:11.228434	\N	\N	1	\N	78	102628	\N	4	2	0
7368	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000533443	2019-12-09 07:30:11.228434	\N	\N	1	\N	747	6974	\N	4	2	0
7358	2019-11-16	50200004799122-TPT-J P 20 26OCT 4NOV	0000000135999615	2019-12-09 07:30:11.228434	\N	\N	1	\N	94	105714	\N	4	2	0
7367	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000204738	2019-12-09 07:30:11.228434	\N	\N	1	\N	28	7122	\N	4	2	0
7366	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000004227	2019-12-09 07:30:11.228434	\N	\N	1	\N	101	7353	\N	4	2	0
7361	2019-11-18	NEFT CR-UTBI0GND561-ANTARIKSH ENTERPRISES-J P ENTERPRISES-UTBIN19322040562	UTBIN19322040562	2019-12-09 07:30:11.228434	\N	\N	1	\N	513	8000	\N	4	2	0
7360	2019-11-18	FT - CR - 50100256958061 - MANVENDRA SINGH	0000000000000029	2019-12-09 07:30:11.228434	\N	\N	1	\N	1310	8061	\N	4	2	0
7365	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000131997	2019-12-09 07:30:11.228434	\N	\N	1	\N	71	9539	\N	4	2	0
7364	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000030461	2019-12-09 07:30:11.228434	\N	\N	1	\N	24	9862	\N	4	2	0
7363	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000030455	2019-12-09 07:30:11.228434	\N	\N	1	\N	24	10061	\N	4	2	0
7362	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000162020	2019-12-09 07:30:11.228434	\N	\N	1	\N	34	10309	\N	4	2	0
7369	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000551	2019-12-09 07:30:11.228434	\N	\N	1	\N	1301	39647	\N	4	2	0
7370	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000642808	2019-12-09 07:30:11.228434	\N	\N	1	\N	1049	49223	\N	4	2	0
7371	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000271061	2019-12-09 07:30:11.228434	\N	\N	1	\N	19	64797	\N	4	2	0
7359	2019-11-18	ACH D- MONDELEZ INDIA FOODS-DB37850324	0000003471486548	2019-12-09 07:30:11.228434	\N	\N	1	\N	1250	\N	192649.589999999997	4	2	0
7374	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000046887	2019-12-09 07:30:11.228434	\N	\N	1	\N	5	14896	\N	4	2	0
7375	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001150	2019-12-09 07:30:11.228434	\N	\N	1	\N	95	14999	\N	4	2	0
7376	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672943	2019-12-09 07:30:11.228434	\N	\N	1	\N	1260	15697	\N	4	2	0
7378	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000170	2019-12-09 07:30:11.228434	\N	\N	1	\N	72	19918	\N	4	2	0
7379	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000080	2019-12-09 07:30:11.228434	\N	\N	1	\N	1064	23792	\N	4	2	0
7380	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000824591	2019-12-09 07:30:11.228434	\N	\N	1	\N	60	25114	\N	4	2	0
7381	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000006864	2019-12-09 07:30:11.228434	\N	\N	1	\N	31	29226	\N	4	2	0
7372	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000642801	2019-12-09 07:30:11.228434	\N	\N	1	\N	1049	95947	\N	4	2	0
7387	2019-11-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000723852	2019-12-09 07:30:11.228434	\N	\N	1	\N	42	2861	\N	4	2	0
7383	2019-11-19	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN119323592559	SBIN119323592559	2019-12-09 07:30:11.228434	\N	\N	1	\N	52	4722	\N	4	2	0
7388	2019-11-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001425	2019-12-09 07:30:11.228434	\N	\N	1	\N	1240	8219	\N	4	2	0
7389	2019-11-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000545	2019-12-09 07:30:11.228434	\N	\N	1	\N	1087	9696	\N	4	2	0
7390	2019-11-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000738	2019-12-09 07:30:11.228434	\N	\N	1	\N	42	10017	\N	4	2	0
7391	2019-11-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000070	2019-12-09 07:30:11.228434	\N	\N	1	\N	313	33444	\N	4	2	0
7385	2019-11-19	CHQ DEP RET- CONNECTIVITY NOT ESTABLISHE	0000000000204738	2019-12-09 07:30:11.228434	\N	\N	1	\N	28	\N	7122	4	2	0
7384	2019-11-19	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000131997	2019-12-09 07:30:11.228434	\N	\N	1	\N	71	\N	9539	4	2	0
7386	2019-11-19	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000551	2019-12-09 07:30:11.228434	\N	\N	1	\N	1301	\N	39647	4	2	0
7394	2019-11-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000932324	2019-12-09 07:30:11.228434	\N	\N	1	\N	1270	3353	\N	4	2	0
7393	2019-11-20	CHQ DEP - MICR - MICR CLG - NOIDA WBO	0000000000204738	2019-12-09 07:30:11.228434	\N	\N	1	\N	28	7122	\N	4	2	0
7395	2019-11-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133702	2019-12-09 07:30:11.228434	\N	\N	1	\N	685	10323	\N	4	2	0
7396	2019-11-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136184	2019-12-09 07:30:11.228434	\N	\N	1	\N	55	11156	\N	4	2	0
7397	2019-11-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000898455	2019-12-09 07:30:11.228434	\N	\N	1	\N	109	15316	\N	4	2	0
7398	2019-11-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000881089	2019-12-09 07:30:11.228434	\N	\N	1	\N	83	16604	\N	4	2	0
7399	2019-11-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000215142	2019-12-09 07:30:11.228434	\N	\N	1	\N	1192	17734	\N	4	2	0
7400	2019-11-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000038923	2019-12-09 07:30:11.228434	\N	\N	1	\N	1216	20000	\N	4	2	0
7392	2019-11-20	50200006539210-TPT-JP CA TO TUSHAR CA	0000000269630108	2019-12-09 07:30:11.228434	\N	\N	1	\N	1245	\N	100000	4	2	0
7407	2019-11-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826785	2019-12-09 07:30:11.228434	\N	\N	1	\N	858	2345	\N	4	2	0
7408	2019-11-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000146	2019-12-09 07:30:11.228434	\N	\N	1	\N	1196	2613	\N	4	2	0
7401	2019-11-21	NEFT CR-IOBA0001556-M/S PAWAN MEDICAL STORE-JP ENTERPRISES-IOBAN19325611144	IOBAN19325611144	2019-12-09 07:30:11.228434	\N	\N	1	\N	30	3204	\N	4	2	0
7409	2019-11-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000141339	2019-12-09 07:30:11.228434	\N	\N	1	\N	1040	3868	\N	4	2	0
7410	2019-11-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000200	2019-12-09 07:30:11.228434	\N	\N	1	\N	231	11311	\N	4	2	0
7411	2019-11-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000127	2019-12-09 07:30:11.228434	\N	\N	1	\N	1090	16000	\N	4	2	0
7403	2019-11-21	CHQ DEP RET CHGS 191119-MIR1932520704808	0000000000131997	2019-12-09 07:30:11.228434	\N	\N	1	\N	1246	\N	118	4	2	0
7402	2019-11-21	CHQ DEP RET CHGS 191119-MIR1932520660467	0000000000000551	2019-12-09 07:30:11.228434	\N	\N	1	\N	1246	\N	118	4	2	0
7405	2019-11-21	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000204738	2019-12-09 07:30:11.228434	\N	\N	1	\N	28	\N	7122	4	2	0
7404	2019-11-21	ACH D- MONDELEZ INDIA FOODS-DB37890289	0000003525941299	2019-12-09 07:30:11.228434	\N	\N	1	\N	1250	\N	872472.579999999958	4	2	0
7419	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000310120	2019-12-09 07:30:11.228434	\N	\N	1	\N	87	3018	\N	4	2	0
7420	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000195286	2019-12-09 07:30:11.228434	\N	\N	1	\N	28	4339	\N	4	2	0
7421	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000293159	2019-12-09 07:30:11.228434	\N	\N	1	\N	1311	6200	\N	4	2	0
7413	2019-11-22	NEFT CR-INDB0000006-RAVINDRA NATH-JPENTERPRISES-000226473790	0000000226473790	2019-12-09 07:30:11.228434	\N	\N	1	\N	340	7000	\N	4	2	0
7416	2019-11-22	UPI-ASHWANI KUMAR VERMA-9971344900@YBL-YESB0000085-932636352536-PAYMENT FROM PHONE	0000932618039179	2019-12-09 07:30:11.228434	\N	\N	1	\N	1312	7164	\N	4	2	0
7422	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001026	2019-12-09 07:30:11.228434	\N	\N	1	\N	73	7257	\N	4	2	0
7423	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000467994	2019-12-09 07:30:11.228434	\N	\N	1	\N	58	8196	\N	4	2	0
7424	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000533449	2019-12-09 07:30:11.228434	\N	\N	1	\N	747	8252	\N	4	2	0
7425	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001513	2019-12-09 07:30:11.228434	\N	\N	1	\N	140	9085	\N	4	2	0
7415	2019-11-22	UPI-GUPTA GROCERY STORE-8744800800@YBL-BARB0GNOIDA-932654478088-PAYMENT FROM PHONE	0000932618878732	2019-12-09 07:30:11.228434	\N	\N	1	\N	12	10000	\N	4	2	0
7426	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382389	2019-12-09 07:30:11.228434	\N	\N	1	\N	773	13202	\N	4	2	0
7427	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000340083	2019-12-09 07:30:11.228434	\N	\N	1	\N	78	14791	\N	4	2	0
7412	2019-11-22	IMPS-932610155117-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARG	0000932610155117	2019-12-09 07:30:11.228434	\N	\N	1	\N	586	19386	\N	4	2	0
7428	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785711	2019-12-09 07:30:11.228434	\N	\N	1	\N	910	21388	\N	4	2	0
7417	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000010167	2019-12-09 07:30:11.228434	\N	\N	1	\N	105	64977	\N	4	2	0
7418	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000458514	2019-12-09 07:30:11.228434	\N	\N	1	\N	91	83715	\N	4	2	0
7414	2019-11-22	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000127	2019-12-09 07:30:11.228434	\N	\N	1	\N	1245	\N	16000	4	2	0
7382	2019-11-19	NEFT CR-UTIB0000624-MITTAL TRADERS-J P ENTERPRISES-AXMB193231489134	AXMB193231489134	2019-12-09 07:30:11.228434	\N	\N	1	\N	359	41133	\N	4	2	0
7430	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000133354	2019-12-09 07:30:11.228434	\N	\N	1	\N	6	53664	\N	4	2	0
7431	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992870	2019-12-09 07:30:11.228434	\N	\N	1	\N	23	62033	\N	4	2	0
7464	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000932344	2019-12-09 07:30:11.228434	\N	\N	1	\N	1270	1925	\N	4	2	0
7463	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137038	2019-12-09 07:30:11.228434	\N	\N	1	\N	663	2857	\N	4	2	0
7432	2019-11-25	UPI-LAXMI KUMARI-9650834417@YBL-PUNB0447600-932911814847-PAYMENT FROM PHONE	0000932911369186	2019-12-09 07:30:11.228434	\N	\N	1	\N	1313	4000	\N	4	2	0
7462	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000266	2019-12-09 07:30:11.228434	\N	\N	1	\N	705	4539	\N	4	2	0
7461	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000062777	2019-12-09 07:30:11.228434	\N	\N	1	\N	32	4916	\N	4	2	0
7460	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000135835	2019-12-09 07:30:11.228434	\N	\N	1	\N	89	5007	\N	4	2	0
7459	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000556893	2019-12-09 07:30:11.228434	\N	\N	1	\N	553	5387	\N	4	2	0
7458	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000004242	2019-12-09 07:30:11.228434	\N	\N	1	\N	101	6653	\N	4	2	0
7457	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000395	2019-12-09 07:30:11.228434	\N	\N	1	\N	1066	7488	\N	4	2	0
7456	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000221	2019-12-09 07:30:11.228434	\N	\N	1	\N	1039	7823	\N	4	2	0
7455	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155573	2019-12-09 07:30:11.228434	\N	\N	1	\N	512	10000	\N	4	2	0
7454	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000590717	2019-12-09 07:30:11.228434	\N	\N	1	\N	1175	10000	\N	4	2	0
7451	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000030466	2019-12-09 07:30:11.228434	\N	\N	1	\N	24	14291	\N	4	2	0
7450	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000576	2019-12-09 07:30:11.228434	\N	\N	1	\N	1083	14764	\N	4	2	0
7452	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000232	2019-12-09 07:30:11.228434	\N	\N	1	\N	72	13693	\N	4	2	0
7449	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000006874	2019-12-09 07:30:11.228434	\N	\N	1	\N	31	15794	\N	4	2	0
7447	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000824613	2019-12-09 07:30:11.228434	\N	\N	1	\N	60	17720	\N	4	2	0
7448	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000161	2019-12-09 07:30:11.228434	\N	\N	1	\N	551	16732	\N	4	2	0
7446	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000154320	2019-12-09 07:30:11.228434	\N	\N	1	\N	304	19200	\N	4	2	0
7445	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000162021	2019-12-09 07:30:11.228434	\N	\N	1	\N	34	19728	\N	4	2	0
7444	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000795620	2019-12-09 07:30:11.228434	\N	\N	1	\N	1215	20195	\N	4	2	0
7437	2019-11-25	NEFT CR-SYNB0008690-K K STORE-J P ENTERPRISES-P19112510384034	0P19112510384034	2019-12-09 07:30:11.228434	\N	\N	1	\N	918	21435	\N	4	2	0
7443	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024263	2019-12-09 07:30:11.228434	\N	\N	1	\N	700	22500	\N	4	2	0
7442	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002104	2019-12-09 07:30:11.228434	\N	\N	1	\N	67	24327	\N	4	2	0
7441	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019448	2019-12-09 07:30:11.228434	\N	\N	1	\N	102	24831	\N	4	2	0
7440	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002024	2019-12-09 07:30:11.228434	\N	\N	1	\N	81	33575	\N	4	2	0
7439	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019446	2019-12-09 07:30:11.228434	\N	\N	1	\N	102	41790	\N	4	2	0
7435	2019-11-25	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19329006599	VIJBH19329006599	2019-12-09 07:30:11.228434	\N	\N	1	\N	471	44951	\N	4	2	0
7438	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000138301	2019-12-09 07:30:11.228434	\N	\N	1	\N	56	66649	\N	4	2	0
7433	2019-11-25	CHQ DEP RET CHGS 211119-MIR1932726486105	0000000000204738	2019-12-09 07:30:11.228434	\N	\N	1	\N	1246	\N	118	4	2	0
7434	2019-11-25	CHQ DEP RET CHGS 221119-MIR1932726938027	0000000000000127	2019-12-09 07:30:11.228434	\N	\N	1	\N	1246	\N	118	4	2	0
7436	2019-11-25	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000024262	2019-12-09 07:30:11.228434	\N	\N	1	\N	700	\N	22500	4	2	0
7472	2019-11-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000367	2019-12-09 07:30:11.228434	\N	\N	1	\N	78	5876	\N	4	2	0
7473	2019-11-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000898458	2019-12-09 07:30:11.228434	\N	\N	1	\N	109	6103	\N	4	2	0
7466	2019-11-26	NEFT CR-SYNB0009451-DS ASSOCIATES-JP ENTERPRISES-P19112610519757	0P19112610519757	2019-12-09 07:30:11.228434	\N	\N	1	\N	1314	6380	\N	4	2	0
7474	2019-11-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000074	2019-12-09 07:30:11.228434	\N	\N	1	\N	313	12602	\N	4	2	0
7468	2019-11-26	NEFT CR-UBIN0560430-GSS TRADING CO-J P ENTERPRISES-000056292251	0000000056292251	2019-12-09 07:30:11.228434	\N	\N	1	\N	632	23426	\N	4	2	0
7475	2019-11-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001523	2019-12-09 07:30:11.228434	\N	\N	1	\N	1063	20000	\N	4	2	0
7470	2019-11-26	FT - CR - 50100205755921 - PREETI SINGH	0000000000000058	2019-12-09 07:30:11.228434	\N	\N	1	\N	1315	20000	\N	4	2	0
7469	2019-11-26	50200004799122-TPT-JP ENT 11 18NOV-9 TO 9 MERCATO	0000000134792386	2019-12-09 07:30:11.228434	\N	\N	1	\N	94	24616	\N	4	2	0
7476	2019-11-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000538205	2019-12-09 07:30:11.228434	\N	\N	1	\N	328	33224	\N	4	2	0
7477	2019-11-26	NEFT CR-SBIN0006070-FUTURE RETAIL LIMITED-J P ENTERPRISES-SBIN219330617018	SBIN219330617018	2019-12-09 07:30:11.228434	\N	\N	1	\N	1224	343666.789999999979	\N	4	2	0
7478	2019-11-26	POS 436303XXXXXX9204 UDUPI KRISHNA RE	0000933016000921	2019-12-09 07:30:11.228434	\N	\N	1	\N	1245	\N	1360	4	2	0
7467	2019-11-26	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000155573	2019-12-09 07:30:11.228434	\N	\N	1	\N	512	\N	10000	4	2	0
7465	2019-11-26	ACH D- MONDELEZ INDIA FOODS-DB37940649	0000003614061092	2019-12-09 07:30:11.228434	\N	\N	1	\N	1250	\N	395914.580000000016	4	2	0
7480	2019-11-27	50200027549434-TPT-J P BILL NO 5627-HARSHIT TRADERS	0000000141135863	2019-12-09 07:30:11.228434	\N	\N	1	\N	1108	1472	\N	4	2	0
7483	2019-11-27	NEFT CR-BARB0KHURJA-J K TRADERS-J P ENTERPRISES-BARBW19331861253	BARBW19331861253	2019-12-09 07:30:11.228434	\N	\N	1	\N	1316	102500	\N	4	2	0
7484	2019-11-27	CHQ DEP RET CHGS 251119-MIR1933130667543	0000000000024262	2019-12-09 07:30:11.228434	\N	\N	1	\N	1246	\N	118	4	2	0
7479	2019-11-27	NEFT DR-ORBC0100616-SHRI TRADING COMPANY-NETBANK, MUM-N331190991255945-SHRI TRADING COMPA	N331190991255945	2019-12-09 07:30:11.228434	\N	\N	1	\N	1317	\N	100000	4	2	0
7481	2019-11-27	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-N331190991413091-COLGATE	N331190991413091	2019-12-09 07:30:11.228434	\N	\N	1	\N	1254	\N	182000	4	2	0
7482	2019-11-27	N3058220156601310-STP-DABUR HPC	IB27164549987242	2019-12-09 07:30:11.228434	\N	\N	1	\N	1255	\N	230000	4	2	0
7485	2019-11-27	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19331004474	VIJBH19331004474	2019-12-09 07:30:11.228434	\N	\N	1	\N	471	8801	\N	4	2	0
7487	2019-11-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000422083	2019-12-09 07:30:11.228434	\N	\N	1	\N	114	26715	\N	4	2	0
7491	2019-11-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000310126	2019-12-09 07:30:11.228434	\N	\N	1	\N	87	3243	\N	4	2	0
7492	2019-11-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000422084	2019-12-09 07:30:11.228434	\N	\N	1	\N	1192	9359	\N	4	2	0
7493	2019-11-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000516	2019-12-09 07:30:11.228434	\N	\N	1	\N	616	10000	\N	4	2	0
7494	2019-11-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000253538	2019-12-09 07:30:11.228434	\N	\N	1	\N	83	11258	\N	4	2	0
7495	2019-11-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000007574	2019-12-09 07:30:11.228434	\N	\N	1	\N	514	13400	\N	4	2	0
7496	2019-11-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001524	2019-12-09 07:30:11.228434	\N	\N	1	\N	1063	20000	\N	4	2	0
7497	2019-11-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000243	2019-12-09 07:30:11.228434	\N	\N	1	\N	71	23554	\N	4	2	0
7489	2019-11-28	CHQ DEP RET CHGS 261119-MIR1933234502742	0000000000155573	2019-12-09 07:30:11.228434	\N	\N	1	\N	1246	\N	118	4	2	0
7488	2019-11-28	N3058220156601330-STP-DABUR HC	IB28132631779654	2019-12-09 07:30:11.228434	\N	\N	1	\N	1255	\N	250000	4	2	0
7490	2019-11-28	ACH D- MONDELEZ INDIA FOODS-DB37960422	0000003655982060	2019-12-09 07:30:11.228434	\N	\N	1	\N	1250	\N	378931.780000000028	4	2	0
7505	2019-11-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826758	2019-12-09 07:30:11.228434	\N	\N	1	\N	858	3780	\N	4	2	0
7506	2019-11-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000159914	2019-12-09 07:30:11.228434	\N	\N	1	\N	595	5145	\N	4	2	0
7501	2019-11-29	IMPS-933313139197-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARG	0000933313139197	2019-12-09 07:30:11.228434	\N	\N	1	\N	586	6219	\N	4	2	0
7507	2019-11-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672970	2019-12-09 07:30:11.228434	\N	\N	1	\N	1260	6282	\N	4	2	0
7508	2019-11-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000108918	2019-12-09 07:30:11.228434	\N	\N	1	\N	1049	7565	\N	4	2	0
7499	2019-11-29	NEFT CR-INDB0000006-RAVINDRA NATH-JPENTERPRISES-000227742899	0000000227742899	2019-12-09 07:30:11.228434	\N	\N	1	\N	340	11000	\N	4	2	0
7509	2019-11-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001525	2019-12-09 07:30:11.228434	\N	\N	1	\N	1063	20187	\N	4	2	0
7500	2019-11-29	FT - CR - 28458620000010 - EVERY DAY SHOPPING MART PVT LTD	0000000000011123	2019-12-09 07:30:11.228434	\N	\N	1	\N	97	200000	\N	4	2	0
7510	2019-11-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000992879	2019-12-09 07:30:11.228434	\N	\N	1	\N	23	22442	\N	4	2	0
7511	2019-11-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000340111	2019-12-09 07:30:11.228434	\N	\N	1	\N	78	25599	\N	4	2	0
7502	2019-11-29	NEFT CR-UTIB0000624-SHRI JEE GENERAL STORE-JAYPEE ENTERPRISES-AXMB193334190726	AXMB193334190726	2019-12-09 07:30:11.228434	\N	\N	1	\N	365	29125	\N	4	2	0
7504	2019-11-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000573	2019-12-09 07:30:11.228434	\N	\N	1	\N	126	116482	\N	4	2	0
7503	2019-11-29	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000243	2019-12-09 07:30:11.228434	\N	\N	1	\N	71	\N	23554	4	2	0
7523	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001048	2019-12-09 07:30:11.228434	\N	\N	1	\N	73	6765	\N	4	2	0
7522	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000327770	2019-12-09 07:30:11.228434	\N	\N	1	\N	1051	8000	\N	4	2	0
7521	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000590718	2019-12-09 07:30:11.228434	\N	\N	1	\N	1175	8163	\N	4	2	0
7524	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137971	2019-12-09 07:30:11.228434	\N	\N	1	\N	68	8319	\N	4	2	0
7514	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000030	2019-12-09 07:30:11.228434	\N	\N	1	\N	553	13968	\N	4	2	0
7516	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000132	2019-12-09 07:30:11.228434	\N	\N	1	\N	1090	20290	\N	4	2	0
7518	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000166494	2019-12-09 07:30:11.228434	\N	\N	1	\N	14	24857	\N	4	2	0
7517	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000010218	2019-12-09 07:30:11.228434	\N	\N	1	\N	105	41025	\N	4	2	0
7520	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000002042	2019-12-09 07:30:11.228434	\N	\N	1	\N	81	68630	\N	4	2	0
7519	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000260295	2019-12-09 07:30:11.228434	\N	\N	1	\N	1131	77284	\N	4	2	0
7515	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000458529	2019-12-09 07:30:11.228434	\N	\N	1	\N	91	79469	\N	4	2	0
7513	2019-11-30	8202171467-27 11 2019-HD03123849	0000911279843960	2019-12-09 07:30:11.228434	\N	\N	1	\N	1245	81596.679999999993	\N	4	2	0
7512	2019-11-30	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019113057184898-COLGATE	HDFCR52019113057184898	2019-12-09 07:30:11.228434	\N	\N	1	\N	1254	\N	200000	4	2	0
7529	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000556899	2019-12-09 07:30:11.228434	\N	\N	1	\N	553	1278	\N	4	2	0
7531	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000275	2019-12-09 07:30:11.228434	\N	\N	1	\N	501	3500	\N	4	2	0
7530	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000407590	2019-12-09 07:30:11.228434	\N	\N	1	\N	1129	4525	\N	4	2	0
7534	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000517	2019-12-09 07:30:11.228434	\N	\N	1	\N	616	5602	\N	4	2	0
7532	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000510500	2019-12-09 07:30:11.228434	\N	\N	1	\N	705	6923	\N	4	2	0
7533	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044440	2019-12-09 07:30:11.228434	\N	\N	1	\N	75	6760	\N	4	2	0
7537	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000004250	2019-12-09 07:30:11.228434	\N	\N	1	\N	101	7441	\N	4	2	0
7536	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000451789	2019-12-09 07:30:11.228434	\N	\N	1	\N	306	8805	\N	4	2	0
7535	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000030474	2019-12-09 07:30:11.228434	\N	\N	1	\N	24	10000	\N	4	2	0
7539	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000240	2019-12-09 07:30:11.228434	\N	\N	1	\N	72	15000	\N	4	2	0
7538	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000062783	2019-12-09 07:30:11.228434	\N	\N	1	\N	32	16604	\N	4	2	0
7528	2019-12-02	FT - CR - 50100033209576 - RAVISH KUMAR SINGH	0000000000000146	2019-12-09 07:30:11.228434	\N	\N	1	\N	1291	28805	\N	4	2	0
7540	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000043205	2019-12-09 07:30:11.228434	\N	\N	1	\N	102	33328	\N	4	2	0
7526	2019-12-02	CHQ DEP RET CHGS 291119-MIR1933640079785	0000000000000243	2019-12-09 07:30:11.228434	\N	\N	1	\N	1246	\N	118	4	2	0
7525	2019-12-02	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019120257402273-RED BULL	HDFCR52019120257402273	2019-12-09 07:30:11.228434	\N	\N	1	\N	1251	\N	200000	4	2	0
7527	2019-12-02	ACH D- MONDELEZ INDIA FOODS-DB37990302	0000003734319187	2019-12-09 07:30:11.228434	\N	\N	1	\N	1250	\N	556359.390000000014	4	2	0
7541	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000290384	2019-12-09 07:30:11.228434	\N	\N	1	\N	1236	24359	\N	4	2	0
7544	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000378	2019-12-09 07:30:11.228434	\N	\N	1	\N	40	33873	\N	4	2	0
7543	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000397740	2019-12-09 07:30:11.228434	\N	\N	1	\N	6	51660	\N	4	2	0
7545	2019-12-02	POS 436303XXXXXX9204 SATISH CHANDRA G	0000933613565527	2019-12-09 07:30:11.228434	\N	\N	1	\N	1267	\N	1500	4	2	0
7553	2019-12-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008601	2019-12-09 07:30:11.228434	\N	\N	1	\N	728	47144	\N	4	2	0
7552	2019-12-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000257114	2019-12-09 07:30:11.228434	\N	\N	1	\N	796	7984	\N	4	2	0
7551	2019-12-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000406	2019-12-09 07:30:11.228434	\N	\N	1	\N	1066	8193	\N	4	2	0
7546	2019-12-03	NEFT CR-YESB0000001-FRESHLEE RETAIL-JP ENTERPRISES-N336190327752429	N336190327752429	2019-12-09 07:30:11.228434	\N	\N	1	\N	443	115955	\N	4	2	0
7548	2019-12-03	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000378	2019-12-09 07:30:11.228434	\N	\N	1	\N	40	\N	33873	4	2	0
7547	2019-12-03	CHQ DEP RET- EXCEEDS ARRANGEMENT	0000000000510500	2019-12-09 07:30:11.228434	\N	\N	1	\N	705	\N	6923	4	2	0
7550	2019-12-03	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N337190997798382-RED BULL	N337190997798382	2019-12-09 07:30:11.228434	\N	\N	1	\N	1251	\N	100000	4	2	0
7564	2019-12-04	IMPS-933818034115-MANOJ -HDFC-XXXXXXXX8697-	0000933818034115	2019-12-09 07:30:11.228434	\N	\N	1	\N	1276	5000	\N	4	2	0
7558	2019-12-04	NEFT CR-SBIN0004324-M S JAI BHAWANI KIRANA STORE-JP ENTERPRISES-SBIN319338214479	SBIN319338214479	2019-12-09 07:30:11.228434	\N	\N	1	\N	52	5857	\N	4	2	0
7560	2019-12-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000898465	2019-12-09 07:30:11.228434	\N	\N	1	\N	109	7143	\N	4	2	0
7562	2019-12-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000911165	2019-12-09 07:30:11.228434	\N	\N	1	\N	1074	18148	\N	4	2	0
7561	2019-12-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000887488	2019-12-09 07:30:11.228434	\N	\N	1	\N	1318	13200	\N	4	2	0
7563	2019-12-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001170	2019-12-09 07:30:11.228434	\N	\N	1	\N	95	19310	\N	4	2	0
7556	2019-12-04	NEFT CR-KKBK0000958-OM CONFECTIONERY-JP ENTERPRISES-KKBKH19338844964	KKBKH19338844964	2019-12-09 07:30:11.228434	\N	\N	1	\N	1243	20000	\N	4	2	0
7559	2019-12-04	IMPS-933815833402-K K STORE-HDFC-XXXXXXXXXX1250-MB  TRANSFER TO JP	0000933815833402	2019-12-09 07:30:11.228434	\N	\N	1	\N	918	44584	\N	4	2	0
7565	2019-12-04	POS 436303XXXXXX9204 INDIAN OIL CORPO	0000933812068323	2019-12-09 07:30:11.228434	\N	\N	1	\N	1267	\N	2773.67999999999984	4	2	0
7554	2019-12-04	NEFT DR-ORBC0100616-SHRI TRADING COMPANY-NETBANK, MUM-N338190998385793-SHRI TRADING CO	N338190998385793	2019-12-09 07:30:11.228434	\N	\N	1	\N	1317	\N	50000	4	2	0
7557	2019-12-04	EMI 45070519 CHQ S45070519134 121945070519	000000000000000	2019-12-09 07:30:11.228434	\N	\N	1	\N	1256	\N	69821	4	2	0
7555	2019-12-04	HB3142NR1000009999-STP-GODREJ	IB04104457682208	2019-12-09 07:30:11.228434	\N	\N	1	\N	1249	\N	110000	4	2	0
7567	2019-11-17	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-932118119380-BHARATPE9020004894	0000932118655179	2019-12-10 08:24:52.947778	\N	\N	1	\N	1307	4410	\N	5	2	0
7566	2019-11-17	UPI-SATISH SETH-9717790455@PAYTM-PYTM0123456-932137799165-NA	0000932113280020	2019-12-10 08:24:52.947778	\N	\N	1	\N	1319	5000	\N	5	2	0
7568	2019-11-18	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-932204316967-BHARATPE9020004894	0000093224191673	2019-12-10 08:24:52.947778	\N	\N	1	\N	1307	8577	\N	5	2	0
7569	2019-11-18	NEFT DR-ORBC0100616-SHRI TRADING COMPANY-NETBANK, MUM-N322190984150711-SHRI TRADING COMPA	N322190984150711	2019-12-10 08:24:52.947778	\N	\N	1	\N	1317	\N	100000	5	2	0
7572	2019-11-18	HB3142NR1000009999-STP-GODREJ	IB18134950967598	2019-12-10 08:24:52.947778	\N	\N	1	\N	1249	\N	201000	5	2	0
7570	2019-11-18	N3058220156601310-STP-DABUR HPC	IB18134657956272	2019-12-10 08:24:52.947778	\N	\N	1	\N	1255	\N	210000	5	2	0
7571	2019-11-18	N3058220156601330-STP-DABUR HC	IB18134801946807	2019-12-10 08:24:52.947778	\N	\N	1	\N	1255	\N	300000	5	2	0
7573	2019-11-19	UPI-PRAVEEN KUMAR-PRAVEENKUMARBHRUV1234@OKAXIS-UTIB0000624-932312287295-BANK	0000932312130823	2019-12-10 08:24:52.947778	\N	\N	1	\N	1286	6727	\N	5	2	0
7574	2019-11-19	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LIMITED-NETBANK, MUM-HDFCR52019111955324946-COLGATE	HDFCR52019111955324946	2019-12-10 08:24:52.947778	\N	\N	1	\N	1254	\N	258000	5	2	0
7578	2019-11-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132340	2019-12-10 08:24:52.947778	\N	\N	1	\N	64	36524	\N	5	2	0
7577	2019-11-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001972	2019-12-10 08:24:52.947778	\N	\N	1	\N	81	44129	\N	5	2	0
7576	2019-11-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000408590	2019-12-10 08:24:52.947778	\N	\N	1	\N	1094	55725	\N	5	2	0
7575	2019-11-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013259	2019-12-10 08:24:52.947778	\N	\N	1	\N	57	113379	\N	5	2	0
7579	2019-11-21	IB BILLPAY DR-HDFCCS-457262XXXXXX3504	000000000000000	2019-12-10 08:24:52.947778	\N	\N	1	\N	1275	\N	14736	5	2	0
7580	2019-11-22	HB3142NR1000009999-STP-GODREJ	IB22155108217272	2019-12-10 08:24:52.947778	\N	\N	1	\N	1249	\N	227000	5	2	0
7581	2019-11-23	IMPS-932712764786-LIFE LINE INDIA-HDFC-XXXXXXXXXX1000-	0000932712764786	2019-12-10 08:24:52.947778	\N	\N	1	\N	1308	3260	\N	5	2	0
7583	2019-11-23	IMPS-932714817067-PATANJALIKIRANASTORE-HDFC-XXXXXXXXXX0237-JPENTERPRISE	0000932714817067	2019-12-10 08:24:52.947778	\N	\N	1	\N	1090	16000	\N	5	2	0
7584	2019-11-24	IMPS-932812105667-HARENDRA KUMAR TEWAT-HDFC-XXXXXXXX8761-	0000932812105667	2019-12-10 08:24:52.947778	\N	\N	1	\N	1320	3242	\N	5	2	0
7582	2019-11-23	UPI-AMIT AGARWAL SO MKAG-9999900212@PAYTM-ORBC0100526-932737517118-NA	0000932713542987	2019-12-10 08:24:52.947778	\N	\N	1	\N	1063	20000	\N	5	2	0
7586	2019-11-25	HB3142NR1000009999-STP-GODREJ	IB25120449300418	2019-12-10 08:24:52.947778	\N	\N	1	\N	1249	\N	147000	5	2	0
7587	2019-11-25	RTGS DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-HDFCR52019112556135369-REDBULL	HDFCR52019112556135369	2019-12-10 08:24:52.947778	\N	\N	1	\N	1251	\N	200000	5	2	0
7590	2019-11-26	UPI-PRAVEEN KUMAR-9213274978@YBL-UTIB0000624-933016500717-PAYMENT FROM PHONE	0000933016752779	2019-12-10 08:24:52.947778	\N	\N	1	\N	1286	6743	\N	5	2	0
7588	2019-11-26	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-933035200221-NA	0000933011981719	2019-12-10 08:24:52.947778	\N	\N	1	\N	1295	9795	\N	5	2	0
7589	2019-11-26	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N330190990630532-REDBULL	N330190990630532	2019-12-10 08:24:52.947778	\N	\N	1	\N	1251	\N	125000	5	2	0
7592	2019-11-27	IMPS-933111949927-GOYAL MEDICAL STORE-HDFC-XXXXXXXXXX0644-MB  CASE	0000933111949927	2019-12-10 08:24:52.947778	\N	\N	1	\N	831	4026	\N	5	2	0
7591	2019-11-27	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-933103173551-BHARATPE9020004894	0000093313168722	2019-12-10 08:24:52.947778	\N	\N	1	\N	1307	6462	\N	5	2	0
7593	2019-11-27	IMPS-933115597915-T N ENTERPRISES-HDFC-XXXXXXXX4853-OPENTXN3429961	0000933115597915	2019-12-10 08:24:52.947778	\N	\N	1	\N	1081	9245	\N	5	2	0
7603	2019-12-01	UPI-YOGESH KUMAR SO JASW-7042668040@YBL-PUNB0460300-933526820662-PAYMENT FROM PHONE	0000933513543800	2019-12-10 08:24:52.947778	\N	\N	1	\N	\N	10000	\N	5	2	0
7604	2019-12-02	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-933604984407-BHARATPE9020004894	0000093364369810	2019-12-10 08:24:52.947778	\N	\N	1	\N	\N	5454	\N	5	2	0
7608	2019-12-03	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-933741730228-NA	0000933717051004	2019-12-10 08:24:52.947778	\N	\N	1	\N	\N	6924	\N	5	2	0
7610	2019-12-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000298	2019-12-10 08:24:52.947778	\N	\N	1	\N	\N	230198	\N	5	2	0
7611	2019-12-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000132350	2019-12-10 08:24:52.947778	\N	\N	1	\N	\N	26819	\N	5	2	0
7612	2019-12-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000315	2019-12-10 08:24:52.947778	\N	\N	1	\N	\N	27996	\N	5	2	0
7613	2019-12-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000413484	2019-12-10 08:24:52.947778	\N	\N	1	\N	\N	56199	\N	5	2	0
7595	2019-11-28	UPI-RAJEEV KUMAR CHAURAS-RAJEEVCHAURASIYA1@OKAXIS-UTIB0000884-933214929170-UPI	0000933214796943	2019-12-10 08:24:52.947778	\N	\N	1	\N	1096	2580	\N	5	2	0
7597	2019-11-29	UPI-PAYTM-WALLETMONEYTOBANK@PAYTM-PYTM0123456-933340680524-NA	0000933316634276	2019-12-10 08:24:52.947778	\N	\N	1	\N	1295	2000	\N	5	2	0
7596	2019-11-29	UPI-HARENDRA KUMAR TEWAT-7678658761@PAYTM-SBIN0004324-933336311990-NA	0000933312633426	2019-12-10 08:24:52.947778	\N	\N	1	\N	1320	3133	\N	5	2	0
7598	2019-11-29	ADDISTRO TECHN-J P ENTERPRIS COL09	0000227821700002	2019-12-10 08:24:52.947778	\N	\N	1	\N	1116	73482	\N	5	2	0
7600	2019-11-30	NEFT CR-ORBC0105014-IBUSER-LIFE LINE INDIA-JP ENTERPRISES-SAA77837731	00000SAA77837731	2019-12-10 08:24:52.947778	\N	\N	1	\N	1308	4734	\N	5	2	0
7599	2019-11-30	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-933403551842-BHARATPE9020004894	0000093343071773	2019-12-10 08:24:52.947778	\N	\N	1	\N	1307	10000	\N	5	2	0
7602	2019-12-01	UPI-SATISH SETH-9717790455@PAYTM-PYTM0123456-933535140048-NA	0000933511682817	2019-12-10 08:24:52.947778	\N	\N	1	\N	1319	5000	\N	5	2	0
7606	2019-12-03	NEFT DR-HSBC0400002-RED BULL INDIA PVT LTD-NETBANK, MUM-N337190997196258-RED BULL	N337190997196258	2019-12-10 08:24:52.947778	\N	\N	1	\N	1251	\N	100000	5	2	0
7607	2019-12-03	NEFT CR-UTIB0000624-MAHAVEERA GENERAL STORE-JP ENTERPRISES-AXMB193375778508	AXMB193375778508	2019-12-10 08:24:52.947778	\N	\N	1	\N	54	7383	\N	5	2	0
7605	2019-12-03	NEFT CR-UTIB0000066-AIRPLAZA RETAIL HOLDINGS PVT LTD F-J P  ENTERPRISES-AXISP00085864418	AXISP00085864418	2019-12-10 08:24:52.947778	\N	\N	1	\N	1145	39720	\N	5	2	0
7609	2019-12-04	CASH DEP DADRI	000000000000000	2019-12-10 08:24:52.947778	\N	\N	1	\N	1244	53000	\N	5	2	0
7601	2019-12-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-12-10 08:24:52.947778	\N	\N	1	\N	1279	\N	35270	5	2	0
7655	2019-10-10	CASH DEP DADRI	000000000000000	2019-12-10 14:22:10.050227	\N	\N	1	\N	773	100000	\N	2	1	1
7616	2019-10-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000047284	2019-12-10 14:22:10.050227	\N	\N	1	\N	122	3089	\N	2	1	1
7617	2019-10-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482282	2019-12-10 14:22:10.050227	\N	\N	1	\N	646	3754	\N	2	1	1
7618	2019-10-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000367	2019-12-10 14:22:10.050227	\N	\N	1	\N	569	7972	\N	2	1	1
7619	2019-10-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000234	2019-12-10 14:22:10.050227	\N	\N	1	\N	309	8857	\N	2	1	1
7614	2019-10-01	IMPS-927409167824-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000927409167824	2019-12-10 14:22:10.050227	\N	\N	1	\N	632	24943	\N	2	1	1
7620	2019-10-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000463451	2019-12-10 14:22:10.050227	\N	\N	1	\N	791	25298	\N	2	1	1
7615	2019-10-01	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-N274190941927880-COLGATE	N274190941927880	2019-12-10 14:22:10.050227	\N	\N	1	\N	764	\N	365000	2	1	1
7621	2019-10-02	IMPS-927510144119-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000927510144119	2019-12-10 14:22:10.050227	\N	\N	1	\N	158	3509	\N	2	1	1
7638	2019-10-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000174	2019-12-10 14:22:10.050227	\N	\N	1	\N	326	3000	\N	2	1	1
7622	2019-10-03	IMPS-927611470488-RESILIENT INNOVATION-HDFC-XXXXXXXXXXX0061-VERIFY	0000927611470488	2019-12-10 14:22:10.050227	\N	\N	1	\N	761	1	\N	2	1	1
7625	2019-10-03	UPI-BHARATPE MERCHANT-BHARATPE.PAYOUT@YESBANK-YESB0000480-927611838451-PE9010001788992761	0000927611691234	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	100	\N	2	1	1
7626	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000010062	2019-12-10 14:22:10.050227	\N	\N	1	\N	23	2709	\N	2	1	1
7627	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001372	2019-12-10 14:22:10.050227	\N	\N	1	\N	262	2958	\N	2	1	1
7628	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000061092	2019-12-10 14:22:10.050227	\N	\N	1	\N	401	10274	\N	2	1	1
7629	2019-10-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000155894	2019-12-10 14:22:10.050227	\N	\N	1	\N	812	16936	\N	2	1	1
7623	2019-10-03	50200007138822-TPT-TTC CA TO JP CA	0000000522266018	2019-12-10 14:22:10.050227	\N	\N	1	\N	761	\N	100000	2	1	1
7624	2019-10-03	FT - DR - 50200029853444 - TUSHAR TRADING COMPANY	0000000000000199	2019-12-10 14:22:10.050227	\N	\N	1	\N	761	\N	450000	2	1	1
7631	2019-10-04	IMPS-927717239860-BHARATPE-HDFC-XXXXXXXX0543-927741455330	0000927717239860	2019-12-10 14:22:10.050227	\N	\N	1	\N	761	1	\N	2	1	1
7635	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826759	2019-12-10 14:22:10.050227	\N	\N	1	\N	45	1588	\N	2	1	1
7634	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000201447	2019-12-10 14:22:10.050227	\N	\N	1	\N	383	4634	\N	2	1	1
7633	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033136	2019-12-10 14:22:10.050227	\N	\N	1	\N	18	29376	\N	2	1	1
7646	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000551077	2019-12-10 14:22:10.050227	\N	\N	1	\N	633	1155	\N	2	1	1
7700	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000116867	2019-12-10 14:22:10.050227	\N	\N	1	\N	557	26552	\N	2	1	1
7758	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044471	2019-12-10 14:22:10.050227	\N	\N	1	\N	97	20992	\N	2	1	1
7813	2019-11-12	ACH D- MONDELEZ INDIA FOODS-DB37800891	0000003375133809	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	250151.920000000013	2	1	1
7906	2019-10-03	IMPS-927611712177-SANGRAM TRADING AND -HDFC-XXXXXXXX1071-NO1SOAP	0000927611712177	2019-12-10 14:40:30.986857	\N	\N	1	\N	807	2939	\N	3	1	0
7904	2019-10-03	CASH DEP DADRI	000000000000000	2019-12-10 14:40:30.986857	\N	\N	1	\N	773	366000	\N	3	1	0
7907	2019-10-03	CHQ PAID-INWARD TRAN-GODREJ CONSUMER PRO	0000000000000061	2019-12-10 14:40:30.986857	\N	\N	1	\N	763	\N	794000	3	1	0
7908	2019-10-04	IMPS-927713367421-GOYAL TRADERS-HDFC-XXXXXX4136-MB: PAYMENT	0000927713367421	2019-12-10 14:40:30.986857	\N	\N	1	\N	190	75	\N	3	1	0
7909	2019-10-09	CASH DEP DADRI	000000000000000	2019-12-10 14:40:30.986857	\N	\N	1	\N	773	400000	\N	3	1	0
7910	2019-10-09	HB3142NR1000007858-STP-GODREJ	IB09164956693782	2019-12-10 14:40:30.986857	\N	\N	1	\N	771	\N	430000	3	1	0
7911	2019-10-11	IMPS-928412229241-SANGRAM TRADING AND -HDFC-XXXXXXXX1071-OREOBISCUITS	0000928412229241	2019-12-10 14:40:30.986857	\N	\N	1	\N	807	1048	\N	3	1	0
7912	2019-10-30	CASH DEP DADRI	000000000000000	2019-12-10 14:40:30.986857	\N	\N	1	\N	773	50000	\N	3	1	0
7913	2019-11-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-12-10 14:40:30.986857	\N	\N	1	\N	776	\N	28565	3	1	0
7914	2019-11-04	CHQ PAID-MICR CTS-NO-VIVEK GOYAL	0000000000000068	2019-12-10 14:40:30.986857	\N	\N	1	\N	761	\N	6000	3	1	0
7915	2019-11-07	O/S INTEREST RECOVERY FROM A/C XXXXXXXXXX9210	000000000000000	2019-12-10 14:40:30.986857	\N	\N	1	\N	776	28565	\N	3	1	0
7916	2019-11-11	BCCLTDGT69776-STP-RDM	IB11131636221513	2019-12-10 14:40:30.986857	\N	\N	1	\N	765	\N	49510	3	1	0
7920	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000116877	2019-12-10 14:40:30.986857	\N	\N	1	\N	557	1500	\N	3	1	0
7921	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000095202	2019-12-10 14:40:30.986857	\N	\N	1	\N	505	2070	\N	3	1	0
7922	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000352989	2019-12-10 14:40:30.986857	\N	\N	1	\N	342	20000	\N	3	1	0
7923	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000095203	2019-12-10 14:40:30.986857	\N	\N	1	\N	761	2700	\N	3	1	0
7918	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044427	2019-12-10 14:40:30.986857	\N	\N	1	\N	131	21656	\N	3	1	0
7919	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044493	2019-12-10 14:40:30.986857	\N	\N	1	\N	97	22777	\N	3	1	0
7917	2019-11-18	IMPS-932215413242-GOYAL TRADERS-HDFC-XXXXXX4136-MB: PAYMENT	0000932215413242	2019-12-10 14:40:30.986857	\N	\N	1	\N	190	38540	\N	3	1	0
7905	2019-10-03	FT - CR - 50200006539210 - TUSHAR TRADING COMPANY	0000000000000199	2019-12-10 14:40:30.986857	2019-12-22 16:45:21.048381	\N	1	\N	761	450000	\N	3	1	0
7869	2019-11-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000050	2019-12-10 14:22:10.050227	\N	\N	1	\N	76	6035	\N	2	1	1
7373	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000498	2019-12-09 07:30:11.228434	\N	\N	1	\N	616	14696	\N	4	2	0
7377	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000406543	2019-12-09 07:30:11.228434	\N	\N	1	\N	264	17014	\N	4	2	0
7406	2019-11-21	NEFT CR-YESB0000001-FRESHLEE RETAIL-JP ENTERPRISES-N325190321596080	N325190321596080	2019-12-09 07:30:11.228434	\N	\N	1	\N	1070	216898	\N	4	2	0
7429	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000024262	2019-12-09 07:30:11.228434	\N	\N	1	\N	700	22500	\N	4	2	0
7453	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000135	2019-12-09 07:30:11.228434	\N	\N	1	\N	1262	12020	\N	4	2	0
7471	2019-11-26	NEFT CR-UTIB0000624-MITTAL TRADERS-J P ENTERPRISES-AXMB193303425580	AXMB193303425580	2019-12-09 07:30:11.228434	\N	\N	1	\N	359	51902	\N	4	2	0
7486	2019-11-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000480	2019-12-09 07:30:11.228434	\N	\N	1	\N	88	6938	\N	4	2	0
7498	2019-11-29	NEFT DR-ORBC0100616-SHRI TRADING COMPANY-NETBANK, MUM-N333190993419776-SHRI TRADING CO	N333190993419776	2019-12-09 07:30:11.228434	\N	\N	1	\N	1317	\N	165000	4	2	0
7542	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001407	2019-12-09 07:30:11.228434	\N	\N	1	\N	60	17992	\N	4	2	0
7549	2019-12-03	NEFT CR-VIJB0007140-CITY SUPERMART-JP ENTERPRISES-VIJBH19337074249	VIJBH19337074249	2019-12-09 07:30:11.228434	\N	\N	1	\N	471	11641	\N	4	2	0
7585	2019-11-25	IMPS-932909499858-RESILIENT INNOVATION-HDFC-XXXXXXXXXXX0061-BHARATPE9020004894520191124YES	0000932909499858	2019-12-10 08:24:52.947778	\N	\N	1	\N	1321	2279	\N	5	2	0
7594	2019-11-27	HB3142NR1000009999-STP-GODREJ	IB27163447760704	2019-12-10 08:24:52.947778	\N	\N	1	\N	1249	\N	15000	5	2	0
7924	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000046227	2019-12-10 14:40:30.986857	\N	\N	1	\N	370	4598	\N	3	1	0
7925	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001121	2019-12-10 14:40:30.986857	\N	\N	1	\N	348	4905	\N	3	1	0
7926	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382388	2019-12-10 14:40:30.986857	\N	\N	1	\N	332	6198	\N	3	1	0
7927	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008337	2019-12-10 14:40:30.986857	\N	\N	1	\N	799	6733	\N	3	1	0
7928	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672944	2019-12-10 14:40:30.986857	\N	\N	1	\N	786	7821	\N	3	1	0
7929	2019-11-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000084529	2019-12-10 14:40:30.986857	\N	\N	1	\N	449	12415	\N	3	1	0
7930	2019-11-20	NEFT DR-CITI0000002-PERFETTI VAN MELLE INDIA PVT LTD-NETBANK, MUM-N324190986081354-PERFETTI	N324190986081354	2019-12-10 14:40:30.986857	\N	\N	1	\N	766	\N	125000	3	1	0
7935	2019-11-27	NEFT DR-CITI0000002-PERFETTI VAN MELLE INDIA PVT LTD-NETBANK, MUM-N331190991496998-PERFETTI	N331190991496998	2019-12-10 14:40:30.986857	\N	\N	1	\N	766	\N	135000	3	1	0
7936	2019-12-01	DEBIT INTEREST CAPITALIZED	000000000000000	2019-12-10 14:40:30.986857	\N	\N	1	\N	776	\N	27147	3	1	0
7931	2019-11-25	50200012390552-TPT-TUSHAR TRADING-SANDEEP KUMAR	0000000571859710	2019-12-10 14:40:30.986857	\N	\N	1	\N	822	9217	\N	3	1	0
7934	2019-11-25	FT - CR - 50200038727490 - VINOD KUMAR PRAMOD KUMAR	0000000000000030	2019-12-10 14:40:30.986857	\N	\N	1	\N	656	247045	\N	3	1	0
7932	2019-11-25	CASH DEP DADRI	000000000000000	2019-12-10 14:40:30.986857	\N	\N	1	\N	773	300000	\N	3	1	0
7933	2019-11-25	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-HDFCR52019112556164898-COLGATE	HDFCR52019112556164898	2019-12-10 14:40:30.986857	\N	\N	1	\N	764	\N	230000	3	1	0
1979	2019-07-10	FT - DR - 50100040075595 - MUKESH KUMAR GARG	0000000000000196	2019-10-01 23:34:09.331984	2019-12-22 16:52:23.331433	\N	1	\N	339	\N	500000	2	1	0
1852	2019-06-07	50200013317598-TPT-TUSHAR	0000000251642976	2019-10-01 23:34:09.331984	2019-12-22 16:53:53.537819	\N	1	\N	761	8167	\N	2	1	0
7632	2019-10-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785666	2019-12-10 14:22:10.050227	\N	\N	1	\N	143	34674	\N	2	1	1
7630	2019-10-04	EMI 58456073 CHQ S58456073116 101958456073	000000000000000	2019-12-10 14:22:10.050227	\N	\N	1	\N	774	\N	87242	2	1	1
7639	2019-10-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000382374	2019-12-10 14:22:10.050227	\N	\N	1	\N	332	5239	\N	2	1	1
7640	2019-10-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136168	2019-12-10 14:22:10.050227	\N	\N	1	\N	326	14887	\N	2	1	1
7636	2019-10-05	CASH DEP DADRI	000000000000000	2019-12-10 14:22:10.050227	\N	\N	1	\N	773	312800	\N	2	1	1
7637	2019-10-05	RTGS DR-ORBC0100616-SHRI TRADING COMPANY-DADRI-HDFCR52019100598529965	0000000000000200	2019-12-10 14:22:10.050227	\N	\N	1	\N	813	\N	200000	2	1	1
7643	2019-10-09	IMPS-928210574625-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-BOUNVITA	0000928210574625	2019-12-10 14:22:10.050227	\N	\N	1	\N	186	1436	\N	2	1	1
7647	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000047287	2019-12-10 14:22:10.050227	\N	\N	1	\N	122	2831	\N	2	1	1
7648	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482284	2019-12-10 14:22:10.050227	\N	\N	1	\N	646	4383	\N	2	1	1
7644	2019-10-09	IMPS-928212120892-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000928212120892	2019-12-10 14:22:10.050227	\N	\N	1	\N	158	5587	\N	2	1	1
7649	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000086883	2019-12-10 14:22:10.050227	\N	\N	1	\N	505	7369	\N	2	1	1
7650	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000079209	2019-12-10 14:22:10.050227	\N	\N	1	\N	269	8082	\N	2	1	1
7641	2019-10-07	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000382374	2019-12-10 14:22:10.050227	\N	\N	1	\N	332	\N	5239	2	1	1
7660	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001379	2019-12-10 14:22:10.050227	\N	\N	1	\N	262	11211	\N	2	1	1
7696	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000798678	2019-12-10 14:22:10.050227	\N	\N	1	\N	62	2388	\N	2	1	1
7651	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000080421	2019-12-10 14:22:10.050227	\N	\N	1	\N	6	9295	\N	2	1	1
7642	2019-10-09	NEFT CR-KKBK0000958-OM CONFECTIONERY-TUSHARTRADINGCO-KKBKH19282709601	KKBKH19282709601	2019-12-10 14:22:10.050227	\N	\N	1	\N	373	10000	\N	2	1	1
7652	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001029	2019-12-10 14:22:10.050227	\N	\N	1	\N	131	13095	\N	2	1	1
7653	2019-10-09	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000008150	2019-12-10 14:22:10.050227	\N	\N	1	\N	798	14799	\N	2	1	1
7645	2019-10-09	HB3142NR1000007858-STP-GODREJ	IB09165028318553	2019-12-10 14:22:10.050227	\N	\N	1	\N	771	\N	50000	2	1	1
7663	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672890	2019-12-10 14:22:10.050227	\N	\N	1	\N	786	2479	\N	2	1	1
7662	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137888	2019-12-10 14:22:10.050227	\N	\N	1	\N	142	2626	\N	2	1	1
7661	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000622	2019-12-10 14:22:10.050227	\N	\N	1	\N	628	9413	\N	2	1	1
7659	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785675	2019-12-10 14:22:10.050227	\N	\N	1	\N	143	11323	\N	2	1	1
7658	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000013530	2019-12-10 14:22:10.050227	\N	\N	1	\N	472	12284	\N	2	1	1
7657	2019-10-10	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000386678	2019-12-10 14:22:10.050227	\N	\N	1	\N	464	12913	\N	2	1	1
7656	2019-10-10	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000079209	2019-12-10 14:22:10.050227	\N	\N	1	\N	269	\N	8082	2	1	1
7654	2019-10-10	ACH D- MONDELEZ INDIA FOODS-DB37470804	0000002606340524	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	366636.530000000028	2	1	1
7672	2019-10-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000047290	2019-12-10 14:22:10.050227	\N	\N	1	\N	122	3000	\N	2	1	1
7664	2019-10-11	IMPS-928402247969-BHARATPE-HDFC-XXXXXXXX0543-BHARATPE.901042165220191010ICI	0000928402247969	2019-12-10 14:22:10.050227	\N	\N	1	\N	761	13	\N	2	1	1
7669	2019-10-11	NEFT CR-SYNB0008690-K K STORE-TUSHAR TRADING CO-P19101122694866	0P19101122694866	2019-12-10 14:22:10.050227	\N	\N	1	\N	234	24172	\N	2	1	1
7671	2019-10-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000377499	2019-12-10 14:22:10.050227	\N	\N	1	\N	392	27589	\N	2	1	1
7665	2019-10-11	NEFT CR-CBIN0284598-RADHEY LAL JAI PRAKASH-TUSHAR TRADING CO-CBINH19284136968	CBINH19284136968	2019-12-10 14:22:10.050227	\N	\N	1	\N	429	65607	\N	2	1	1
7667	2019-10-11	CASH DEP DADRI	000000000000000	2019-12-10 14:22:10.050227	\N	\N	1	\N	773	150000	\N	2	1	1
7666	2019-10-11	CHQ DEP RET CHGS 071019-MIR1928419747284	0000000000382374	2019-12-10 14:22:10.050227	\N	\N	1	\N	778	\N	118	2	1	1
7670	2019-10-11	RDMCGHA0090-STP-RDM	IB11193211198170	2019-12-10 14:22:10.050227	\N	\N	1	\N	765	\N	33694	2	1	1
7668	2019-10-11	NEFT DR-ORBC0100616-SHRI TRADING COMPANY-DADRI-N284190951928125	0000000000000201	2019-12-10 14:22:10.050227	\N	\N	1	\N	813	\N	150000	2	1	1
7673	2019-10-12	UPI-BHARATPE MERCHANT-BHARATPE.PAYOUT@YESBANK-YESB0000480-928513978450-CASHBACK	0000928513022328	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	11	\N	2	1	1
7675	2019-10-13	IMPS-928621387091-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000928621387091	2019-12-10 14:22:10.050227	\N	\N	1	\N	632	17778	\N	2	1	1
7674	2019-10-13	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-928603400187-BHARATPE9010001788	0000092863392242	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	26780	\N	2	1	1
7680	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000046212	2019-12-10 14:22:10.050227	\N	\N	1	\N	370	3477	\N	2	1	1
7681	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000178	2019-12-10 14:22:10.050227	\N	\N	1	\N	326	6288	\N	2	1	1
7682	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000079215	2019-12-10 14:22:10.050227	\N	\N	1	\N	269	8082	\N	2	1	1
7684	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000043276	2019-12-10 14:22:10.050227	\N	\N	1	\N	131	9508	\N	2	1	1
7683	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000042744	2019-12-10 14:22:10.050227	\N	\N	1	\N	97	8128	\N	2	1	1
7685	2019-10-14	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000382	2019-12-10 14:22:10.050227	\N	\N	1	\N	569	22219	\N	2	1	1
7677	2019-10-14	CHQ DEP RET CHGS 101019-MIR1928523900790	0000000000079209	2019-12-10 14:22:10.050227	\N	\N	1	\N	778	\N	118	2	1	1
7679	2019-10-14	50100040075595-TPT-DRAWINGS	0000000159366807	2019-12-10 14:22:10.050227	\N	\N	1	\N	772	\N	20000	2	1	1
7678	2019-10-14	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000377499	2019-12-10 14:22:10.050227	\N	\N	1	\N	392	\N	27589	2	1	1
7676	2019-10-14	ACH D- MONDELEZ INDIA FOODS-DB37490971	0000002672215234	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	180078.459999999992	2	1	1
7686	2019-10-15	FT - CR - 09272000000837 - ANUJ MEDICAL STORE	0000000000000276	2019-12-10 14:22:10.050227	\N	\N	1	\N	49	4853	\N	2	1	1
7687	2019-10-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044455	2019-12-10 14:22:10.050227	\N	\N	1	\N	97	5285	\N	2	1	1
7688	2019-10-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672896	2019-12-10 14:22:10.050227	\N	\N	1	\N	786	32763	\N	2	1	1
7692	2019-10-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000034	2019-12-10 14:22:10.050227	\N	\N	1	\N	76	5000	\N	2	1	1
7691	2019-10-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000061095	2019-12-10 14:22:10.050227	\N	\N	1	\N	401	11346	\N	2	1	1
7690	2019-10-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136711	2019-12-10 14:22:10.050227	\N	\N	1	\N	261	114439	\N	2	1	1
7689	2019-10-16	CHQ PAID-MICR CTS-NO-SHUBH MOBILES ZONE	0000000000000207	2019-12-10 14:22:10.050227	\N	\N	1	\N	814	\N	28999	2	1	1
7695	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000141305	2019-12-10 14:22:10.050227	\N	\N	1	\N	142	3038	\N	2	1	1
7698	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000338266	2019-12-10 14:22:10.050227	\N	\N	1	\N	630	5892	\N	2	1	1
7697	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000578599	2019-12-10 14:22:10.050227	\N	\N	1	\N	349	26424	\N	2	1	1
7694	2019-10-17	CASH DEP DADRI	000000000000000	2019-12-10 14:22:10.050227	\N	\N	1	\N	773	100000	\N	2	1	1
7693	2019-10-17	ACH D- MONDELEZ INDIA FOODS-DB37540659	0000002791706176	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	219960.5	2	1	1
7703	2019-10-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001370	2019-12-10 14:22:10.050227	\N	\N	1	\N	815	1092	\N	2	1	1
7701	2019-10-18	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN219291817597	SBIN219291817597	2019-12-10 14:22:10.050227	\N	\N	1	\N	403	2867	\N	2	1	1
7704	2019-10-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000117	2019-12-10 14:22:10.050227	\N	\N	1	\N	110	3849	\N	2	1	1
7705	2019-10-18	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000047291	2019-12-10 14:22:10.050227	\N	\N	1	\N	122	5334	\N	2	1	1
7702	2019-10-18	ACH D- MONDELEZ INDIA FOODS-DB37550632	0000002827679569	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	132649.429999999993	2	1	1
7710	2019-10-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000280	2019-12-10 14:22:10.050227	\N	\N	1	\N	108	1664	\N	2	1	1
7709	2019-10-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000080422	2019-12-10 14:22:10.050227	\N	\N	1	\N	6	3501	\N	2	1	1
7708	2019-10-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000751725	2019-12-10 14:22:10.050227	\N	\N	1	\N	383	19861	\N	2	1	1
7707	2019-10-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001109	2019-12-10 14:22:10.050227	\N	\N	1	\N	348	25314	\N	2	1	1
7706	2019-10-19	CHQ DEP RET CHGS 141019-MIR1928947145250	0000000000377499	2019-12-10 14:22:10.050227	\N	\N	1	\N	778	\N	118	2	1	1
7711	2019-10-19	GST/BANK REFERENCE NO: R1929214797704/CIN NO: HDFC19100900437895	0191019090066323	2019-12-10 14:22:10.050227	\N	\N	1	\N	783	\N	13122	2	1	1
7720	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019414	2019-12-10 14:22:10.050227	\N	\N	1	\N	321	4685	\N	2	1	1
7718	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000181	2019-12-10 14:22:10.050227	\N	\N	1	\N	326	6000	\N	2	1	1
7717	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000392	2019-12-10 14:22:10.050227	\N	\N	1	\N	569	6712	\N	2	1	1
7716	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071186	2019-12-10 14:22:10.050227	\N	\N	1	\N	151	8898	\N	2	1	1
7721	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044462	2019-12-10 14:22:10.050227	\N	\N	1	\N	97	10480	\N	2	1	1
7715	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000086889	2019-12-10 14:22:10.050227	\N	\N	1	\N	505	10832	\N	2	1	1
7714	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000352987	2019-12-10 14:22:10.050227	\N	\N	1	\N	342	11200	\N	2	1	1
7713	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001044	2019-12-10 14:22:10.050227	\N	\N	1	\N	131	14553	\N	2	1	1
7719	2019-10-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000620889	2019-12-10 14:22:10.050227	\N	\N	1	\N	627	29800	\N	2	1	1
7712	2019-10-21	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000751725	2019-12-10 14:22:10.050227	\N	\N	1	\N	383	\N	19861	2	1	1
7725	2019-10-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000079216	2019-12-10 14:22:10.050227	\N	\N	1	\N	269	7134	\N	2	1	1
7724	2019-10-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000751728	2019-12-10 14:22:10.050227	\N	\N	1	\N	383	19861	\N	2	1	1
7723	2019-10-22	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000352987	2019-12-10 14:22:10.050227	\N	\N	1	\N	342	\N	11200	2	1	1
7722	2019-10-22	ACH D- MONDELEZ INDIA FOODS-DB37590708	0000002913399537	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	131966.190000000002	2	1	1
7730	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000551107	2019-12-10 14:22:10.050227	\N	\N	1	\N	633	2187	\N	2	1	1
7731	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000037	2019-12-10 14:22:10.050227	\N	\N	1	\N	76	3858	\N	2	1	1
7729	2019-10-23	IMPS-929612124524-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARGKIRANA	0000929612124524	2019-12-10 14:22:10.050227	\N	\N	1	\N	158	5512	\N	2	1	1
7732	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000046215	2019-12-10 14:22:10.050227	\N	\N	1	\N	370	7516	\N	2	1	1
7733	2019-10-23	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019425	2019-12-10 14:22:10.050227	\N	\N	1	\N	321	9683	\N	2	1	1
7727	2019-10-23	NEFT CR-SBIN0003342-RAMA PROVISION STORE-TUSHAR TRADING CO-SBIN219296308909	SBIN219296308909	2019-12-10 14:22:10.050227	\N	\N	1	\N	462	98753	\N	2	1	1
7728	2019-10-23	CHQ DEP RET CHGS 211019-MIR1929660017654	0000000000751725	2019-12-10 14:22:10.050227	\N	\N	1	\N	778	\N	118	2	1	1
7736	2019-10-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000141316	2019-12-10 14:22:10.050227	\N	\N	1	\N	142	651	\N	2	1	1
7737	2019-10-24	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826763	2019-12-10 14:22:10.050227	\N	\N	1	\N	45	1310	\N	2	1	1
7735	2019-10-24	CHQ DEP RET CHGS 221019-MIR1929762416671	0000000000352987	2019-12-10 14:22:10.050227	\N	\N	1	\N	778	\N	118	2	1	1
7734	2019-10-24	50200007138822-TPT-TTC CA JP CA	0000000264575212	2019-12-10 14:22:10.050227	\N	\N	1	\N	761	\N	100000	2	1	1
7738	2019-10-25	IMPS-929808250233-RESILIENT INNOVATION-HDFC-XXXXXXXXXXX0061-BHARATPE9010001788920191024	0000929808250233	2019-12-10 14:22:10.050227	\N	\N	1	\N	816	521	\N	2	1	1
7741	2019-10-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000082351	2019-12-10 14:22:10.050227	\N	\N	1	\N	197	15317	\N	2	1	1
7740	2019-10-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785690	2019-12-10 14:22:10.050227	\N	\N	1	\N	143	51459	\N	2	1	1
7742	2019-10-25	50200007138822-TPT-JP CA TO TTC CA	0000000387393925	2019-12-10 14:22:10.050227	\N	\N	1	\N	761	200000	\N	2	1	1
7739	2019-10-25	RDMCGHA0090-STP-RDM	IB25164032385819	2019-12-10 14:22:10.050227	\N	\N	1	\N	765	\N	49266	2	1	1
7743	2019-10-27	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-930002136143-BHARATPE9010001788	0000093002338769	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	40	\N	2	1	1
7754	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000798694	2019-12-10 14:22:10.050227	\N	\N	1	\N	62	1465	\N	2	1	1
7753	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001114	2019-12-10 14:22:10.050227	\N	\N	1	\N	348	2992	\N	2	1	1
7752	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000086893	2019-12-10 14:22:10.050227	\N	\N	1	\N	505	4600	\N	2	1	1
7751	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000182	2019-12-10 14:22:10.050227	\N	\N	1	\N	326	7945	\N	2	1	1
7750	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044332	2019-12-10 14:22:10.050227	\N	\N	1	\N	569	9487	\N	2	1	1
7749	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000751737	2019-12-10 14:22:10.050227	\N	\N	1	\N	383	9848	\N	2	1	1
7748	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000240	2019-12-10 14:22:10.050227	\N	\N	1	\N	309	10125	\N	2	1	1
7747	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482290	2019-12-10 14:22:10.050227	\N	\N	1	\N	646	11267	\N	2	1	1
7746	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000084522	2019-12-10 14:22:10.050227	\N	\N	1	\N	449	18255	\N	2	1	1
7744	2019-10-30	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN219303873761	SBIN219303873761	2019-12-10 14:22:10.050227	\N	\N	1	\N	403	20000	\N	2	1	1
7745	2019-10-30	FT - CR - 50100239891016 - RINKU NAGAR	0000000000000023	2019-12-10 14:22:10.050227	\N	\N	1	\N	480	26546	\N	2	1	1
7757	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000751731	2019-12-10 14:22:10.050227	\N	\N	1	\N	383	30754	\N	2	1	1
7756	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136727	2019-12-10 14:22:10.050227	\N	\N	1	\N	261	87788	\N	2	1	1
7764	2019-10-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001398	2019-12-10 14:22:10.050227	\N	\N	1	\N	262	3447	\N	2	1	1
7768	2019-10-31	UPI-BHUPENDRA PATHAK-PATHAK.BHUPENDRA98@OKHDFCBANK-HDFC0003966-930420838499-A	0000930420788394	2019-12-10 14:22:10.050227	\N	\N	1	\N	810	3675	\N	2	1	1
7765	2019-10-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000041	2019-12-10 14:22:10.050227	\N	\N	1	\N	76	4265	\N	2	1	1
7766	2019-10-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001624	2019-12-10 14:22:10.050227	\N	\N	1	\N	139	4604	\N	2	1	1
7767	2019-10-31	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000071190	2019-12-10 14:22:10.050227	\N	\N	1	\N	151	14824	\N	2	1	1
7760	2019-10-31	CASH DEP DADRI	000000000000000	2019-12-10 14:22:10.050227	\N	\N	1	\N	773	200000	\N	2	1	1
7762	2019-10-31	ACH D- MONDELEZ INDIA FOODS-DB37670510	0000003105717626	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	36239.8700000000026	2	1	1
7759	2019-10-31	HB3142NR1000007858-STP-GODREJ	IB31130850701485	2019-12-10 14:22:10.050227	\N	\N	1	\N	763	\N	73594.1499999999942	2	1	1
7763	2019-10-31	ACH D- MONDELEZ INDIA FOODS-DB37640441	0000003105717627	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	203774.559999999998	2	1	1
7761	2019-10-31	BCCLTDGT69776-STP-BAJAJ	IB31150742617383	2019-12-10 14:22:10.050227	\N	\N	1	\N	767	\N	215000	2	1	1
7770	2019-11-01	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785696	2019-12-10 14:22:10.050227	\N	\N	1	\N	143	33438	\N	2	1	1
7769	2019-11-01	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-N305190969438838-COLGATE	N305190969438838	2019-12-10 14:22:10.050227	\N	\N	1	\N	764	\N	46225.510000000002	2	1	1
7775	2019-11-02	CHQ DEP - MICR CLG - NOIDA WBO	0000000000000029	2019-12-10 14:22:10.050227	\N	\N	1	\N	817	4753	\N	2	1	1
7773	2019-11-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000080428	2019-12-10 14:22:10.050227	\N	\N	1	\N	6	13172	\N	2	1	1
7774	2019-11-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000036065	2019-12-10 14:22:10.050227	\N	\N	1	\N	18	53474	\N	2	1	1
7772	2019-11-02	ACH D- MONDELEZ INDIA FOODS-DB37700459	0000003160307923	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	155190.579999999987	2	1	1
7780	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000042	2019-12-10 14:22:10.050227	\N	\N	1	\N	76	2182	\N	2	1	1
7781	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001059	2019-12-10 14:22:10.050227	\N	\N	1	\N	475	2248	\N	2	1	1
7782	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000047300	2019-12-10 14:22:10.050227	\N	\N	1	\N	122	3000	\N	2	1	1
7783	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000033077	2019-12-10 14:22:10.050227	\N	\N	1	\N	113	5133	\N	2	1	1
7777	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000822	2019-12-10 14:22:10.050227	\N	\N	1	\N	619	11216	\N	2	1	1
7778	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000938627	2019-12-10 14:22:10.050227	\N	\N	1	\N	593	13117	\N	2	1	1
7779	2019-11-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000089947	2019-12-10 14:22:10.050227	\N	\N	1	\N	199	36190	\N	2	1	1
7776	2019-11-04	EMI 58456073 CHQ S58456073117 111958456073	000000000000000	2019-12-10 14:22:10.050227	\N	\N	1	\N	774	\N	87242	2	1	1
7787	2019-11-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000317576	2019-12-10 14:22:10.050227	\N	\N	1	\N	145	8650	\N	2	1	1
7784	2019-11-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000341056	2019-12-10 14:22:10.050227	\N	\N	1	\N	791	34725	\N	2	1	1
7786	2019-11-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000949220	2019-12-10 14:22:10.050227	\N	\N	1	\N	788	41684	\N	2	1	1
7785	2019-11-05	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000578603	2019-12-10 14:22:10.050227	\N	\N	1	\N	349	55620	\N	2	1	1
7791	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826771	2019-12-10 14:22:10.050227	\N	\N	1	\N	45	1840	\N	2	1	1
7792	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000050002	2019-12-10 14:22:10.050227	\N	\N	1	\N	122	3000	\N	2	1	1
7793	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000185	2019-12-10 14:22:10.050227	\N	\N	1	\N	326	4272	\N	2	1	1
7794	2019-11-06	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000043297	2019-12-10 14:22:10.050227	\N	\N	1	\N	131	16617	\N	2	1	1
7788	2019-11-06	CASH DEP DADRI	000000000000000	2019-12-10 14:22:10.050227	\N	\N	1	\N	773	200000	\N	2	1	1
7789	2019-11-06	BCCLTDGT69776-STP-BAJAJ	IB06133611579036	2019-12-10 14:22:10.050227	\N	\N	1	\N	767	\N	35000	2	1	1
7790	2019-11-06	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000949220	2019-12-10 14:22:10.050227	\N	\N	1	\N	788	\N	41684	2	1	1
7799	2019-11-07	FT - CR - 50100302237710 - TAUHID	0000000000000016	2019-12-10 14:22:10.050227	\N	\N	1	\N	818	5354	\N	2	1	1
7801	2019-11-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136172	2019-12-10 14:22:10.050227	\N	\N	1	\N	326	20203	\N	2	1	1
7800	2019-11-07	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000047914	2019-12-10 14:22:10.050227	\N	\N	1	\N	14	27365	\N	2	1	1
7796	2019-11-07	IMPS-931111186623-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-TUSHAR	0000931111186623	2019-12-10 14:22:10.050227	\N	\N	1	\N	158	30395	\N	2	1	1
7798	2019-11-07	NEFT CR-CBIN0284598-RADHEY LAL JAI PRAKASH-TUSHAR TRADING CO-CBINH19311120640	CBINH19311120640	2019-12-10 14:22:10.050227	\N	\N	1	\N	429	70000	\N	2	1	1
7795	2019-11-07	O/S INTEREST RECOVERY FOR A/C XXXXXXXXXX3444	000000000000000	2019-12-10 14:22:10.050227	\N	\N	1	\N	776	\N	28565	2	1	1
7797	2019-11-07	HB3142NR1000007858-STP-GODREJ	IB07123150577558	2019-12-10 14:22:10.050227	\N	\N	1	\N	763	\N	223752.540000000008	2	1	1
7802	2019-11-08	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672918	2019-12-10 14:22:10.050227	\N	\N	1	\N	786	18749	\N	2	1	1
7807	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000137027	2019-12-10 14:22:10.050227	\N	\N	1	\N	589	1194	\N	2	1	1
7808	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044484	2019-12-10 14:22:10.050227	\N	\N	1	\N	97	1750	\N	2	1	1
7809	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000354613	2019-12-10 14:22:10.050227	\N	\N	1	\N	161	2711	\N	2	1	1
7803	2019-11-11	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-931503859208-BHARATPE9010001788	0000093153237625	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	7000	\N	2	1	1
7810	2019-11-11	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044415	2019-12-10 14:22:10.050227	\N	\N	1	\N	131	8300	\N	2	1	1
7804	2019-11-11	CASH DEP DADRI	000000000000000	2019-12-10 14:22:10.050227	\N	\N	1	\N	773	200000	\N	2	1	1
7806	2019-11-11	CHQ DEP RET CHGS 061119-MIR1931592475323	0000000000949220	2019-12-10 14:22:10.050227	\N	\N	1	\N	778	\N	118	2	1	1
7811	2019-11-11	GST/BANK REFERENCE NO: R1931515157441/CIN NO: HDFC19110900110590	0191111090012419	2019-12-10 14:22:10.050227	\N	\N	1	\N	783	\N	9920	2	1	1
7805	2019-11-11	RTGS DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-HDFCR52019111153903985-COLGATE	HDFCR52019111153903985	2019-12-10 14:22:10.050227	\N	\N	1	\N	764	\N	237000	2	1	1
7815	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000045	2019-12-10 14:22:10.050227	\N	\N	1	\N	76	1455	\N	2	1	1
7817	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000050007	2019-12-10 14:22:10.050227	\N	\N	1	\N	122	3000	\N	2	1	1
7814	2019-11-13	RDMCGHA0090-STP-RDM	IB13113410577762	2019-12-10 14:22:10.050227	\N	\N	1	\N	765	\N	49510	2	1	1
7816	2019-11-13	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000347230	2019-12-10 14:22:10.050227	\N	\N	1	\N	819	87707	\N	2	1	1
7818	2019-11-14	IMPS-931810872455-TILAPTA GROCERY MART-HDFC-XXXXXXXX3444-TGM	0000931810872455	2019-12-10 14:22:10.050227	\N	\N	1	\N	632	20760	\N	2	1	1
7819	2019-11-14	NEFT CR-PUNB0010900-PREM CHAND PRAMOD KUMAR-TUSHAR TRADING COMPANY-PUNBH19318321835	PUNBH19318321835	2019-12-10 14:22:10.050227	\N	\N	1	\N	422	60821	\N	2	1	1
7820	2019-11-14	50100040075595-TPT-DRAWINGS	0000000214277131	2019-12-10 14:22:10.050227	\N	\N	1	\N	772	\N	5000	2	1	1
7830	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000086897	2019-12-10 14:22:10.050227	\N	\N	1	\N	505	1282	\N	2	1	1
7829	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000120	2019-12-10 14:22:10.050227	\N	\N	1	\N	110	2867	\N	2	1	1
7828	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000932309	2019-12-10 14:22:10.050227	\N	\N	1	\N	633	6209	\N	2	1	1
7821	2019-11-15	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-931904035112-BHARATPE9010001788	0000093194681588	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	3660	\N	2	1	1
7827	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000020270	2019-12-10 14:22:10.050227	\N	\N	1	\N	255	11424	\N	2	1	1
7826	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000659	2019-12-10 14:22:10.050227	\N	\N	1	\N	628	23843	\N	2	1	1
7825	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785706	2019-12-10 14:22:10.050227	\N	\N	1	\N	143	25268	\N	2	1	1
7824	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001506	2019-12-10 14:22:10.050227	\N	\N	1	\N	262	26212	\N	2	1	1
7823	2019-11-15	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000949221	2019-12-10 14:22:10.050227	\N	\N	1	\N	788	41684	\N	2	1	1
7822	2019-11-15	ACH D- MONDELEZ INDIA FOODS-DB37830760	0000003436034918	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	149439.369999999995	2	1	1
7831	2019-11-16	UPI-BHARATPE MERCHANT-BHARATPE.PAYOUT@YESBANK-YESB0000480-932012576340-CASHBACK	0000932012808124	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	11	\N	2	1	1
7833	2019-11-16	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000050009	2019-12-10 14:22:10.050227	\N	\N	1	\N	761	2426	\N	2	1	1
7832	2019-11-16	ACH D- MONDELEZ INDIA FOODS-DB37840636	0000003455738342	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	36698.3199999999997	2	1	1
7834	2019-11-17	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-932118115124-BHARATPE9010001788	0000932118614581	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	9297	\N	2	1	1
7837	2019-11-19	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000061098	2019-12-10 14:22:10.050227	\N	\N	1	\N	401	9732	\N	2	1	1
7836	2019-11-19	NEFT CR-BARB0SURGAU-GOYAL TRADERS-TUSHAR TRADING COMPANY-BARBT19323991934	BARBT19323991934	2019-12-10 14:22:10.050227	\N	\N	1	\N	190	76533	\N	2	1	1
7835	2019-11-19	ACH D- MONDELEZ INDIA FOODS-DB37870581	0000003490096975	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	142556.290000000008	2	1	1
7838	2019-11-20	IMPS-932411438605-GOYAL KIRANA STORE-HDFC-XXXXXXXXXX1265-HIT ALMON B VUTA	0000932411438605	2019-12-10 14:22:10.050227	\N	\N	1	\N	186	3499	\N	2	1	1
7841	2019-11-20	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482299	2019-12-10 14:22:10.050227	\N	\N	1	\N	646	4939	\N	2	1	1
7839	2019-11-20	50200007138822-TPT-JP CA TO TUSHAR CA	0000000269630108	2019-12-10 14:22:10.050227	\N	\N	1	\N	761	100000	\N	2	1	1
7840	2019-11-20	ACH D- MONDELEZ INDIA FOODS-DB37880669	0000003506647614	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	277950.419999999984	2	1	1
7845	2019-11-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019609	2019-12-10 14:22:10.050227	\N	\N	1	\N	626	4302	\N	2	1	1
7844	2019-11-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000932325	2019-12-10 14:22:10.050227	\N	\N	1	\N	633	13397	\N	2	1	1
7843	2019-11-21	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000200579	2019-12-10 14:22:10.050227	\N	\N	1	\N	309	14530	\N	2	1	1
7846	2019-11-22	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-932604974454-BHARATPE9010001788	0000093264403287	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	4630	\N	2	1	1
7847	2019-11-22	IMPS-932610157129-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARG	0000932610157129	2019-12-10 14:22:10.050227	\N	\N	1	\N	158	9870	\N	2	1	1
7849	2019-11-22	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785712	2019-12-10 14:22:10.050227	\N	\N	1	\N	143	49819	\N	2	1	1
7848	2019-11-22	NEFT CR-SBIN0003342-RAMA PROVISION STORE-TUSHAR TRADING CO-SBIN319326850505	SBIN319326850505	2019-12-10 14:22:10.050227	\N	\N	1	\N	462	93456	\N	2	1	1
7850	2019-11-23	50200013317598-TPT-TUSHAR-MAHENDRA KUMAR PRAMOD KUMAR	0000000305152794	2019-12-10 14:22:10.050227	\N	\N	1	\N	291	10171	\N	2	1	1
7851	2019-11-24	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-932803852611-BHARATPE9010001788	0000093283822059	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	2000	\N	2	1	1
7854	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000067994	2019-12-10 14:22:10.050227	\N	\N	1	\N	62	1744	\N	2	1	1
7855	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000510496	2019-12-10 14:22:10.050227	\N	\N	1	\N	761	4329	\N	2	1	1
7853	2019-11-25	FT - CR - 09272000000837 - ANUJ MEDICAL STORE	0000000000000281	2019-12-10 14:22:10.050227	\N	\N	1	\N	49	4425	\N	2	1	1
7863	2019-11-25	CHQ DEP - MICR CLG - NOIDA WBO	0000000000201457	2019-12-10 14:22:10.050227	\N	\N	1	\N	381	4447	\N	2	1	1
7865	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000076877	2019-12-10 14:22:10.050227	\N	\N	1	\N	785	5369	\N	2	1	1
7864	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000932343	2019-12-10 14:22:10.050227	\N	\N	1	\N	633	8630	\N	2	1	1
7862	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000080433	2019-12-10 14:22:10.050227	\N	\N	1	\N	6	10062	\N	2	1	1
7861	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001069	2019-12-10 14:22:10.050227	\N	\N	1	\N	131	10633	\N	2	1	1
7860	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000061099	2019-12-10 14:22:10.050227	\N	\N	1	\N	401	12057	\N	2	1	1
7859	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000082369	2019-12-10 14:22:10.050227	\N	\N	1	\N	197	14583	\N	2	1	1
7858	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000136179	2019-12-10 14:22:10.050227	\N	\N	1	\N	327	15585	\N	2	1	1
7857	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000395214	2019-12-10 14:22:10.050227	\N	\N	1	\N	627	31319	\N	2	1	1
7856	2019-11-25	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000763615	2019-12-10 14:22:10.050227	\N	\N	1	\N	35	55887	\N	2	1	1
7852	2019-11-25	RDMCGHA0090-STP-RDM	IB25112501685437	2019-12-10 14:22:10.050227	\N	\N	1	\N	765	\N	40000	2	1	1
7874	2019-11-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000482302	2019-12-10 14:22:10.050227	\N	\N	1	\N	646	4420	\N	2	1	1
7867	2019-11-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000044858	2019-12-10 14:22:10.050227	\N	\N	1	\N	727	20352	\N	2	1	1
7868	2019-11-26	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001064	2019-12-10 14:22:10.050227	\N	\N	1	\N	475	39933	\N	2	1	1
7873	2019-11-27	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000050015	2019-12-10 14:22:10.050227	\N	\N	1	\N	122	2994	\N	2	1	1
7870	2019-11-27	NEFT CR-ICIC0001917-SUNIL KIRANA STORE-TUSHAR TRADING CO-000077969593	0000000077969593	2019-12-10 14:22:10.050227	\N	\N	1	\N	619	34377	\N	2	1	1
7872	2019-11-27	CHQ DEP RET- FUNDS INSUFFICIENT	0000000000000050	2019-12-10 14:22:10.050227	\N	\N	1	\N	76	\N	6035	2	1	1
7871	2019-11-27	BCCLTDGT69776-STP-BAJAJ	IB27121216853374	2019-12-10 14:22:10.050227	\N	\N	1	\N	767	\N	250000	2	1	1
7879	2019-11-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000826788	2019-12-10 14:22:10.050227	\N	\N	1	\N	45	1258	\N	2	1	1
7877	2019-11-28	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN419332074003	SBIN419332074003	2019-12-10 14:22:10.050227	\N	\N	1	\N	403	4641	\N	2	1	1
7876	2019-11-28	NEFT CR-SBIN0003342-M S POOJA KIRANA STORE-TUSHAR TRADING CO-SBIN419332036886	SBIN419332036886	2019-12-10 14:22:10.050227	\N	\N	1	\N	403	8500	\N	2	1	1
7880	2019-11-28	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000086542	2019-12-10 14:22:10.050227	\N	\N	1	\N	820	150000	\N	2	1	1
7878	2019-11-28	HB3142NR1000007858-STP-GODREJ	IB28181930661972	2019-12-10 14:22:10.050227	\N	\N	1	\N	763	\N	27001	2	1	1
7875	2019-11-28	ACH D- MONDELEZ INDIA FOODS-DB37960627	0000003655982072	2019-12-10 14:22:10.050227	\N	\N	1	\N	762	\N	48472.2200000000012	2	1	1
7883	2019-11-29	IMPS-933313140015-GARG KIRANA STORE-HDFC-XXXXXXXXXX6326-GARG	0000933313140015	2019-12-10 14:22:10.050227	\N	\N	1	\N	158	13717	\N	2	1	1
7884	2019-11-29	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000785718	2019-12-10 14:22:10.050227	\N	\N	1	\N	143	35678	\N	2	1	1
7882	2019-11-29	CHQ DEP RET CHGS 271119-MIR1933337723166	0000000000000050	2019-12-10 14:22:10.050227	\N	\N	1	\N	778	\N	118	2	1	1
7889	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000084536	2019-12-10 14:22:10.050227	\N	\N	1	\N	449	5175	\N	2	1	1
7887	2019-11-30	IMPS-933418617154-PRIYA SHIV CONFECTIO-HDFC-XXXXXXXXXXX1070-	0000933418617154	2019-12-10 14:22:10.050227	\N	\N	1	\N	821	6163	\N	2	1	1
7890	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000201461	2019-12-10 14:22:10.050227	\N	\N	1	\N	381	7435	\N	2	1	1
7888	2019-11-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000046235	2019-12-10 14:22:10.050227	\N	\N	1	\N	370	10199	\N	2	1	1
7885	2019-11-30	NEFT DR-BOFA0MM6205-COLGATE PALMOLIVE INDIA LTD-NETBANK, MUM-N334190994807271-COLGATE	N334190994807271	2019-12-10 14:22:10.050227	\N	\N	1	\N	764	\N	100000	2	1	1
7886	2019-11-30	BCCLTDGT69776-STP-BAJAJ	IB30115745597814	2019-12-10 14:22:10.050227	\N	\N	1	\N	767	\N	100000	2	1	1
7894	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001080	2019-12-10 14:22:10.050227	\N	\N	1	\N	131	2185	\N	2	1	1
7893	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000050022	2019-12-10 14:22:10.050227	\N	\N	1	\N	122	3000	\N	2	1	1
7892	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000751756	2019-12-10 14:22:10.050227	\N	\N	1	\N	383	12713	\N	2	1	1
7897	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000797520	2019-12-10 14:22:10.050227	\N	\N	1	\N	791	15825	\N	2	1	1
7891	2019-12-02	FT - CR - 50200044569247 - M/S ABHISHEK DEPARTMENTAL STORE	0000000000000012	2019-12-10 14:22:10.050227	\N	\N	1	\N	14	16832	\N	2	1	1
7896	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000045608	2019-12-10 14:22:10.050227	\N	\N	1	\N	97	18084	\N	2	1	1
7895	2019-12-02	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000775682	2019-12-10 14:22:10.050227	\N	\N	1	\N	392	18350	\N	2	1	1
7898	2019-12-03	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000052	2019-12-10 14:22:10.050227	\N	\N	1	\N	76	6035	\N	2	1	1
7901	2019-12-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000082376	2019-12-10 14:22:10.050227	\N	\N	1	\N	197	9377	\N	2	1	1
7902	2019-12-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000932366	2019-12-10 14:22:10.050227	\N	\N	1	\N	633	9654	\N	2	1	1
7903	2019-12-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000672971	2019-12-10 14:22:10.050227	\N	\N	1	\N	786	17070	\N	2	1	1
7900	2019-12-04	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000000299	2019-12-10 14:22:10.050227	\N	\N	1	\N	261	140213	\N	2	1	1
7899	2019-12-04	EMI 58456073 CHQ S58456073118 121958456073	000000000000000	2019-12-10 14:22:10.050227	\N	\N	1	\N	774	\N	87242	2	1	1
7699	2019-10-17	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000001387	2019-12-10 14:22:10.050227	\N	\N	1	\N	262	4487	\N	2	1	1
7726	2019-10-23	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-929601820189-BHARATPE9010001788	0000092961984611	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	1	\N	2	1	1
7755	2019-10-30	CHQ DEP MICR CLG NOIDA - MICR 1 CLG - NO	0000000000019604	2019-12-10 14:22:10.050227	\N	\N	1	\N	626	1450	\N	2	1	1
7771	2019-11-02	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-930603300393-BHARATPE9010001788	0000093063835437	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	6500	\N	2	1	1
7812	2019-11-12	IMPS-931611432466-K K STORE-HDFC-XXXXXXXXXX1250-MB  TRANSFER TO TUSHAR	0000931611432466	2019-12-10 14:22:10.050227	\N	\N	1	\N	234	10527	\N	2	1	1
7842	2019-11-21	IMPS-932514427085-RESILIENT INNOVATION-HDFC-XXXXXXXXXXX0061-BHARATPE9010001788920191119YES	0000932514427085	2019-12-10 14:22:10.050227	\N	\N	1	\N	816	4865	\N	2	1	1
7866	2019-11-26	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-933003736698-BHARATPE9010001788	0000093303729720	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	2015	\N	2	1	1
7881	2019-11-29	UPI-BHARATPE MERCHANT-BHARATPEMERCHANT@YESBANK-YESB0000004-933303037355-BHARATPE9010001788	0000093333176580	2019-12-10 14:22:10.050227	\N	\N	1	\N	811	8342	\N	2	1	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, password) FROM stdin;
1	Tushar	1234
\.


--
-- Name: banks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banks_id_seq', 5, true);


--
-- Name: chq_reg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chq_reg_id_seq', 1, false);


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_id_seq', 2, true);


--
-- Name: company_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_masters_id_seq', 5, true);


--
-- Name: cust_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cust_id_seq', 767, true);


--
-- Name: files_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_table_id_seq', 47, true);


--
-- Name: ledger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ledger_id_seq', 39, true);


--
-- Name: master_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.master_groups_id_seq', 4, true);


--
-- Name: master_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.master_id_seq', 3587, true);


--
-- Name: statement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statement_id_seq', 7936, true);


--
-- Name: chq_reg chq_reg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chq_reg
    ADD CONSTRAINT chq_reg_pkey PRIMARY KEY (id);


--
-- Name: company_masters company_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_masters
    ADD CONSTRAINT company_masters_pkey PRIMARY KEY (id);


--
-- Name: files_table files_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_table
    ADD CONSTRAINT files_table_pkey PRIMARY KEY (id);


--
-- Name: ledger ledger_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger
    ADD CONSTRAINT ledger_pkey PRIMARY KEY (id);


--
-- Name: masters masters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.masters
    ADD CONSTRAINT masters_pkey PRIMARY KEY (id);


--
-- Name: ledger no_duplicate_bill; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger
    ADD CONSTRAINT no_duplicate_bill UNIQUE (cust_id, ledger_no);


--
-- Name: statement statement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statement
    ADD CONSTRAINT statement_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

