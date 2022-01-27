--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2021-11-30 10:22:10

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
-- TOC entry 3388 (class 0 OID 16426)
-- Dependencies: 212
-- Data for Name: pizzeria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizzeria (id, nom) FROM stdin;
2	Little Italy
3	Le Plateau
\.


--
-- TOC entry 3392 (class 0 OID 16440)
-- Dependencies: 216
-- Data for Name: rôle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."rôle" (id, nom) FROM stdin;
2	client
3	manager
4	pizzaïolo
5	livreur
\.


--
-- TOC entry 3396 (class 0 OID 16502)
-- Dependencies: 220
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilisateur (nom, "prénom", email, password, "id_rôle", id, "téléphone") FROM stdin;
Lamine	Bianca	biancalamine@gmail.com	licornerose	2	3	0626156879
Hauchon	Paul	paulhauchon@gmail.com	oreiller	2	4	0675612668
Hochet	Eric	erichochet@gmail.com	cailloux	3	5	06455626668
Honette	Camille	comillehonette@gmail.com	mercedes	4	6	0615762462
Tallo	Armand	armandtallo@gmail.com	suzuki	5	7	0613862442
Scylla	Eddy	eddyscylla@gmail.com	onverrabien	2	2	0616155879
\.


--
-- TOC entry 3398 (class 0 OID 16538)
-- Dependencies: 222
-- Data for Name: adresse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adresse (adresse, id_pizzeria, id_utilisateur, id) FROM stdin;
34 rue sainte Catherine, Montréal	2	\N	1
5556 rue saint denis, Montréal	3	\N	2
7896 chemin de la côte des neiges montréal	\N	2	3
5650 rue saint Hubert Montréal	\N	3	4
7145 boulevard saint laurent Montréal	\N	4	5
\.


--
-- TOC entry 3400 (class 0 OID 16563)
-- Dependencies: 224
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commande (id_utilisateur, id_adresse, id_pizzeria, paiement, livraison, id) FROM stdin;
4	5	2	f	f	1
2	3	2	t	f	3
3	4	2	t	t	2
\.


--
-- TOC entry 3386 (class 0 OID 16419)
-- Dependencies: 210
-- Data for Name: ingrédient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ingrédient" (id, nom) FROM stdin;
1	tomate
2	basilic
3	mozzarella
4	olive
5	jambon
6	champignon
7	gorgonzola
8	emmental
9	chèvre
10	pâte à pizza
\.


--
-- TOC entry 3390 (class 0 OID 16433)
-- Dependencies: 214
-- Data for Name: produit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produit (id, nom) FROM stdin;
1	Napolitaine
2	Reine
3	4 Fromages
\.


--
-- TOC entry 3402 (class 0 OID 16589)
-- Dependencies: 226
-- Data for Name: ligne_de_commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ligne_de_commande (id_commande, id_produit, "quantité") FROM stdin;
1	1	3
1	2	2
1	3	1
2	1	1
2	2	1
3	3	2
3	2	1
\.


--
-- TOC entry 3403 (class 0 OID 16640)
-- Dependencies: 227
-- Data for Name: liste_utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.liste_utilisateur (id_utilisateur, id_pizzeria) FROM stdin;
5	2
6	2
7	2
7	3
\.


--
-- TOC entry 3394 (class 0 OID 16447)
-- Dependencies: 218
-- Data for Name: prix; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prix (id, date, id_produit, prix) FROM stdin;
1	2020-01-01	1	9.90
2	2020-01-01	2	12.9
3	2020-01-01	3	11.9
4	2021-01-01	1	10
5	2021-01-01	2	14
6	2021-01-01	3	13
\.


--
-- TOC entry 3395 (class 0 OID 16474)
-- Dependencies: 219
-- Data for Name: recette; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recette (id_produit, "id_ingrédient", "quantité") FROM stdin;
1	1	3
1	2	1
1	10	1
1	3	3
1	4	1
2	10	1
2	1	3
2	2	1
2	3	2
2	4	4
2	5	2
2	6	2
3	10	1
3	1	3
3	2	1
3	3	3
3	7	3
3	8	3
3	9	3
3	4	1
\.


--
-- TOC entry 3404 (class 0 OID 16667)
-- Dependencies: 228
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (id_pizzeria, "id_ingrédient", "quantité") FROM stdin;
2	1	500
2	2	50
2	3	500
2	4	100
2	5	200
2	6	50
2	7	60
2	8	100
2	9	100
2	10	500
3	1	500
3	2	50
3	3	500
3	4	100
3	5	200
3	6	50
3	7	60
3	8	100
3	9	100
3	10	500
\.


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 223
-- Name: adresse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adresse_id_seq', 5, true);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 225
-- Name: commande_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commande_id_seq', 3, true);


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 209
-- Name: ingrédients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ingrédients_id_seq"', 10, true);


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 211
-- Name: pizzeria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizzeria_id_seq', 3, true);


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 217
-- Name: prix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prix_id_seq', 6, true);


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 213
-- Name: produit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produit_id_seq', 3, true);


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 215
-- Name: rôle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."rôle_id_seq"', 5, true);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 221
-- Name: utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateur_id_seq', 7, true);


-- Completed on 2021-11-30 10:22:11

--
-- PostgreSQL database dump complete
--

