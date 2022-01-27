--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2021-11-30 10:21:41

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
-- TOC entry 222 (class 1259 OID 16538)
-- Name: adresse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adresse (
    adresse character varying(100) NOT NULL,
    id_pizzeria integer,
    id_utilisateur integer,
    id integer NOT NULL,
    CONSTRAINT adresse_id_check CHECK ((id >= 0))
);


ALTER TABLE public.adresse OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16543)
-- Name: adresse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adresse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adresse_id_seq OWNER TO postgres;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 223
-- Name: adresse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adresse_id_seq OWNED BY public.adresse.id;


--
-- TOC entry 224 (class 1259 OID 16563)
-- Name: commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande (
    id_utilisateur integer NOT NULL,
    id_adresse integer NOT NULL,
    id_pizzeria integer NOT NULL,
    paiement boolean NOT NULL,
    livraison boolean NOT NULL,
    id integer NOT NULL,
    CONSTRAINT commande_id_check CHECK ((id >= 0))
);


ALTER TABLE public.commande OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16566)
-- Name: commande_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commande_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commande_id_seq OWNER TO postgres;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 225
-- Name: commande_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commande_id_seq OWNED BY public.commande.id;


--
-- TOC entry 210 (class 1259 OID 16419)
-- Name: ingrédient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ingrédient" (
    id integer NOT NULL,
    nom character varying(50) NOT NULL,
    CONSTRAINT "ingrédient_id_check" CHECK ((id >= 0))
);


ALTER TABLE public."ingrédient" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16418)
-- Name: ingrédients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ingrédients_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ingrédients_id_seq" OWNER TO postgres;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 209
-- Name: ingrédients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ingrédients_id_seq" OWNED BY public."ingrédient".id;


--
-- TOC entry 226 (class 1259 OID 16589)
-- Name: ligne_de_commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ligne_de_commande (
    id_commande integer NOT NULL,
    id_produit integer NOT NULL,
    "quantité" integer NOT NULL,
    CONSTRAINT "ligne_de_commande_quantité_check" CHECK (("quantité" > 0))
);


ALTER TABLE public.ligne_de_commande OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16640)
-- Name: liste_utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.liste_utilisateur (
    id_utilisateur integer,
    id_pizzeria integer
);


ALTER TABLE public.liste_utilisateur OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16425)
-- Name: pizzeria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizzeria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizzeria_id_seq OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16426)
-- Name: pizzeria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizzeria (
    id integer DEFAULT nextval('public.pizzeria_id_seq'::regclass) NOT NULL,
    nom character varying(50) NOT NULL,
    CONSTRAINT pizzeria_id_check1 CHECK ((id >= 0))
);


ALTER TABLE public.pizzeria OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16447)
-- Name: prix; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prix (
    id integer NOT NULL,
    date date NOT NULL,
    id_produit integer NOT NULL,
    prix numeric NOT NULL,
    CONSTRAINT prix_id_check CHECK ((id >= 0))
);


ALTER TABLE public.prix OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16446)
-- Name: prix_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prix_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prix_id_seq OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 217
-- Name: prix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prix_id_seq OWNED BY public.prix.id;


--
-- TOC entry 213 (class 1259 OID 16432)
-- Name: produit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produit_id_seq OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16433)
-- Name: produit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produit (
    id integer DEFAULT nextval('public.produit_id_seq'::regclass) NOT NULL,
    nom character varying(50) NOT NULL,
    CONSTRAINT produit_id_check CHECK ((id >= 0))
);


ALTER TABLE public.produit OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16474)
-- Name: recette; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recette (
    id_produit integer NOT NULL,
    "id_ingrédient" integer NOT NULL,
    "quantité" integer NOT NULL,
    CONSTRAINT "recette_quantité_check" CHECK (("quantité" > 0))
);


ALTER TABLE public.recette OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16439)
-- Name: rôle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."rôle_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rôle_id_seq" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16440)
-- Name: rôle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."rôle" (
    id integer DEFAULT nextval('public."rôle_id_seq"'::regclass) NOT NULL,
    nom character varying(10) NOT NULL,
    CONSTRAINT "rôle_id_check" CHECK ((id >= 0))
);


ALTER TABLE public."rôle" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16667)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    id_pizzeria integer,
    "id_ingrédient" integer,
    "quantité" integer,
    CONSTRAINT "stock_quantité_check" CHECK (("quantité" > 0))
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16517)
-- Name: utilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilisateur_id_seq OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16502)
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur (
    nom character varying(50) NOT NULL,
    "prénom" character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(15) NOT NULL,
    "id_rôle" integer NOT NULL,
    id integer DEFAULT nextval('public.utilisateur_id_seq'::regclass) NOT NULL,
    "téléphone" character varying(15) NOT NULL
);


ALTER TABLE public.utilisateur OWNER TO postgres;

