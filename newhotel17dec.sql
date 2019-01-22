--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    booking_id integer NOT NULL,
    cust_id bigint,
    r_id bigint,
    pay_id bigint,
    employee_id bigint,
    checkin_date timestamp without time zone,
    checkout_date timestamp without time zone,
    booking_date timestamp without time zone,
    booking_status character varying(200),
    booking_site character varying(200) DEFAULT NULL::character varying,
    no_of_childrens integer,
    no_of_adults integer,
    booking_type character varying(200),
    note character varying(200),
    tiffen integer,
    lunch integer,
    dinner integer
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- Name: booking_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_booking_id_seq OWNER TO postgres;

--
-- Name: booking_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_booking_id_seq OWNED BY public.booking.booking_id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    customer_fname character varying(200),
    customer_lname character varying(200),
    phone bigint,
    address character varying(200),
    email character varying(200),
    gender character varying(20),
    identity_type character varying(200),
    identity_number character varying(200),
    photo character varying(255),
    gst_number character varying(200)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    emp_id integer NOT NULL,
    fname character varying(255),
    lname character varying(255),
    email character varying(255),
    phone bigint,
    address character varying(255),
    designation_id bigint,
    salary double precision,
    dob date,
    doj date,
    gender character varying(255),
    employee_status character varying(255),
    identity_type character varying(255),
    identity_num character varying(255),
    emp_pass character varying(255)
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_emp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_emp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_emp_id_seq OWNER TO postgres;

--
-- Name: employee_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_emp_id_seq OWNED BY public.employee.emp_id;


--
-- Name: extra_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extra_service (
    esid integer NOT NULL,
    description character varying(200),
    book_id bigint,
    price double precision,
    service_price double precision,
    service_tax bigint,
    service_type character varying(200),
    quantity bigint
);


ALTER TABLE public.extra_service OWNER TO postgres;

--
-- Name: extra_service_esid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.extra_service_esid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extra_service_esid_seq OWNER TO postgres;

--
-- Name: extra_service_esid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.extra_service_esid_seq OWNED BY public.extra_service.esid;


--
-- Name: facilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facilities (
    fac_id integer NOT NULL,
    fac_name character varying(255),
    fac_description character varying(255),
    fac_price double precision
);


ALTER TABLE public.facilities OWNER TO postgres;

--
-- Name: facilities_fac_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facilities_fac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facilities_fac_id_seq OWNER TO postgres;

--
-- Name: facilities_fac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facilities_fac_id_seq OWNED BY public.facilities.fac_id;


--
-- Name: logindetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logindetails (
    login_id integer NOT NULL,
    date date,
    in_time time without time zone,
    out_time time without time zone,
    employee_id integer
);


ALTER TABLE public.logindetails OWNER TO postgres;

--
-- Name: logindetails_login_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logindetails_login_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logindetails_login_id_seq OWNER TO postgres;

--
-- Name: logindetails_login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logindetails_login_id_seq OWNED BY public.logindetails.login_id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    payment_status character varying(200),
    payment_method character varying(200),
    bill_date timestamp without time zone,
    employee_id bigint,
    ocuupy_date date,
    total_amount double precision,
    total_rent double precision,
    room_price double precision,
    tax_amount double precision,
    advance_pay double precision,
    occupy_advance double precision,
    payment_tax double precision,
    concession_amount double precision,
    concession_rate double precision
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    role_name character varying(255)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: room_update; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room_update (
    update_id integer NOT NULL,
    old_rid bigint,
    b_id bigint,
    shift_date date
);


ALTER TABLE public.room_update OWNER TO postgres;

--
-- Name: room_update_update_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_update_update_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_update_update_id_seq OWNER TO postgres;

--
-- Name: room_update_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_update_update_id_seq OWNED BY public.room_update.update_id;


--
-- Name: roomcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roomcategory (
    cat_id integer NOT NULL,
    cat_name character varying(255),
    price double precision,
    rid bigint,
    taxid integer
);


ALTER TABLE public.roomcategory OWNER TO postgres;

--
-- Name: roomcategory_cat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roomcategory_cat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roomcategory_cat_id_seq OWNER TO postgres;

