--
-- PostgreSQL database dump
--

-- Dumped from database version 14.16 (Debian 14.16-1.pgdg120+1)
-- Dumped by pg_dump version 14.16 (Debian 14.16-1.pgdg120+1)

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
-- Name: device_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_id_seq OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: device; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.device (
    id integer DEFAULT nextval('public.device_id_seq'::regclass) NOT NULL,
    unique_number character varying(100),
    status character varying(50) NOT NULL
);


ALTER TABLE public.device OWNER TO admin;

--
-- Name: COLUMN device.id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.device.id IS 'Идентификатор устройства';


--
-- Name: COLUMN device.unique_number; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.device.unique_number IS 'Уникальный номер устройства';


--
-- Name: COLUMN device.status; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.device.status IS 'Статус устройства';


--
-- Name: medical_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.medical_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medical_entry_id_seq OWNER TO admin;

--
-- Name: medical_entry; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.medical_entry (
    id integer DEFAULT nextval('public.medical_entry_id_seq'::regclass) NOT NULL,
    entry_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    description text,
    disease text,
    vaccinations text,
    recommendation text,
    medical_record_id integer,
    device_number integer,
    veterinarian_id integer
);


ALTER TABLE public.medical_entry OWNER TO admin;

--
-- Name: COLUMN medical_entry.id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_entry.id IS 'Идентификатор записи в медкарте';


--
-- Name: COLUMN medical_entry.entry_date; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_entry.entry_date IS 'Дата и время записи';


--
-- Name: COLUMN medical_entry.description; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_entry.description IS 'Описание записи (возможно, XML)';


--
-- Name: COLUMN medical_entry.disease; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_entry.disease IS 'Заболевание';


--
-- Name: COLUMN medical_entry.vaccinations; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_entry.vaccinations IS 'Вакцинации';


--
-- Name: COLUMN medical_entry.recommendation; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_entry.recommendation IS 'Рекомендации';


--
-- Name: COLUMN medical_entry.medical_record_id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_entry.medical_record_id IS 'Ссылка на медкарту';


--
-- Name: COLUMN medical_entry.device_number; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_entry.device_number IS 'Номер устройства';


--
-- Name: COLUMN medical_entry.veterinarian_id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_entry.veterinarian_id IS 'Идентификатор ветеринара';


--
-- Name: medical_record_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.medical_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medical_record_id_seq OWNER TO admin;

--
-- Name: medical_record; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.medical_record (
    id integer DEFAULT nextval('public.medical_record_id_seq'::regclass) NOT NULL,
    veterinarian_id integer,
    owner_id integer,
    pet_id integer
);


ALTER TABLE public.medical_record OWNER TO admin;

--
-- Name: COLUMN medical_record.id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_record.id IS 'Идентификатор медкарты';


--
-- Name: COLUMN medical_record.veterinarian_id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_record.veterinarian_id IS 'Ссылка на ветеринара';


--
-- Name: COLUMN medical_record.owner_id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_record.owner_id IS 'Ссылка на владельца';


--
-- Name: COLUMN medical_record.pet_id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.medical_record.pet_id IS 'Ссылка на питомца';


--
-- Name: owner_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.owner_id_seq OWNER TO admin;

--
-- Name: owner; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.owner (
    id integer DEFAULT nextval('public.owner_id_seq'::regclass) NOT NULL,
    full_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(20) NOT NULL,
    password_hash character varying(255) NOT NULL
);


ALTER TABLE public.owner OWNER TO admin;

--
-- Name: COLUMN owner.id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.owner.id IS 'Идентификатор владельца';


--
-- Name: COLUMN owner.full_name; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.owner.full_name IS 'ФИО владельца';


--
-- Name: COLUMN owner.email; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.owner.email IS 'Электронная почта';


--
-- Name: COLUMN owner.phone; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.owner.phone IS 'Телефон владельца';


--
-- Name: COLUMN owner.password_hash; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.owner.password_hash IS 'Пароль (Hash)';


--
-- Name: pet_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.pet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pet_id_seq OWNER TO admin;

--
-- Name: pet; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.pet (
    id integer DEFAULT nextval('public.pet_id_seq'::regclass) NOT NULL,
    animal_type character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    gender character varying(10),
    age integer NOT NULL,
    weight numeric(5,2),
    condition text,
    behavior text,
    research_status text,
    CONSTRAINT pet_gender_check CHECK (((gender)::text = ANY ((ARRAY['Male'::character varying, 'Female'::character varying])::text[])))
);