--
-- TOC entry 3227 (class 2604 OID 16544)
-- Name: adresse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresse ALTER COLUMN id SET DEFAULT nextval('public.adresse_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 16567)
-- Name: commande id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande ALTER COLUMN id SET DEFAULT nextval('public.commande_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 16422)
-- Name: ingrédient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ingrédient" ALTER COLUMN id SET DEFAULT nextval('public."ingrédients_id_seq"'::regclass);


--
-- TOC entry 3223 (class 2604 OID 16450)
-- Name: prix id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prix ALTER COLUMN id SET DEFAULT nextval('public.prix_id_seq'::regclass);


--
-- TOC entry 3246 (class 2606 OID 16552)
-- Name: adresse adresse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pkey PRIMARY KEY (id);


--
-- TOC entry 3248 (class 2606 OID 16573)
-- Name: commande commande_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 16424)
-- Name: ingrédient ingrédient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ingrédient"
    ADD CONSTRAINT "ingrédient_pkey" PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 16431)
-- Name: pizzeria pizzeria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzeria
    ADD CONSTRAINT pizzeria_pkey PRIMARY KEY (id);


--
-- TOC entry 3242 (class 2606 OID 16454)
-- Name: prix prix_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prix
    ADD CONSTRAINT prix_pkey PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 16438)
-- Name: produit produit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_pkey PRIMARY KEY (id);


--
-- TOC entry 3240 (class 2606 OID 16445)
-- Name: rôle rôle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."rôle"
    ADD CONSTRAINT "rôle_pkey" PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 16524)
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 16553)
-- Name: adresse adresse_id_pizzeria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_id_pizzeria_fkey FOREIGN KEY (id_pizzeria) REFERENCES public.pizzeria(id);


--
-- TOC entry 3254 (class 2606 OID 16558)
-- Name: adresse adresse_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- TOC entry 3256 (class 2606 OID 16579)
-- Name: commande commande_id_adresse_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_id_adresse_fkey FOREIGN KEY (id_adresse) REFERENCES public.adresse(id);


--
-- TOC entry 3257 (class 2606 OID 16584)
-- Name: commande commande_id_pizzeria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_id_pizzeria_fkey FOREIGN KEY (id_pizzeria) REFERENCES public.pizzeria(id);


--
-- TOC entry 3255 (class 2606 OID 16574)
-- Name: commande commande_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- TOC entry 3258 (class 2606 OID 16593)
-- Name: ligne_de_commande ligne_de_commande_id_commande_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ligne_de_commande
    ADD CONSTRAINT ligne_de_commande_id_commande_fkey FOREIGN KEY (id_commande) REFERENCES public.commande(id);


--
-- TOC entry 3259 (class 2606 OID 16598)
-- Name: ligne_de_commande ligne_de_commande_id_produit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ligne_de_commande
    ADD CONSTRAINT ligne_de_commande_id_produit_fkey FOREIGN KEY (id_produit) REFERENCES public.produit(id);


--
-- TOC entry 3261 (class 2606 OID 16648)
-- Name: liste_utilisateur liste_utilisateur_id_pizzeria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.liste_utilisateur
    ADD CONSTRAINT liste_utilisateur_id_pizzeria_fkey FOREIGN KEY (id_pizzeria) REFERENCES public.pizzeria(id);


--
-- TOC entry 3260 (class 2606 OID 16643)
-- Name: liste_utilisateur liste_utilisateur_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.liste_utilisateur
    ADD CONSTRAINT liste_utilisateur_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- TOC entry 3249 (class 2606 OID 16468)
-- Name: prix prix_id_produit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prix
    ADD CONSTRAINT prix_id_produit_fkey FOREIGN KEY (id_produit) REFERENCES public.produit(id);


--
-- TOC entry 3251 (class 2606 OID 16483)
-- Name: recette recette_id_ingrédient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recette
    ADD CONSTRAINT "recette_id_ingrédient_fkey" FOREIGN KEY ("id_ingrédient") REFERENCES public."ingrédient"(id);


--
-- TOC entry 3250 (class 2606 OID 16478)
-- Name: recette recette_id_produit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recette
    ADD CONSTRAINT recette_id_produit_fkey FOREIGN KEY (id_produit) REFERENCES public.produit(id);


--
-- TOC entry 3263 (class 2606 OID 16675)
-- Name: stock stock_id_ingrédient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT "stock_id_ingrédient_fkey" FOREIGN KEY ("id_ingrédient") REFERENCES public."ingrédient"(id);


--
-- TOC entry 3262 (class 2606 OID 16670)
-- Name: stock stock_id_pizzeria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_id_pizzeria_fkey FOREIGN KEY (id_pizzeria) REFERENCES public.pizzeria(id);


--
-- TOC entry 3252 (class 2606 OID 16509)
-- Name: utilisateur utilisateur_id_rôle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT "utilisateur_id_rôle_fkey" FOREIGN KEY ("id_rôle") REFERENCES public."rôle"(id);


-- Completed on 2021-11-30 10:21:42

--
-- PostgreSQL database dump complete
--