--
-- Name: roomcategory_cat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roomcategory_cat_id_seq OWNED BY public.roomcategory.cat_id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    rooms_id integer NOT NULL,
    room_num character varying(255),
    r_type bigint,
    r_cat bigint,
    status character varying(255),
    no_adults bigint,
    no_childrens bigint
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: rooms_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_rooms_id_seq OWNER TO postgres;

--
-- Name: rooms_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_rooms_id_seq OWNED BY public.rooms.rooms_id;


--
-- Name: roomtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roomtype (
    room_id integer NOT NULL,
    room_type character varying(255)
);


ALTER TABLE public.roomtype OWNER TO postgres;

--
-- Name: roomtype_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roomtype_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roomtype_room_id_seq OWNER TO postgres;

--
-- Name: roomtype_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roomtype_room_id_seq OWNED BY public.roomtype.room_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    service_name character varying(200),
    service_price double precision,
    service_description text,
    service_tax integer
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_service_id_seq OWNER TO postgres;

--
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- Name: taxdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taxdetails (
    tax_id integer NOT NULL,
    taxstartprice integer,
    taxendprice integer,
    tax integer
);


ALTER TABLE public.taxdetails OWNER TO postgres;

--
-- Name: taxdetails_tax_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taxdetails_tax_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taxdetails_tax_id_seq OWNER TO postgres;

--
-- Name: taxdetails_tax_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taxdetails_tax_id_seq OWNED BY public.taxdetails.tax_id;


--
-- Name: trip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trip (
    trip_id integer NOT NULL,
    trip_name character varying(255),
    trip_price double precision,
    trip_description character varying(255)
);


ALTER TABLE public.trip OWNER TO postgres;

--
-- Name: trip_trip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trip_trip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trip_trip_id_seq OWNER TO postgres;

--
-- Name: trip_trip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trip_trip_id_seq OWNED BY public.trip.trip_id;


--
-- Name: user_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_services (
    uservice_id integer NOT NULL,
    serv_id bigint,
    book_id bigint
);


ALTER TABLE public.user_services OWNER TO postgres;

--
-- Name: user_services_uservice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_services_uservice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_services_uservice_id_seq OWNER TO postgres;

--
-- Name: user_services_uservice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_services_uservice_id_seq OWNED BY public.user_services.uservice_id;


--
-- Name: weekdays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weekdays (
    weekid integer NOT NULL,
    sun integer,
    mon integer,
    tue integer,
    wed integer,
    thu integer,
    fri integer,
    sat integer,
    tripid bigint
);


ALTER TABLE public.weekdays OWNER TO postgres;

--
-- Name: weekdays_weekid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weekdays_weekid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weekdays_weekid_seq OWNER TO postgres;

--
-- Name: weekdays_weekid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weekdays_weekid_seq OWNED BY public.weekdays.weekid;


--
-- Name: booking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN booking_id SET DEFAULT nextval('public.booking_booking_id_seq'::regclass);


--
-- Name: customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Name: emp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN emp_id SET DEFAULT nextval('public.employee_emp_id_seq'::regclass);


--
-- Name: esid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extra_service ALTER COLUMN esid SET DEFAULT nextval('public.extra_service_esid_seq'::regclass);


--
-- Name: fac_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facilities ALTER COLUMN fac_id SET DEFAULT nextval('public.facilities_fac_id_seq'::regclass);


--
-- Name: login_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logindetails ALTER COLUMN login_id SET DEFAULT nextval('public.logindetails_login_id_seq'::regclass);


--
-- Name: payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: update_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_update ALTER COLUMN update_id SET DEFAULT nextval('public.room_update_update_id_seq'::regclass);


--
-- Name: cat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roomcategory ALTER COLUMN cat_id SET DEFAULT nextval('public.roomcategory_cat_id_seq'::regclass);


--
-- Name: rooms_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN rooms_id SET DEFAULT nextval('public.rooms_rooms_id_seq'::regclass);


--
-- Name: room_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roomtype ALTER COLUMN room_id SET DEFAULT nextval('public.roomtype_room_id_seq'::regclass);


--
-- Name: service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- Name: tax_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxdetails ALTER COLUMN tax_id SET DEFAULT nextval('public.taxdetails_tax_id_seq'::regclass);