ALTER TABLE public.pet OWNER TO admin;

--
-- Name: COLUMN pet.id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.pet.id IS 'Идентификатор питомца';


--
-- Name: COLUMN pet.animal_type; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.pet.animal_type IS 'Вид животного';


--
-- Name: COLUMN pet.name; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.pet.name IS 'Имя питомца';


--
-- Name: COLUMN pet.gender; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.pet.gender IS 'Пол питомца';


--
-- Name: COLUMN pet.age; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.pet.age IS 'Возраст питомца';


--
-- Name: COLUMN pet.weight; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.pet.weight IS 'Вес питомца';


--
-- Name: COLUMN pet.condition; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.pet.condition IS 'Состояние питомца';


--
-- Name: COLUMN pet.behavior; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.pet.behavior IS 'Поведение питомца';


--
-- Name: COLUMN pet.research_status; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.pet.research_status IS 'Статус исследования';


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO admin;

--
-- Name: veterinarian_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.veterinarian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veterinarian_id_seq OWNER TO admin;

--
-- Name: veterinarian; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.veterinarian (
    id integer DEFAULT nextval('public.veterinarian_id_seq'::regclass) NOT NULL,
    full_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(20) NOT NULL,
    password_hash character varying(255) NOT NULL,
    "position" character varying(100),
    clinic_number character varying(20)
);


ALTER TABLE public.veterinarian OWNER TO admin;

--
-- Name: COLUMN veterinarian.id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.veterinarian.id IS 'Идентификатор ветеринара';


--
-- Name: COLUMN veterinarian.full_name; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.veterinarian.full_name IS 'ФИО ветеринара';


--
-- Name: COLUMN veterinarian.email; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.veterinarian.email IS 'Электронная почта';


--
-- Name: COLUMN veterinarian.phone; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.veterinarian.phone IS 'Телефон ветеринара';


--
-- Name: COLUMN veterinarian.password_hash; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.veterinarian.password_hash IS 'Пароль (Hash)';


--
-- Name: COLUMN veterinarian."position"; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.veterinarian."position" IS 'Должность ветеринара';


--
-- Name: COLUMN veterinarian.clinic_number; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.veterinarian.clinic_number IS 'Номер поликлиники';


--
-- Name: device device_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (id);


--
-- Name: medical_entry medical_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.medical_entry
    ADD CONSTRAINT medical_entry_pkey PRIMARY KEY (id);


--
-- Name: medical_record medical_record_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.medical_record
    ADD CONSTRAINT medical_record_pkey PRIMARY KEY (id);


--
-- Name: owner owner_email_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.owner
    ADD CONSTRAINT owner_email_key UNIQUE (email);


--
-- Name: owner owner_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.owner
    ADD CONSTRAINT owner_pkey PRIMARY KEY (id);


--
-- Name: pet pet_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pet
    ADD CONSTRAINT pet_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: veterinarian veterinarian_email_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.veterinarian
    ADD CONSTRAINT veterinarian_email_key UNIQUE (email);


--
-- Name: veterinarian veterinarian_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.veterinarian
    ADD CONSTRAINT veterinarian_pkey PRIMARY KEY (id);


--
-- Name: medical_entry medical_entry_device_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.medical_entry
    ADD CONSTRAINT medical_entry_device_number_fkey FOREIGN KEY (device_number) REFERENCES public.device(id);


--
-- Name: medical_entry medical_entry_medical_record_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.medical_entry
    ADD CONSTRAINT medical_entry_medical_record_id_fkey FOREIGN KEY (medical_record_id) REFERENCES public.medical_record(id);


--
-- Name: medical_entry medical_entry_veterinarian_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.medical_entry
    ADD CONSTRAINT medical_entry_veterinarian_id_fkey FOREIGN KEY (veterinarian_id) REFERENCES public.veterinarian(id);


--
-- Name: medical_record medical_record_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.medical_record
    ADD CONSTRAINT medical_record_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owner(id);


--
-- Name: medical_record medical_record_pet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.medical_record
    ADD CONSTRAINT medical_record_pet_id_fkey FOREIGN KEY (pet_id) REFERENCES public.pet(id);


--
-- Name: medical_record medical_record_veterinarian_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.medical_record
    ADD CONSTRAINT medical_record_veterinarian_id_fkey FOREIGN KEY (veterinarian_id) REFERENCES public.veterinarian(id);


--
-- PostgreSQL database dump complete
--