--
-- Name: trip_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip ALTER COLUMN trip_id SET DEFAULT nextval('public.trip_trip_id_seq'::regclass);


--
-- Name: uservice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_services ALTER COLUMN uservice_id SET DEFAULT nextval('public.user_services_uservice_id_seq'::regclass);


--
-- Name: weekid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weekdays ALTER COLUMN weekid SET DEFAULT nextval('public.weekdays_weekid_seq'::regclass);


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking (booking_id, cust_id, r_id, pay_id, employee_id, checkin_date, checkout_date, booking_date, booking_status, booking_site, no_of_childrens, no_of_adults, booking_type, note, tiffen, lunch, dinner) FROM stdin;
270	309	34	276	3	2018-10-11 00:00:00	2018-10-11 00:00:00	2018-10-11 00:00:00	booked	www.bookingsite.com	0	1	hotel	none	1	0	0
271	310	28	277	3	2018-10-11 00:00:00	2018-10-11 00:00:00	2018-10-11 00:00:00	booked	www.bookingsite.com	0	1	hotel	none	1	0	0
272	311	28	278	3	2018-10-11 00:00:00	2018-10-11 00:00:00	2018-10-11 00:00:00	booked	www.bookingsite.com	0	1	online	none	1	0	0
273	312	33	279	3	2018-10-11 00:00:00	2018-10-11 00:00:00	2018-10-11 00:00:00	booked	www.bookingsite.com	0	1	hotel	none	1	0	0
274	313	28	280	3	2018-10-11 00:00:00	2018-10-11 00:00:00	2018-10-11 00:00:00	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
275	314	30	281	3	2018-10-11 00:00:00	2018-10-11 00:00:00	2018-10-11 00:00:00	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
269	308	31	275	3	2018-10-11 00:00:00	2018-10-11 00:00:00	2018-10-11 00:00:00	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
276	315	31	282	\N	2018-11-17 00:00:00	2018-11-18 00:00:00	2018-11-17 00:00:00	occupy	www.bookingsite.com	2	2	hotel	none	1	0	0
278	317	30	284	13	2018-12-08 00:00:00	2018-12-09 00:00:00	2018-12-08 00:00:00	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
279	318	42	285	13	2018-12-08 00:00:00	2018-12-09 00:00:00	2018-12-08 00:00:00	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
280	319	40	286	13	2018-12-08 00:00:00	2018-12-09 00:00:00	2018-12-08 00:00:00	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
281	320	49	287	13	2018-12-08 00:00:00	2018-12-09 00:00:00	2018-12-08 00:00:00	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
282	321	41	288	13	2018-12-08 00:00:00	2018-12-09 00:00:00	2018-12-08 00:00:00	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
283	322	29	289	13	2018-12-08 16:56:31	2018-12-09 16:56:31	2018-12-08 00:00:00	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
284	323	48	290	13	2018-12-13 08:30:22	2018-12-21 14:30:22	2018-12-08 17:12:48	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
286	325	44	292	13	2018-12-10 12:01:27	2018-12-19 15:30:27	2018-12-10 12:12:04	reserve	www.bookingsite.com	1	2	hotel	none	1	0	0
287	326	30	293	13	2018-12-10 13:11:07	2018-12-28 13:11:07	2018-12-10 13:12:32	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
289	328	27	295	13	2018-12-10 14:48:05	2018-12-10 17:00:05	2018-12-10 14:12:28	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
304	343	62	310	13	2018-12-12 17:21:42	2018-12-12 17:47:36	2018-12-12 17:12:28	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
292	331	50	298	13	2018-12-12 09:20:23	2018-12-12 17:47:50	2018-12-12 09:12:33	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
294	333	31	300	13	2018-12-12 11:11:34	2018-12-12 17:48:17	2018-12-12 11:12:45	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
299	338	40	305	13	2018-12-14 12:34:43	2018-12-15 12:34:43	2018-12-12 12:12:55	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
290	329	63	296	13	2018-12-10 15:00:14	2018-12-11 15:00:14	2018-12-10 15:12:42	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
301	340	29	307	13	2018-12-13 12:49:32	2018-12-14 12:49:32	2018-12-12 12:12:50	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
288	327	57	294	13	2018-12-10 14:45:13	2018-12-11 14:45:13	2018-12-10 14:12:24	cancel	www.bookingsite.com	0	1	hotel		1	0	0
285	324	50	291	13	2018-12-10 10:02:41	2018-12-11 10:02:41	2018-12-10 10:12:55	cancel	www.bookingsite.com	0	1	hotel	none	1	0	0
295	334	49	301	13	2018-12-12 11:13:55	2018-12-12 17:48:56	2018-12-12 11:12:08	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
306	345	50	312	13	2018-12-12 17:57:35	2018-12-12 18:18:41	2018-12-12 18:12:47	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
296	335	42	302	13	2018-12-12 11:15:46	2018-12-12 17:49:17	2018-12-12 11:12:03	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
307	346	41	313	13	2018-12-17 09:02:35	2018-12-18 09:02:35	2018-12-17 09:12:09	occupy	www.bookingsite.com	0	1	hotel	none	1	0	0
297	336	41	303	13	2018-12-12 11:17:37	2018-12-12 17:49:32	2018-12-12 11:12:47	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
309	348	62	315	13	2018-12-17 11:36:13	2018-12-18 11:36:13	2018-12-17 11:12:26	reserve	www.bookingsite.com	0	1	hotel	none	1	0	0
293	332	62	299	13	2018-12-12 11:10:57	2018-12-12 17:20:21	2018-12-12 11:12:06	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
291	330	57	297	13	2018-12-11 19:00:00	2018-12-12 17:27:31	2018-12-11 19:12:11	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
300	339	29	306	13	2018-12-12 12:46:30	2018-12-12 17:50:58	2018-12-12 12:12:45	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
302	341	34	308	13	2018-12-12 13:07:33	2018-12-12 17:41:25	2018-12-12 13:12:47	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
298	337	55	304	13	2018-12-12 12:12:33	2018-12-12 17:42:58	2018-12-12 12:12:40	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
303	342	27	309	13	2018-12-12 14:16:41	2018-12-12 17:45:35	2018-12-12 14:12:06	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
305	344	50	311	13	2018-12-12 17:53:23	2018-12-12 17:57:27	2018-12-12 17:12:32	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
308	347	63	314	13	2018-12-17 09:07:01	2018-12-17 11:37:52	2018-12-17 09:12:11	vacant	www.bookingsite.com	0	1	hotel	none	1	0	0
\.


--
-- Name: booking_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_booking_id_seq', 309, true);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, customer_fname, customer_lname, phone, address, email, gender, identity_type, identity_number, photo, gst_number) FROM stdin;
309	u		0			male	\N	\N	face-0.jpg	
310	pagan		9900357123			male	\N	\N	face-0.jpg	
311	pagan		0			male	\N	\N	face-0.jpg	
312	pagan		0			male	\N	\N	face-0.jpg	
313	ggggg		0			male	\N	\N	face-0.jpg	
314	dsdsds		0			male	\N	\N	face-0.jpg	
308	pavan		9900357123			male	\N	\N	face-0.jpg	
315	Pavan	s	879887878	mangalore	pavan@gmail.com	male	\N	\N	face-0.jpg	
317	kiran		9874563210			male	\N	\N	face-0.jpg	
318	kiran		9874856320			male	\N	\N	face-0.jpg	
319	kiran		87456321089			male	\N	\N	face-0.jpg	
320	kiran		8745632101			male	\N	\N	face-0.jpg	
321	kiran		4563321024			male	\N	\N	face-0.jpg	
322	kiran		6575896512			male	\N	\N	face-0.jpg	
323	kiran		7896541230			male	\N	\N	face-0.jpg	
324	kiran		4563321024			male	\N	\N	face-0.jpg	
325	pavan		8765412309			male	\N	\N	face-0.jpg	
326	kiran		7896541230			male	\N	\N	face-0.jpg	
328	kiran		7896541230			male	\N	\N	face-0.jpg	
327	pavan	s	6575896512	mangalore	pavan@gmail.com	male	\N	\N	face-0.jpg	
329	kiran	kumar	7896541230	mangalore	kiran@gmail.com	male	\N	\N	face-0.jpg	
330	kiran		4563321024			male	\N	\N	face-0.jpg	
331	kiran		4563321024			male	\N	\N	face-0.jpg	
332	kiran		4563321024			male	\N	\N	face-0.jpg	
333	pavan		6575896512			male	\N	\N	face-0.jpg	
334	pavan		6575896512			male	\N	\N	face-0.jpg	
335	kiran		8765412309			male	\N	\N	face-0.jpg	
336	kiran		4563321024			male	\N	\N	face-0.jpg	
337	kiran		4563321024			male	\N	\N	face-0.jpg	
338	kiran		4563321024			male	\N	\N	face-0.jpg	
339	kiran		4563321024			male	\N	\N	face-0.jpg	
340	kiran		4563321024			male	\N	\N	face-0.jpg	
341	kiran		4563321024			male	\N	\N	face-0.jpg	
342	kiran		4563321024			male	\N	\N	face-0.jpg	
343	kiran		4563321024			male	\N	\N	face-0.jpg	
344	kiran		4563321024			male	\N	\N	face-0.jpg	
345	kiran		4563321024			male	\N	\N	face-0.jpg	
346	kiran		4563321024			male	\N	\N	face-0.jpg	
347	pavan		6575896512			male	\N	\N	face-0.jpg	
348	pavan		4563321024			male	\N	\N	face-0.jpg	
\.


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 348, true);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (emp_id, fname, lname, email, phone, address, designation_id, salary, dob, doj, gender, employee_status, identity_type, identity_num, emp_pass) FROM stdin;
9	admin	admin	admin@admin.com	8765493210	mangalore	1	15000	1976-03-06	2005-05-10	male	working	Aadhar	6897546932541256	$2a$10$LgL1YJveSXDiwuAtcGfQZuyqYuCIK7VygVPeCDBY2wT34LedP84bO
13	kiran	Kumar	kiran@gmail.com	9874563210	mangalore	1	15000	1994-11-26	2000-10-29	male	working	Aadhar	1236547890125432	4399
3	arjun	kumar	arjunkumar@gmail.com	8765493210	mangalore	2	15000	1976-03-06	2005-05-10	male	working	Aadhar	6897546932541256	1111
\.


--
-- Name: employee_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_emp_id_seq', 15, true);


--
-- Data for Name: extra_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.extra_service (esid, description, book_id, price, service_price, service_tax, service_type, quantity) FROM stdin;
121	Trip2	269	5900	5000	18	hotel	1
124	Trip2	271	5900	5000	18	hotel	1
126	Trip2	269	5900	5000	18	hotel	1
128	Trip1	269	3920	3500	12	hotel	1
129	dsdsd	269	100	100	0	outside	0
130	trip3	276	3240	1500	8	hotel	2
131	Trip2	288	18880	8000	18	hotel	2
132	trip3	288	1620	1500	8	hotel	1
133	trip3	288	3240	1500	8	hotel	2
134	Trip2	288	28320	8000	18	hotel	3
135	Trip2	290	28320	8000	18	hotel	3
136	Trip2	285	18880	8000	18	hotel	2
137	breakfast	285	2.5	2.5	0	outside	0
138	lunch	285	250	250	0	outside	0
139	breakfast	288	2.5	2.5	0	outside	0
140	lunch	288	250	250	0	outside	0
141	Trip2	293	9440	8000	18	hotel	1
142	Trip2	303	9440	8000	18	hotel	1
143	trip3	303	3240	1500	8	hotel	2
144	trip3	306	1620	1500	8	hotel	1
145	Trip2	308	9440	8000	18	hotel	1
146	food	308	100	100	0	outside	0
\.


--
-- Name: extra_service_esid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.extra_service_esid_seq', 146, true);


--
-- Data for Name: facilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facilities (fac_id, fac_name, fac_description, fac_price) FROM stdin;
\.


--
-- Name: facilities_fac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facilities_fac_id_seq', 1, false);


--
-- Data for Name: logindetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logindetails (login_id, date, in_time, out_time, employee_id) FROM stdin;
1	2018-11-19	12:29:37	\N	13
2	2018-11-19	12:29:58	\N	13
4	2018-11-19	12:31:21	\N	13
5	2018-11-19	12:34:16	\N	13
3	2018-11-19	12:30:50	13:07:48	13
6	2018-11-19	13:46:38	\N	13
7	2018-11-19	14:04:48	14:05:10	13
8	2018-11-28	09:28:41	\N	13
9	2018-11-28	09:30:09	\N	13
10	2018-11-28	09:30:43	\N	13
11	2018-11-28	09:39:08	\N	13
12	2018-11-28	09:51:32	09:58:04	13
\.


--
-- Name: logindetails_login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logindetails_login_id_seq', 12, true);


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (payment_id, payment_status, payment_method, bill_date, employee_id, ocuupy_date, total_amount, total_rent, room_price, tax_amount, advance_pay, occupy_advance, payment_tax, concession_amount, concession_rate) FROM stdin;
276	paid	cash	2018-10-11 00:00:00	3	2018-10-11	2240	2000	2000	240	0	1000	12	0	0
278	paid	cash	2018-10-11 00:00:00	3	2018-10-11	1120	1000	1000	120	0	0	12	0	0
279	paid	cash	2018-10-11 00:00:00	3	2018-10-11	11520	9000	9000	2520	0	100	28	1350	15
280	paid	cash	2018-10-11 00:00:00	3	2018-10-11	2240	2000	2000	240	0	1000	12	300	15
281	paid	cash	2018-10-11 00:00:00	3	2018-10-11	5310	4500	4500	810	0	100	18	675	15
275	paid	cash	2018-10-11 00:00:00	3	2018-10-11	19360	3000	3000	540	0	0	18	450	15
277	paid	cash	2018-10-11 00:00:00	3	2018-10-11	6850	950	950	0	0	2000	0	0	0
282	pending	cash	\N	\N	2018-11-17	3540	3000	3000	540	0	0	18	0	0
284	pending	cash	\N	\N	\N	5310	4500	4500	810	0	\N	18	0	0
285	pending	cash	\N	\N	\N	11520	9000	9000	2520	0	\N	28	0	0
286	pending	cash	\N	\N	\N	11520	9000	9000	2520	0	\N	28	0	0
287	pending	cash	\N	\N	\N	4130	3500	3500	630	0	\N	18	0	0
288	pending	cash	\N	\N	\N	11520	9000	9000	2520	0	\N	28	0	0
289	pending	cash	\N	\N	\N	11520	9000	9000	2520	0	\N	28	0	0
290	pending	cash	\N	\N	\N	23600	20000	2500	3600	0	\N	18	0	0
291	pending	cash	\N	\N	\N	3540	3000	3000	540	0	\N	18	0	0
292	pending	cash	\N	\N	\N	31860	27000	3000	4860	0	\N	18	0	0
293	pending	cash	\N	\N	\N	95580	81000	4500	14580	0	\N	18	0	0
295	pending	cash	\N	\N	\N	0	0	2000	0	0	\N	12	0	0
294	pending	cash	\N	\N	\N	1680	1500	1500	180	0	\N	12	0	0
296	pending	online	\N	\N	\N	2240	2000	2000	240	0	\N	12	0	0
305	pending	cash	\N	\N	\N	11520	9000	9000	2520	0	\N	28	0	0
307	pending	cash	\N	\N	\N	11520	9000	9000	2520	0	\N	28	0	0
306	paid	cash	2018-12-12 17:50:58	13	2018-12-12	11520	9000	9000	2520	0	0	28	0	0
311	paid	cash	2018-12-12 17:57:27	13	2018-12-12	3540	3000	3000	540	0	0	18	0	0
299	paid	cash	2018-12-12 17:20:21	13	2018-12-12	11680	2000	2000	240	0	0	12	0	0
312	paid	cash	2018-12-12 18:18:41	13	2018-12-12	5160	3000	3000	540	100	0	18	0	0
297	paid	cash	2018-12-12 17:27:31	13	2018-12-12	NaN	\N	1500	\N	0	100	12	\N	0
308	paid	cash	2018-12-12 17:41:25	13	2018-12-12	0	0	2000	0	0	0	12	0	0
304	paid	cash	2018-12-12 17:42:58	13	2018-12-12	0	0	1500	0	0	0	12	0	0
309	paid	cash	2018-12-12 17:45:35	13	2018-12-12	14920	2000	2000	240	100	100	12	0	0
313	pending	cash	\N	\N	2018-12-17	11520	9000	9000	2520	0	0	28	0	0
310	paid	cash	2018-12-12 17:47:36	13	2018-12-12	2240	2000	2000	240	0	0	12	0	0
298	paid	cash	2018-12-12 17:47:50	13	2018-12-12	3540	3000	3000	540	0	0	18	0	0
300	paid	cash	2018-12-12 17:48:17	13	2018-12-12	3540	3000	3000	540	0	0	18	0	0
301	paid	cash	2018-12-12 17:48:56	13	2018-12-12	4130	3500	3500	630	0	0	18	0	0
302	paid	cash	2018-12-12 17:49:17	13	2018-12-12	11520	9000	9000	2520	0	0	28	0	0
303	paid	cash	2018-12-12 17:49:32	13	2018-12-12	11520	9000	9000	2520	0	0	28	0	0
315	pending	cash	\N	\N	\N	2240	2000	2000	240	0	\N	12	0	0
314	paid	cash	2018-12-17 11:37:52	\N	2018-12-17	11780	2000	2000	240	0	0	12	0	0
\.


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 315, true);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, role_name) FROM stdin;
1	admin
2	receiption
41	Chef
42	HeadChef
\.


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 42, true);


--
-- Data for Name: room_update; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room_update (update_id, old_rid, b_id, shift_date) FROM stdin;
45	30	269	2018-10-11
46	30	273	2018-10-11
47	41	297	2018-12-12
48	31	297	2018-12-12
49	29	297	2018-12-12
50	28	297	2018-12-12
\.


--
-- Name: room_update_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_update_update_id_seq', 50, true);


--
-- Data for Name: roomcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roomcategory (cat_id, cat_name, price, rid, taxid) FROM stdin;
28	queen	3000	4	3
29	double-room	4500	4	3
34	twin	3500	4	3
18	king	9000	4	3
35	queen	1500	5	2
37	twin	2500	5	3
19	king	2000	5	2
\.


--
-- Name: roomcategory_cat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roomcategory_cat_id_seq', 38, true);


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (rooms_id, room_num, r_type, r_cat, status, no_adults, no_childrens) FROM stdin;
28	102	5	19	Available	3	2
30	111	4	29	Available	4	3
31	112	4	28	Available	4	3
29	110	4	18	Available	4	2
33	113	4	18	Available	4	3
34	114	5	19	Available	3	2
35	115	5	19	Available	2	3
36	116	5	19	Available	3	5
40	122	4	18	Available	2	2
41	123	4	18	Available	2	2
42	124	4	18	Available	2	2
27	101	5	19	Available	4	2
44	125	4	28	Available	4	5
45	126	5	35	Available	2	2
46	127	5	37	Available	2	2
47	128	5	35	Available	2	2
48	129	5	37	Available	2	2
49	130	4	34	Available	2	2
50	131	4	28	Available	2	2
51	132	5	35	Available	2	2
52	133	5	35	Available	2	2
53	134	5	35	Available	2	2
54	135	5	35	Available	2	2
55	136	5	35	Available	2	2
56	137	5	35	Available	2	2
57	138	5	35	Available	2	2
58	139	5	35	Available	2	2
59	140	5	19	Available	2	2
60	141	5	19	Available	2	2
61	142	5	19	Available	2	2
62	143	5	19	Available	2	2
63	144	5	19	Available	2	2
\.


--
-- Name: rooms_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_rooms_id_seq', 63, true);


--
-- Data for Name: roomtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roomtype (room_id, room_type) FROM stdin;
4	AC
5	NONAC
\.


--
-- Name: roomtype_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roomtype_room_id_seq', 5, true);


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (service_id, service_name, service_price, service_description, service_tax) FROM stdin;
16	Trip2	8000	2 days trip in bangalore	18
21	trip3	1500	1 day Trip in mangalore	8
\.


--
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_service_id_seq', 22, true);


--
-- Data for Name: taxdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taxdetails (tax_id, taxstartprice, taxendprice, tax) FROM stdin;
1	0	999	0
2	1000	2499	12
3	2500	7499	18
4	7500	2147483647	28
\.


--
-- Name: taxdetails_tax_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taxdetails_tax_id_seq', 4, true);


--
-- Data for Name: trip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trip (trip_id, trip_name, trip_price, trip_description) FROM stdin;
\.


--
-- Name: trip_trip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trip_trip_id_seq', 12, true);


--
-- Data for Name: user_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_services (uservice_id, serv_id, book_id) FROM stdin;
\.


--
-- Name: user_services_uservice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_services_uservice_id_seq', 184, true);


--
-- Data for Name: weekdays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weekdays (weekid, sun, mon, tue, wed, thu, fri, sat, tripid) FROM stdin;
19	0	1	0	1	0	1	0	16
24	0	0	0	0	1	0	0	21
\.


--
-- Name: weekdays_weekid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weekdays_weekid_seq', 25, true);


--
-- Name: booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (booking_id);


--
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


--
-- Name: extra_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extra_service
    ADD CONSTRAINT extra_service_pkey PRIMARY KEY (esid);


--
-- Name: facilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facilities
    ADD CONSTRAINT facilities_pkey PRIMARY KEY (fac_id);


--
-- Name: logindetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logindetails
    ADD CONSTRAINT logindetails_pkey PRIMARY KEY (login_id);


--
-- Name: payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: room_update_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_update
    ADD CONSTRAINT room_update_pkey PRIMARY KEY (update_id);


--
-- Name: roomcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roomcategory
    ADD CONSTRAINT roomcategory_pkey PRIMARY KEY (cat_id);


--
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (rooms_id);


--
-- Name: roomtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roomtype
    ADD CONSTRAINT roomtype_pkey PRIMARY KEY (room_id);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: taxdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxdetails
    ADD CONSTRAINT taxdetails_pkey PRIMARY KEY (tax_id);


--
-- Name: trip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_pkey PRIMARY KEY (trip_id);


--
-- Name: user_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_services
    ADD CONSTRAINT user_services_pkey PRIMARY KEY (uservice_id);


--
-- Name: weekdays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weekdays
    ADD CONSTRAINT weekdays_pkey PRIMARY KEY (weekid);


--
-- Name: booking_cust_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_cust_id_fkey FOREIGN KEY (cust_id) REFERENCES public.customer(customer_id);


--
-- Name: booking_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(emp_id);


--
-- Name: booking_pay_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pay_id_fkey FOREIGN KEY (pay_id) REFERENCES public.payment(payment_id);


--
-- Name: booking_r_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_r_id_fkey FOREIGN KEY (r_id) REFERENCES public.rooms(rooms_id);


--
-- Name: emp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT emp_id FOREIGN KEY (employee_id) REFERENCES public.employee(emp_id);


--
-- Name: employee_designation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_designation_id_fkey FOREIGN KEY (designation_id) REFERENCES public.role(id);


--
-- Name: extra_service_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extra_service
    ADD CONSTRAINT extra_service_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.booking(booking_id);


--
-- Name: logindetails_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logindetails
    ADD CONSTRAINT logindetails_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(emp_id);


--
-- Name: room_update_b_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_update
    ADD CONSTRAINT room_update_b_id_fkey FOREIGN KEY (b_id) REFERENCES public.booking(booking_id);


--
-- Name: room_update_old_rid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_update
    ADD CONSTRAINT room_update_old_rid_fkey FOREIGN KEY (old_rid) REFERENCES public.rooms(rooms_id);


--
-- Name: roomcategory_rid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roomcategory
    ADD CONSTRAINT roomcategory_rid_fkey FOREIGN KEY (rid) REFERENCES public.roomtype(room_id);


--
-- Name: rooms_r_cat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_r_cat_fkey FOREIGN KEY (r_cat) REFERENCES public.roomcategory(cat_id);


--
-- Name: rooms_r_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_r_type_fkey FOREIGN KEY (r_type) REFERENCES public.roomtype(room_id);


--
-- Name: taxid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roomcategory
    ADD CONSTRAINT taxid FOREIGN KEY (taxid) REFERENCES public.taxdetails(tax_id);


--
-- Name: tripid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weekdays
    ADD CONSTRAINT tripid FOREIGN KEY (tripid) REFERENCES public.services(service_id);


--
-- Name: user_services_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_services
    ADD CONSTRAINT user_services_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.booking(booking_id);


--
-- Name: user_services_serv_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_services
    ADD CONSTRAINT user_services_serv_id_fkey FOREIGN KEY (serv_id) REFERENCES public.services(service_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

