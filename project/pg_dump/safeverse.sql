--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY accounts (id, kind, company_name, commercial_phone, segment, created_at, updated_at, cep, city, state, neighborhood, street, other_segment, inactive, complement, number) FROM stdin;
1	individual_consultant				2015-07-11 00:17:39.723344	2015-07-11 00:17:39.723344							f		
2	individual_consultant				2015-07-11 00:59:44.86704	2015-07-11 00:59:44.86704							f		
3	individual_consultant				2015-07-13 16:30:18.505393	2015-07-13 16:30:18.505393							f		
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, function, phone, name, inactive, other_function, picture_file_name, picture_content_type, picture_file_size, picture_updated_at, delete_picture, crop_x, crop_y, crop_w, crop_h, current_account_id, current_project_id) FROM stdin;
1	max@algorich.com.br	$2a$10$FMjxEyHe9MbIdSnZsbVB7u6/HSD6qlXERuf8/ku3Yk4KxBDKOPKSm	\N	\N	\N	4	2015-08-24 14:04:15.244448	2015-07-21 17:20:54.353186	191.34.59.133	191.249.216.75	2015-07-10 23:59:46.725559	2015-08-24 14:04:15.251402	businessman	(22) 9991-24353	Max Salles	f		\N	\N	\N	\N	f	\N	\N	\N	\N	1	1
2	matheusgfelix@yahoo.com.br	$2a$10$j2jw1L3AhcRQlqpR3Kfuw.E88lk/1CZzgOPcRHuA/RSx6uvZtG/0a	\N	\N	2015-10-23 12:03:13.037988	105	2015-10-23 12:50:54.234672	2015-10-23 12:03:13.051146	177.47.134.49	191.32.237.178	2015-07-11 00:59:35.219372	2015-10-23 12:50:54.238479	safety_technician	(22) 2723-9747	Matheus Felix	f		profile_foto.jpg	image/jpeg	561758	2015-08-20 13:17:01.304586	f	0	0	1033	1033	2	7
3	matheusgfelix@gmail.com	$2a$10$BQCEfVpyuPa/FlCRD7uAHeFiTd76XLLBnwzfXIoReVPZ2Wi2xJulW	\N	\N	\N	8	2015-10-19 11:40:17.689359	2015-10-16 20:48:19.4148	179.86.207.14	177.47.131.15	2015-07-13 16:30:04.566042	2015-10-19 11:40:17.693007	businessman	(22) 2723-947	Matheus Felix 	f	matheusgfelix@gmail.com	\N	\N	\N	\N	f	\N	\N	\N	\N	3	3
\.


--
-- Data for Name: account_users; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY account_users (id, user_id, account_id, created_at, updated_at, kind) FROM stdin;
1	1	1	2015-07-11 00:17:39.73082	2015-07-11 00:17:39.740315	owner
2	2	2	2015-07-11 00:59:44.872378	2015-07-11 00:59:44.878473	owner
3	3	3	2015-07-13 16:30:18.510909	2015-07-13 16:30:18.517138	owner
\.


--
-- Name: account_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('account_users_id_seq', 3, true);


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('accounts_id_seq', 3, true);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY companies (id, cnpj, state_registration, company_name, fantasy_name, operation_area, phone_number, cnae, employee_numbers, female_employee_numbers, male_employee_numbers, cep, city, state, neighborhood, street, created_at, updated_at, account_id, logo_file_name, logo_content_type, logo_file_size, logo_updated_at, delete_logo, crop_x, crop_y, crop_w, crop_h, complement, number, risk_level, weekly_hours_worked) FROM stdin;
1	22.222.222/2222-22	2222222	Algorich DV	Algorich	Segmento qualquer	999124353	2222	222	35	34	28015-200	Campos dos Goytacazes	rj	Centro	Rua Dr. Herculano Aquino	2015-07-11 00:19:29.278094	2015-07-11 00:19:29.278094	1	\N	\N	\N	\N	f	\N	\N	\N	\N		122	\N	\N
2	99.999.999/9999-99	99999	Anglo American	Anglo American	Mineração	27235845	999999	1600	800	800	28035042	Campos dos Goytacazes	rj	Centro	Tenente Coronel Cardoso	2015-07-11 01:02:19.500334	2015-07-11 01:02:19.500334	2	\N	\N	\N	\N	f	\N	\N	\N	\N		873	\N	\N
3	99.999.999/9999-99	9999999	Algorich	Algorich 	Desenvolvimento de software		9999 	30	15	15	28035-042	Campos 	rj	Centro 	Tenente Coronel Cardoso 	2015-07-13 17:35:38.163427	2015-07-13 17:35:38.163427	3	\N	\N	\N	\N	f	\N	\N	\N	\N		873	\N	\N
4	88.888.888/8888-88	99999999	Algorich	Algorich	Desenvolvimento de Software	27239747	9999999999	30	15	15	28035-042	Campos dos Goytacazes	rj	Centro	Tenente Coronel Cardoso	2015-07-14 23:32:32.415808	2015-07-14 23:32:32.415808	2	\N	\N	\N	\N	f	\N	\N	\N	\N		873	\N	\N
5	77.777.777/7777-77	7777777	Stark Industries	Stark Industries	Construção Civil	(27) 2358-45	77777777	300	150	150	28035-042	Rio de Janeiro	rj	Centro	Tenente Coronel Cardoso	2015-07-14 23:42:52.366715	2015-07-14 23:47:34.625511	2	\N	\N	\N	\N	f	\N	\N	\N	\N		200	\N	\N
7	66.666.666/6666-66	666666	ACME	ACME INDUSTRIES	Industrial		6666666666	3000	1500	1500	28035042	Campos dos Goytacazes	rj	Centro	Rua Tenente-Coronel Cardoso	2015-07-29 12:46:41.192707	2015-07-29 12:46:41.192707	2	\N	\N	\N	\N	f	\N	\N	\N	\N		873	\N	\N
8	22.222.222/2222-22	222222222	OSCORP Industries	OSCORP Industries	Industrias e Tecnologia	(22) 2222-22222	2222222	10000	5000	5000	28035042	Campos dos Goytacazes	rj	Centro	Rua Tenente-Coronel Cardoso	2015-08-07 13:44:43.682807	2015-08-07 13:44:43.682807	2	oscorp_industries.png	image/png	38076	2015-08-07 13:44:42.752438	f	\N	\N	\N	\N		873	4	40
11	55.555.555/5555-55	55555555	Wayne Enter	Wayne Enter	Tecnologia	27239747	5555555	4000	2000	2000	28035042	Campos dos Goytacazes	rj	Centro	Rua Tenente-Coronel Cardoso	2015-08-19 21:50:34.487895	2015-08-19 21:50:34.487895	2	Wayne_Enterprises.jpg	image/jpeg	8118	2015-08-19 21:50:34.274546	f	\N	\N	\N	\N		873	4	40
6	66.666.666/6666-66	666666666	Wonka Industries	Wonka Industries	Industrial	(27) 2397-47	6666666	3000	1500	1500	28035-042	Campos dos Goytacazes	rj	Centro	Rua Tenente-Coronel Cardoso	2015-07-16 14:10:25.297762	2015-08-26 18:41:22.172565	2	Quasar.jpg	image/jpeg	1886948	2015-08-26 18:41:14.89424	f	\N	\N	\N	\N	bl 2	721	4	40
12	11.111.111/1111-11	2222222222222222222222	Camargo Correa S.A	Camargo Correa	Construção Civil	(22) 2222-22222	11111111111	3000	1500	1500	22222-222	Campos	rj	Centro	HASGAHJSGAHJ	2015-10-09 14:40:42.162631	2015-10-09 14:41:25.359714	2	CCCC.jpg	image/jpeg	168324	2015-10-09 14:41:24.947174	f	\N	\N	\N	\N	DSSDS	2323	4	40
\.


--
-- Data for Name: collaborator_functions; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY collaborator_functions (id, name, account_id, company_id, created_at, updated_at, description) FROM stdin;
2	Engenheiro de Segurança	2	2	2015-07-11 01:05:00.192712	2015-07-11 01:05:00.192712	\N
3	Técnico de Segurança	2	2	2015-07-11 13:52:52.698457	2015-07-11 13:52:52.698457	\N
4	Médico do Trabalho	2	2	2015-07-11 14:00:46.023073	2015-07-11 14:00:46.023073	\N
6	Auxiliar Administrativo	2	2	2015-07-14 13:07:00.107796	2015-07-14 13:07:00.107796	\N
7	Programador	2	4	2015-07-14 23:35:42.707454	2015-07-14 23:35:42.707454	\N
8	Engenheiro Eletrônico	2	5	2015-07-15 00:13:53.607206	2015-07-15 00:13:53.607206	\N
9	Técnico de Segurança	2	6	2015-07-16 14:12:59.629489	2015-07-16 14:12:59.629489	\N
10	AJUDANTE	2	6	2015-07-16 16:20:37.966177	2015-07-16 16:20:37.966177	\N
11	ALMOXARIFE	2	6	2015-07-16 16:20:59.597411	2015-07-16 16:20:59.597411	\N
12	ANALISTA MEIO AMBIENTE	2	6	2015-07-16 16:21:13.770306	2015-07-16 16:21:13.770306	\N
13	APONTADOR	2	6	2015-07-16 16:21:26.183303	2015-07-16 16:21:26.183303	\N
14	APROPRIADOR	2	6	2015-07-16 16:21:44.137693	2015-07-16 16:21:44.137693	\N
15	ARMADOR	2	6	2015-07-16 16:21:57.496332	2015-07-16 16:21:57.496332	\N
16	ASS. TEC. MANUTENÇÃO	2	6	2015-07-16 16:22:10.916257	2015-07-16 16:22:10.916257	\N
17	ASS. ADM. PESSOAL 	2	6	2015-07-16 16:22:23.964921	2015-07-16 16:22:23.964921	\N
18	ASS. ADM. PESSOAL	2	6	2015-07-16 16:22:38.316008	2015-07-16 16:22:38.316008	\N
19	Aux. ADMINISTRATIVO	2	6	2015-07-16 16:22:51.601201	2015-07-16 16:22:51.601201	\N
20	ASS TEC PLANEJAMENTO	2	6	2015-07-16 16:23:04.491946	2015-07-16 16:23:04.491946	\N
21	ASS. ADM. DOCUMENTOS 	2	6	2015-07-16 16:23:15.413602	2015-07-16 16:23:15.413602	\N
22	ASS. APOIO ADMINISTRATIVO 	2	6	2015-07-16 16:26:44.328388	2015-07-16 16:26:44.328388	\N
23	ASS. ADM. FINANCEIRO	2	6	2015-07-16 16:26:56.710921	2015-07-16 16:26:56.710921	\N
24	AUX. ADM FINANCEIRO	2	6	2015-07-16 16:27:05.778368	2015-07-16 16:27:05.778368	\N
25	ASS. CUSTOS 	2	6	2015-07-16 16:27:24.763074	2015-07-16 16:27:24.763074	\N
26	ASS. TEC. CUSTOS 	2	6	2015-07-16 16:27:35.205359	2015-07-16 16:27:35.205359	\N
27	ASS. TEC. PRODUÇÃO	2	6	2015-07-16 16:27:44.226548	2015-07-16 16:27:44.226548	\N
28	AUX. TEC. SEGURANÇA DO TRABALHO 	2	6	2015-07-16 16:27:52.202561	2015-07-16 16:27:52.202561	\N
29	AUX. TEC. PLANEJAMENTO	2	6	2015-07-16 16:28:10.527303	2015-07-16 16:28:10.527303	\N
30	AUX. ALMOXARIFE 	2	6	2015-07-16 16:28:22.9996	2015-07-16 16:28:22.9996	\N
31	AUX. ALMOXARIFE 	2	6	2015-07-16 16:28:36.012589	2015-07-16 16:28:36.012589	\N
32	AUXILIAR DE TOPOGRAFIA	2	6	2015-07-16 16:28:49.795701	2015-07-16 16:28:49.795701	\N
33	CARPINTEIRO	2	6	2015-07-16 16:28:59.432668	2015-07-16 16:28:59.432668	\N
34	COMPRADOR	2	6	2015-07-16 16:29:09.889144	2015-07-16 16:29:09.889144	\N
35	COORDENAÇAO DE QMSR 	2	6	2015-07-16 16:29:18.30996	2015-07-16 16:29:18.30996	\N
36	COORD. PRODUÇÃO 	2	6	2015-07-16 16:29:27.76906	2015-07-16 16:29:27.76906	\N
37	ELETRICISTA C/A I  	2	6	2015-07-16 16:29:41.663121	2015-07-16 16:29:41.663121	\N
38	ENC APONTADORIA 	2	6	2015-07-16 16:29:50.890325	2015-07-16 16:29:50.890325	\N
39	ENC. DEP. PESSOAL	2	6	2015-07-16 16:30:00.651588	2015-07-16 16:30:00.651588	\N
40	ENARREGADO DE OBRAS	2	6	2015-07-16 16:30:16.661706	2015-07-16 16:30:16.661706	\N
41	ENCARREGADO GERAL 	2	6	2015-07-16 16:30:32.047889	2015-07-16 16:30:32.047889	\N
42	ENCARREGADO OBRAS CIVIS	2	6	2015-07-16 20:27:43.306837	2015-07-16 20:27:43.306837	\N
43	ENCARREGADO DE SERV GERAIS 	2	6	2015-07-16 20:27:54.370237	2015-07-16 20:27:54.370237	\N
44	ENC.DE TERRAPLANAGEM	2	6	2015-07-16 20:28:05.604946	2015-07-16 20:28:05.604946	\N
45	ENCARREGADO DE TRANSPORTE 	2	6	2015-07-16 20:28:13.892751	2015-07-16 20:28:13.892751	\N
46	ENCARREGADO DE PRODUÇÃO	2	6	2015-07-16 20:28:26.783264	2015-07-16 20:28:26.783264	\N
47	ENCANADOR HIDRAULICO	2	6	2015-07-16 20:28:37.423176	2015-07-16 20:28:37.423176	\N
48	ENGENHEIRO DE SEG TRABALHO	2	6	2015-07-16 20:28:58.240137	2015-07-16 20:28:58.240137	\N
49	ENGENHEIRO PLANEJAMENTO	2	6	2015-07-16 20:30:33.895294	2015-07-16 20:30:33.895294	\N
50	ENGENHEIRO DE PRODUÇÃO 	2	6	2015-07-16 20:31:14.314284	2015-07-16 20:31:14.314284	\N
51	LIDER DE CAPPINTARIA 	2	6	2015-07-16 20:37:23.113406	2015-07-16 20:37:23.113406	\N
52	LIDER DE EQUIPE SERVIÇOS GERAIS 	2	6	2015-07-16 20:57:05.119683	2015-07-16 20:57:05.119683	\N
53	Técnico de Eletrônica	2	5	2015-07-20 13:54:59.12126	2015-07-20 13:54:59.12126	Descrição teste 1
54	Função 1	1	1	2015-07-20 14:00:23.919321	2015-07-20 14:00:23.919321	
55	Técnico de HSE	2	7	2015-07-29 12:49:33.83828	2015-07-29 12:49:33.83828	Ashdgshdg ghdgahdg hagdhagd
56	Coordenador de QHSE	2	7	2015-07-29 12:49:49.071594	2015-07-29 12:49:49.071594	Didjhjkhdj djwhdjkwh wjdhwjh
57	Coordenadora de Medicina	2	7	2015-07-29 12:50:03.008188	2015-07-29 12:50:03.008188	Fjsahdkjah jjhsdjsh hsjdhsjd whejw 
58	Gerente Administrativo	2	7	2015-08-05 14:03:02.068555	2015-08-05 14:03:02.068555	Gerenciamento do setor financeiro.
59	Diretor Executivo	2	8	2015-08-07 13:50:53.84558	2015-08-07 13:50:53.84558	CEO
60	Diretor de Tecnologoia	2	8	2015-08-07 13:51:24.123634	2015-08-07 13:51:24.123634	CTO
61	Engenheiro Eletricista	2	6	2015-08-18 20:35:53.69967	2015-08-18 20:35:53.69967	
62	Encarregado Apontadoria	2	6	2015-08-18 20:36:28.90229	2015-08-18 20:36:28.90229	
63	Encarregado de Obras	2	6	2015-08-18 20:36:50.0927	2015-08-18 20:36:50.0927	
64	Encarregado de QSMS	2	6	2015-08-18 20:37:16.04981	2015-08-18 20:37:16.04981	
65	Engenheiro Mecânico	2	6	2015-08-18 20:38:05.055184	2015-08-18 20:38:05.055184	
66	Médico do Trabalho	2	6	2015-08-20 23:54:13.776752	2015-08-20 23:54:13.776752	
67	Enfermeira do Trabalho	2	6	2015-08-28 13:49:29.183616	2015-08-28 13:49:29.183616	dhsgdhsg hsgdhadgsh
68	Engenheiro Civil	2	6	2015-08-28 13:51:48.86882	2015-08-28 13:51:48.86882	hgsdhsg shdgshdg ahgdash
69	Abastecedor	2	2	2015-09-23 18:44:18.488168	2015-09-23 18:44:18.488168	Responsável pelo abastecimento de veículos. Fazendo manuseio e armazenagem de combustíveis.
70	Engenheiro de Segurança	2	12	2015-10-09 14:45:55.135627	2015-10-09 14:45:55.135627	shgdjsdgshg
\.


--
-- Data for Name: collaborator_positions; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY collaborator_positions (id, name, account_id, company_id, created_at, updated_at) FROM stdin;
1	Engenheiro de Segurança	2	2	2015-07-11 01:04:13.350604	2015-07-11 01:04:13.350604
2	Técnico de Segurança	2	2	2015-07-11 13:53:23.250237	2015-07-11 13:53:23.250237
3	Médico do Trabalho	2	2	2015-07-11 13:59:02.268959	2015-07-11 13:59:02.268959
4	Auxiliar Administrativo	2	2	2015-07-14 13:06:39.033431	2015-07-14 13:06:39.033431
5	Diretor Geral	2	4	2015-07-14 23:34:56.147008	2015-07-14 23:34:56.147008
6	Diretor de Tecnologia	2	5	2015-07-15 00:12:53.859669	2015-07-15 00:13:21.119555
7	Técnico de Segurança	2	6	2015-07-16 14:12:33.126189	2015-07-16 14:12:33.126189
8	LIDER EQ. O.A.C.	2	6	2015-07-16 20:32:50.815673	2015-07-16 20:32:50.815673
9	LIDER EQ	2	6	2015-07-16 20:33:59.232394	2015-07-16 20:33:59.232394
10	LIDER DE CAPPINTARIA 	2	6	2015-07-16 20:36:06.255768	2015-07-16 20:36:06.255768
11	Almoxarife	2	6	2015-07-20 13:36:40.87142	2015-07-20 13:36:40.87142
12	Engenheiro de QSMS	2	6	2015-07-20 13:39:02.764064	2015-07-20 13:39:02.764064
13	Engenheiro Eletricista	2	6	2015-07-20 13:39:34.412831	2015-07-20 13:39:44.007673
14	Engenheiro Mecânico	2	6	2015-07-20 13:40:06.901012	2015-07-20 13:40:06.901012
15	Encarregado de Obras	2	6	2015-07-20 13:41:37.577222	2015-07-20 13:41:37.577222
16	Encarregado Apontadoria	2	6	2015-07-20 13:41:52.062852	2015-07-20 13:41:52.062852
17	Técnico de Eletrônica	2	5	2015-07-20 13:55:54.473101	2015-07-20 13:55:54.473101
18	Cargo 1	1	1	2015-07-20 13:57:59.466861	2015-07-20 13:57:59.466861
19	Cargo 2	1	1	2015-07-20 13:58:35.921084	2015-07-20 13:58:35.921084
20	Cargo 3	1	1	2015-07-20 13:58:41.621016	2015-07-20 13:58:41.621016
21	Cargo 4	1	1	2015-07-20 13:59:30.978238	2015-07-20 13:59:30.978238
22	Cargo 5	1	1	2015-07-20 13:59:41.950002	2015-07-20 13:59:41.950002
23	Cargo 6	1	1	2015-07-20 13:59:46.96778	2015-07-20 13:59:46.96778
24	Cargo 7	1	1	2015-07-20 13:59:54.583073	2015-07-20 13:59:54.583073
25	Técnico de Segurança	2	7	2015-07-29 12:48:25.534628	2015-07-29 12:48:25.534628
26	Engenheiro de Sgeurança	2	7	2015-07-29 12:48:37.834137	2015-07-29 12:48:37.834137
27	Enfermeira do Trabalho	2	7	2015-07-29 12:48:53.938151	2015-07-29 12:48:53.938151
28	Gerente Adminitrativo	2	7	2015-08-05 14:02:19.483429	2015-08-05 14:02:19.483429
29	Diretor Executivo	2	8	2015-08-07 13:46:06.55423	2015-08-07 13:46:06.55423
30	Diretor de Tecnologia	2	8	2015-08-07 13:51:55.176867	2015-08-07 13:51:55.176867
31	Analista Meio Ambiente	2	6	2015-08-18 20:43:31.651073	2015-08-18 20:43:31.651073
32	Apontador	2	6	2015-08-18 20:43:52.095286	2015-08-18 20:43:52.095286
33	Armador	2	6	2015-08-18 20:44:11.982788	2015-08-18 20:44:11.982788
34	Carpinteiro	2	6	2015-08-18 20:44:54.366858	2015-08-18 20:44:54.366858
35	Médico do Trabalho	2	6	2015-08-20 23:53:49.199079	2015-08-20 23:53:49.199079
36	Enfermeira do Trabalho	2	6	2015-08-28 13:49:05.217001	2015-08-28 13:49:05.217001
37	Engenheiro Civil	2	6	2015-08-28 13:51:32.055937	2015-08-28 13:51:32.055937
38	Abastecedor	2	2	2015-09-23 18:42:39.3733	2015-09-23 18:42:39.3733
39	Engenheiro de Segurança	2	12	2015-10-09 14:45:40.133551	2015-10-09 14:45:40.133551
\.


--
-- Data for Name: sectors; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY sectors (id, name, company_id, created_at, updated_at, description, weekly_hours_worked) FROM stdin;
1	Projetos	2	2015-07-11 01:24:36.922752	2015-07-11 01:24:36.922752	\N	\N
2	Administrativo	2	2015-07-11 01:24:56.547359	2015-07-11 01:24:56.547359	\N	\N
3	Operacional	2	2015-07-11 14:04:12.573202	2015-07-11 14:04:12.573202	\N	\N
5	Tecnologia	5	2015-07-15 00:14:09.864133	2015-07-15 00:14:09.864133	\N	\N
6	Administrativo	6	2015-07-16 14:13:17.385318	2015-07-16 14:13:17.385318	\N	\N
4	Administrativo	4	2015-07-14 23:35:59.169327	2015-07-20 13:57:28.110467	Descrição Setor 1 teste	\N
7	Tecnologia	4	2015-07-20 13:58:14.636771	2015-07-20 13:58:14.636771	Descrição setor tecnologia 2	\N
8	Administrativo	5	2015-07-20 13:59:27.442577	2015-07-20 13:59:27.442577	Descrição adm teste	\N
9	Projetos	5	2015-07-20 14:00:16.807239	2015-07-20 14:00:16.807239	Descrição projetos teste	\N
10	Setor 1	1	2015-07-20 14:00:49.099727	2015-07-20 14:00:49.099727		\N
11	Setor 2	1	2015-07-22 19:11:42.199397	2015-07-22 19:11:42.199397		\N
12	Projetos	7	2015-07-29 12:50:21.724107	2015-07-29 12:50:21.724107	 Gjsgdhsgds hsdgshgdshg	\N
13	Administrativo	7	2015-07-29 12:50:32.116363	2015-07-29 12:50:32.116363	DGAhdgashdg gdhagdh hagdahdgsahgs	\N
14	Operacional	7	2015-07-29 12:50:41.62655	2015-07-29 12:50:41.62655	dihgfhf jdhsjdhsj jshdsjdh uhdjshd	\N
15	Administrativo	8	2015-08-07 13:53:05.130314	2015-08-07 13:53:05.130314	Adm teste	40
16	Manutenção	6	2015-08-18 20:39:48.712148	2015-08-18 20:39:48.712148		40
17	Administrativo	12	2015-10-09 14:45:05.413028	2015-10-09 14:45:05.413028	shgashgahsg	40
\.


--
-- Data for Name: collaborators; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY collaborators (id, name, nationality, birth_country, gender, birth_date, identity, cpf, passport, father_name, mother_name, cep, city, state, neighborhood, street, cnh, cnh_type, phone_number, email, admission_date, remission_date, created_at, updated_at, account_id, company_id, user_id, document_emitter, complement, number, collaborator_function_id, collaborator_position_id, sector_id, crm, is_doctor, collaborator_location_id) FROM stdin;
1	Johnny Walker	Brasileiro	Rio de Janeiro	male	28/03/1980	99999999999			Cricius	Mary Jane										01/01/2015		2015-07-11 01:05:24.249708	2015-07-11 01:05:24.249708	2	2	\N	DETRAN			2	1	\N	\N	f	\N
2	Maria	Brasileiro	Rio de Janeiro	female	13/04/1979	8888888888'				Mary Jane									matheusgfelix@yahoo.com.br	01/01/2015		2015-07-14 13:07:14.929033	2015-07-14 13:07:14.929033	2	2	\N	DETRAN			6	4	\N	\N	f	\N
4	Johnn	Americano	New York	male	28/02/1980	22222222				Mary Jane										02/02/2015		2015-07-15 14:13:21.814638	2015-07-15 14:13:21.814638	2	5	\N	DETRAN			8	6	\N	\N	f	\N
6	Marcus 	Brasileiro	Rio de Janeiro	male	28/02/1980	111111111111111	080.846.177-30		sssssssss	Mary Jane	28035042	Campos dos Goytacazes	rj	Centro	Rua Tenente-Coronel Cardoso	876778809	ab	2227239747	matheusgfelix@gmail.com	28/07/2015		2015-07-29 12:54:23.391474	2015-07-29 12:54:23.391474	2	7	\N	DETRAN		873	56	26	\N	\N	f	\N
7	Rogério Eduardo	Brasileiro	Rio de Janeiro	male	15/02/1970	333333333333	333.333.333-33	3333333333	xxxxxxxxxxx	Mary Jane	28035-042	Campos dos Goytacazes	rj	Centro	Tenente Coronel Cardoso	3333333333	ab	2227235845	matheusgfelix@gmail.com	01/01/2000		2015-08-05 14:03:56.775759	2015-08-05 14:03:56.775759	2	7	\N	DETRAN	Bloco 2	873	58	28	\N	\N	f	\N
8	Norman Osborn	Americano	New York	male	01/01/1964	11111111111111	111.111.111-11	1111111111	Ambrose Osborn	xxxxxxxxxxxxxxx	11111-111	New York			xxxxxxxx	11111111111	ab			01/01/1980		2015-08-07 14:03:49.139863	2015-08-07 14:04:05.104023	2	8	\N	xxxx			59	29	\N	\N	f	\N
9	Harry Osborn	Americano	New York	male	01/02/1980	3333333333	333.333.333-33	33333333333	Norman Osborn	xxxxxxxxxx	28035-042	Campos dos Goytacazes			Rua Tenente-Coronel Cardoso	33333333333	ab	2227239747		01/01/1994		2015-08-07 15:20:00.457705	2015-08-07 15:20:00.457705	2	8	\N	xxxx			60	30	\N	\N	f	\N
10	Mark	Brasileiro	Brasil	male	03/03/1980	111111111111111			xxxxxx	Mary Jane						99999999	b					2015-08-19 14:17:23.73637	2015-08-19 14:17:23.73637	2	6	\N	DETRAN			9	7	\N		f	\N
5	Stuart	Brasileiro	Rio de Janeiro	male	05/03/2015	111111111111111	999.999.999-99			Mary Jane	28035-042	Campos dos Goytacazes	pr	Centro	Rua Tenente-Coronel Cardoso	99999999	a	(22) 2723-9747	matheusgfelix@gmail.com	01/03/2015	01/01/2015	2015-07-16 20:14:31.049909	2015-08-20 23:54:25.598921	2	6	\N	DETRAN		873	66	35	\N	5555555RJ	t	\N
11	João	Brasileiro	Brasil	male	08/03/1980	111111111111111			xxxxxx	Mary Jane						99999999	b		matheusgfelix@gmail.com	01/08/2015		2015-08-28 13:45:58.712545	2015-08-28 13:45:58.712545	2	6	\N	DETRAN			9	7	\N		f	\N
15	Elvia	Brasileiro	Brasil	female	25/02/1983	111111111111111				Mary Jane										01/08/2015		2015-08-28 13:49:44.062928	2015-08-28 13:49:44.062928	2	6	\N	DETRAN			67	36	\N		f	\N
14	Rodrigo	Brasileiro	Brasil	male	14/03/1980	111111111111111				Mary Jane												2015-08-28 13:48:03.990675	2015-08-28 13:50:56.263467	2	6	\N	DETRAN			65	14	\N		f	\N
13	Ralph	Brasileiro	Brasil	male	06/03/1980	111111111111111				Mary Jane												2015-08-28 13:47:27.054204	2015-08-28 13:51:51.805256	2	6	\N	DETRAN			68	37	\N		f	\N
12	Paulo Roberto	Brasileiro	Brasil	male	20/03/1980	111111111111111			xxxxxx	Mary Jane	28035042	Campos dos Goytacazes			Rua Tenente-Coronel Cardoso			(22) 2723-9747	paulo@safeverse.com	01/08/2015		2015-08-28 13:46:49.540858	2015-08-28 13:55:18.384201	2	6	\N	DETRAN			66	35	\N	55555	t	\N
16	Oswald Chesterfield Cobblepot Junior	Brasileiro	Rio de Janeiro	male	28/03/1980	333333333333				Fulana										10/03/2015		2015-08-31 19:12:19.845333	2015-08-31 19:12:19.845333	2	6	\N	DETRAN			68	37	\N		f	\N
17	Jorge	Brasileiro	Rio de Janeiro	male	28/03/1980	11111111111111	222.222.222-22		xxxxxxx	yyyyyyyyy						222222222222222	a			01/10/2015		2015-10-09 14:46:01.146022	2015-10-09 14:46:01.146022	2	12	\N	hdgahsgah			70	39	\N		f	\N
18	Luke Skywalker	Brasileiro	Rio de Janeiro	male	28/03/1980	1111111	111.111.111-11	11	jsdshajsh	kjdsabsdkasjkd						111	e			15/10/2015		2015-10-16 14:39:37.322296	2015-10-16 14:39:37.322296	2	12	\N	111			70	39	\N		f	1
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY projects (id, name, description, created_at, updated_at, account_id) FROM stdin;
1	Projeto teste	Teste	2015-07-11 00:17:48.624151	2015-07-11 00:17:48.624151	1
2	Porto do Açu	Projeto teste	2015-07-11 01:00:19.728246	2015-07-11 01:00:19.728246	2
3	Porto do Açu	Xxxxxx	2015-07-13 16:31:26.947062	2015-07-13 16:31:26.947062	3
4	Estaleiro	xxxxxxxxxxxxxxxxxxxxxxx	2015-07-14 23:33:11.795636	2015-07-14 23:33:11.795636	2
5	Vale	Teste teste	2015-07-29 12:43:57.048229	2015-07-29 12:43:57.048229	2
6	Nome do projeto	Qualquer coisa	2015-08-05 00:05:43.645586	2015-08-05 00:05:43.645586	2
7	Mina	shdhsgdhsgh	2015-08-28 19:32:28.021835	2015-08-28 19:32:28.021835	2
8	Camargo Correa	dsdsdsdsd	2015-10-09 14:33:52.058049	2015-10-09 14:33:52.058049	2
\.


--
-- Data for Name: asos; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY asos (id, collaborator_id, project_id, account_id, coordinator_id, executor_id, created_at, updated_at, realization_date, expiration_date, kind) FROM stdin;
1	10	7	2	12	5	2015-09-09 23:17:35.99589	2015-09-09 23:17:35.99589	2015-09-08	2016-08-24	admission
2	10	7	2	12	5	2015-09-11 00:57:45.847945	2015-09-11 00:57:45.847945	2015-09-09	2015-09-26	demission
3	11	7	2	12	5	2015-09-16 00:28:52.842427	2015-09-16 00:28:52.842427	2015-09-15	2016-09-15	admission
4	16	7	2	12	5	2015-10-07 00:41:56.623781	2015-10-07 00:41:56.623781	2015-10-04	2016-08-31	admission
\.


--
-- Data for Name: exams; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY exams (id, name, account_id, created_at, updated_at) FROM stdin;
1	Encefalograma	2	2015-08-20 23:57:29.960695	2015-08-20 23:57:29.960695
2	Raio X	2	2015-08-27 17:56:44.347054	2015-08-27 17:56:44.347054
3	Audiometria	2	2015-08-27 17:57:30.0203	2015-08-27 17:57:30.0203
4	Acuidade Visual	2	2015-08-27 17:57:58.921096	2015-08-27 17:57:58.921096
5	Eletrocardiograma	2	2015-08-27 17:58:27.275065	2015-08-27 17:58:27.275065
6	Exames Laboratoriais	2	2015-08-27 18:04:49.739783	2015-08-27 18:04:49.739783
7	Tipagem Sanguínea	2	2015-08-27 20:10:15.785497	2015-08-27 20:10:15.785497
\.


--
-- Data for Name: aso_exams; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY aso_exams (id, exam_id, aso_id, created_at, updated_at, realization_date) FROM stdin;
\.


--
-- Name: aso_exams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('aso_exams_id_seq', 1, false);


--
-- Name: asos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('asos_id_seq', 4, true);


--
-- Data for Name: trainings; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY trainings (id, title, account_id, description, validity_period, created_at, updated_at, project_id, enabled, collaborators_who_did_not_perform, collaborators_who_already_expired, collaborators_who_will_expire_in_1_month, collaborators_who_will_expire_in_2_month, collaborators_who_will_expire_in_3_month, array_collaborators_who_did_not_perform, array_collaborators_who_already_expired, array_collaborators_who_will_expire_in_1_month, array_collaborators_who_will_expire_in_2_month, array_collaborators_who_will_expire_in_3_month) FROM stdin;
1	Trabalho em Altura	2	teste descrição	12	2015-07-11 01:21:46.744927	2015-07-11 01:21:46.744927	\N	t	0	0	0	0	0	{}	{}	{}	{}	{}
2	Espaço Confinado	2	xxxxxxxxxxxxxxx	12	2015-07-15 00:38:34.208967	2015-07-15 00:38:34.208967	\N	t	0	0	0	0	0	{}	{}	{}	{}	{}
3	Espaço Confinado	2	Treinamento de Espaço confinado de 40 hs	12	2015-08-12 16:10:59.944129	2015-08-12 16:10:59.944129	5	t	0	0	0	0	0	{}	{}	{}	{}	{}
4	Primeiros Socorros	2	djhsjdh asbajs ashsbajb	12	2015-08-28 19:12:20.72394	2015-08-28 19:12:20.72394	4	t	0	0	0	0	0	{}	{}	{}	{}	{}
6	Treinamento Introdutório	2	hgdshgd shgdshdg shgdsh	12	2015-08-28 19:29:13.39305	2015-08-28 19:29:13.39305	4	t	0	0	0	0	0	{}	{}	{}	{}	{}
14	NR - 10	2	ahsgahsg	12	2015-09-21 13:33:48.153654	2015-09-21 13:33:48.153654	7	t	0	0	0	0	0	{}	{}	{}	{}	{}
13	Brigadista	2	saihsjahs 	12	2015-09-11 13:42:13.763879	2015-10-09 14:03:24.797245	7	t	0	0	0	0	0	{}	{}	{}	{}	{}
15	CBSP	2	ahsgahgs	60	2015-10-01 14:41:58.294864	2015-10-22 17:07:40.589789	7	t	0	0	0	0	0	{}	{}	{}	{}	{}
21	Teste Integração	2	dasasas	12	2015-10-20 19:48:51.009995	2015-10-22 17:11:43.09959	7	t	1	0	0	0	0	{18}	{}	{}	{}	{}
18	Integração	2	hagshagshag	12	2015-10-09 14:47:12.717998	2015-10-09 14:54:00.789485	8	t	0	0	0	0	0	{}	{}	{}	{}	{}
19	Teste 3	2	sasasasa	12	2015-10-16 12:17:19.598701	2015-10-20 12:28:50.942644	7	t	0	0	0	0	0	{}	{}	{}	{}	{}
20	CIPA	2	asasasas	12	2015-10-20 13:40:11.813735	2015-10-20 13:40:11.813735	8	t	0	0	0	0	0	{}	{}	{}	{}	{}
10	Combate a Incêndio	2	Teste	12	2015-09-01 18:11:08.709446	2015-10-22 02:00:07.241025	7	f	3	0	0	0	0	{10,11,14}	{}	{}	{}	{}
11	PSA	2	Teste PSA	24	2015-09-03 22:14:11.002594	2015-10-22 15:45:19.215139	7	t	0	0	0	0	0	{}	{}	{}	{}	{}
12	Proteção de Máquinas e Equipamentos	2	sdsdsd	12	2015-09-09 21:10:34.843155	2015-10-22 15:57:30.606761	7	t	0	0	0	0	0	{}	{}	{}	{}	{}
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY courses (id, account_id, training_id, realization_start_date, realization_end_date, created_at, updated_at, status, seats, name) FROM stdin;
1	2	4	2015-08-29 11:00:00	2015-08-29 21:00:00	2015-08-28 19:13:33.584531	2015-08-28 19:13:33.584531	planned	\N	\N
2	2	4	2015-08-29 11:00:00	2015-08-29 21:00:00	2015-08-28 19:23:18.725728	2015-08-28 19:23:18.725728	planned	\N	\N
3	2	1	2015-08-28 19:16:00	2015-08-29 19:16:00	2015-08-28 19:25:14.134063	2015-08-28 19:25:14.134063	planned	\N	\N
4	2	6	2015-09-01 11:00:00	2015-09-01 21:00:00	2015-08-28 19:43:37.206392	2015-08-28 19:43:37.206392	planned	\N	\N
8	2	1	2015-09-05 11:00:00	2015-09-06 21:00:00	2015-09-01 18:18:13.556113	2015-09-09 20:11:24.320475	canceled	5	002
9	2	1	2015-09-09 20:11:00	2015-09-10 20:11:00	2015-09-09 20:11:54.827056	2015-09-09 20:11:54.827056	planned	20	222
10	2	2	2015-09-09 20:12:00	2015-09-24 20:12:00	2015-09-09 20:12:38.400585	2015-09-09 20:12:38.400585	planned	20	200
13	2	2	2015-09-17 23:07:00	2015-09-25 23:07:00	2015-09-10 23:08:26.378238	2015-09-10 23:08:26.378238	planned	22	222
71	2	20	2015-10-21 10:00:00	2015-10-21 20:00:00	2015-10-20 13:42:20.289733	2015-10-20 13:42:20.289733	planned	10	0001
23	2	1	2015-09-22 13:59:00	2015-09-24 13:59:00	2015-09-21 14:00:14.378065	2015-09-21 14:00:14.378065	planned	20	001
24	2	6	2015-09-23 14:01:00	2015-09-24 14:01:00	2015-09-21 14:01:55.828369	2015-09-21 14:01:55.828369	planned	22	12
25	2	1	2015-09-24 14:02:00	2015-09-27 14:02:00	2015-09-21 14:02:41.967039	2015-09-21 14:02:41.967039	planned	12	33
85	2	1	2015-10-22 12:43:00	2015-10-23 12:43:00	2015-10-22 12:43:57.67981	2015-10-22 12:44:17.637387	planned	10	Nome exemplo
84	2	3	2015-10-22 11:32:00	2015-10-23 11:32:00	2015-10-22 11:32:46.606606	2015-10-22 12:44:45.020755	planned	30	Nome exemplo
86	2	3	2015-10-22 12:50:00	2015-10-23 12:50:00	2015-10-22 12:50:34.739809	2015-10-22 12:50:34.739809	planned	12	0004
67	2	4	2015-10-23 22:19:00	2015-10-27 22:19:00	2015-10-16 23:20:20.724551	2015-10-16 23:20:20.724551	confirmed	32	002
93	2	21	2015-10-23 10:00:00	2015-10-23 18:00:00	2015-10-22 17:14:57.894636	2015-10-22 17:26:15.587424	confirmed	30	Nome exemplo
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY attachments (id, project_id, name, file_file_name, file_content_type, file_file_size, file_updated_at, course_id, description) FROM stdin;
1	5	Certificado	Certificate.jpg	image/jpeg	124102	2015-08-07 16:31:12.553511	\N	\N
2	5	Logo Wayne	Wayne_Enterprises.jpg	image/jpeg	8118	2015-08-19 21:32:03.962264	\N	\N
3	5	Logo Oscorp	oscorp_industries.png	image/png	38076	2015-08-19 21:32:23.440244	\N	\N
7	7	Manual de Segurança	nr_15_anexo1.pdf	application/pdf	12488	2015-09-23 13:06:38.051584	\N	\N
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('attachments_id_seq', 18, true);


--
-- Data for Name: calendars; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY calendars (id, name, account_id, created_at, updated_at, ppra_id, pcmso_id) FROM stdin;
1	Treinamentos e Palestras	2	2015-07-14 01:52:59.591616	2015-07-14 01:52:59.591616	\N	\N
2	Plano de Ações	2	2015-07-14 01:58:53.770722	2015-07-14 01:58:53.770722	\N	\N
3	Calendário 3	2	2015-07-14 02:04:25.201091	2015-07-14 02:04:25.201091	\N	\N
4	Calendário 4	2	2015-07-14 02:04:45.653493	2015-07-14 02:04:45.653493	\N	\N
5	ACME/ppra/0	2	2015-07-29 13:01:43.197547	2015-07-29 13:01:43.197547	5	\N
6	ACME/ppra/0	2	2015-07-31 17:33:06.56582	2015-07-31 17:33:06.56582	6	\N
7	ACME/ppra/0	2	2015-08-07 13:37:03.822223	2015-08-07 13:37:03.822223	7	\N
8	OSCORP Industries/ppra/0	2	2015-08-07 14:05:03.729814	2015-08-07 14:05:03.729814	8	\N
9	OSCORP Industries/ppra/0002	2	2015-08-18 16:40:23.73753	2015-08-18 16:40:23.73753	9	\N
10	Wonka Industries/ppra/001	2	2015-08-18 16:53:32.809324	2015-08-18 16:53:32.809324	10	\N
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY events (id, name, description, created_at, updated_at, account_id, observations, start_date, end_date, realization_start_date, realization_end_date) FROM stdin;
2	Conferência de Saúde Pública	Apresentação de Saúde Pública	2015-07-14 01:57:13.132563	2015-07-14 01:57:13.132563	2	\N	\N	\N	\N	\N
7	Medição Ambiental	dghsgdhsgdhsg	2015-07-29 13:22:21.696142	2015-07-29 14:26:48.804496	2	Medições concluídas	2015-07-31 11:00:00	2015-08-05 21:00:00	2015-07-29 14:25:00	2015-07-29 14:26:00
8	Palestra Trabalho em altura	fsags hagshag gayhsga gahsga 	2015-08-05 14:11:54.021314	2015-08-05 14:11:54.021314	2	\N	2015-11-05 13:09:00	2015-11-05 17:00:00	\N	\N
9	Treinamento de Abandono Emergência	Teste Descrição	2015-08-07 14:11:33.502977	2015-08-07 14:11:33.502977	2	\N	2015-09-10 11:00:00	2015-09-11 12:00:00	\N	\N
10	Medições Ambientais	Descrição medições	2015-08-07 15:23:09.542024	2015-08-07 15:23:09.542024	2	\N	2015-11-01 10:00:00	2015-11-06 20:00:00	\N	\N
12	Palestra Sobre Segurança do Trabalho	Palestra Sobre Segurança do Trabalho	2015-08-19 14:21:31.794463	2015-08-19 14:21:31.794463	2	\N	2015-09-04 10:00:00	2015-09-04 15:00:00	\N	\N
14	Palestra Sobre combate a Incêndio	Palestra Sobre combate a Incêndio	2015-08-19 14:23:09.80866	2015-08-19 14:23:09.80866	2	\N	2015-08-28 11:00:00	2015-08-28 15:00:00	\N	\N
15	Treinar os Trabalhadores Sobre Uso Adequado dos EPC’s	Treinar os Trabalhadores Sobre Uso Adequado dos EPC’s	2015-08-19 14:23:55.173772	2015-08-19 14:23:55.173772	2	\N	2015-08-25 11:00:00	2015-08-25 15:00:00	\N	\N
13	Palestra de Guarda, Conservação, Higienização e uso correto dos EPI’s para todos empregados	Palestra de Guarda, Conservação, Higienização e uso correto dos EPI’s para todos empregados	2015-08-19 14:22:12.028917	2015-08-19 14:30:25.966621	2	Realizado em novo formato e resumido.	2015-08-18 11:00:00	2015-08-22 15:00:00	2015-08-18 11:15:00	2015-08-19 14:30:00
11	Medição Ambiental	skadkjashdjkah sjhdjsahdkjsahdj  sjhSAJKHSKJahskjah	2015-08-18 17:00:39.846819	2015-08-19 14:32:42.255247	2	Realiza a medição apenas do setor de manutenção.	2015-08-17 11:00:00	2015-08-17 21:00:00	2015-08-17 11:25:00	2015-08-17 18:30:00
17	Elaboração do LTCAT	Elaboração do LTCAT	2015-08-19 14:25:34.842331	2015-09-16 00:25:07.854488	2		2015-08-21 11:00:00	2015-08-29 11:00:00	2015-08-21 11:00:00	2015-08-30 00:24:00
16	Avaliação Quantitativa dos riscos e da exposição dos trabalhadores	Avaliação Quantitativa dos riscos e da exposição dos trabalhadores	2015-08-19 14:24:57.859728	2015-10-07 00:38:39.902239	2		2015-08-22 11:00:00	2015-08-26 21:00:00	2015-08-22 11:00:00	2015-08-26 21:00:00
\.


--
-- Data for Name: calendars_events; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY calendars_events (id, calendar_id, event_id) FROM stdin;
2	1	2
7	5	7
8	5	8
9	8	9
10	8	10
11	10	11
12	10	12
13	10	13
14	10	14
15	10	15
16	10	16
17	10	17
\.


--
-- Name: calendars_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('calendars_events_id_seq', 17, true);


--
-- Name: calendars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('calendars_id_seq', 10, true);


--
-- Data for Name: checklists; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY checklists (id, title, project_id, created_at, updated_at) FROM stdin;
1	Checklist Test	2	2015-07-11 01:20:23.544725	2015-07-11 01:20:23.544725
2	Reconhecimento de Riscos	5	2015-07-29 14:33:46.77051	2015-07-29 14:33:46.77051
3	Checklist Reconhecimento	4	2015-08-05 13:53:55.23688	2015-08-05 13:53:55.23688
4	Check List Área de Vivência NR 18	7	2015-08-31 17:23:45.649681	2015-09-04 15:12:11.867075
\.


--
-- Name: checklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('checklists_id_seq', 4, true);


--
-- Data for Name: collaborator_courses; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY collaborator_courses (id, collaborator_id, course_id, status, created_at, updated_at, status_on_conclude) FROM stdin;
1	10	8	scheduled	2015-09-09 20:11:24.297796	2015-09-09 20:11:24.297796	approved
2	5	8	scheduled	2015-09-09 20:11:24.311086	2015-09-09 20:11:24.311086	approved
3	5	10	scheduled	2015-09-09 20:12:38.407069	2015-09-09 20:12:38.407069	approved
4	10	10	scheduled	2015-09-09 20:12:38.413168	2015-09-09 20:12:38.413168	approved
99	7	67	scheduled	2015-10-16 23:20:40.130291	2015-10-16 23:20:40.130291	approved
98	6	67	waiting_confirmation	2015-10-16 23:20:40.123528	2015-10-16 23:20:40.123528	approved
208	1	84	waiting_confirmation	2015-10-22 11:32:46.617512	2015-10-22 11:32:46.617512	approved
209	10	84	confirmed	2015-10-22 11:32:46.62538	2015-10-22 11:32:46.62538	approved
210	11	84	waiting_confirmation	2015-10-22 11:32:46.631299	2015-10-22 11:32:46.631299	approved
211	1	85	scheduled	2015-10-22 12:44:08.757677	2015-10-22 12:44:08.757677	approved
212	2	85	scheduled	2015-10-22 12:44:08.762853	2015-10-22 12:44:08.762853	approved
213	4	85	scheduled	2015-10-22 12:44:08.766619	2015-10-22 12:44:08.766619	approved
214	6	85	scheduled	2015-10-22 12:44:08.770134	2015-10-22 12:44:08.770134	approved
215	5	85	scheduled	2015-10-22 12:44:08.773666	2015-10-22 12:44:08.773666	approved
40	10	24	scheduled	2015-09-21 14:01:55.835148	2015-09-21 14:01:55.835148	approved
41	5	24	scheduled	2015-09-21 14:01:55.84012	2015-09-21 14:01:55.84012	approved
42	11	24	scheduled	2015-09-21 14:01:55.84492	2015-09-21 14:01:55.84492	approved
43	10	25	scheduled	2015-09-21 14:02:41.973168	2015-09-21 14:02:41.973168	approved
44	5	25	scheduled	2015-09-21 14:02:41.978104	2015-09-21 14:02:41.978104	approved
45	11	25	scheduled	2015-09-21 14:02:41.982368	2015-09-21 14:02:41.982368	approved
244	18	93	scheduled	2015-10-22 17:14:57.905336	2015-10-22 17:14:57.905336	approved
\.


--
-- Name: collaborator_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('collaborator_courses_id_seq', 244, true);


--
-- Name: collaborator_functions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('collaborator_functions_id_seq', 70, true);


--
-- Data for Name: collaborator_locations; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY collaborator_locations (id, account_id, company_id, name, created_at, updated_at) FROM stdin;
1	2	12	Pier	2015-10-16 14:39:20.719626	2015-10-16 14:39:20.719626
\.


--
-- Name: collaborator_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('collaborator_locations_id_seq', 1, true);


--
-- Data for Name: collaborator_makers_pprapcmsos; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY collaborator_makers_pprapcmsos (pprapcmso_id, collaborator_id, created_at, updated_at) FROM stdin;
10	10	2015-08-24 18:28:47.401349	2015-08-24 18:28:47.401349
\.


--
-- Name: collaborator_positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('collaborator_positions_id_seq', 39, true);


--
-- Data for Name: collaborator_projects; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY collaborator_projects (collaborator_id, project_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: collaborator_trainings; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY collaborator_trainings (id, collaborator_id, training_id, conclusion_date, validity_period, mandatory, created_at, updated_at, project_id, expiration_date) FROM stdin;
1	2	1	2014-08-02	12	f	2015-07-14 23:57:35	2015-07-14 23:57:35.970181	\N	\N
2	1	1	2015-07-02	12	f	2015-07-15 00:05:18	2015-07-15 00:05:18.074908	\N	\N
3	1	1	2015-07-02	12	f	2015-07-15 00:06:42	2015-07-15 00:06:42.411983	\N	\N
4	1	1	2014-07-01	12	f	2015-07-15 00:09:13	2015-07-15 00:09:13.919882	\N	\N
5	1	1	2014-08-02	12	f	2015-07-15 00:16:26	2015-07-15 00:16:26.276048	\N	\N
6	1	1	2014-08-04	12	f	2015-07-15 00:17:46	2015-07-15 00:17:46.835795	\N	\N
7	1	1	2014-08-01	12	f	2015-07-15 00:24:44	2015-07-15 00:24:44.531843	\N	\N
9	2	2	\N	\N	t	2015-07-15 00:38:54	2015-07-15 00:38:54.270194	\N	\N
10	2	2	2014-09-01	12	f	2015-07-15 00:39:19	2015-07-15 00:39:19.673219	\N	\N
11	5	1	\N	\N	t	2015-07-16 20:58:40	2015-07-16 20:58:40.488803	\N	\N
12	5	2	\N	\N	t	2015-07-16 20:58:40	2015-07-16 20:58:40.488803	\N	\N
13	4	1	\N	\N	t	2015-07-16 20:58:40	2015-07-16 20:58:40.488803	\N	\N
14	4	2	\N	\N	t	2015-07-16 20:58:40	2015-07-16 20:58:40.488803	\N	\N
15	1	2	\N	\N	t	2015-07-16 20:58:40	2015-07-16 20:58:40.488803	\N	\N
16	5	1	2015-07-14	12	f	2015-07-16 20:59:11	2015-07-16 20:59:11.342506	\N	\N
17	4	1	2015-07-14	12	f	2015-07-16 20:59:11	2015-07-16 20:59:11.342506	\N	\N
18	2	1	2015-07-14	12	f	2015-07-16 20:59:11	2015-07-16 20:59:11.342506	\N	\N
19	1	1	2015-07-14	12	f	2015-07-16 20:59:11	2015-07-16 20:59:11.342506	\N	\N
20	5	2	2014-07-17	12	f	2015-07-16 21:02:35	2015-07-16 21:02:35.467739	\N	\N
21	8	3	\N	\N	f	2015-08-12 16:11:00.004659	2015-08-12 16:11:00.004798	5	\N
22	6	4	\N	\N	t	2015-08-28 19:12:20.767077	2015-08-28 19:12:20.767172	4	\N
23	7	4	\N	\N	t	2015-08-28 19:12:20.767077	2015-08-28 19:12:20.767172	4	\N
26	6	6	\N	\N	t	2015-08-28 19:29:13.430678	2015-08-28 19:29:13.430742	4	\N
27	7	6	\N	\N	t	2015-08-28 19:29:13.430678	2015-08-28 19:29:13.430742	4	\N
51	10	10	\N	\N	t	2015-09-01 18:11:08.736262	2015-09-01 18:11:08.736343	7	\N
52	11	10	\N	\N	t	2015-09-01 18:11:08.736262	2015-09-01 18:11:08.736343	7	\N
53	10	11	\N	\N	t	2015-09-03 22:14:11.060589	2015-09-03 22:14:11.060754	7	\N
54	11	11	\N	\N	t	2015-09-03 22:14:11.060589	2015-09-03 22:14:11.060754	7	\N
55	14	10	\N	\N	t	2015-09-04 16:02:39.254084	2015-09-04 16:02:39.254189	7	\N
56	10	12	\N	\N	t	2015-09-09 21:10:34.880377	2015-09-09 21:10:34.880495	7	\N
57	11	12	\N	\N	t	2015-09-09 21:10:34.880377	2015-09-09 21:10:34.880495	7	\N
58	14	12	\N	\N	t	2015-09-09 21:10:34.880377	2015-09-09 21:10:34.880495	7	\N
59	10	13	\N	\N	t	2015-09-12 18:34:42.607946	2015-09-12 18:34:42.608032	7	\N
60	11	13	\N	\N	t	2015-09-12 18:34:42.607946	2015-09-12 18:34:42.608032	7	\N
61	10	14	\N	\N	t	2015-09-21 13:33:48.184576	2015-09-21 13:33:48.184692	7	\N
62	11	14	\N	\N	t	2015-09-21 13:33:48.184576	2015-09-21 13:33:48.184692	7	\N
64	15	14	\N	\N	t	2015-09-21 13:46:18.007806	2015-09-21 13:46:18.007877	7	\N
65	10	14	2015-09-24	12	f	2015-09-21 14:46:13.37462	2015-09-21 14:46:13.37462	7	\N
66	15	14	2015-09-24	12	f	2015-09-21 14:46:13.387439	2015-09-21 14:46:13.387439	7	\N
67	11	14	2015-09-26	12	f	2015-09-21 14:59:31.967988	2015-09-21 14:59:31.967988	7	\N
68	11	14	2015-09-23	12	f	2015-09-22 13:24:15.817906	2015-09-22 13:24:15.817906	7	\N
69	10	15	\N	\N	t	2015-10-01 14:41:58.332598	2015-10-01 14:41:58.332692	7	\N
70	11	15	\N	\N	t	2015-10-01 14:41:58.332598	2015-10-01 14:41:58.332692	7	\N
75	11	13	2015-09-25	12	f	2015-10-07 13:18:33.49917	2015-10-07 13:18:33.49917	7	2016-09-25
76	10	13	2015-09-25	12	f	2015-10-07 13:18:33.504784	2015-10-07 13:18:33.504784	7	2016-09-25
85	17	18	\N	\N	t	2015-10-09 14:47:12.74797	2015-10-09 14:47:12.748055	8	\N
88	18	18	\N	\N	t	2015-10-16 14:39:37.386892	2015-10-16 14:39:37.386892	8	\N
90	5	19	\N	\N	t	2015-10-16 14:47:30.801054	2015-10-16 14:47:30.80111	7	\N
91	12	19	\N	\N	t	2015-10-16 14:47:30.801054	2015-10-16 14:47:30.80111	7	\N
92	12	19	2014-09-01	12	f	2015-10-16 14:53:40.359211	2015-10-16 14:53:40.359211	7	2015-09-01
93	5	19	2014-09-01	12	f	2015-10-16 14:53:40.367809	2015-10-16 14:53:40.367809	7	2015-09-01
94	12	19	2014-11-30	12	f	2015-10-16 20:05:11.080882	2015-10-16 20:05:11.080882	7	2015-11-30
95	5	19	2014-11-30	12	f	2015-10-16 20:05:11.087012	2015-10-16 20:05:11.087012	7	2015-11-30
96	5	19	2014-03-01	12	f	2015-10-16 20:29:08.884753	2015-10-16 20:29:08.884753	7	2015-03-01
97	12	19	2014-03-01	12	f	2015-10-16 20:29:08.890151	2015-10-16 20:29:08.890151	7	2015-03-01
98	12	19	2015-10-15	12	f	2015-10-16 21:01:41	2015-10-16 21:01:41.881585	\N	\N
99	1	19	2015-10-15	12	f	2015-10-16 21:01:41	2015-10-16 21:01:41.881585	\N	\N
100	4	19	2015-10-01	12	f	2015-10-16 21:14:30	2015-10-16 21:14:30.193197	\N	\N
101	2	19	2015-10-01	12	f	2015-10-16 21:14:30	2015-10-16 21:14:30.193197	\N	\N
102	1	19	2015-10-01	12	f	2015-10-16 21:14:30	2015-10-16 21:14:30.193197	\N	\N
103	1	19	2015-10-14	12	f	2015-10-18 14:17:31	2015-10-18 14:17:32.016029	\N	\N
104	13	19	\N	\N	t	2015-10-19 13:04:49	2015-10-19 13:04:49.784735	\N	\N
105	13	19	2015-10-01	12	f	2015-10-19 13:05:08	2015-10-19 13:05:08.952941	\N	\N
106	12	19	2015-10-21	12	f	2015-10-19 21:23:13.095919	2015-10-19 21:23:13.095919	7	2016-10-21
107	1	15	\N	\N	t	2015-10-20 12:21:42	2015-10-20 12:21:42.154551	\N	\N
108	1	12	\N	\N	t	2015-10-20 12:21:42	2015-10-20 12:21:42.154551	\N	\N
109	5	19	2015-10-21	12	f	2015-10-20 12:26:40.459849	2015-10-20 12:26:40.459849	7	2016-10-21
110	5	19	2015-10-21	12	f	2015-10-20 12:28:13.557781	2015-10-20 12:28:13.557781	7	2016-10-21
111	17	20	\N	\N	t	2015-10-20 13:40:11.830028	2015-10-20 13:40:11.830094	8	\N
112	18	20	\N	\N	t	2015-10-20 13:40:11.830028	2015-10-20 13:40:11.830094	8	\N
113	2	21	\N	\N	t	2015-10-20 19:48:51.06499	2015-10-20 19:48:51.065137	7	\N
114	14	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
115	8	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
116	12	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
117	17	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
118	1	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
119	15	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
120	10	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
121	11	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
122	4	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
123	18	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
124	5	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
125	13	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
126	9	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
127	7	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
128	16	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
129	6	21	\N	\N	t	2015-10-20 19:50:00.118168	2015-10-20 19:50:00.11822	7	\N
130	5	21	2015-10-22	12	f	2015-10-21 18:47:48.114977	2015-10-21 18:47:48.114977	7	2016-10-22
131	2	21	2015-10-22	12	f	2015-10-21 18:47:48.121435	2015-10-21 18:47:48.121435	7	2016-10-22
132	4	21	2015-10-22	12	f	2015-10-21 18:47:48.125757	2015-10-21 18:47:48.125757	7	2016-10-22
133	8	21	2015-10-22	12	f	2015-10-21 18:47:48.130114	2015-10-21 18:47:48.130114	7	2016-10-22
134	10	11	2015-10-23	24	f	2015-10-22 15:44:18.996494	2015-10-22 15:44:18.996494	7	2017-10-23
135	11	11	2015-10-23	24	f	2015-10-22 15:44:19.002747	2015-10-22 15:44:19.002747	7	2017-10-23
136	1	21	2015-10-22	12	f	2015-10-22 15:55:03.373091	2015-10-22 15:55:03.373091	7	2016-10-22
137	6	21	2015-10-22	12	f	2015-10-22 15:55:03.378138	2015-10-22 15:55:03.378138	7	2016-10-22
138	1	12	2015-10-23	12	f	2015-10-22 15:56:37.894287	2015-10-22 15:56:37.894287	7	2016-10-23
139	10	12	2015-10-23	12	f	2015-10-22 15:56:37.901857	2015-10-22 15:56:37.901857	7	2016-10-23
140	11	12	2015-10-23	12	f	2015-10-22 15:56:37.907862	2015-10-22 15:56:37.907862	7	2016-10-23
141	14	12	2015-10-23	12	f	2015-10-22 15:56:37.924088	2015-10-22 15:56:37.924088	7	2016-10-23
142	7	21	2015-10-22	12	f	2015-10-22 17:05:26.444537	2015-10-22 17:05:26.444537	7	2016-10-22
143	10	21	2015-10-22	12	f	2015-10-22 17:05:26.454978	2015-10-22 17:05:26.454978	7	2016-10-22
144	11	21	2015-10-22	12	f	2015-10-22 17:05:26.463894	2015-10-22 17:05:26.463894	7	2016-10-22
145	14	21	2015-10-22	12	f	2015-10-22 17:05:26.473737	2015-10-22 17:05:26.473737	7	2016-10-22
146	15	21	2015-10-22	12	f	2015-10-22 17:05:26.483875	2015-10-22 17:05:26.483875	7	2016-10-22
147	1	15	2015-10-23	60	f	2015-10-22 17:07:29.975295	2015-10-22 17:07:29.975295	7	2020-10-23
148	10	15	2015-10-23	60	f	2015-10-22 17:07:29.98547	2015-10-22 17:07:29.98547	7	2020-10-23
149	11	15	2015-10-23	60	f	2015-10-22 17:07:29.994315	2015-10-22 17:07:29.994315	7	2020-10-23
150	12	21	2015-10-23	12	f	2015-10-22 17:11:28.085843	2015-10-22 17:11:28.085843	7	2016-10-23
151	13	21	2015-10-23	12	f	2015-10-22 17:11:28.096412	2015-10-22 17:11:28.096412	7	2016-10-23
152	17	21	2015-10-23	12	f	2015-10-22 17:11:28.105675	2015-10-22 17:11:28.105675	7	2016-10-23
153	9	21	2015-10-23	12	f	2015-10-22 17:11:28.11528	2015-10-22 17:11:28.11528	7	2016-10-23
154	16	21	2015-10-23	12	f	2015-10-22 17:11:28.124508	2015-10-22 17:11:28.124508	7	2016-10-23
\.


--
-- Name: collaborator_trainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('collaborator_trainings_id_seq', 154, true);


--
-- Data for Name: collaborators_events; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY collaborators_events (collaborator_id, event_id, created_at, updated_at) FROM stdin;
1	7	2015-07-30 17:21:10.037445	2015-07-30 17:21:10.037445
6	8	2015-08-05 14:11:54.033478	2015-08-05 14:11:54.033478
8	9	2015-08-07 14:11:33.516969	2015-08-07 14:11:33.516969
9	10	2015-08-07 15:23:09.547393	2015-08-07 15:23:09.547393
9	9	2015-08-07 16:53:42.38086	2015-08-07 16:53:42.38086
10	12	2015-08-19 14:21:31.800852	2015-08-19 14:21:31.800852
10	13	2015-08-19 14:22:12.034197	2015-08-19 14:22:12.034197
5	14	2015-08-19 14:23:09.81472	2015-08-19 14:23:09.81472
10	15	2015-08-19 14:23:55.179987	2015-08-19 14:23:55.179987
10	16	2015-08-19 14:24:57.864928	2015-08-19 14:24:57.864928
5	17	2015-08-19 14:25:34.84751	2015-08-19 14:25:34.84751
13	11	2015-09-16 00:24:00.402561	2015-09-16 00:24:00.402561
\.


--
-- Name: collaborators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('collaborators_id_seq', 18, true);


--
-- Data for Name: collaborators_pprapcmsos; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY collaborators_pprapcmsos (id, collaborator_id, ppra_id) FROM stdin;
1	1	1
2	2	3
3	6	5
11	1	7
12	8	8
13	9	8
14	8	9
15	9	9
26	5	10
27	12	10
\.


--
-- Name: collaborators_pprapcmsos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('collaborators_pprapcmsos_id_seq', 27, true);


--
-- Data for Name: collaborators_projects; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY collaborators_projects (collaborator_id, project_id) FROM stdin;
10	7
5	7
11	7
15	7
14	7
13	7
12	7
16	7
1	7
1	7
2	7
4	7
6	7
7	7
8	7
9	7
10	7
5	7
11	7
15	7
14	7
13	7
12	7
16	7
17	7
18	7
\.


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('companies_id_seq', 12, true);


--
-- Data for Name: companies_projects; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY companies_projects (project_id, company_id) FROM stdin;
1	1
3	3
4	4
4	5
2	4
2	2
5	7
\.


--
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY contracts (id, project_id, company_id, number, start_validity, end_validity, collaborator_id, scope, created_at, updated_at, kind) FROM stdin;
1	4	7	1111111	2015-07-30	2016-02-29	6	dsfsaddfasdfasfasfasf	2015-08-05 13:10:44.425262	2015-08-05 13:10:44.425262	hired
2	5	7	111111111	2015-06-01	2016-07-01	6	dsdsdsdasasf qwdswde wd dwde	2015-08-05 14:05:31.815538	2015-08-05 14:05:31.815538	hired
3	5	8		\N	\N	\N		2015-08-07 13:45:25.515619	2015-08-07 13:45:25.515619	main
4	5	6	000000	2015-08-18	2016-08-01	7	fgasdssasd	2015-08-18 16:53:08.404564	2015-08-18 16:53:08.404564	hired
5	5	9	4444	2015-08-19	2016-01-01	1	shadahd jahsdjahdj jhsdjhasd jsjkshajkdh	2015-08-19 20:47:57.620294	2015-08-19 20:47:57.620294	hired
6	5	4	5555555	2015-08-01	2016-08-01	7	ahsidgashdgas 	2015-08-19 21:54:12.481089	2015-08-19 21:54:12.481089	hired
7	7	6		\N	\N	\N		2015-08-28 19:33:48.914493	2015-08-28 19:33:48.914493	main
8	7	2	999999	2015-09-01	2016-09-01	16	sdgshdgshdgshd shdghs shdgsh shdsh	2015-09-23 18:45:39.088719	2015-09-23 18:45:39.088719	hired
9	7	11	22222222222222	2015-10-10	2016-08-31	16	dasasas	2015-10-09 13:52:53.694843	2015-10-09 13:52:53.694843	hired
10	7	8	33333333333333	2015-10-08	2016-08-31	9	dasdasasas	2015-10-09 13:53:30.070921	2015-10-09 13:53:30.070921	hired
11	8	12		\N	\N	\N		2015-10-09 14:41:38.673629	2015-10-09 14:41:38.673629	main
12	7	12	000003	2015-10-13	2016-03-01	11	jfjhgjhghjg	2015-10-14 13:43:40.851784	2015-10-14 13:43:40.851784	hired
13	7	7	222	2015-10-19	2015-10-23	15	2e3rfwefrrwefe	2015-10-16 19:50:34.42524	2015-10-16 19:50:34.42524	hired
14	7	5	fsdvsdg	2015-10-16	2015-10-20	17	asdcsafsdf	2015-10-16 19:51:14.640949	2015-10-16 19:51:14.640949	hired
15	7	4	scasca	2015-10-16	2015-10-27	17	waFASFVSGFVWSEVEW	2015-10-16 19:51:49.139629	2015-10-16 19:51:49.139629	hired
\.


--
-- Name: contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('contracts_id_seq', 15, true);


--
-- Data for Name: control_exams; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY control_exams (id, admission_examinations_per_year, admission_exam_anormal_result, admission_examinations_to_next_year, demission_examinations_per_year, demission_exam_anormal_result, demission_examinations_to_next_year, periodic_examinations_per_year, periodic_exam_anormal_result, periodic_examinations_to_next_year, change_function_examinations_per_year, change_function_exam_anormal_result, change_function_examinations_to_next_year, returning_work_examinations_per_year, returning_work_exam_anormal_result, returning_work_examinations_to_next_year, position_risk_id, created_at, updated_at) FROM stdin;
1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-08-31 14:37:02.057328	2015-08-31 14:37:02.057328
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-08-31 14:37:02.078745	2015-08-31 14:37:02.078745
3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-08-31 14:37:02.086586	2015-08-31 14:37:02.086586
4	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-08-31 14:37:02.094084	2015-08-31 14:37:02.094084
5	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-08-31 14:37:02.101742	2015-08-31 14:37:02.101742
6	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-08-31 14:37:02.109224	2015-08-31 14:37:02.109224
7	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-08-31 14:37:02.116838	2015-08-31 14:37:02.116838
8	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-08-31 14:37:02.124065	2015-08-31 14:37:02.124065
9	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-08-31 14:37:02.130899	2015-08-31 14:37:02.130899
10	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-08-31 14:37:02.138036	2015-08-31 14:37:02.138036
11	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-08-31 14:37:02.145224	2015-08-31 14:37:02.145224
12	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-08-31 14:37:02.152334	2015-08-31 14:37:02.152334
14	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-08-31 14:37:02.167198	2015-08-31 14:37:02.167198
15	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-08-31 14:37:02.174803	2015-08-31 14:37:02.174803
16	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-08-31 14:37:02.182085	2015-08-31 14:37:02.182085
17	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-08-31 14:37:02.18947	2015-08-31 14:37:02.18947
18	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-08-31 14:37:02.196887	2015-08-31 14:37:02.196887
19	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-08-31 14:37:02.204433	2015-08-31 14:37:02.204433
20	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-08-31 14:37:02.211582	2015-08-31 14:37:02.211582
21	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-08-31 14:37:02.218771	2015-08-31 14:37:02.218771
22	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-08-31 14:37:02.226115	2015-08-31 14:37:02.226115
23	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-08-31 14:37:02.233341	2015-08-31 14:37:02.233341
24	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-08-31 16:45:24.834366	2015-08-31 16:45:24.834366
25	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-08-31 16:45:24.848799	2015-08-31 16:45:24.848799
26	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-08-31 16:45:24.856106	2015-08-31 16:45:24.856106
27	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-08-31 16:45:24.863114	2015-08-31 16:45:24.863114
28	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-08-31 16:45:24.869798	2015-08-31 16:45:24.869798
29	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-08-31 16:45:24.876598	2015-08-31 16:45:24.876598
30	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-08-31 16:45:24.883173	2015-08-31 16:45:24.883173
31	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-08-31 16:45:24.889971	2015-08-31 16:45:24.889971
32	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-08-31 16:45:24.896511	2015-08-31 16:45:24.896511
33	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-08-31 16:45:24.903499	2015-08-31 16:45:24.903499
34	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-08-31 16:45:24.910131	2015-08-31 16:45:24.910131
35	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-08-31 16:45:24.916361	2015-08-31 16:45:24.916361
37	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-08-31 16:45:24.930222	2015-08-31 16:45:24.930222
38	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-08-31 16:45:24.93667	2015-08-31 16:45:24.93667
39	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-08-31 16:45:24.943012	2015-08-31 16:45:24.943012
40	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-08-31 16:45:24.949177	2015-08-31 16:45:24.949177
41	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-08-31 16:45:24.955233	2015-08-31 16:45:24.955233
42	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-08-31 16:45:24.961368	2015-08-31 16:45:24.961368
43	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-08-31 16:45:24.967421	2015-08-31 16:45:24.967421
44	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-08-31 16:45:24.973572	2015-08-31 16:45:24.973572
45	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-08-31 16:45:24.979604	2015-08-31 16:45:24.979604
46	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-08-31 16:45:24.985911	2015-08-31 16:45:24.985911
47	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-01 17:25:32.417293	2015-09-01 17:25:32.417293
48	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-01 17:25:32.424433	2015-09-01 17:25:32.424433
49	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-01 17:25:32.427693	2015-09-01 17:25:32.427693
50	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-01 17:25:32.430793	2015-09-01 17:25:32.430793
51	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-01 17:25:32.43577	2015-09-01 17:25:32.43577
52	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-01 17:25:32.439153	2015-09-01 17:25:32.439153
53	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-01 17:25:32.442386	2015-09-01 17:25:32.442386
54	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-01 17:25:32.445449	2015-09-01 17:25:32.445449
55	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-01 17:25:32.448535	2015-09-01 17:25:32.448535
56	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-01 17:25:32.451749	2015-09-01 17:25:32.451749
57	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-01 17:25:32.454904	2015-09-01 17:25:32.454904
58	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-01 17:25:32.458049	2015-09-01 17:25:32.458049
59	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-01 17:25:32.461095	2015-09-01 17:25:32.461095
60	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-01 17:25:32.464224	2015-09-01 17:25:32.464224
61	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-01 17:25:32.467425	2015-09-01 17:25:32.467425
62	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-01 17:25:32.470791	2015-09-01 17:25:32.470791
63	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-01 17:25:32.474095	2015-09-01 17:25:32.474095
64	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-01 17:25:32.477226	2015-09-01 17:25:32.477226
65	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-01 17:25:32.480307	2015-09-01 17:25:32.480307
66	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-01 17:25:32.483503	2015-09-01 17:25:32.483503
67	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-01 17:25:32.486557	2015-09-01 17:25:32.486557
68	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-01 17:25:32.489705	2015-09-01 17:25:32.489705
69	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-01 17:25:32.492748	2015-09-01 17:25:32.492748
70	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-01 22:45:28.160611	2015-09-01 22:45:28.160611
36	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-08-31 16:45:24.923426	2015-10-07 13:25:38.739446
71	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-01 22:45:28.16909	2015-09-01 22:45:28.16909
72	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-01 22:45:28.173257	2015-09-01 22:45:28.173257
73	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-01 22:45:28.176798	2015-09-01 22:45:28.176798
74	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-01 22:45:28.180275	2015-09-01 22:45:28.180275
75	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-01 22:45:28.183608	2015-09-01 22:45:28.183608
76	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-01 22:45:28.187063	2015-09-01 22:45:28.187063
77	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-01 22:45:28.190407	2015-09-01 22:45:28.190407
78	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-01 22:45:28.19383	2015-09-01 22:45:28.19383
79	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-01 22:45:28.197303	2015-09-01 22:45:28.197303
80	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-01 22:45:28.200615	2015-09-01 22:45:28.200615
81	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-01 22:45:28.203826	2015-09-01 22:45:28.203826
82	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-01 22:45:28.207123	2015-09-01 22:45:28.207123
83	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-01 22:45:28.210372	2015-09-01 22:45:28.210372
84	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-01 22:45:28.213646	2015-09-01 22:45:28.213646
85	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-01 22:45:28.216866	2015-09-01 22:45:28.216866
86	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-01 22:45:28.220147	2015-09-01 22:45:28.220147
87	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-01 22:45:28.223435	2015-09-01 22:45:28.223435
88	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-01 22:45:28.22687	2015-09-01 22:45:28.22687
89	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-01 22:45:28.230255	2015-09-01 22:45:28.230255
90	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-01 22:45:28.233693	2015-09-01 22:45:28.233693
91	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-01 22:45:28.237136	2015-09-01 22:45:28.237136
92	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-01 22:45:28.24063	2015-09-01 22:45:28.24063
93	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-01 22:47:38.392971	2015-09-01 22:47:38.392971
94	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-01 22:47:38.402382	2015-09-01 22:47:38.402382
95	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-01 22:47:38.410736	2015-09-01 22:47:38.410736
96	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-01 22:47:38.418653	2015-09-01 22:47:38.418653
97	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-01 22:47:38.426283	2015-09-01 22:47:38.426283
98	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-01 22:47:38.432925	2015-09-01 22:47:38.432925
99	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-01 22:47:38.439309	2015-09-01 22:47:38.439309
100	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-01 22:47:38.446175	2015-09-01 22:47:38.446175
101	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-01 22:47:38.452456	2015-09-01 22:47:38.452456
102	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-01 22:47:38.458907	2015-09-01 22:47:38.458907
103	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-01 22:47:38.465346	2015-09-01 22:47:38.465346
104	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-01 22:47:38.471862	2015-09-01 22:47:38.471862
105	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-01 22:47:38.478639	2015-09-01 22:47:38.478639
106	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-01 22:47:38.485098	2015-09-01 22:47:38.485098
107	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-01 22:47:38.512953	2015-09-01 22:47:38.512953
108	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-01 22:47:38.523882	2015-09-01 22:47:38.523882
109	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-01 22:47:38.532531	2015-09-01 22:47:38.532531
110	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-01 22:47:38.543833	2015-09-01 22:47:38.543833
111	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-01 22:47:38.552991	2015-09-01 22:47:38.552991
112	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-01 22:47:38.559579	2015-09-01 22:47:38.559579
113	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-01 22:47:38.566722	2015-09-01 22:47:38.566722
114	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-01 22:47:38.574293	2015-09-01 22:47:38.574293
115	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-01 22:47:38.581737	2015-09-01 22:47:38.581737
116	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-02 17:04:27.86015	2015-09-02 17:04:27.86015
117	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-02 17:04:27.87631	2015-09-02 17:04:27.87631
118	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-02 17:04:27.882215	2015-09-02 17:04:27.882215
119	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-02 17:04:27.88763	2015-09-02 17:04:27.88763
120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-02 17:04:27.891974	2015-09-02 17:04:27.891974
121	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-02 17:04:27.896579	2015-09-02 17:04:27.896579
122	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-02 17:04:27.900941	2015-09-02 17:04:27.900941
123	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-02 17:04:27.905316	2015-09-02 17:04:27.905316
124	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-02 17:04:27.909578	2015-09-02 17:04:27.909578
125	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-02 17:04:27.914118	2015-09-02 17:04:27.914118
126	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-02 17:04:27.919056	2015-09-02 17:04:27.919056
127	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-02 17:04:27.939387	2015-09-02 17:04:27.939387
128	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-02 17:04:27.94609	2015-09-02 17:04:27.94609
129	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-02 17:04:27.953667	2015-09-02 17:04:27.953667
130	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-02 17:04:27.961037	2015-09-02 17:04:27.961037
131	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-02 17:04:27.967848	2015-09-02 17:04:27.967848
132	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-02 17:04:27.975495	2015-09-02 17:04:27.975495
133	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-02 17:04:27.982407	2015-09-02 17:04:27.982407
134	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-02 17:04:27.987542	2015-09-02 17:04:27.987542
135	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-02 17:04:27.991761	2015-09-02 17:04:27.991761
136	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-02 17:04:27.996437	2015-09-02 17:04:27.996437
137	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-02 17:04:28.00155	2015-09-02 17:04:28.00155
138	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-02 17:04:28.008251	2015-09-02 17:04:28.008251
139	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-03 20:33:19.260935	2015-09-03 20:33:19.260935
140	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-03 20:33:19.27092	2015-09-03 20:33:19.27092
141	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-03 20:33:19.275391	2015-09-03 20:33:19.275391
142	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-03 20:33:19.279692	2015-09-03 20:33:19.279692
143	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-03 20:33:19.283969	2015-09-03 20:33:19.283969
144	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-03 20:33:19.288128	2015-09-03 20:33:19.288128
145	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-03 20:33:19.292106	2015-09-03 20:33:19.292106
146	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-03 20:33:19.297133	2015-09-03 20:33:19.297133
147	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-03 20:33:19.301249	2015-09-03 20:33:19.301249
148	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-03 20:33:19.30577	2015-09-03 20:33:19.30577
149	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-03 20:33:19.309808	2015-09-03 20:33:19.309808
150	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-03 20:33:19.314228	2015-09-03 20:33:19.314228
151	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-03 20:33:19.318149	2015-09-03 20:33:19.318149
152	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-03 20:33:19.323026	2015-09-03 20:33:19.323026
153	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-03 20:33:19.327464	2015-09-03 20:33:19.327464
154	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-03 20:33:19.332136	2015-09-03 20:33:19.332136
155	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-03 20:33:19.33631	2015-09-03 20:33:19.33631
156	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-03 20:33:19.340871	2015-09-03 20:33:19.340871
157	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-03 20:33:19.344645	2015-09-03 20:33:19.344645
158	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-03 20:33:19.348327	2015-09-03 20:33:19.348327
159	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-03 20:33:19.35749	2015-09-03 20:33:19.35749
160	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-03 20:33:19.366118	2015-09-03 20:33:19.366118
161	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-03 20:33:19.374173	2015-09-03 20:33:19.374173
162	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-03 20:43:45.448779	2015-09-03 20:43:45.448779
163	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-03 20:43:45.45785	2015-09-03 20:43:45.45785
164	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-03 20:43:45.462075	2015-09-03 20:43:45.462075
165	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-03 20:43:45.466411	2015-09-03 20:43:45.466411
166	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-03 20:43:45.471226	2015-09-03 20:43:45.471226
167	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-03 20:43:45.475552	2015-09-03 20:43:45.475552
168	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-03 20:43:45.479733	2015-09-03 20:43:45.479733
169	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-03 20:43:45.483883	2015-09-03 20:43:45.483883
170	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-03 20:43:45.487793	2015-09-03 20:43:45.487793
171	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-03 20:43:45.491511	2015-09-03 20:43:45.491511
172	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-03 20:43:45.495314	2015-09-03 20:43:45.495314
173	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-03 20:43:45.499284	2015-09-03 20:43:45.499284
174	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-03 20:43:45.503025	2015-09-03 20:43:45.503025
175	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-03 20:43:45.506411	2015-09-03 20:43:45.506411
176	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-03 20:43:45.510168	2015-09-03 20:43:45.510168
177	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-03 20:43:45.513236	2015-09-03 20:43:45.513236
178	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-03 20:43:45.520095	2015-09-03 20:43:45.520095
179	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-03 20:43:45.530544	2015-09-03 20:43:45.530544
180	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-03 20:43:45.539828	2015-09-03 20:43:45.539828
181	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-03 20:43:45.549668	2015-09-03 20:43:45.549668
182	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-03 20:43:45.560657	2015-09-03 20:43:45.560657
183	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-03 20:43:45.572086	2015-09-03 20:43:45.572086
184	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-03 20:43:45.581844	2015-09-03 20:43:45.581844
185	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-03 20:50:12.198845	2015-09-03 20:50:12.198845
186	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-03 20:50:12.207532	2015-09-03 20:50:12.207532
187	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-03 20:50:12.211873	2015-09-03 20:50:12.211873
188	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-03 20:50:12.216043	2015-09-03 20:50:12.216043
189	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-03 20:50:12.220308	2015-09-03 20:50:12.220308
190	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-03 20:50:12.224642	2015-09-03 20:50:12.224642
191	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-03 20:50:12.229984	2015-09-03 20:50:12.229984
192	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-03 20:50:12.233214	2015-09-03 20:50:12.233214
193	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-03 20:50:12.236213	2015-09-03 20:50:12.236213
194	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-03 20:50:12.23914	2015-09-03 20:50:12.23914
195	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-03 20:50:12.242126	2015-09-03 20:50:12.242126
196	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-03 20:50:12.245078	2015-09-03 20:50:12.245078
197	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-03 20:50:12.248044	2015-09-03 20:50:12.248044
198	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-03 20:50:12.250908	2015-09-03 20:50:12.250908
199	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-03 20:50:12.253926	2015-09-03 20:50:12.253926
200	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-03 20:50:12.257045	2015-09-03 20:50:12.257045
201	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-03 20:50:12.259897	2015-09-03 20:50:12.259897
202	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-03 20:50:12.262858	2015-09-03 20:50:12.262858
203	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-03 20:50:12.265781	2015-09-03 20:50:12.265781
204	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-03 20:50:12.268633	2015-09-03 20:50:12.268633
205	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-03 20:50:12.273494	2015-09-03 20:50:12.273494
206	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-03 20:50:12.276709	2015-09-03 20:50:12.276709
207	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-03 20:50:12.279683	2015-09-03 20:50:12.279683
208	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-04 23:00:08.193908	2015-09-04 23:00:08.193908
209	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-04 23:00:08.202977	2015-09-04 23:00:08.202977
210	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-04 23:00:08.206658	2015-09-04 23:00:08.206658
211	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-04 23:00:08.209996	2015-09-04 23:00:08.209996
212	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-04 23:00:08.213551	2015-09-04 23:00:08.213551
213	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-04 23:00:08.216929	2015-09-04 23:00:08.216929
214	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-04 23:00:08.220272	2015-09-04 23:00:08.220272
215	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-04 23:00:08.223733	2015-09-04 23:00:08.223733
216	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-04 23:00:08.22723	2015-09-04 23:00:08.22723
217	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-04 23:00:08.230653	2015-09-04 23:00:08.230653
218	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-04 23:00:08.233852	2015-09-04 23:00:08.233852
219	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-04 23:00:08.237116	2015-09-04 23:00:08.237116
220	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-04 23:00:08.240411	2015-09-04 23:00:08.240411
221	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-04 23:00:08.243717	2015-09-04 23:00:08.243717
222	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-04 23:00:08.24697	2015-09-04 23:00:08.24697
223	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-04 23:00:08.250264	2015-09-04 23:00:08.250264
224	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-04 23:00:08.253529	2015-09-04 23:00:08.253529
225	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-04 23:00:08.256888	2015-09-04 23:00:08.256888
226	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-04 23:00:08.260264	2015-09-04 23:00:08.260264
227	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-04 23:00:08.263766	2015-09-04 23:00:08.263766
228	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-04 23:00:08.267037	2015-09-04 23:00:08.267037
229	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-04 23:00:08.270551	2015-09-04 23:00:08.270551
230	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-04 23:00:08.273895	2015-09-04 23:00:08.273895
231	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-08 13:00:17.429254	2015-09-08 13:00:17.429254
232	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-08 13:00:17.436519	2015-09-08 13:00:17.436519
233	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-08 13:00:17.439819	2015-09-08 13:00:17.439819
234	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-08 13:00:17.442943	2015-09-08 13:00:17.442943
235	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-08 13:00:17.446059	2015-09-08 13:00:17.446059
236	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-08 13:00:17.449273	2015-09-08 13:00:17.449273
237	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-08 13:00:17.452591	2015-09-08 13:00:17.452591
238	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-08 13:00:17.455821	2015-09-08 13:00:17.455821
239	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-08 13:00:17.459094	2015-09-08 13:00:17.459094
240	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-08 13:00:17.462302	2015-09-08 13:00:17.462302
241	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-08 13:00:17.465317	2015-09-08 13:00:17.465317
242	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-08 13:00:17.468358	2015-09-08 13:00:17.468358
243	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-08 13:00:17.471424	2015-09-08 13:00:17.471424
244	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-08 13:00:17.474573	2015-09-08 13:00:17.474573
245	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-08 13:00:17.477564	2015-09-08 13:00:17.477564
246	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-08 13:00:17.480836	2015-09-08 13:00:17.480836
247	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-08 13:00:17.483899	2015-09-08 13:00:17.483899
248	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-08 13:00:17.487016	2015-09-08 13:00:17.487016
249	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-08 13:00:17.4901	2015-09-08 13:00:17.4901
250	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-08 13:00:17.493147	2015-09-08 13:00:17.493147
251	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-08 13:00:17.496116	2015-09-08 13:00:17.496116
252	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-08 13:00:17.499274	2015-09-08 13:00:17.499274
253	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-08 13:00:17.50243	2015-09-08 13:00:17.50243
254	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-09 18:33:10.701042	2015-09-09 18:33:10.701042
255	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-09 18:33:10.71791	2015-09-09 18:33:10.71791
256	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-09 18:33:10.72477	2015-09-09 18:33:10.72477
257	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-09 18:33:10.731589	2015-09-09 18:33:10.731589
258	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-09 18:33:10.738138	2015-09-09 18:33:10.738138
259	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-09 18:33:10.745007	2015-09-09 18:33:10.745007
260	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-09 18:33:10.751654	2015-09-09 18:33:10.751654
261	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-09 18:33:10.758145	2015-09-09 18:33:10.758145
262	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-09 18:33:10.764621	2015-09-09 18:33:10.764621
263	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-09 18:33:10.77123	2015-09-09 18:33:10.77123
264	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-09 18:33:10.777795	2015-09-09 18:33:10.777795
265	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-09 18:33:10.784399	2015-09-09 18:33:10.784399
266	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-09 18:33:10.790867	2015-09-09 18:33:10.790867
267	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-09 18:33:10.797342	2015-09-09 18:33:10.797342
268	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-09 18:33:10.803854	2015-09-09 18:33:10.803854
269	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-09 18:33:10.810499	2015-09-09 18:33:10.810499
270	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-09 18:33:10.817341	2015-09-09 18:33:10.817341
271	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-09 18:33:10.824153	2015-09-09 18:33:10.824153
272	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-09 18:33:10.830609	2015-09-09 18:33:10.830609
273	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-09 18:33:10.837284	2015-09-09 18:33:10.837284
274	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-09 18:33:10.843881	2015-09-09 18:33:10.843881
275	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-09 18:33:10.85028	2015-09-09 18:33:10.85028
276	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-09 18:33:10.856654	2015-09-09 18:33:10.856654
277	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-09 19:46:02.539569	2015-09-09 19:46:02.539569
278	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-09 19:46:02.5482	2015-09-09 19:46:02.5482
279	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-09 19:46:02.571546	2015-09-09 19:46:02.571546
280	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-09 19:46:02.57573	2015-09-09 19:46:02.57573
281	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-09 19:46:02.578773	2015-09-09 19:46:02.578773
282	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-09 19:46:02.582326	2015-09-09 19:46:02.582326
283	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-09 19:46:02.585344	2015-09-09 19:46:02.585344
284	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-09 19:46:02.588221	2015-09-09 19:46:02.588221
285	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-09 19:46:02.591674	2015-09-09 19:46:02.591674
286	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-09 19:46:02.594674	2015-09-09 19:46:02.594674
287	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-09 19:46:02.597662	2015-09-09 19:46:02.597662
288	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-09 19:46:02.600627	2015-09-09 19:46:02.600627
289	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-09 19:46:02.603905	2015-09-09 19:46:02.603905
290	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-09 19:46:02.607792	2015-09-09 19:46:02.607792
291	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-09 19:46:02.611277	2015-09-09 19:46:02.611277
292	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-09 19:46:02.614299	2015-09-09 19:46:02.614299
293	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-09 19:46:02.617215	2015-09-09 19:46:02.617215
294	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-09 19:46:02.624159	2015-09-09 19:46:02.624159
295	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-09 19:46:02.627132	2015-09-09 19:46:02.627132
296	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-09 19:46:02.630068	2015-09-09 19:46:02.630068
297	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-09 19:46:02.632942	2015-09-09 19:46:02.632942
298	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-09 19:46:02.636043	2015-09-09 19:46:02.636043
299	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-09 19:46:02.639097	2015-09-09 19:46:02.639097
300	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-11 13:30:15.288378	2015-09-11 13:30:15.288378
301	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-11 13:30:15.296871	2015-09-11 13:30:15.296871
302	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-11 13:30:15.300225	2015-09-11 13:30:15.300225
303	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-11 13:30:15.303674	2015-09-11 13:30:15.303674
304	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-11 13:30:15.307064	2015-09-11 13:30:15.307064
305	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-11 13:30:15.310523	2015-09-11 13:30:15.310523
306	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-11 13:30:15.313638	2015-09-11 13:30:15.313638
307	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-11 13:30:15.316939	2015-09-11 13:30:15.316939
308	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-11 13:30:15.320111	2015-09-11 13:30:15.320111
309	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-11 13:30:15.323504	2015-09-11 13:30:15.323504
310	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-11 13:30:15.326775	2015-09-11 13:30:15.326775
311	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-11 13:30:15.330342	2015-09-11 13:30:15.330342
312	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-11 13:30:15.33346	2015-09-11 13:30:15.33346
313	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-11 13:30:15.336728	2015-09-11 13:30:15.336728
314	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-11 13:30:15.339769	2015-09-11 13:30:15.339769
315	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-11 13:30:15.342912	2015-09-11 13:30:15.342912
316	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-11 13:30:15.346011	2015-09-11 13:30:15.346011
317	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-11 13:30:15.349077	2015-09-11 13:30:15.349077
318	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-11 13:30:15.352155	2015-09-11 13:30:15.352155
319	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-11 13:30:15.355294	2015-09-11 13:30:15.355294
320	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-11 13:30:15.358437	2015-09-11 13:30:15.358437
321	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-11 13:30:15.361627	2015-09-11 13:30:15.361627
322	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-11 13:30:15.364798	2015-09-11 13:30:15.364798
323	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-11 15:23:25.833295	2015-09-11 15:23:25.833295
324	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-11 15:23:25.850016	2015-09-11 15:23:25.850016
325	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-11 15:23:25.856904	2015-09-11 15:23:25.856904
326	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-11 15:23:25.864302	2015-09-11 15:23:25.864302
327	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-11 15:23:25.872414	2015-09-11 15:23:25.872414
328	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-11 15:23:25.879998	2015-09-11 15:23:25.879998
329	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-11 15:23:25.887526	2015-09-11 15:23:25.887526
330	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-11 15:23:25.894854	2015-09-11 15:23:25.894854
331	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-11 15:23:25.901723	2015-09-11 15:23:25.901723
332	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-11 15:23:25.908425	2015-09-11 15:23:25.908425
333	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-11 15:23:25.915016	2015-09-11 15:23:25.915016
334	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-11 15:23:25.921951	2015-09-11 15:23:25.921951
335	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-11 15:23:25.928522	2015-09-11 15:23:25.928522
336	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-11 15:23:25.935193	2015-09-11 15:23:25.935193
337	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-11 15:23:25.941562	2015-09-11 15:23:25.941562
338	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-11 15:23:25.948246	2015-09-11 15:23:25.948246
339	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-11 15:23:25.954821	2015-09-11 15:23:25.954821
340	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-11 15:23:25.961398	2015-09-11 15:23:25.961398
341	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-11 15:23:25.968086	2015-09-11 15:23:25.968086
342	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-11 15:23:25.974839	2015-09-11 15:23:25.974839
343	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-11 15:23:25.981445	2015-09-11 15:23:25.981445
344	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-11 15:23:25.988382	2015-09-11 15:23:25.988382
345	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-11 15:23:25.995026	2015-09-11 15:23:25.995026
346	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-14 16:53:28.667474	2015-09-14 16:53:28.667474
347	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-14 16:53:28.675883	2015-09-14 16:53:28.675883
348	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-14 16:53:28.679236	2015-09-14 16:53:28.679236
349	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-14 16:53:28.682304	2015-09-14 16:53:28.682304
350	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-14 16:53:28.685334	2015-09-14 16:53:28.685334
351	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-14 16:53:28.688266	2015-09-14 16:53:28.688266
352	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-14 16:53:28.691639	2015-09-14 16:53:28.691639
353	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-14 16:53:28.694579	2015-09-14 16:53:28.694579
354	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-14 16:53:28.697638	2015-09-14 16:53:28.697638
355	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-14 16:53:28.700587	2015-09-14 16:53:28.700587
356	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-14 16:53:28.703471	2015-09-14 16:53:28.703471
357	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-14 16:53:28.706531	2015-09-14 16:53:28.706531
358	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-14 16:53:28.709484	2015-09-14 16:53:28.709484
359	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-14 16:53:28.712437	2015-09-14 16:53:28.712437
360	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-14 16:53:28.715326	2015-09-14 16:53:28.715326
361	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-14 16:53:28.718331	2015-09-14 16:53:28.718331
362	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-14 16:53:28.721376	2015-09-14 16:53:28.721376
363	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-14 16:53:28.724386	2015-09-14 16:53:28.724386
364	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-14 16:53:28.727515	2015-09-14 16:53:28.727515
365	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-14 16:53:28.730885	2015-09-14 16:53:28.730885
366	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-14 16:53:28.733885	2015-09-14 16:53:28.733885
367	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-14 16:53:28.736918	2015-09-14 16:53:28.736918
368	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-14 16:53:28.740048	2015-09-14 16:53:28.740048
369	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-15 18:32:10.889746	2015-09-15 18:32:10.889746
370	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-15 18:32:10.897451	2015-09-15 18:32:10.897451
371	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-15 18:32:10.90059	2015-09-15 18:32:10.90059
372	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-15 18:32:10.903611	2015-09-15 18:32:10.903611
373	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-15 18:32:10.906698	2015-09-15 18:32:10.906698
374	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-15 18:32:10.909649	2015-09-15 18:32:10.909649
375	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-15 18:32:10.912726	2015-09-15 18:32:10.912726
376	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-15 18:32:10.915659	2015-09-15 18:32:10.915659
377	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-15 18:32:10.918613	2015-09-15 18:32:10.918613
378	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-15 18:32:10.921587	2015-09-15 18:32:10.921587
379	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-15 18:32:10.924403	2015-09-15 18:32:10.924403
380	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-15 18:32:10.927549	2015-09-15 18:32:10.927549
381	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-15 18:32:10.930538	2015-09-15 18:32:10.930538
382	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-15 18:32:10.933449	2015-09-15 18:32:10.933449
383	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-15 18:32:10.936419	2015-09-15 18:32:10.936419
384	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-15 18:32:10.939323	2015-09-15 18:32:10.939323
385	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-15 18:32:10.942255	2015-09-15 18:32:10.942255
386	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-15 18:32:10.945355	2015-09-15 18:32:10.945355
387	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-15 18:32:10.948428	2015-09-15 18:32:10.948428
388	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-15 18:32:10.951365	2015-09-15 18:32:10.951365
389	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-15 18:32:10.954302	2015-09-15 18:32:10.954302
390	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-15 18:32:10.95748	2015-09-15 18:32:10.95748
391	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-15 18:32:10.960515	2015-09-15 18:32:10.960515
392	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-16 14:31:17.239623	2015-09-16 14:31:17.239623
393	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-16 14:31:17.262225	2015-09-16 14:31:17.262225
394	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-16 14:31:17.269071	2015-09-16 14:31:17.269071
395	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-16 14:31:17.275563	2015-09-16 14:31:17.275563
396	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-16 14:31:17.282325	2015-09-16 14:31:17.282325
397	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-16 14:31:17.289034	2015-09-16 14:31:17.289034
398	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-16 14:31:17.295527	2015-09-16 14:31:17.295527
399	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-16 14:31:17.302163	2015-09-16 14:31:17.302163
400	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-16 14:31:17.308376	2015-09-16 14:31:17.308376
401	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-16 14:31:17.315685	2015-09-16 14:31:17.315685
402	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-16 14:31:17.323906	2015-09-16 14:31:17.323906
403	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-16 14:31:17.331276	2015-09-16 14:31:17.331276
404	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-16 14:31:17.337731	2015-09-16 14:31:17.337731
405	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-16 14:31:17.344045	2015-09-16 14:31:17.344045
406	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-16 14:31:17.350466	2015-09-16 14:31:17.350466
407	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-16 14:31:17.356889	2015-09-16 14:31:17.356889
408	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-16 14:31:17.363365	2015-09-16 14:31:17.363365
409	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-16 14:31:17.370686	2015-09-16 14:31:17.370686
410	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-16 14:31:17.377618	2015-09-16 14:31:17.377618
411	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-16 14:31:17.384061	2015-09-16 14:31:17.384061
412	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-16 14:31:17.390358	2015-09-16 14:31:17.390358
413	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-16 14:31:17.396579	2015-09-16 14:31:17.396579
414	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-16 14:31:17.402859	2015-09-16 14:31:17.402859
415	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-16 20:05:01.864495	2015-09-16 20:05:01.864495
416	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-16 20:05:01.876385	2015-09-16 20:05:01.876385
417	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-16 20:05:01.879556	2015-09-16 20:05:01.879556
418	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-16 20:05:01.882451	2015-09-16 20:05:01.882451
419	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-16 20:05:01.885408	2015-09-16 20:05:01.885408
420	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-16 20:05:01.888368	2015-09-16 20:05:01.888368
421	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-16 20:05:01.891355	2015-09-16 20:05:01.891355
422	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-16 20:05:01.894628	2015-09-16 20:05:01.894628
423	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-16 20:05:01.897669	2015-09-16 20:05:01.897669
424	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-16 20:05:01.90076	2015-09-16 20:05:01.90076
425	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-16 20:05:01.903688	2015-09-16 20:05:01.903688
426	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-16 20:05:01.906748	2015-09-16 20:05:01.906748
427	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-16 20:05:01.909649	2015-09-16 20:05:01.909649
428	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-16 20:05:01.912698	2015-09-16 20:05:01.912698
429	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-16 20:05:01.91566	2015-09-16 20:05:01.91566
430	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-16 20:05:01.918663	2015-09-16 20:05:01.918663
431	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-16 20:05:01.921648	2015-09-16 20:05:01.921648
432	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-16 20:05:01.924982	2015-09-16 20:05:01.924982
433	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-16 20:05:01.927933	2015-09-16 20:05:01.927933
434	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-16 20:05:01.930908	2015-09-16 20:05:01.930908
435	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-16 20:05:01.933815	2015-09-16 20:05:01.933815
436	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-16 20:05:01.936772	2015-09-16 20:05:01.936772
437	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-16 20:05:01.939699	2015-09-16 20:05:01.939699
438	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-16 20:42:10.675745	2015-09-16 20:42:10.675745
439	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-16 20:42:10.697665	2015-09-16 20:42:10.697665
440	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-16 20:42:10.703244	2015-09-16 20:42:10.703244
441	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-16 20:42:10.708813	2015-09-16 20:42:10.708813
442	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-16 20:42:10.714376	2015-09-16 20:42:10.714376
443	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-16 20:42:10.719652	2015-09-16 20:42:10.719652
444	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-16 20:42:10.724976	2015-09-16 20:42:10.724976
445	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-16 20:42:10.730584	2015-09-16 20:42:10.730584
446	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-16 20:42:10.735725	2015-09-16 20:42:10.735725
447	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-16 20:42:10.741118	2015-09-16 20:42:10.741118
448	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-16 20:42:10.746519	2015-09-16 20:42:10.746519
449	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-16 20:42:10.751488	2015-09-16 20:42:10.751488
450	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-16 20:42:10.756474	2015-09-16 20:42:10.756474
451	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-16 20:42:10.761479	2015-09-16 20:42:10.761479
452	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-16 20:42:10.766532	2015-09-16 20:42:10.766532
453	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-16 20:42:10.771457	2015-09-16 20:42:10.771457
454	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-16 20:42:10.776456	2015-09-16 20:42:10.776456
455	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-16 20:42:10.781921	2015-09-16 20:42:10.781921
456	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-16 20:42:10.787149	2015-09-16 20:42:10.787149
457	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-16 20:42:10.791902	2015-09-16 20:42:10.791902
458	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-16 20:42:10.796904	2015-09-16 20:42:10.796904
459	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-16 20:42:10.801767	2015-09-16 20:42:10.801767
460	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-16 20:42:10.8065	2015-09-16 20:42:10.8065
461	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-16 20:46:10.423279	2015-09-16 20:46:10.423279
462	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-16 20:46:10.436325	2015-09-16 20:46:10.436325
463	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-16 20:46:10.441654	2015-09-16 20:46:10.441654
464	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-16 20:46:10.447049	2015-09-16 20:46:10.447049
465	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-16 20:46:10.452135	2015-09-16 20:46:10.452135
466	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-16 20:46:10.457318	2015-09-16 20:46:10.457318
467	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-16 20:46:10.462512	2015-09-16 20:46:10.462512
468	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-16 20:46:10.467586	2015-09-16 20:46:10.467586
469	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-16 20:46:10.472713	2015-09-16 20:46:10.472713
470	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-16 20:46:10.477686	2015-09-16 20:46:10.477686
471	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-16 20:46:10.482789	2015-09-16 20:46:10.482789
472	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-16 20:46:10.487776	2015-09-16 20:46:10.487776
473	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-16 20:46:10.49272	2015-09-16 20:46:10.49272
474	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-16 20:46:10.497701	2015-09-16 20:46:10.497701
475	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-16 20:46:10.516866	2015-09-16 20:46:10.516866
476	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-16 20:46:10.52491	2015-09-16 20:46:10.52491
477	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-16 20:46:10.530816	2015-09-16 20:46:10.530816
478	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-16 20:46:10.536496	2015-09-16 20:46:10.536496
479	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-16 20:46:10.542052	2015-09-16 20:46:10.542052
480	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-16 20:46:10.547371	2015-09-16 20:46:10.547371
481	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-16 20:46:10.552801	2015-09-16 20:46:10.552801
482	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-16 20:46:10.558344	2015-09-16 20:46:10.558344
483	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-16 20:46:10.563698	2015-09-16 20:46:10.563698
484	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-17 21:03:44.86259	2015-09-17 21:03:44.86259
485	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-17 21:03:44.877588	2015-09-17 21:03:44.877588
486	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-17 21:03:44.884317	2015-09-17 21:03:44.884317
487	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-17 21:03:44.891086	2015-09-17 21:03:44.891086
488	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-17 21:03:44.897466	2015-09-17 21:03:44.897466
489	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-17 21:03:44.90421	2015-09-17 21:03:44.90421
490	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-17 21:03:44.910929	2015-09-17 21:03:44.910929
491	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-17 21:03:44.917324	2015-09-17 21:03:44.917324
492	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-17 21:03:44.924443	2015-09-17 21:03:44.924443
493	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-17 21:03:44.930762	2015-09-17 21:03:44.930762
494	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-17 21:03:44.937124	2015-09-17 21:03:44.937124
495	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-17 21:03:44.943572	2015-09-17 21:03:44.943572
496	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-17 21:03:44.950151	2015-09-17 21:03:44.950151
497	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-17 21:03:44.956584	2015-09-17 21:03:44.956584
498	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-17 21:03:44.963184	2015-09-17 21:03:44.963184
499	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-17 21:03:44.970258	2015-09-17 21:03:44.970258
500	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-17 21:03:44.976701	2015-09-17 21:03:44.976701
501	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-17 21:03:44.98341	2015-09-17 21:03:44.98341
502	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-17 21:03:44.989953	2015-09-17 21:03:44.989953
503	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-17 21:03:44.99631	2015-09-17 21:03:44.99631
504	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-17 21:03:45.002807	2015-09-17 21:03:45.002807
505	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-17 21:03:45.009302	2015-09-17 21:03:45.009302
506	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-17 21:03:45.015757	2015-09-17 21:03:45.015757
507	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-21 13:14:03.576279	2015-09-21 13:14:03.576279
508	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-21 13:14:03.58462	2015-09-21 13:14:03.58462
509	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-21 13:14:03.588449	2015-09-21 13:14:03.588449
510	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-21 13:14:03.594529	2015-09-21 13:14:03.594529
511	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-21 13:14:03.602394	2015-09-21 13:14:03.602394
512	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-21 13:14:03.609948	2015-09-21 13:14:03.609948
513	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-21 13:14:03.616645	2015-09-21 13:14:03.616645
514	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-21 13:14:03.623516	2015-09-21 13:14:03.623516
515	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-21 13:14:03.629277	2015-09-21 13:14:03.629277
516	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-21 13:14:03.63234	2015-09-21 13:14:03.63234
517	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-21 13:14:03.635288	2015-09-21 13:14:03.635288
518	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-21 13:14:03.640586	2015-09-21 13:14:03.640586
519	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-21 13:14:03.647639	2015-09-21 13:14:03.647639
520	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-21 13:14:03.655879	2015-09-21 13:14:03.655879
521	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-21 13:14:03.664097	2015-09-21 13:14:03.664097
522	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-21 13:14:03.671659	2015-09-21 13:14:03.671659
523	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-21 13:14:03.678671	2015-09-21 13:14:03.678671
524	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-21 13:14:03.685714	2015-09-21 13:14:03.685714
525	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-21 13:14:03.692677	2015-09-21 13:14:03.692677
526	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-21 13:14:03.69956	2015-09-21 13:14:03.69956
527	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-21 13:14:03.704957	2015-09-21 13:14:03.704957
528	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-21 13:14:03.708032	2015-09-21 13:14:03.708032
529	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-21 13:14:03.711014	2015-09-21 13:14:03.711014
530	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-21 15:10:04.112879	2015-09-21 15:10:04.112879
531	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-21 15:10:04.122473	2015-09-21 15:10:04.122473
532	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-21 15:10:04.125615	2015-09-21 15:10:04.125615
533	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-21 15:10:04.128626	2015-09-21 15:10:04.128626
534	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-21 15:10:04.131668	2015-09-21 15:10:04.131668
535	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-21 15:10:04.134662	2015-09-21 15:10:04.134662
536	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-21 15:10:04.137653	2015-09-21 15:10:04.137653
537	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-21 15:10:04.140662	2015-09-21 15:10:04.140662
538	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-21 15:10:04.143678	2015-09-21 15:10:04.143678
539	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-21 15:10:04.146691	2015-09-21 15:10:04.146691
540	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-21 15:10:04.149618	2015-09-21 15:10:04.149618
541	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-21 15:10:04.152629	2015-09-21 15:10:04.152629
542	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-21 15:10:04.155797	2015-09-21 15:10:04.155797
543	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-21 15:10:04.159042	2015-09-21 15:10:04.159042
544	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-21 15:10:04.162064	2015-09-21 15:10:04.162064
545	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-21 15:10:04.164979	2015-09-21 15:10:04.164979
546	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-21 15:10:04.167854	2015-09-21 15:10:04.167854
547	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-21 15:10:04.170686	2015-09-21 15:10:04.170686
548	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-21 15:10:04.173617	2015-09-21 15:10:04.173617
549	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-21 15:10:04.17654	2015-09-21 15:10:04.17654
550	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-21 15:10:04.179609	2015-09-21 15:10:04.179609
551	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-21 15:10:04.182604	2015-09-21 15:10:04.182604
552	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-21 15:10:04.185588	2015-09-21 15:10:04.185588
553	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-09-22 17:06:46.664676	2015-09-22 17:06:46.664676
554	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-09-22 17:06:46.684131	2015-09-22 17:06:46.684131
555	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-09-22 17:06:46.691535	2015-09-22 17:06:46.691535
556	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-09-22 17:06:46.6983	2015-09-22 17:06:46.6983
557	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-09-22 17:06:46.705002	2015-09-22 17:06:46.705002
558	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-09-22 17:06:46.711574	2015-09-22 17:06:46.711574
559	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-09-22 17:06:46.718161	2015-09-22 17:06:46.718161
560	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-09-22 17:06:46.724583	2015-09-22 17:06:46.724583
561	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-09-22 17:06:46.731001	2015-09-22 17:06:46.731001
562	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-09-22 17:06:46.737755	2015-09-22 17:06:46.737755
563	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-09-22 17:06:46.744409	2015-09-22 17:06:46.744409
564	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-09-22 17:06:46.752235	2015-09-22 17:06:46.752235
565	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-09-22 17:06:46.759686	2015-09-22 17:06:46.759686
566	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-09-22 17:06:46.767373	2015-09-22 17:06:46.767373
567	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-09-22 17:06:46.774527	2015-09-22 17:06:46.774527
568	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-09-22 17:06:46.781582	2015-09-22 17:06:46.781582
569	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-09-22 17:06:46.789429	2015-09-22 17:06:46.789429
570	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-09-22 17:06:46.797601	2015-09-22 17:06:46.797601
571	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-09-22 17:06:46.805537	2015-09-22 17:06:46.805537
572	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-09-22 17:06:46.813418	2015-09-22 17:06:46.813418
573	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-09-22 17:06:46.819895	2015-09-22 17:06:46.819895
574	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-09-22 17:06:46.826424	2015-09-22 17:06:46.826424
575	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-09-22 17:06:46.832823	2015-09-22 17:06:46.832823
576	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-01 13:36:55.930348	2015-10-01 13:36:55.930348
577	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-01 13:36:55.938866	2015-10-01 13:36:55.938866
578	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-01 13:36:55.94197	2015-10-01 13:36:55.94197
579	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-01 13:36:55.945159	2015-10-01 13:36:55.945159
580	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-01 13:36:55.948203	2015-10-01 13:36:55.948203
581	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-01 13:36:55.951343	2015-10-01 13:36:55.951343
582	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-01 13:36:55.954449	2015-10-01 13:36:55.954449
583	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-01 13:36:55.957522	2015-10-01 13:36:55.957522
584	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-01 13:36:55.960597	2015-10-01 13:36:55.960597
585	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-01 13:36:55.963749	2015-10-01 13:36:55.963749
586	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-01 13:36:55.966919	2015-10-01 13:36:55.966919
587	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-01 13:36:55.969955	2015-10-01 13:36:55.969955
588	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-01 13:36:55.973026	2015-10-01 13:36:55.973026
589	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-01 13:36:55.976088	2015-10-01 13:36:55.976088
590	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-01 13:36:55.979389	2015-10-01 13:36:55.979389
591	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-01 13:36:55.982663	2015-10-01 13:36:55.982663
592	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-01 13:36:55.98566	2015-10-01 13:36:55.98566
593	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-01 13:36:55.988774	2015-10-01 13:36:55.988774
594	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-01 13:36:55.991867	2015-10-01 13:36:55.991867
595	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-01 13:36:55.994937	2015-10-01 13:36:55.994937
596	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-01 13:36:55.998116	2015-10-01 13:36:55.998116
597	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-01 13:36:56.001358	2015-10-01 13:36:56.001358
598	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-01 13:36:56.004404	2015-10-01 13:36:56.004404
599	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	32	2015-10-06 14:25:56.488545	2015-10-06 14:25:56.488545
600	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-06 14:27:22.178227	2015-10-06 14:27:22.178227
601	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-06 15:39:22.962895	2015-10-06 15:39:22.962895
602	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-06 15:39:22.969947	2015-10-06 15:39:22.969947
603	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-06 15:39:22.972993	2015-10-06 15:39:22.972993
604	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-06 15:39:22.976043	2015-10-06 15:39:22.976043
605	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-06 15:39:22.979017	2015-10-06 15:39:22.979017
606	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-06 15:39:22.981997	2015-10-06 15:39:22.981997
607	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-06 15:39:22.984954	2015-10-06 15:39:22.984954
608	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-06 15:39:22.987934	2015-10-06 15:39:22.987934
609	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-06 15:39:22.990929	2015-10-06 15:39:22.990929
610	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-06 15:39:22.993922	2015-10-06 15:39:22.993922
611	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-06 15:39:22.996889	2015-10-06 15:39:22.996889
612	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-06 15:39:22.99985	2015-10-06 15:39:22.99985
613	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-06 15:39:23.002875	2015-10-06 15:39:23.002875
614	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-06 15:39:23.005974	2015-10-06 15:39:23.005974
615	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-06 15:39:23.009082	2015-10-06 15:39:23.009082
616	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-06 15:39:23.012097	2015-10-06 15:39:23.012097
617	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-06 15:39:23.015047	2015-10-06 15:39:23.015047
618	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-06 15:39:23.018038	2015-10-06 15:39:23.018038
619	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-06 15:39:23.020972	2015-10-06 15:39:23.020972
620	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-06 15:39:23.023945	2015-10-06 15:39:23.023945
621	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-06 15:39:23.026918	2015-10-06 15:39:23.026918
622	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-06 15:39:23.029938	2015-10-06 15:39:23.029938
623	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-06 15:39:23.032945	2015-10-06 15:39:23.032945
624	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-06 15:39:23.03589	2015-10-06 15:39:23.03589
13	3	1	3	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-08-31 14:37:02.159683	2015-10-07 13:25:23.09665
625	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-08 19:08:32.171998	2015-10-08 19:08:32.171998
626	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-08 19:08:32.179541	2015-10-08 19:08:32.179541
627	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-08 19:08:32.182562	2015-10-08 19:08:32.182562
628	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-08 19:08:32.185526	2015-10-08 19:08:32.185526
629	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-08 19:08:32.188659	2015-10-08 19:08:32.188659
630	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-08 19:08:32.191589	2015-10-08 19:08:32.191589
631	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-08 19:08:32.195178	2015-10-08 19:08:32.195178
632	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-08 19:08:32.198163	2015-10-08 19:08:32.198163
633	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-08 19:08:32.201	2015-10-08 19:08:32.201
634	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-08 19:08:32.20394	2015-10-08 19:08:32.20394
635	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-08 19:08:32.206848	2015-10-08 19:08:32.206848
636	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-08 19:08:32.209764	2015-10-08 19:08:32.209764
637	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-08 19:08:32.212703	2015-10-08 19:08:32.212703
638	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-08 19:08:32.215646	2015-10-08 19:08:32.215646
639	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-08 19:08:32.218484	2015-10-08 19:08:32.218484
640	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-08 19:08:32.221301	2015-10-08 19:08:32.221301
641	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-08 19:08:32.224209	2015-10-08 19:08:32.224209
642	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-08 19:08:32.227103	2015-10-08 19:08:32.227103
643	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-08 19:08:32.230103	2015-10-08 19:08:32.230103
644	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-08 19:08:32.232985	2015-10-08 19:08:32.232985
645	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-08 19:08:32.23596	2015-10-08 19:08:32.23596
646	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-08 19:08:32.238913	2015-10-08 19:08:32.238913
647	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-08 19:08:32.241881	2015-10-08 19:08:32.241881
648	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-08 19:08:32.244796	2015-10-08 19:08:32.244796
649	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-09 23:44:27.317682	2015-10-09 23:44:27.317682
650	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-09 23:44:27.326287	2015-10-09 23:44:27.326287
651	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-09 23:44:27.329324	2015-10-09 23:44:27.329324
652	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-09 23:44:27.332571	2015-10-09 23:44:27.332571
653	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-09 23:44:27.335577	2015-10-09 23:44:27.335577
654	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-09 23:44:27.338545	2015-10-09 23:44:27.338545
655	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-09 23:44:27.341595	2015-10-09 23:44:27.341595
656	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-09 23:44:27.344601	2015-10-09 23:44:27.344601
657	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-09 23:44:27.347583	2015-10-09 23:44:27.347583
658	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-09 23:44:27.350571	2015-10-09 23:44:27.350571
659	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-09 23:44:27.353523	2015-10-09 23:44:27.353523
660	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-09 23:44:27.356498	2015-10-09 23:44:27.356498
661	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-09 23:44:27.359524	2015-10-09 23:44:27.359524
662	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-09 23:44:27.362601	2015-10-09 23:44:27.362601
663	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-09 23:44:27.365557	2015-10-09 23:44:27.365557
664	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-09 23:44:27.368614	2015-10-09 23:44:27.368614
665	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-09 23:44:27.371674	2015-10-09 23:44:27.371674
666	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-09 23:44:27.374697	2015-10-09 23:44:27.374697
667	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-09 23:44:27.377977	2015-10-09 23:44:27.377977
668	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-09 23:44:27.381126	2015-10-09 23:44:27.381126
669	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-09 23:44:27.384158	2015-10-09 23:44:27.384158
670	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-09 23:44:27.387157	2015-10-09 23:44:27.387157
671	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-09 23:44:27.3902	2015-10-09 23:44:27.3902
672	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-09 23:44:27.393213	2015-10-09 23:44:27.393213
673	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-13 17:34:21.993354	2015-10-13 17:34:21.993354
674	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-13 17:34:22.007491	2015-10-13 17:34:22.007491
675	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-13 17:34:22.011505	2015-10-13 17:34:22.011505
676	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-13 17:34:22.014889	2015-10-13 17:34:22.014889
677	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-13 17:34:22.018213	2015-10-13 17:34:22.018213
678	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-13 17:34:22.021369	2015-10-13 17:34:22.021369
679	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-13 17:34:22.024444	2015-10-13 17:34:22.024444
680	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-13 17:34:22.027777	2015-10-13 17:34:22.027777
681	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-13 17:34:22.030919	2015-10-13 17:34:22.030919
682	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-13 17:34:22.033951	2015-10-13 17:34:22.033951
683	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-13 17:34:22.036847	2015-10-13 17:34:22.036847
684	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-13 17:34:22.039731	2015-10-13 17:34:22.039731
685	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-13 17:34:22.042753	2015-10-13 17:34:22.042753
686	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-13 17:34:22.046119	2015-10-13 17:34:22.046119
687	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-13 17:34:22.049071	2015-10-13 17:34:22.049071
688	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-13 17:34:22.051938	2015-10-13 17:34:22.051938
689	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-13 17:34:22.055782	2015-10-13 17:34:22.055782
690	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-13 17:34:22.059179	2015-10-13 17:34:22.059179
691	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-13 17:34:22.062152	2015-10-13 17:34:22.062152
692	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-13 17:34:22.065245	2015-10-13 17:34:22.065245
693	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-13 17:34:22.068232	2015-10-13 17:34:22.068232
694	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-13 17:34:22.071163	2015-10-13 17:34:22.071163
695	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-13 17:34:22.074167	2015-10-13 17:34:22.074167
696	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-13 17:34:22.077418	2015-10-13 17:34:22.077418
697	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-14 18:21:11.609524	2015-10-14 18:21:11.609524
698	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-14 18:21:11.617665	2015-10-14 18:21:11.617665
699	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-14 18:21:11.620869	2015-10-14 18:21:11.620869
700	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-14 18:21:11.623893	2015-10-14 18:21:11.623893
701	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-14 18:21:11.627961	2015-10-14 18:21:11.627961
702	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-14 18:21:11.631104	2015-10-14 18:21:11.631104
703	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-14 18:21:11.634258	2015-10-14 18:21:11.634258
704	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-14 18:21:11.637795	2015-10-14 18:21:11.637795
705	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-14 18:21:11.640809	2015-10-14 18:21:11.640809
706	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-14 18:21:11.643774	2015-10-14 18:21:11.643774
707	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-14 18:21:11.647054	2015-10-14 18:21:11.647054
708	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-14 18:21:11.650639	2015-10-14 18:21:11.650639
709	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-14 18:21:11.653732	2015-10-14 18:21:11.653732
710	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-14 18:21:11.656684	2015-10-14 18:21:11.656684
711	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-14 18:21:11.659751	2015-10-14 18:21:11.659751
712	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-14 18:21:11.662737	2015-10-14 18:21:11.662737
713	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-14 18:21:11.665754	2015-10-14 18:21:11.665754
714	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-14 18:21:11.66877	2015-10-14 18:21:11.66877
715	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-14 18:21:11.671841	2015-10-14 18:21:11.671841
716	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-14 18:21:11.675011	2015-10-14 18:21:11.675011
717	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-14 18:21:11.678082	2015-10-14 18:21:11.678082
718	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-14 18:21:11.681074	2015-10-14 18:21:11.681074
719	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-14 18:21:11.684038	2015-10-14 18:21:11.684038
720	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-14 18:21:11.687025	2015-10-14 18:21:11.687025
721	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-15 21:10:08.935071	2015-10-15 21:10:08.935071
722	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-15 21:10:08.942952	2015-10-15 21:10:08.942952
723	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-15 21:10:08.946375	2015-10-15 21:10:08.946375
724	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-15 21:10:08.950051	2015-10-15 21:10:08.950051
725	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-15 21:10:08.953273	2015-10-15 21:10:08.953273
726	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-15 21:10:08.956237	2015-10-15 21:10:08.956237
727	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-15 21:10:08.95926	2015-10-15 21:10:08.95926
728	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-15 21:10:08.962168	2015-10-15 21:10:08.962168
729	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-15 21:10:08.965017	2015-10-15 21:10:08.965017
730	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-15 21:10:08.96798	2015-10-15 21:10:08.96798
731	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-15 21:10:08.970879	2015-10-15 21:10:08.970879
732	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-15 21:10:08.973785	2015-10-15 21:10:08.973785
733	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-15 21:10:08.976768	2015-10-15 21:10:08.976768
734	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-15 21:10:08.97986	2015-10-15 21:10:08.97986
735	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-15 21:10:08.982846	2015-10-15 21:10:08.982846
736	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-15 21:10:08.986121	2015-10-15 21:10:08.986121
737	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-15 21:10:08.989163	2015-10-15 21:10:08.989163
738	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-15 21:10:08.993349	2015-10-15 21:10:08.993349
739	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-15 21:10:08.997331	2015-10-15 21:10:08.997331
740	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-15 21:10:09.00077	2015-10-15 21:10:09.00077
741	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-15 21:10:09.004261	2015-10-15 21:10:09.004261
742	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-15 21:10:09.007359	2015-10-15 21:10:09.007359
743	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-15 21:10:09.010405	2015-10-15 21:10:09.010405
744	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-15 21:10:09.013361	2015-10-15 21:10:09.013361
745	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-16 16:46:13.587471	2015-10-16 16:46:13.587471
746	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-16 16:46:13.594556	2015-10-16 16:46:13.594556
747	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-16 16:46:13.597573	2015-10-16 16:46:13.597573
748	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-16 16:46:13.600573	2015-10-16 16:46:13.600573
749	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-16 16:46:13.603538	2015-10-16 16:46:13.603538
750	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-16 16:46:13.606534	2015-10-16 16:46:13.606534
751	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-16 16:46:13.609641	2015-10-16 16:46:13.609641
752	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-16 16:46:13.612586	2015-10-16 16:46:13.612586
753	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-16 16:46:13.615606	2015-10-16 16:46:13.615606
754	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-16 16:46:13.618563	2015-10-16 16:46:13.618563
755	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-16 16:46:13.621478	2015-10-16 16:46:13.621478
756	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-16 16:46:13.62442	2015-10-16 16:46:13.62442
757	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-16 16:46:13.627346	2015-10-16 16:46:13.627346
758	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-16 16:46:13.630289	2015-10-16 16:46:13.630289
759	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-16 16:46:13.633242	2015-10-16 16:46:13.633242
760	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-16 16:46:13.636156	2015-10-16 16:46:13.636156
761	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-16 16:46:13.639109	2015-10-16 16:46:13.639109
762	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-16 16:46:13.642163	2015-10-16 16:46:13.642163
763	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-16 16:46:13.645097	2015-10-16 16:46:13.645097
764	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-16 16:46:13.648055	2015-10-16 16:46:13.648055
765	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-16 16:46:13.651042	2015-10-16 16:46:13.651042
766	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-16 16:46:13.654014	2015-10-16 16:46:13.654014
767	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-16 16:46:13.656936	2015-10-16 16:46:13.656936
768	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-16 16:46:13.659909	2015-10-16 16:46:13.659909
769	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-16 17:43:50.848497	2015-10-16 17:43:50.848497
770	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-16 17:43:50.859573	2015-10-16 17:43:50.859573
771	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-16 17:43:50.863174	2015-10-16 17:43:50.863174
772	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-16 17:43:50.86612	2015-10-16 17:43:50.86612
773	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-16 17:43:50.872397	2015-10-16 17:43:50.872397
774	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-16 17:43:50.875427	2015-10-16 17:43:50.875427
775	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-16 17:43:50.878628	2015-10-16 17:43:50.878628
776	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-16 17:43:50.884557	2015-10-16 17:43:50.884557
777	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-16 17:43:50.889518	2015-10-16 17:43:50.889518
778	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-16 17:43:50.892664	2015-10-16 17:43:50.892664
779	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-16 17:43:50.895625	2015-10-16 17:43:50.895625
780	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-16 17:43:50.898601	2015-10-16 17:43:50.898601
781	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-16 17:43:50.901606	2015-10-16 17:43:50.901606
782	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-16 17:43:50.904569	2015-10-16 17:43:50.904569
783	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-16 17:43:50.907568	2015-10-16 17:43:50.907568
784	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-16 17:43:50.910532	2015-10-16 17:43:50.910532
785	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-16 17:43:50.913454	2015-10-16 17:43:50.913454
786	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-16 17:43:50.917812	2015-10-16 17:43:50.917812
787	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-16 17:43:50.921633	2015-10-16 17:43:50.921633
788	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-16 17:43:50.925524	2015-10-16 17:43:50.925524
789	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-16 17:43:50.928947	2015-10-16 17:43:50.928947
790	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-16 17:43:50.932205	2015-10-16 17:43:50.932205
791	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-16 17:43:50.935327	2015-10-16 17:43:50.935327
792	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-16 17:43:50.938269	2015-10-16 17:43:50.938269
793	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-16 23:18:36.90811	2015-10-16 23:18:36.90811
794	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-16 23:18:36.91551	2015-10-16 23:18:36.91551
795	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-16 23:18:36.91847	2015-10-16 23:18:36.91847
796	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-16 23:18:36.921403	2015-10-16 23:18:36.921403
797	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-16 23:18:36.924351	2015-10-16 23:18:36.924351
798	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-16 23:18:36.927483	2015-10-16 23:18:36.927483
799	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-16 23:18:36.93051	2015-10-16 23:18:36.93051
800	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-16 23:18:36.933436	2015-10-16 23:18:36.933436
801	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-16 23:18:36.936452	2015-10-16 23:18:36.936452
802	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-16 23:18:36.939491	2015-10-16 23:18:36.939491
803	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-16 23:18:36.942468	2015-10-16 23:18:36.942468
804	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-16 23:18:36.945461	2015-10-16 23:18:36.945461
805	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-16 23:18:36.948407	2015-10-16 23:18:36.948407
806	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-16 23:18:36.951394	2015-10-16 23:18:36.951394
807	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-16 23:18:36.954436	2015-10-16 23:18:36.954436
808	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-16 23:18:36.957416	2015-10-16 23:18:36.957416
809	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-16 23:18:36.960362	2015-10-16 23:18:36.960362
810	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-16 23:18:36.963376	2015-10-16 23:18:36.963376
811	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-16 23:18:36.966372	2015-10-16 23:18:36.966372
812	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-16 23:18:36.969384	2015-10-16 23:18:36.969384
813	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-16 23:18:36.972473	2015-10-16 23:18:36.972473
814	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-16 23:18:36.975508	2015-10-16 23:18:36.975508
815	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-16 23:18:36.978565	2015-10-16 23:18:36.978565
816	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-16 23:18:36.981529	2015-10-16 23:18:36.981529
817	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-19 17:16:32.126915	2015-10-19 17:16:32.126915
818	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-19 17:16:32.135273	2015-10-19 17:16:32.135273
819	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-19 17:16:32.138742	2015-10-19 17:16:32.138742
820	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-19 17:16:32.141906	2015-10-19 17:16:32.141906
821	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-19 17:16:32.145249	2015-10-19 17:16:32.145249
822	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-19 17:16:32.14867	2015-10-19 17:16:32.14867
823	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-19 17:16:32.152053	2015-10-19 17:16:32.152053
824	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-19 17:16:32.155176	2015-10-19 17:16:32.155176
825	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-19 17:16:32.15848	2015-10-19 17:16:32.15848
826	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-19 17:16:32.161667	2015-10-19 17:16:32.161667
827	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-19 17:16:32.164833	2015-10-19 17:16:32.164833
828	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-19 17:16:32.167945	2015-10-19 17:16:32.167945
829	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-19 17:16:32.171059	2015-10-19 17:16:32.171059
830	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-19 17:16:32.174135	2015-10-19 17:16:32.174135
831	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-19 17:16:32.177166	2015-10-19 17:16:32.177166
832	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-19 17:16:32.180266	2015-10-19 17:16:32.180266
833	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-19 17:16:32.183286	2015-10-19 17:16:32.183286
834	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-19 17:16:32.186372	2015-10-19 17:16:32.186372
835	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-19 17:16:32.189419	2015-10-19 17:16:32.189419
836	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-19 17:16:32.192489	2015-10-19 17:16:32.192489
837	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-19 17:16:32.195721	2015-10-19 17:16:32.195721
838	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-19 17:16:32.198781	2015-10-19 17:16:32.198781
839	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-19 17:16:32.201731	2015-10-19 17:16:32.201731
840	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-19 17:16:32.204738	2015-10-19 17:16:32.204738
841	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-21 13:23:19.7307	2015-10-21 13:23:19.7307
842	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-21 13:23:19.739965	2015-10-21 13:23:19.739965
843	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-21 13:23:19.743168	2015-10-21 13:23:19.743168
844	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-21 13:23:19.746197	2015-10-21 13:23:19.746197
845	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-21 13:23:19.749291	2015-10-21 13:23:19.749291
846	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-21 13:23:19.752555	2015-10-21 13:23:19.752555
847	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-21 13:23:19.755752	2015-10-21 13:23:19.755752
848	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-21 13:23:19.759027	2015-10-21 13:23:19.759027
849	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-21 13:23:19.762161	2015-10-21 13:23:19.762161
850	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-21 13:23:19.765173	2015-10-21 13:23:19.765173
851	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-21 13:23:19.768418	2015-10-21 13:23:19.768418
852	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-21 13:23:19.771507	2015-10-21 13:23:19.771507
853	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-21 13:23:19.77459	2015-10-21 13:23:19.77459
854	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-21 13:23:19.777538	2015-10-21 13:23:19.777538
855	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-21 13:23:19.780588	2015-10-21 13:23:19.780588
856	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-21 13:23:19.783744	2015-10-21 13:23:19.783744
857	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-21 13:23:19.78691	2015-10-21 13:23:19.78691
858	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-21 13:23:19.790084	2015-10-21 13:23:19.790084
859	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-21 13:23:19.793133	2015-10-21 13:23:19.793133
860	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-21 13:23:19.796247	2015-10-21 13:23:19.796247
861	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-21 13:23:19.799249	2015-10-21 13:23:19.799249
862	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-21 13:23:19.802442	2015-10-21 13:23:19.802442
863	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-21 13:23:19.805464	2015-10-21 13:23:19.805464
864	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-21 13:23:19.808793	2015-10-21 13:23:19.808793
865	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	2015-10-21 16:40:24.955802	2015-10-21 16:40:24.955802
866	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	2015-10-21 16:40:24.97111	2015-10-21 16:40:24.97111
867	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	2015-10-21 16:40:24.975615	2015-10-21 16:40:24.975615
868	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	2015-10-21 16:40:24.979042	2015-10-21 16:40:24.979042
869	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	2015-10-21 16:40:24.982431	2015-10-21 16:40:24.982431
870	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	2015-10-21 16:40:24.985569	2015-10-21 16:40:24.985569
871	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	2015-10-21 16:40:24.988734	2015-10-21 16:40:24.988734
872	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	2015-10-21 16:40:24.992018	2015-10-21 16:40:24.992018
873	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	2015-10-21 16:40:24.995284	2015-10-21 16:40:24.995284
874	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	18	2015-10-21 16:40:24.998536	2015-10-21 16:40:24.998536
875	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	2015-10-21 16:40:25.001687	2015-10-21 16:40:25.001687
876	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	2015-10-21 16:40:25.004943	2015-10-21 16:40:25.004943
877	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	2015-10-21 16:40:25.008161	2015-10-21 16:40:25.008161
878	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	22	2015-10-21 16:40:25.011505	2015-10-21 16:40:25.011505
879	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	23	2015-10-21 16:40:25.01464	2015-10-21 16:40:25.01464
880	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	2015-10-21 16:40:25.017768	2015-10-21 16:40:25.017768
881	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	2015-10-21 16:40:25.020827	2015-10-21 16:40:25.020827
882	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	2015-10-21 16:40:25.023929	2015-10-21 16:40:25.023929
883	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	2015-10-21 16:40:25.027067	2015-10-21 16:40:25.027067
884	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	2015-10-21 16:40:25.030287	2015-10-21 16:40:25.030287
885	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	2015-10-21 16:40:25.033439	2015-10-21 16:40:25.033439
886	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	2015-10-21 16:40:25.036646	2015-10-21 16:40:25.036646
887	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	31	2015-10-21 16:40:25.03977	2015-10-21 16:40:25.03977
888	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	33	2015-10-21 16:40:25.042876	2015-10-21 16:40:25.042876
\.


--
-- Name: control_exams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('control_exams_id_seq', 888, true);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('courses_id_seq', 93, true);


--
-- Data for Name: enviroments; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY enviroments (id, name, description, project_id, account_id, created_at, updated_at, ppra_id) FROM stdin;
1	GHE 1	GHE teste	2	2	2015-07-11 01:14:44.986553	2015-07-11 01:14:44.986553	1
2	GHE 1	teste ghe	2	2	2015-07-11 01:31:55.295632	2015-07-11 01:31:55.295632	1
3	GHE 1	Descrição GHE 1	2	2	2015-07-14 01:49:16.114742	2015-07-14 01:49:16.114742	1
4	GHE 1	Colaboradores que realizam atividades administrativas em escritório em área urbana.	2	2	2015-07-15 18:51:08.059826	2015-07-15 18:51:08.059826	1
5	GHE 1	kjhaadk sadjadka ijdskajs ijsaks ajsk a	2	2	2015-07-15 18:52:35.11927	2015-07-15 18:52:35.11927	1
\.


--
-- Data for Name: enviroments_function_positions; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY enviroments_function_positions (id, function_position_id, enviroment_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	4
5	3	4
6	1	4
7	2	5
8	3	5
9	1	5
\.


--
-- Name: enviroments_function_positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('enviroments_function_positions_id_seq', 9, true);


--
-- Name: enviroments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('enviroments_id_seq', 5, true);


--
-- Data for Name: epcs; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY epcs (id, name, description, ppra_id, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, kind) FROM stdin;
1	Guarda Corpo	GUARDA-CORPO PARA PROTEÇÃO CONTRA QUEDAS \r\n                        \r\n Vergalhão diâmetro ½” ou cabo de aço diâmetro 5/16” ou ¼”  \r\nTubo diâmetro 1” Sch/40 ou cantoneira L  2” x 2” x ¼”  \r\nMadeirite de espessura de 100 mm   	3	2015-07-28 13:34:30.641495	2015-07-28 13:34:30.641495	i397913.jpg	image/jpeg	34125	2015-07-28 13:34:30.388105	\N
2	Guarda Corpo	sgdsh sdshdg hsgdashdg 	5	2015-08-05 14:09:26.583092	2015-08-05 14:09:26.583092	i397913.jpg	image/jpeg	34125	2015-08-05 14:09:26.389095	collective
\.


--
-- Name: epcs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('epcs_id_seq', 2, true);


--
-- Data for Name: epis; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY epis (id, name, description, ppra_id, created_at, updated_at, ca_number, manufacturer, protection_type, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, kind) FROM stdin;
2	LUVA LATEX	Luva de segurança confeccionada em borracha natural, revestimento interno em algodão flocado, antiderrapante na palma e face palmar dos dedos, punho com virola.\r\nPROTEÇÃO DAS MÃOS DO USUÁRIO CONTRA AGENTES ABRASIVOS, ESCORIANTES, CORTANTES E PERFURANTES, E CONTRA AGENTES QUÍMICOS TAIS COMO CLASSE A - TIPO 2: AGRESSIVOS BÁSICOS; CLASSE B - DETERGENTES, SABÕES, AMONÍACO E SIMILARES E CLASSE C - TIPO 3: ÁLCOOIS, TIPO 4: ÉTERES, TIPO 5: CETONAS, TIPO 6: ÁCIDOS ORGÂNICOS.	1	2015-07-27 20:02:15.120837	2015-07-27 20:02:15.120837	15532 	Acme Industries	PROTEÇÃO DAS MÃOS	85335_2205.jpg	image/jpeg	44084	2015-07-27 20:02:14.699671	\N
3	Luvas de Latex	Luva de Segurança confeccionada em fios de algodão revestida com látex natural, palma e dorso corrugado. Sua forma anatômica proporciona excelente ajuste nas mãos e sensibilidade tátil. Esta luva tem excelente resistência à abrasão, conferindo maior durabilidade, palma antiderrapante corrugada que garante maior aderência com objetos úmidos ou molhados, excelente resistência mecânica, possui resistência térmica de – 15Cº a 100°C e proporciona conforto ao usuário devido ao seu suporte têxtil. Tem resistência química a produtos básicos, cetônicos, sabões e detergentes, ela é resistente à corte e abrasão e é muito resistente a rasgos e perfuração.	3	2015-07-28 13:18:30.677372	2015-07-28 13:18:30.677372	33555	Acme	Mãos	85335_2205.jpg	image/jpeg	44084	2015-07-28 13:18:30.385661	\N
4	Luvas de Latex	Luva de segurança confeccionada em borracha natural, revestimento interno em algodão flocado, antiderrapante na palma e face palmar dos dedos, punho com virola.\r\nPROTEÇÃO DAS MÃOS DO USUÁRIO CONTRA AGENTES ABRASIVOS, ESCORIANTES, CORTANTES E PERFURANTES, E CONTRA AGENTES QUÍMICOS TAIS COMO CLASSE A - TIPO 2: AGRESSIVOS BÁSICOS; CLASSE B - DETERGENTES, SABÕES, AMONÍACO E SIMILARES E CLASSE C - TIPO 3: ÁLCOOIS, TIPO 4: ÉTERES, TIPO 5: CETONAS, TIPO 6: ÁCIDOS ORGÂNICOS.\r\nOs níveis de desempenho variam de 0 (zero) a 4 (quatro) para abrasão, rasgamento e perfuração e 0 (zero) a 5 (cinco) para corte, sendo 0 (zero) o pior resultado. A luva de segurança referência "DA-299 Confort Látex" obteve resultado de níveis de desempenho 0010, onde: 0 - Resistência à abrasão; 0 - Resistência ao corte por lâmina; 1 - Resistência ao rasgamento; 0 - Resistência à perfuração por punção	5	2015-07-29 13:15:22.999081	2015-07-29 13:20:26.002335	15532	Danny	Mãos	85335_2205.jpg	image/jpeg	44084	2015-07-29 13:15:22.695258	\N
5	Luvas de Látex	dhsgdhs hgsdsahgd hgsahsg 	5	2015-08-06 00:25:44.316074	2015-08-06 00:25:44.316074	3532	Luvex	Mãos	85335_2205.jpg	image/jpeg	44084	2015-08-06 00:25:44.099615	individual
6	Guarda Corpo	dsdasds wdwdw 	5	2015-08-06 00:29:06.248271	2015-08-06 00:29:06.248271				i397913.jpg	image/jpeg	34125	2015-08-06 00:29:06.003081	collective
7	Treinamento	hdsjdhsjd	5	2015-08-07 01:12:08.704166	2015-08-07 01:12:08.704166				\N	\N	\N	\N	administrative
8	Guarda Corpo	teste descrição	8	2015-08-07 14:08:50.463677	2015-08-07 14:08:50.463677				i397913.jpg	image/jpeg	34125	2015-08-07 14:08:50.234515	collective
9	Luvas de Látex	Descrição Teste luvas	8	2015-08-07 14:09:35.361222	2015-08-07 14:09:41.9134	11111	OSCORP	Mãos	85335_2205.jpg	image/jpeg	44084	2015-08-07 14:09:35.204173	individual
10	Procedimento de parada para descanso	Descrição testeDescrição testeDescrição testeDescrição teste	8	2015-08-07 16:51:01.7718	2015-08-07 16:51:01.7718				\N	\N	\N	\N	administrative
11	Área de Acesso limitada	Algumas funções não serão permitidas em determinados locais.	8	2015-08-07 16:52:41.759037	2015-08-07 16:52:41.759037				\N	\N	\N	\N	organizational
12	Guarda Corpo	asjhashak ashajhsajhs ahsajshajs ajshajshajhs	10	2015-08-18 16:58:55.499642	2015-08-18 16:58:55.499642				i397913.jpg	image/jpeg	34125	2015-08-18 16:58:55.0906	collective
13	Luvas de Borracha	assdadsa dwddwdwd qdafasfas 	10	2015-08-18 16:59:37.07471	2015-08-18 16:59:37.07471	11111	Luvex	Mãos	85335_2205.jpg	image/jpeg	44084	2015-08-18 16:59:36.923498	individual
14	Treinamentos e Palestras	As medidas estão citadas no cronograma do planejamento anual.	10	2015-08-19 14:27:16.054396	2015-08-19 14:27:16.054396				\N	\N	\N	\N	administrative
\.


--
-- Name: epis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('epis_id_seq', 14, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('events_id_seq', 17, true);


--
-- Data for Name: position_risks; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY position_risks (id, collaborator_position_id, collaborator_function_id, sector_id, created_at, updated_at) FROM stdin;
1	1	2	1	2015-07-11 01:26:34.743512	2015-07-11 01:26:34.743512
8	10	51	6	2015-07-20 13:25:19.06636	2015-07-20 13:25:19.06636
9	18	54	10	2015-07-20 14:02:43.96635	2015-07-20 14:02:43.96635
10	18	54	11	2015-07-22 19:12:35.43986	2015-07-22 19:12:35.43986
13	3	4	2	2015-07-23 20:25:57.892652	2015-07-23 20:25:57.892652
14	12	48	6	2015-07-28 13:08:30.47974	2015-07-28 13:08:30.47974
15	26	56	12	2015-07-29 13:07:33.839255	2015-07-29 13:07:33.839255
16	25	55	12	2015-08-02 01:02:04.88911	2015-08-02 01:02:04.88911
17	27	57	12	2015-08-06 00:22:27.136972	2015-08-06 00:22:27.136972
18	28	58	12	2015-08-07 00:39:14.674162	2015-08-07 00:39:14.674162
19	29	59	15	2015-08-07 14:07:12.606967	2015-08-07 14:07:12.606967
20	30	60	15	2015-08-07 15:20:55.824355	2015-08-07 15:20:55.824355
21	7	9	6	2015-08-18 16:57:08.636549	2015-08-18 16:57:08.636549
22	11	11	6	2015-08-18 20:33:50.369296	2015-08-18 20:33:50.369296
23	14	65	16	2015-08-18 20:48:48.846583	2015-08-18 20:48:48.846583
24	13	61	16	2015-08-18 20:49:14.464708	2015-08-18 20:49:14.464708
25	34	33	16	2015-08-18 20:49:45.058788	2015-08-18 20:49:45.058788
26	16	62	6	2015-08-18 20:50:35.703504	2015-08-18 20:50:35.703504
27	12	47	6	2015-08-21 12:08:14.933612	2015-08-21 12:08:14.933612
28	35	66	6	2015-08-21 12:19:48.14848	2015-08-21 12:19:48.14848
29	13	61	6	2015-08-24 18:33:16.710693	2015-08-24 18:33:16.710693
30	31	12	6	2015-08-27 20:13:13.004875	2015-08-27 20:13:13.004875
31	37	68	16	2015-08-28 14:27:14.845529	2015-08-28 14:27:14.845529
33	12	64	6	2015-10-06 14:27:22.169632	2015-10-06 14:27:22.169632
\.


--
-- Data for Name: exam_position_risks; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY exam_position_risks (id, exam_id, position_risk_id, expiration_months, created_at, updated_at) FROM stdin;
1	1	21	12	2015-08-27 17:56:01.196328	2015-08-27 17:56:01.196328
2	1	22	12	2015-08-27 17:56:23.852381	2015-08-27 17:56:23.852381
3	2	26	12	2015-08-27 17:56:48.459192	2015-08-27 17:56:48.459192
4	2	28	12	2015-08-27 17:57:00.32699	2015-08-27 17:57:00.32699
6	6	27	12	2015-08-27 18:05:21.599808	2015-08-27 18:05:21.599808
7	1	27	12	2015-08-27 18:05:37.438352	2015-08-27 18:05:37.438352
8	2	21	12	2015-08-27 20:00:48.446531	2015-08-27 20:00:48.446531
9	5	21	12	2015-08-27 20:00:58.900039	2015-08-27 20:00:58.900039
11	7	21	12	2015-08-27 20:10:20.751875	2015-08-27 20:10:20.751875
12	2	22	12	2015-08-28 00:20:04.191713	2015-08-28 00:20:04.191713
13	5	22	12	2015-08-28 00:20:04.211704	2015-08-28 00:20:04.211704
14	7	22	12	2015-08-28 00:20:04.222612	2015-08-28 00:20:04.222612
15	1	24	12	2015-08-28 00:20:04.240516	2015-08-28 00:20:04.240516
16	2	24	12	2015-08-28 00:20:04.25099	2015-08-28 00:20:04.25099
17	5	24	12	2015-08-28 00:20:04.261596	2015-08-28 00:20:04.261596
18	7	24	12	2015-08-28 00:20:04.272241	2015-08-28 00:20:04.272241
19	1	25	12	2015-08-28 00:20:04.288018	2015-08-28 00:20:04.288018
20	2	25	12	2015-08-28 00:20:04.298372	2015-08-28 00:20:04.298372
21	5	25	12	2015-08-28 00:20:04.308903	2015-08-28 00:20:04.308903
22	7	25	12	2015-08-28 00:20:04.342037	2015-08-28 00:20:04.342037
23	1	26	12	2015-08-28 00:20:04.36497	2015-08-28 00:20:04.36497
24	5	26	12	2015-08-28 00:20:04.376311	2015-08-28 00:20:04.376311
25	7	26	12	2015-08-28 00:20:04.387711	2015-08-28 00:20:04.387711
26	2	27	12	2015-08-28 00:20:04.405534	2015-08-28 00:20:04.405534
27	5	27	12	2015-08-28 00:20:04.416363	2015-08-28 00:20:04.416363
28	7	27	12	2015-08-28 00:20:04.427503	2015-08-28 00:20:04.427503
29	1	28	12	2015-08-28 00:20:04.44539	2015-08-28 00:20:04.44539
30	5	28	12	2015-08-28 00:20:04.456299	2015-08-28 00:20:04.456299
31	7	28	12	2015-08-28 00:20:04.467181	2015-08-28 00:20:04.467181
32	1	29	12	2015-08-28 00:20:04.484304	2015-08-28 00:20:04.484304
33	2	29	12	2015-08-28 00:20:04.494866	2015-08-28 00:20:04.494866
34	5	29	12	2015-08-28 00:20:04.505661	2015-08-28 00:20:04.505661
35	7	29	12	2015-08-28 00:20:04.516664	2015-08-28 00:20:04.516664
36	1	30	12	2015-08-28 00:20:04.533252	2015-08-28 00:20:04.533252
37	2	30	12	2015-08-28 00:20:04.544091	2015-08-28 00:20:04.544091
38	5	30	12	2015-08-28 00:20:04.555266	2015-08-28 00:20:04.555266
39	7	30	12	2015-08-28 00:20:04.5663	2015-08-28 00:20:04.5663
40	1	23	12	2015-08-31 11:48:07.961043	2015-08-31 11:48:07.961043
41	2	23	12	2015-08-31 11:48:07.97573	2015-08-31 11:48:07.97573
42	5	23	12	2015-08-31 11:48:07.986684	2015-08-31 11:48:07.986684
43	7	23	12	2015-08-31 11:48:07.997132	2015-08-31 11:48:07.997132
44	1	31	12	2015-08-31 11:48:08.041102	2015-08-31 11:48:08.041102
45	2	31	12	2015-08-31 11:48:08.05183	2015-08-31 11:48:08.05183
46	5	31	12	2015-08-31 11:48:08.062479	2015-08-31 11:48:08.062479
47	7	31	12	2015-08-31 11:48:08.072899	2015-08-31 11:48:08.072899
\.


--
-- Name: exam_position_risks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('exam_position_risks_id_seq', 47, true);


--
-- Name: exams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('exams_id_seq', 7, true);


--
-- Data for Name: fills; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY fills (id, questions_answers, checklist_id, user_id, created_at, updated_at) FROM stdin;
1	--- !ruby/hash:ActionController::Parameters\nquestion-1: !ruby/hash:ActionController::Parameters\n  label: 1-questão teste T\n  hint: Teste ajuda\n  answer: Conforme\nquestion-2: !ruby/hash:ActionController::Parameters\n  label: 2- questão teste 2\n  hint: teste ajuda 2\n  answer: Não conforme\n	1	2	2015-07-14 14:32:18.897371	2015-07-14 14:32:18.897371
3	--- !ruby/hash:ActionController::Parameters\nquestion-5: !ruby/hash:ActionController::Parameters\n  label: 1- Existem fontes de ruído nesse setor?\n  hint: 'Exemplo: Máquinas, equipamentos, ou atividades que emitam ruído.'\n  answer: Conforme\nquestion-6: !ruby/hash:ActionController::Parameters\n  label: Quais são as fontes existentes?\n  hint: Cite as fontes de ruído com uma breve descrição.\n  answer: Conforme\nquestion-7: !ruby/hash:ActionController::Parameters\n  label: 2 - Existem fontes de calor nesse setor?\n  hint: 'Exemplo: Máquinas, equipamentos, ou atividades que emitam propaguem calor.'\n  answer: Não se aplica\n	3	2	2015-08-05 13:54:29.530777	2015-08-05 13:54:29.530777
2	--- !ruby/hash:ActionController::Parameters\nquestion-3: !ruby/hash:ActionController::Parameters\n  label: 1-Existe fonte de ruído neste ambiente?\n  hint: Teste1\n  answer: Conforme\nquestion-4: !ruby/hash:ActionController::Parameters\n  label: 2 - Existe fonte de calor neste ambiente através de máquinas e equipamentos?\n  hint: teste 2\n  answer: Conforme\n	2	2	2015-07-29 14:44:17.228578	2015-08-06 18:31:58.117326
4	--- !ruby/hash:ActionController::Parameters\nquestion-8: !ruby/hash:ActionController::Parameters\n  label: 1 - Os equipamentos de segurança estão de acordo com NR - 35?\n  hint: ''\n  answer: Conforme\n	4	2	2015-08-31 17:24:13.139647	2015-09-23 18:19:17.788668
\.


--
-- Name: fills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('fills_id_seq', 4, true);


--
-- Data for Name: functions_trainings; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY functions_trainings (collaborator_function_id, training_id) FROM stdin;
55	3
59	3
55	4
56	4
57	4
58	4
70	18
66	19
55	6
56	6
57	6
58	6
70	20
4	21
6	21
7	21
2	21
3	21
8	21
9	21
10	21
11	21
12	21
13	21
14	21
15	21
16	21
17	21
18	21
19	21
20	21
21	21
22	21
23	21
24	21
9	10
9	11
12	11
10	11
65	10
9	12
65	12
9	13
25	21
9	14
67	14
9	15
26	21
3	13
27	21
28	21
29	21
30	21
31	21
32	21
33	21
34	21
35	21
36	21
37	21
38	21
39	21
40	21
41	21
42	21
43	21
44	21
45	21
46	21
47	21
48	21
49	21
50	21
51	21
52	21
53	21
55	21
56	21
57	21
58	21
59	21
60	21
61	21
62	21
63	21
64	21
65	21
66	21
67	21
68	21
69	21
70	21
\.


--
-- Data for Name: incidents; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY incidents (id, collaborator_id, project_id, description, occurrence_date, created_at, updated_at, location, action, people_type, material_type, installations_type, maintainer_id) FROM stdin;
1	1	2	teste descrição	2015-07-09	2015-07-11 01:17:14.539217	2015-07-11 01:17:14.539217	Local teste	Ação teste	t	t	f	\N
2	1	2	Teste descrição 2	2015-07-12	2015-07-14 02:08:45.226176	2015-07-14 02:08:45.226176	Local 1	Ação 1	t	t	t	\N
3	1	2	xxxxxxxxxxx	2015-07-12	2015-07-14 12:22:18.539186	2015-07-14 12:22:18.539186	Portaria	yyyyyyyyyyyyyy	t	f	f	\N
4	2	2	xxxxx	2015-07-02	2015-07-14 13:09:08.75706	2015-07-14 13:09:08.75706	Portaria	xxxxxxx	t	f	f	\N
5	2	2	x	2016-03-03	2015-07-14 13:42:21.27748	2015-07-14 13:42:21.27748	x	x	t	f	f	\N
8	4	2	descrição	2015-07-17	2015-07-20 14:13:26.660344	2015-07-20 14:13:26.660344	local	ação	t	f	f	\N
9	2	2	teste	2015-07-20	2015-07-20 14:17:31.845521	2015-07-20 14:17:31.845521	teste	teste	t	f	f	\N
10	6	5	sgdfgsdg	2015-08-03	2015-08-05 00:22:07.23421	2015-08-05 00:22:07.23421	fdfdsfsdf	fdfdsf	t	f	f	\N
11	2	4	Veículo em alta velocidade.	2015-08-04	2015-08-05 13:56:35.511255	2015-08-05 13:56:35.511255	Estrada do Açu	Informado ao condutor fulano de tal sobre o limite permitido no trecho.	t	f	f	\N
12	6	5	Teste descrição 	2015-08-06	2015-08-06 18:30:55.528582	2015-08-06 18:30:55.528582	Pátio	Teste ação 	t	f	f	7
13	4	5	acdafdf	2015-08-19	2015-08-19 21:33:11.284163	2015-08-19 21:33:11.284163	dasdsdad	adasdasd	f	f	t	5
14	13	7	dvvsdfsf	2015-08-01	2015-08-31 17:30:53.411591	2015-08-31 17:30:53.411591	dfsdfs	dfdsfsd	t	f	f	14
\.


--
-- Name: incidents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('incidents_id_seq', 14, true);


--
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY invitations (id, account_id, inviter, token, gest_email, status, created_at, updated_at, user_kind, projects_permissions) FROM stdin;
\.


--
-- Name: invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('invitations_id_seq', 1, false);


--
-- Data for Name: pcmso_section_images; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY pcmso_section_images (id, url, pcmso_section_id, image_file_name, image_content_type, image_file_size, image_updated_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: pcmso_section_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('pcmso_section_images_id_seq', 1, false);


--
-- Data for Name: pcmso_sections; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY pcmso_sections (id, title, description, pcmso_id, component_position, component, "position", kind, link_images, created_at, updated_at) FROM stdin;
1	Introdução	<div>sdbnsbdnssdgsdg shdgshgd sdgshdg s</div>	10	top	company_description	1	item		2015-08-26 21:11:49.124725	2015-08-26 21:11:49.124725
\.


--
-- Name: pcmso_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('pcmso_sections_id_seq', 1, true);


--
-- Data for Name: pcmsos_collaborators; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY pcmsos_collaborators (pprapcmso_id, collaborator_id, created_at, updated_at) FROM stdin;
10	8	2015-08-26 21:06:35.964777	2015-08-26 21:06:35.964777
\.


--
-- Data for Name: pcmsos_coordinators; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY pcmsos_coordinators (pprapcmso_id, collaborator_id, created_at, updated_at) FROM stdin;
10	5	2015-08-26 21:06:04.598241	2015-08-26 21:06:04.598241
10	12	2015-08-31 11:46:40.021688	2015-08-31 11:46:40.021688
\.


--
-- Data for Name: pcmsos_examiners; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY pcmsos_examiners (pprapcmso_id, collaborator_id, created_at, updated_at) FROM stdin;
10	5	2015-08-26 21:06:17.803848	2015-08-26 21:06:17.803848
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY roles (id, account_id, name, pcmso, ppra, ri, checklist, aso, training, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY permissions (id, account_user_id, project_id, role_id) FROM stdin;
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('permissions_id_seq', 1, false);


--
-- Data for Name: risk_categories; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY risk_categories (id, name, created_at, updated_at, account_id, measurement_unit) FROM stdin;
1	Ruído	2015-07-11 01:08:28.233686	2015-07-11 01:08:28.233686	2	\N
2	Calor	2015-07-11 01:08:35.28161	2015-07-11 01:08:35.28161	2	\N
3	Vírus	2015-07-11 01:08:46.204869	2015-07-11 01:08:46.204869	2	\N
4	Poeira	2015-07-11 01:08:55.028429	2015-07-11 01:08:55.028429	2	\N
5	Bactérias	2015-07-11 01:09:02.940095	2015-07-11 01:09:02.940095	2	\N
6	Categoria 2	2015-07-20 14:01:22.263785	2015-07-20 14:01:22.263785	1	
7	Calor	2015-07-23 17:33:51.480491	2015-07-23 17:33:51.480491	2	°C (IBTUG)
8	Ruído	2015-07-23 20:25:38.419212	2015-07-23 20:25:38.419212	2	dB(A)
9	Radiação Não Ionizante	2015-07-28 22:12:04.271002	2015-07-28 22:12:04.271002	2	mw/cm²
10	Poeira	2015-07-29 13:06:12.996977	2015-07-29 13:06:12.996977	2	mg/m3
11	Bactérias, vírus e bacilos	2015-08-21 12:11:22.664384	2015-08-21 12:11:22.664384	2	Não se aplica
\.


--
-- Data for Name: risk_exposures; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY risk_exposures (id, name, created_at, updated_at, account_id) FROM stdin;
1	Habitual	2015-07-11 01:10:16.40502	2015-07-11 01:10:16.40502	2
2	Intermitente	2015-07-11 01:10:31.479726	2015-07-11 01:10:31.479726	2
3	Eventual	2015-07-11 01:10:47.081946	2015-07-11 01:10:47.081946	2
4	Exposição 1	2015-07-20 14:02:38.164429	2015-07-20 14:02:38.164429	1
\.


--
-- Data for Name: risk_trajectories; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY risk_trajectories (id, name, created_at, updated_at, account_id) FROM stdin;
1	Aérea	2015-07-11 01:09:28.79513	2015-07-11 01:09:28.79513	2
2	Cutânea	2015-07-11 01:09:36.978827	2015-07-11 01:09:36.978827	2
3	Contato	2015-07-11 01:09:48.918967	2015-07-11 01:09:48.918967	2
4	Trajetória 1	2015-07-20 14:01:34.338588	2015-07-20 14:01:34.338588	1
\.


--
-- Data for Name: risk_types; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY risk_types (id, name, created_at, updated_at, account_id) FROM stdin;
1	Físico	2015-07-11 01:07:34.489469	2015-07-11 01:07:34.489469	2
2	Químico	2015-07-11 01:07:56.612317	2015-07-11 01:07:56.612317	2
3	Biológico	2015-07-11 01:08:14.862292	2015-07-11 01:08:14.862292	2
4	Tipo 1	2015-07-20 14:01:11.83873	2015-07-20 14:01:11.83873	1
\.


--
-- Data for Name: risks; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY risks (id, risk_type_id, risk_category_id, risk_exposure_id, risk_trajectory_id, enviroment_id, created_at, updated_at, generating_sources, nocive_agents_effects, control_measures, ppra_id) FROM stdin;
1	3	5	3	3	\N	2015-07-11 01:11:47.234756	2015-07-11 01:11:47.234756	Fonte teste	Efeito Teste	Medida Teste	\N
2	1	1	1	1	\N	2015-07-11 01:26:07.945011	2015-07-11 01:26:07.945011	Fonte teste	Efeito teste	Medida teste	\N
3	2	4	3	1	\N	2015-07-11 01:28:27.266992	2015-07-11 01:28:27.266992	Fonte teste 2	Efeito teste 2	Medida teste 2	\N
4	1	2	3	3	\N	2015-07-11 01:30:16.173353	2015-07-11 01:30:16.173353	Fonte 2	Efeito 2	Medida 2	\N
5	3	5	1	2	\N	2015-07-11 13:47:50.011592	2015-07-11 13:47:50.011592	Fonte 1	Efeito 1	Medida 1	\N
6	1	1	1	1	\N	2015-07-11 14:27:16.14553	2015-07-11 14:27:16.14553	Fonte 1	Efeito 1	Medida 1	\N
7	1	2	1	3	\N	2015-07-11 14:32:06.061999	2015-07-11 14:32:06.061999	Fonte 2	Efeito 2	Medida 2	\N
8	2	4	1	1	\N	2015-07-11 14:32:40.195947	2015-07-11 14:32:40.195947	Fonte 3	Efeito 3	Medida 3	\N
9	1	1	1	1	\N	2015-07-11 14:36:51.099197	2015-07-11 14:36:51.099197	Fonte 1	Efeito 1	Medida1	\N
10	3	4	1	1	\N	2015-07-11 14:37:25.649786	2015-07-11 14:37:25.649786	Fonte 2	Efeito 2	Medida 2	\N
11	1	2	3	3	\N	2015-07-20 12:49:42.772946	2015-07-20 12:49:42.772946	Fonte 1	Efeito 1	Medida 1	\N
12	1	1	3	1	\N	2015-07-20 12:50:30.118194	2015-07-20 12:50:30.118194	Fonte 2	Efeito 2	Medida 2	\N
13	1	2	3	3	\N	2015-07-20 13:01:20.585591	2015-07-20 13:01:20.585591	Fonte 1 	Efeito 1	Medida 1	\N
14	1	1	3	1	\N	2015-07-20 13:01:49.726291	2015-07-20 13:01:49.726291	Fonte 2	Efeito 2	Medida 2	\N
15	3	5	3	2	\N	2015-07-20 13:02:20.49104	2015-07-20 13:02:20.49104	Fonte 3	Efeito 3	Medida 3	\N
16	2	4	3	1	\N	2015-07-20 13:03:58.631281	2015-07-20 13:03:58.631281	Fonte 4	Efeito 4	Medida 4	\N
17	1	1	3	1	\N	2015-07-20 13:07:23.066331	2015-07-20 13:07:23.066331	Fonte 2	Efeito 2	Medida 2	\N
18	4	6	4	4	\N	2015-07-20 14:02:41.138018	2015-07-20 14:02:41.138018	1	1	1	\N
19	4	6	4	4	\N	2015-07-20 14:11:13.461806	2015-07-20 14:11:13.461806	22	22	22	4
20	1	2	3	3	\N	2015-07-20 14:24:34.850452	2015-07-20 14:24:34.850452	Fonte 1	Efeito 1	Medida 1	3
21	1	2	3	3	\N	2015-07-20 14:28:51.329297	2015-07-20 14:28:51.329297	teste 2 	teste 2	teste2	3
22	1	1	1	1	\N	2015-07-20 14:29:55.797304	2015-07-20 14:29:55.797304	Teste 3	Teste 3	Teste 3	3
23	3	5	3	2	\N	2015-07-20 14:35:09.338222	2015-07-20 14:35:09.338222	teste	teste	teste	3
24	4	6	4	4	\N	2015-07-22 19:12:33.866205	2015-07-22 19:12:33.866205	22	22	22	4
25	1	1	3	1	\N	2015-07-23 16:52:37.285233	2015-07-23 16:52:37.285233	vjhghjg	gfkjgjhg	oçuhjkhkjh	3
26	1	7	2	1	\N	2015-07-23 17:34:14.117699	2015-07-23 17:34:14.117699	Exemplo	Exemplo	Exemplo	1
27	1	8	3	1	\N	2015-07-23 20:25:50.730888	2015-07-23 20:25:50.730888	asasd	fasfafs	fsafaF	1
28	1	7	1	1	\N	2015-07-28 13:12:27.501571	2015-07-28 13:12:27.501571	kdskjdhsjk jahsjahsj	knsjkahsj sjkdhsjkdh	jshdjshdjsh	3
29	1	8	3	1	\N	2015-07-28 14:41:29.662897	2015-07-28 14:41:29.662897	dgshdgsh jjgsdhsgdhsg	shgdhsdg hsgdhsgd hghg	DGHSGDHSGD HGSDHSGDHGS	3
30	1	9	3	1	\N	2015-07-28 22:12:24.530702	2015-07-28 22:12:24.530702	dgdgdg 	etetet	rtetrtretr	3
31	1	10	1	1	\N	2015-07-29 13:06:46.912227	2015-07-29 13:06:46.912227	sasds	asdasd	asdsda	5
32	2	10	1	1	\N	2015-07-29 13:07:29.598772	2015-07-29 13:07:29.598772	asdasds	sdasd	dsdasda	5
33	1	8	1	1	\N	2015-08-07 01:14:03.041513	2015-08-07 01:14:03.041513	Fonte teste	Efeito teste	Medida teste	5
34	1	8	3	1	\N	2015-08-07 14:06:41.332778	2015-08-07 14:06:41.332778	Máquinas e equipamentos	Perda auditiva	Uso de protetor auricular.	8
35	1	7	3	1	\N	2015-08-18 16:55:11.999662	2015-08-18 16:55:11.999662	idshdkjhsjkdhsjh	kjshdsjkdhkjsdhj	jshdjshdjshdj	10
36	1	9	1	3	\N	2015-08-18 16:55:38.764454	2015-08-18 16:55:38.764454	ddsdadawdd	dwdwqdqwdq	wdqdqwdqwdqwds	10
37	3	10	3	1	\N	2015-08-18 16:55:58.540349	2015-08-18 16:55:58.540349	adqwdqwed	weqweeqw	weqweewqwe	10
38	1	7	3	1	\N	2015-08-18 20:46:46.166031	2015-08-18 20:46:46.166031	dfsdfds dfadfdf  afsadsd 	d asdd  sdasdasd asdasdas sad	 dsdadasd asdas d asda sd asdda	10
39	2	10	3	1	\N	2015-08-18 20:47:56.166618	2015-08-18 20:47:56.166618	gfgfgfg hghfghfghf hgfhgf	jfjhgfgf hfghfhg fgfgf 	hfhgfg gfgfg hdhg 	10
40	1	8	3	1	\N	2015-08-18 20:48:40.232833	2015-08-18 20:48:40.232833	jhgjhghgjh jgfhgfhf gdjghf uhfghg	lknjkhjkg hgjhghj hughjghjg 	gfgfgffgfgf gfgfgfggfg gfgfkgjh u	10
41	1	7	3	3	\N	2015-08-20 14:17:21.211543	2015-08-20 14:17:21.211543	ghgshgwhwghg hgshsghwgdhgdhsg dhhgwdhgshdgsh shdgshdghsgdhsdg dgshdgshgdhsdg hdsghdgshd shgdshgdhsgdh	dhgdhsgdhsgd dgshdgshdghs shdgshgdshgd sgdhgshdghsg shdgshdghs dhsgdhsghdg sdgshgdhs shgdhsgdh shgdshgdh	hdsgdhgshdgs sgdhgshdgsh shdgshgdhs dshgdhsgdh shdghsgdhsg shdgshgd hsgdhsgdh dhsgdhsdg shdgshdghs	10
42	1	7	3	2	\N	2015-08-20 14:21:41.107298	2015-08-20 14:21:41.107298	 Fornos e fogões em funcionamento 	Desidratação, erupção da pele, cãibras, fadiga física, distúrbios psiconeuróticos, problemas cardiovasculares.	Limitação de tempo de exposição, ventilação no local e ingestão de bastante liquido. Ventilação do local orientação do uso correto de EPI, (avental, botas e luvas especiais).	10
43	1	8	3	1	\N	2015-08-20 14:26:14.070295	2015-08-20 14:26:14.070295	Coifa, Exaustores, Descascador, Processador, Liquidificador industrial em funcionamento. 	Perda de audição, alteração limiar auditivo comprometimento da discriminação auditiva, hiperacusia, hipertensão arterial e ruptura, traumática do tímpano. 	Limitação do tempo de exposição.Uso de protetor auricular tipo concha Orientação sobre uso correto de EPI.	10
44	3	11	3	3	\N	2015-08-21 12:18:17.688811	2015-08-21 12:18:17.688811	Utensílios e equipamentos utilizados em ambulatório contaminados. Exemplo: agulhas descartáveis e gaze. 	Doenças	Utilização de luvas e máscaras. Equipamentos com proteção adequada dos perfurocortantes. Caixa coletora de materiais perfurocortantes adequada. 	10
45	1	8	3	1	\N	2015-10-06 14:14:41.283697	2015-10-06 14:14:41.283697	fonte 1	efeito 1	medida 1	10
\.


--
-- Data for Name: pfs_risks; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY pfs_risks (id, position_risk_id, risk_id, created_at, updated_at, action_level, tolerance_limit) FROM stdin;
1	9	19	2015-07-20 14:11:15.276487	2015-07-20 14:11:15.276487	\N	\N
13	8	20	2015-07-20 14:33:13.410232	2015-07-20 14:33:13.410232	\N	\N
14	8	22	2015-07-20 14:33:13.417962	2015-07-20 14:33:13.417962	\N	\N
15	10	24	2015-07-22 19:12:35.48413	2015-07-22 19:12:35.48413	\N	\N
28	13	27	2015-07-23 20:25:57.922513	2015-07-23 20:25:57.922513	\N	\N
30	1	27	2015-07-28 00:11:45.407386	2015-07-28 00:11:45.407386	\N	\N
35	14	28	2015-07-28 22:12:32.761095	2015-07-28 22:12:32.761095	\N	\N
36	14	30	2015-07-28 22:12:32.765267	2015-07-28 22:12:32.765267	\N	\N
37	15	32	2015-07-29 13:07:33.871876	2015-07-29 14:15:44.034423	33	35
29	1	26	2015-07-28 00:11:45.397282	2015-07-30 17:11:27.751919	11	12
38	16	32	2015-08-02 01:02:04.951438	2015-08-05 14:07:08.496082	55	45
40	17	32	2015-08-06 00:22:27.191393	2015-08-06 00:23:37.59023	42	45
41	18	32	2015-08-07 00:39:46.235406	2015-08-07 00:44:42.795113	33	35
43	15	33	2015-08-07 01:14:50.799688	2015-08-07 01:14:50.799688	\N	\N
44	18	33	2015-08-07 01:15:10.763617	2015-08-07 01:15:10.763617	\N	\N
45	16	33	2015-08-07 01:15:26.643423	2015-08-07 01:15:26.643423	\N	\N
42	17	33	2015-08-07 01:14:20.290611	2015-08-07 01:16:49.073335	80	85
46	19	34	2015-08-07 14:07:12.652354	2015-08-07 14:07:41.514392	80	85
47	20	34	2015-08-07 15:20:55.861849	2015-08-07 15:21:20.946035	80	85
50	21	30	2015-08-18 16:57:08.734583	2015-08-18 16:57:47.099832	20	25
52	22	28	2015-08-18 20:33:50.394779	2015-08-18 20:33:50.394779	\N	\N
53	22	36	2015-08-18 20:34:17.777583	2015-08-18 20:34:17.777583	\N	\N
54	22	37	2015-08-18 20:34:17.784956	2015-08-18 20:34:17.784956	\N	\N
55	23	38	2015-08-18 20:48:48.869415	2015-08-18 20:48:48.869415	\N	\N
56	23	39	2015-08-18 20:48:48.880517	2015-08-18 20:48:48.880517	\N	\N
57	23	40	2015-08-18 20:48:48.941146	2015-08-18 20:48:48.941146	\N	\N
58	24	40	2015-08-18 20:49:14.483714	2015-08-18 20:49:14.483714	\N	\N
59	24	39	2015-08-18 20:49:14.493221	2015-08-18 20:49:14.493221	\N	\N
60	24	38	2015-08-18 20:49:14.50464	2015-08-18 20:49:14.50464	\N	\N
61	26	37	2015-08-18 20:50:35.738576	2015-08-18 20:50:35.738576	\N	\N
62	26	36	2015-08-18 20:50:35.749044	2015-08-18 20:50:35.749044	\N	\N
64	25	37	2015-08-18 20:50:55.207206	2015-08-18 20:50:55.207206	\N	\N
65	25	39	2015-08-18 20:50:55.215327	2015-08-18 20:50:55.215327	\N	\N
67	21	42	2015-08-20 14:21:54.764208	2015-08-20 14:23:10.470783	23	25
68	21	43	2015-08-20 14:26:34.289962	2015-08-20 14:27:41.14009	11	10
69	27	42	2015-08-21 12:08:15.013094	2015-08-21 12:08:15.013094	\N	\N
70	27	43	2015-08-21 12:08:15.02425	2015-08-21 12:08:15.02425	\N	\N
71	28	42	2015-08-21 12:19:48.169939	2015-08-21 12:19:48.169939	\N	\N
72	28	43	2015-08-21 12:19:48.178991	2015-08-21 12:19:48.178991	\N	\N
73	28	44	2015-08-21 12:19:48.187799	2015-08-21 12:19:48.187799	\N	\N
63	25	35	2015-08-18 20:50:55.197294	2015-08-21 12:47:03.699386	22	23
74	29	42	2015-08-24 18:33:16.747244	2015-08-24 18:33:16.747244	\N	\N
75	29	43	2015-08-24 18:33:16.755477	2015-08-24 18:33:16.755477	\N	\N
76	29	36	2015-08-24 18:33:16.763273	2015-08-24 18:33:16.763273	\N	\N
77	30	42	2015-08-27 20:13:13.079071	2015-08-27 20:13:13.079071	\N	\N
78	30	43	2015-08-27 20:13:13.08904	2015-08-27 20:13:13.08904	\N	\N
80	31	39	2015-08-28 14:27:14.917613	2015-08-28 14:27:14.917613	\N	\N
81	31	40	2015-08-28 14:27:14.923307	2015-08-28 14:27:14.923307	\N	\N
83	22	30	2015-08-31 17:53:32.371179	2015-08-31 17:53:32.371179	\N	\N
84	22	42	2015-08-31 17:53:32.385792	2015-08-31 17:53:32.385792	\N	\N
85	22	43	2015-08-31 17:53:32.394099	2015-08-31 17:53:32.394099	\N	\N
86	23	30	2015-08-31 17:53:32.407054	2015-08-31 17:53:32.407054	\N	\N
87	23	42	2015-08-31 17:53:32.414288	2015-08-31 17:53:32.414288	\N	\N
88	23	43	2015-08-31 17:53:32.422069	2015-08-31 17:53:32.422069	\N	\N
89	24	30	2015-08-31 17:53:32.43408	2015-08-31 17:53:32.43408	\N	\N
90	24	42	2015-08-31 17:53:32.440967	2015-08-31 17:53:32.440967	\N	\N
91	24	43	2015-08-31 17:53:32.448057	2015-08-31 17:53:32.448057	\N	\N
92	25	30	2015-08-31 17:53:32.459935	2015-08-31 17:53:32.459935	\N	\N
93	25	42	2015-08-31 17:53:32.467046	2015-08-31 17:53:32.467046	\N	\N
94	25	43	2015-08-31 17:53:32.474342	2015-08-31 17:53:32.474342	\N	\N
95	26	30	2015-08-31 17:53:32.485729	2015-08-31 17:53:32.485729	\N	\N
96	26	42	2015-08-31 17:53:32.492579	2015-08-31 17:53:32.492579	\N	\N
97	26	43	2015-08-31 17:53:32.505017	2015-08-31 17:53:32.505017	\N	\N
98	27	30	2015-08-31 17:53:32.519005	2015-08-31 17:53:32.519005	\N	\N
99	31	30	2015-08-31 17:54:57.371939	2015-08-31 17:54:57.371939	\N	\N
102	33	30	2015-10-06 14:27:22.199163	2015-10-06 14:27:22.199163	\N	\N
103	33	42	2015-10-06 14:27:22.209962	2015-10-06 14:27:22.209962	\N	\N
104	33	43	2015-10-06 14:27:22.217952	2015-10-06 14:27:22.217952	\N	\N
\.


--
-- Name: pfs_risks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('pfs_risks_id_seq', 104, true);


--
-- Name: position_risks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('position_risks_id_seq', 33, true);


--
-- Data for Name: position_risks_pprapcmsos; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY position_risks_pprapcmsos (id, ppra_id, position_risk_id) FROM stdin;
1	1	1
8	3	8
9	4	9
10	4	10
13	1	13
14	3	14
15	5	15
16	5	16
17	5	17
18	5	18
19	8	19
20	8	20
21	10	21
22	10	22
23	10	23
24	10	24
25	10	25
26	10	26
27	10	27
28	10	28
29	10	29
30	10	30
31	10	31
33	10	33
\.


--
-- Name: position_risks_pprapcmsos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('position_risks_pprapcmsos_id_seq', 33, true);


--
-- Data for Name: ppra_sections; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY ppra_sections (id, title, description, ppra_id, component_position, component, created_at, updated_at, "position", kind, link_images) FROM stdin;
5	Introdução	<p>asdasdsda wwsdsd sdsd&nbsp;</p>	5	top		2015-08-05 14:15:08.746574	2015-08-05 14:15:08.746574	2	item	\N
3	Abrangência	Este Programa abrange os riscos ambientais identificados no ambiente laboral da empresa, através dos Laudos Técnicos das Condições do Ambiente de Trabalho - LTCAT ou Demonstrações Ambientais, conforme estabelecido pela NR-9 em seu item 9.1.5 - consideram-se riscos ambientais os agentes físicos, químicos e biológicos existentes nos ambientes de trabalho que, em função de sua natureza, concentração ou intensidade e tempo de exposição, tenham capacidade de causar danos à saúde do funcionário.\r\nConsideram-se agentes físicos as diversas formas de energia a que possam estar expostos os empregados, tais como ruído, vibrações, pressões anormais, temperaturas extremas, radiações ionizantes, radiações não ionizantes, bem como o infra-som e o ultra-som.\r\nConsideram-se agentes químicos as substâncias, compostos ou produtos que possam penetrar no organismo pelas vias respiratórias, nas formas de poeiras, fumos, névoas, neblinas, gases ou vapores, ou seja, pela natureza da atividade de exposição, possam ter contato ou ser absorvidos pelo organismo através da pele ou por ingestão.\r\nConsideram-se agentes biológicos as bactérias, fungos, bacilos, parasitas, protozoários, vírus, substâncias compostas ou produtos químicos em geral. \r\nTal como previsto na NR-9, do Programa de Prevenção de Riscos Ambientais - PPRA deverá conter no mínimo a seguinte estrutura:\r\n•\tPlanejamento anual com estabelecimento de metas, prioridades e cronograma;\r\n•\tEstratégia e metodologia de ação;\r\n•\tForma de registro, manutenção e divulgação dos dados;\r\n•\tPeriodicidade e forma de avaliação do desenvolvimento do PPRA.\r\n	1	top	option_1	2015-07-14 01:47:55.638729	2015-07-30 21:00:03.835874	3	\N	\N
1	Introdução	O Programa de Prevenção de Riscos Ambientais - PPRA é parte integrante do conjunto mais ampla das iniciativas da empresa no campo de preservação, da saúde e da integridade física dos empregados, devendo estar articulado com as demais Normas de Saúde e Segurança no Trabalho, em particular com o Programa de Controle Médico de Saúde Ocupacional - PCMSO.\r\nEste Programa foi elaborado de acordo com as diretrizes da NR-9.\r\n	1	top	option_1	2015-07-14 01:41:13.896571	2015-07-30 21:07:03.819053	1	\N	\N
2	Objetivo	Preservação da Saúde e da integridade física dos empregados, bem como a proteção do meio ambiente.\r\nDeve-se também atender os requisitos mínimos exigidos pela lei 6.514 de 22 de dezembro de 1997, Portaria 3.214 de 08 de junho de 1978.\r\nNo intuito de preservar a saúde e a integridade do trabalhador, foi realizada uma avaliação de toda à empresa, procurando detectar todos e quaisquer riscos ambientais, seja ele físico, químico ou biológico porventura existente no local de trabalho. \r\n	1	top	option_1	2015-07-14 01:45:31.869325	2015-07-30 21:07:03.825213	2	\N	\N
4	Introdução	<p>O Programa  de Preven&ccedil;&atilde;o de Riscos Ambientais - PPRA &eacute; parte integrante do conjunto mais  ampla das iniciativas da empresa no campo de preserva&ccedil;&atilde;o, da sa&uacute;de e da  integridade f&iacute;sica dos empregados, devendo estar articulado com as demais Normas  de Sa&uacute;de e Seguran&ccedil;a no Trabalho, em particular com o Programa de Controle  M&eacute;dico de Sa&uacute;de Ocupacional - PCMSO.</p><p>Este Programa  foi elaborado de acordo com as diretrizes da NR-9.</p>	5	bottom	company_description	2015-08-05 14:14:09.220192	2015-08-05 14:14:09.220192	1	item	\N
10	Objetivo	<p>Teste objetivo&nbsp;Teste objetivoTeste objetivoTeste objetivoTeste objetivoTeste objetivoTeste objetivoTeste objetivoTeste objetivoTeste objetivoTeste objetivoTeste objetivoTeste objetivoTeste objetivo</p><p>Teste objetivoTeste objetivoTeste objetivoTeste objetivoTeste objetivoTeste objetivo</p><p>Teste objetivoTeste objetivoTeste objetivoTeste objetivo</p>	8	top		2015-08-07 21:03:58.744039	2015-08-12 16:55:10.767127	2	item	
11	1.1 Objetivo	<p>Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;Objetivo teste&nbsp;</p>	8	top		2015-08-07 21:04:52.326367	2015-08-12 16:55:10.775575	3	subitem	
12	Certficado de Calibração	<p><img class="fr-fin fr-dib" alt="Image title" src="/system/section_images/images/000/000/002/original/RackMultipart20150807-10674-1mewrzc.jpg?1438981573" width="300"></p><p>teste teste certificado&nbsp;teste teste certificadoteste teste certificadoteste teste certificadoteste teste certificadoteste teste certificado</p>	8	top	risks	2015-08-07 21:05:37.15772	2015-08-07 21:32:11.163238	5	attachment	,/system/section_images/images/000/000/002/original/RackMultipart20150807-10674-1mewrzc.jpg?1438981573
13	Descrição do Anexos		8	top		2015-08-07 21:27:25.957037	2015-08-12 16:56:13.986972	4	item	
21	Definição das responsábilidades	\N	10	\N	\N	2015-08-18 16:53:32.887663	2015-08-20 16:41:37.835941	8	item	\N
9	Introdução	<p>Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;</p><p>Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;</p><p>Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;Introdu&ccedil;&atilde;o teste&nbsp;</p>	8	top	company_description	2015-08-07 21:02:56.626242	2015-08-09 20:52:52.528324	1	item	
14	Introdução		7	bottom	company_description	2015-08-18 15:21:48.389106	2015-08-18 15:21:48.389106	1	item	
17	Definições	\N	10	\N	\N	2015-08-18 16:53:32.857941	2015-08-18 16:53:32.857941	3	item	\N
22	Descrição da empresa	\N	10	top	company_description	2015-08-18 16:53:32.895125	2015-08-20 16:41:37.84444	9	item	\N
23	Desenvolvimento	\N	10	\N	\N	2015-08-18 16:53:32.902249	2015-08-20 16:41:37.852222	10	item	\N
16	Referências	<div>Lei 65414, de 22/12/1977;</div><div><br></div><div>Lei 8.213/81 - Regulamento dos Benef&iacute;cios da Previd&ecirc;ncia Social;</div><div><br></div><div>Decreto 4.882 de 18/11/2003 - Estabelece o uso das Normas de Higiene;</div><div><br></div><div>Ocupacional da Fundacentro como m&eacute;todos de monitoramento a serem seguidos;</div><div><br></div><div>Decreto 3.048/1999 - Estabelece o Regulamento da Previd&ecirc;ncia Social;</div><div><br></div><div>Consolida&ccedil;&atilde;o das Leis Trabalhistas - CLT;</div><div><br></div><div>Portaria 3.214/78 e suas atualiza&ccedil;&otilde;es: NR 6 - EPI, NR 7 - PCMSO, NR 9 - PPRA, NR 15 (Atividades e/ou Opera&ccedil;&otilde;es Insalubres);</div><div><br></div><div>Instru&ccedil;&atilde;o Normativa INSS 45/2010 e suas atualiza&ccedil;&otilde;es - Crit&eacute;rios para enquadramento da aposentadoria especial, entre outras provid&ecirc;ncias;</div><div><br></div><div>NHO 01 - Norma de Higiene Ocupacional - Avalia&ccedil;&atilde;o da Exposi&ccedil;&atilde;o Ocupacional ao Ru&iacute;do;</div><div><br></div><div>NHO 06 - Avalia&ccedil;&atilde;o da Exposi&ccedil;&atilde;o Ocupacional ao Calor;</div>	10			2015-08-18 16:53:32.8508	2015-08-18 18:02:53.918383	2	item	
20	Identificação das planilhas, imagens e cronogramas	\N	10	\N	\N	2015-08-18 16:53:32.880521	2015-08-20 16:41:40.446421	7	item	\N
24	Conclusão	<p>Com o prop&oacute;sito de estabelecer  os crit&eacute;rios para a preven&ccedil;&atilde;o de riscos ambientais que possam existir na  execu&ccedil;&atilde;o das atividades desta empresa, este PPRA, cont&eacute;m as informa&ccedil;&otilde;es e  metodologias para a sua aplica&ccedil;&atilde;o de modo eficiente, a fim de atingir todos  requisitos necess&aacute;rios de acordo com a legisla&ccedil;&atilde;o.</p><p>Al&eacute;m disso, este documento &eacute;  utilizado para outras aplica&ccedil;&otilde;es legais, tais quais:</p><ul>    <li>Caracteriza&ccedil;&atilde;o de atividade ou opera&ccedil;&atilde;o insalubre;</li>        <li>Enquadramento de atividade especial.</li></ul><p>Outro t&oacute;pico importante, &eacute; a total  integra&ccedil;&atilde;o deste documento aos demais programas de seguran&ccedil;a e sa&uacute;de  ocupacional, principalmente ao PCMSO.</p>	10			2015-08-18 16:53:32.90934	2015-08-25 13:04:59.724815	13	item	
19	Responsáveis		10	top		2015-08-18 16:53:32.872701	2015-08-26 18:04:18.832468	6	item	
26	Riscos Ambientais	\N	10	top	risks	2015-08-18 16:53:32.925025	2015-09-23 21:39:18.945908	16	attachment	\N
27	Equipamentos de proteção coletiva	\N	10	top	epc	2015-08-18 16:53:32.932995	2015-09-23 21:39:18.949396	17	attachment	\N
29	Medidas administrativas	\N	10	top	administration_measure	2015-08-18 16:53:32.948739	2015-09-23 21:39:18.952878	18	attachment	\N
30	Equipamentos de proteção individual	\N	10	top	epi	2015-08-18 16:53:32.95623	2015-09-23 21:39:18.956191	19	attachment	\N
25	Cronograma	\N	10	top	schedule	2015-08-18 16:53:32.916775	2015-09-23 21:39:18.959591	20	attachment	\N
18	Siglário	<p>ACGIH -American Conference  of Governmental Industrial Hygienists;</p><p>CA - Certificado de  Aprova&ccedil;&atilde;o do MTE (NR 6);</p><p>DDS - Di&aacute;logo de Seguran&ccedil;a;</p><p>EPI - Equipamento de  Seguran&ccedil;a Individual;</p><p>FISPQ - Ficha de Informa&ccedil;&atilde;o  de Seguran&ccedil;a de Produtos Qu&iacute;micos;</p><p>LT - Limite de Toler&acirc;ncia,  NR 15;</p><p>NIOSH - National  Institute for Occupational Safety and Health;</p><p>N&iacute;vel de A&ccedil;&atilde;o (NR 9) - Dose  ou Concentra&ccedil;&atilde;o &gt; que 50% do LT ou TLV;</p><p>NPS - N&iacute;vel de Press&atilde;o  Sonora;</p><p>OSHA - Occupational Safety  and Health Administration - USA;</p><p>PCA - Programa de  Conserva&ccedil;&atilde;o Auditiva;</p><p>PCMSO - Programa de  Controle M&eacute;dico e Sa&uacute;de Ocupacional;</p><p>ppm - partes por milh&atilde;o -  Uma parte de contaminante por um milh&atilde;o de partes de ar ambiente;</p><p>PPR - Programa de Prote&ccedil;&atilde;o  Respirat&oacute;ria;</p><p>TLVR - Thereshold Limit  Value, limite de exposi&ccedil;&atilde;o ACGIH;</p><p>TWA - Time Weighted Average  - Concentra&ccedil;&atilde;o m&eacute;dia ponderada no tempo (di&aacute;ria);</p>	10			2015-08-18 16:53:32.864944	2015-08-18 17:54:49.145327	4	subitem	
31	Estrutura	<p>O PPRA tem como objetivo a  preven&ccedil;&atilde;o e controle da exposi&ccedil;&atilde;o aos agentes ambientais nocivos, de forma a  garantir a sa&uacute;de dos trabalhadores, atrav&eacute;s do reconhecimento dos riscos  ambientais (f&iacute;sicos, qu&iacute;micos e biol&oacute;gicos), presentes no ambiente e nas  atividades laborais desenvolvidas pelos trabalhadores.</p><p>A avalia&ccedil;&atilde;o da exposi&ccedil;&atilde;o aos  agentes ambientais &eacute; feita por GHE &ndash; Grupos Homog&ecirc;neos de Exposi&ccedil;&atilde;o. Onde a  exposi&ccedil;&atilde;o ser&aacute; avaliada em fun&ccedil;&atilde;o de sua intensidade, concentra&ccedil;&atilde;o, natureza, caracter&iacute;sticas  e efeitos &agrave; sa&uacute;de.</p><p>A avalia&ccedil;&atilde;o deve ser feita  usando as metodologias (NHO/ NIOSH) reconhecidas. Os valores encontrados nas  avalia&ccedil;&otilde;es s&atilde;o comparados com os limites legais. Caso a exposi&ccedil;&atilde;o esteja acima  dos LT estabelecidos, deve ser elaborado um plano de a&ccedil;&atilde;o, identificando as  responsabilidades e os prazos para minimizar ou eliminar a exposi&ccedil;&atilde;o.</p><p>O PPRA &eacute; parte integrante do  conjunto mais amplo de iniciativas da empresa, no campo da preserva&ccedil;&atilde;o da sa&uacute;de  e da integridade f&iacute;sica dos trabalhadores, estando articulado com o disposto  nas demais Normas Regulamentadoras e Legisla&ccedil;&otilde;es Previdenci&aacute;rias. O programa  dever&aacute; conter, no m&iacute;nimo, a seguinte estrutura:</p><ul>    <li>Planejamento  anual com estabelecimento de metas, prioridades e cronograma;</li>        <li>Estrat&eacute;gia  e metodologia de a&ccedil;&atilde;o;</li>        <li>Forma  de registro, manuten&ccedil;&atilde;o e divulga&ccedil;&atilde;o dos dados;</li>        <li>Periodicidade  e forma de avalia&ccedil;&atilde;o do desenvolvimento do PPRA.</li></ul><p>Tendo tamb&eacute;m  por objetivo avaliar as atividades desenvolvidos pelos empregados, no exerc&iacute;cio  de todas as suas fun&ccedil;&otilde;es e ou atividades, determinando se os mesmos estiveram expostos  a agentes nocivos, com potencialidade de causar preju&iacute;zo &agrave; sa&uacute;de ou sua  integridade f&iacute;sica, em conformidade com os par&acirc;metros estabelecidos na  legisla&ccedil;&atilde;o previdenci&aacute;ria vigente.</p>	10			2015-08-18 18:42:58.642895	2015-08-20 16:41:37.860262	11	subitem	
15	Introdução	<p>O Programa de Preven&ccedil;&atilde;o de  Riscos Ambientais - PPRA &eacute; parte integrante do conjunto mais ampla das  iniciativas da empresa no campo de preserva&ccedil;&atilde;o, da sa&uacute;de e da integridade  f&iacute;sica dos empregados, devendo estar articulado com as demais Normas de Sa&uacute;de e  Seguran&ccedil;a no Trabalho, em particular com o Programa de Controle M&eacute;dico de Sa&uacute;de  Ocupacional - PCMSO.</p><p>Este Programa foi elaborado de  acordo com as diretrizes da NR-9.</p><p>A norma regulamentadora 9,  estabelece a obrigatoriedade de elabora&ccedil;&atilde;o e implementa&ccedil;&atilde;o do PPRA, por parte  de todos os empregadores e institui&ccedil;&otilde;es que admitam trabalhadores como  empregados, visando preservar a sa&uacute;de e integridade dos trabalhadores, atrav&eacute;s  da antecipa&ccedil;&atilde;o, reconhecimento, avalia&ccedil;&atilde;o e consequentes medidas de controle de  riscos ambientais, existentes ou que venham a existir, no ambiente de trabalho.</p><p>O PPRA &eacute; parte integrante do  conjunto mais amplo de iniciativas da empresa, para garantir a sa&uacute;de  ocupacional e a integridade dos trabalhadores, contribuindo para sua  produtividade e qualidade de vida. Esse documento deve estar articulado com o  disposto nas demais Normas Regulamentadoras, em especial com o PCMSO, previsto  na NR 7.</p>	10			2015-08-18 16:53:32.838565	2015-08-20 16:40:49.678992	1	item	
32	Etapas da Elaboração	<p>O Programa de  Preven&ccedil;&atilde;o de Riscos Ambientais, dever&aacute; incluir as seguintes etapas:</p><ul><li>Antecipa&ccedil;&atilde;o  e reconhecimento dos riscos;</li><li>Estabelecimento  de prioridades e metas de avalia&ccedil;&atilde;o e controle;</li><li>Avalia&ccedil;&atilde;o  dos riscos e da exposi&ccedil;&atilde;o dos trabalhadores;</li><li>Implanta&ccedil;&atilde;o  de medidas de controle e avalia&ccedil;&atilde;o de sua efic&aacute;cia;</li><li>Monitoramento  da exposi&ccedil;&atilde;o aos riscos;</li><li>Registro  e divulga&ccedil;&atilde;o.</li></ul><p>Este documento  base foi elaborado com software que permite um controle e monitoramento mais  eficiente de suas a&ccedil;&otilde;es e metas, tornando o PPRA uma ferramenta realmente efetiva  e automatizada. </p><p>Al&eacute;m disso  possibilita registrar de maneira segura os dados inseridos e alterado de acordo  com suas vers&otilde;es para seguran&ccedil;a da empresa e fiscaliza&ccedil;&atilde;o do Minist&eacute;rio do Trabalho.</p><p>Em se tratando  de sua divulga&ccedil;&atilde;o por ser um programa controlado por software permite divulgar  de forma mais abrangente atingindo v&aacute;rios n&iacute;veis da empresa e seus  colaboradores por diversos meios eletr&ocirc;nicos.</p><p>As etapas  citadas acima est&atilde;o dispostas neste documento da seguinte forma:</p><p>Anexos</p><ul>    <li>Defini&ccedil;&atilde;o  dos Riscos Ambientais e suas caracter&iacute;sticas por Fun&ccedil;&atilde;o</li>        <li>Registro  das medidas de controle e prote&ccedil;&atilde;o</li>        <li>Cronograma  e Planejamento anual</li></ul>	10			2015-08-18 19:07:16.499109	2015-08-20 16:41:37.868273	12	subitem	
33	Conceitos		10			2015-08-20 16:41:31.820406	2015-08-20 16:41:40.430175	5	subitem	
34	Teste sessão		10	bottom	risk_by_function	2015-08-27 19:44:33.07645	2015-09-23 21:39:18.935499	14	item	
36	teste 2		10	bottom	function_by_sector	2015-08-27 19:58:36.32246	2015-09-23 21:39:18.942063	15	item	
\.


--
-- Name: ppra_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('ppra_sections_id_seq', 36, true);


--
-- Data for Name: pprapcmsos; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY pprapcmsos (id, created_at, updated_at, project_id, company_id, version_code, document_start_validity, document_end_validity, notes, change_notes) FROM stdin;
1	2015-07-11 01:06:06.561017	2015-07-31 17:18:43.34126	2	2	1	2015-07-31	2015-08-02	\N	\N
2	2015-07-15 13:11:49.757196	2015-07-31 17:18:43.361401	4	4	1	2015-07-31	2015-08-02	\N	\N
3	2015-07-16 16:23:48.152307	2015-07-31 17:18:43.373489	2	6	1	2015-07-31	2015-08-02	\N	\N
4	2015-07-18 00:55:27.169895	2015-07-31 17:18:43.387444	1	1	1	2015-07-31	2015-08-02	\N	\N
5	2015-07-29 13:01:43.176929	2015-07-31 17:18:43.399485	5	7	1	2015-07-31	2015-08-02	\N	\N
6	2015-07-31 17:33:06.546031	2015-07-31 17:33:06.546031	5	7	0001	2015-07-01	2016-07-01	\N	\N
7	2015-08-07 13:37:03.791114	2015-08-07 13:37:03.791114	5	7	Teste 1	2016-07-31	2016-08-01	\N	\N
8	2015-08-07 14:05:03.72285	2015-08-07 14:05:03.72285	5	8	001	2015-07-31	2016-08-01	\N	\N
9	2015-08-18 16:40:23.714824	2015-08-18 16:40:23.714824	5	8	0002	2017-08-01	2018-08-01		
10	2015-08-18 16:53:32.774784	2015-08-18 16:53:32.774784	5	6	001	2015-08-01	2016-08-01		
\.


--
-- Name: pprapcmsos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('pprapcmsos_id_seq', 10, true);


--
-- Data for Name: processings; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY processings (id, status, description, incident_id, user_id, created_at, updated_at) FROM stdin;
1	closed	Descrição de fechamento	2	2	2015-07-14 02:11:10.313285	2015-07-14 02:11:10.313285
2	closed	ffedfdfd	10	2	2015-08-05 00:22:35.585154	2015-08-05 00:22:35.585154
3	open	fdfdfsd	11	2	2015-08-05 13:56:58.940824	2015-08-05 13:56:58.940824
4	open	sdasdasd	14	2	2015-09-09 23:22:54.828278	2015-09-09 23:22:54.828278
\.


--
-- Name: processings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('processings_id_seq', 4, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('projects_id_seq', 8, true);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY questions (id, label, hint, checklist_id, created_at, updated_at) FROM stdin;
1	1-questão teste T	Teste ajuda	1	2015-07-11 01:20:23.552185	2015-07-11 01:20:23.552185
2	2- questão teste 2	teste ajuda 2	1	2015-07-11 01:20:23.559295	2015-07-11 01:20:23.559295
3	1-Existe fonte de ruído neste ambiente?	Teste1	2	2015-07-29 14:33:46.774201	2015-07-29 14:33:46.774201
4	2 - Existe fonte de calor neste ambiente através de máquinas e equipamentos?	teste 2	2	2015-07-29 14:33:46.778286	2015-07-29 14:33:46.778286
5	1- Existem fontes de ruído nesse setor?	Exemplo: Máquinas, equipamentos, ou atividades que emitam ruído.	3	2015-08-05 13:53:55.242292	2015-08-05 13:53:55.242292
6	Quais são as fontes existentes?	Cite as fontes de ruído com uma breve descrição.	3	2015-08-05 13:53:55.245413	2015-08-05 13:53:55.245413
7	2 - Existem fontes de calor nesse setor?	Exemplo: Máquinas, equipamentos, ou atividades que emitam propaguem calor.	3	2015-08-05 13:53:55.247858	2015-08-05 13:53:55.247858
9	2 - Piso cimentado, madeira ou equivalente?		4	2015-09-04 15:12:11.887243	2015-09-04 15:12:11.887243
10	3 - Local coberto?		4	2015-09-04 15:12:11.900104	2015-09-04 15:12:11.900104
8	1 - Paredes de alvenaria, madeira ou equivalente?	etc etcetc	4	2015-08-31 17:23:45.668001	2015-09-23 18:18:38.703822
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('questions_id_seq', 10, true);


--
-- Name: risk_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('risk_categories_id_seq', 11, true);


--
-- Name: risk_exposures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('risk_exposures_id_seq', 4, true);


--
-- Data for Name: risk_measurements; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY risk_measurements (id, value, pfs_risk_id, created_at, updated_at, measurement_day) FROM stdin;
1	20	1	2015-07-21 17:21:16.433772	2015-07-21 17:21:16.433772	2015-07-21 17:21:00
2	200	1	2015-07-21 17:21:32.63359	2015-07-21 17:21:32.63359	2015-07-15 17:21:00
3	85	14	2015-07-21 17:50:26.301522	2015-07-21 17:50:26.301522	2015-07-21 17:50:00
13	32	37	2015-07-29 13:09:20.253078	2015-07-29 13:09:20.253078	2015-07-27 13:08:00
14	31	37	2015-07-29 14:16:34.181115	2015-07-29 14:16:34.181115	2015-07-30 14:16:00
15	5	29	2015-07-30 17:11:37.77707	2015-07-30 17:11:37.77707	2015-07-28 17:11:00
16	22	29	2015-07-30 17:11:44.46781	2015-07-30 17:11:44.46781	2015-07-28 17:11:00
17	6	29	2015-07-30 17:11:54.148512	2015-07-30 17:11:54.148512	2015-07-31 17:11:00
18	42	38	2015-08-05 14:07:22.333164	2015-08-05 14:07:22.333164	2015-08-05 14:07:00
19	35	40	2015-08-06 00:23:52.431717	2015-08-06 00:23:52.431717	2015-08-06 00:23:00
20	31	41	2015-08-07 00:44:51.859214	2015-08-07 00:44:51.859214	2015-08-07 00:44:00
21	75	42	2015-08-07 01:17:14.293649	2015-08-07 01:17:14.293649	2015-08-07 01:16:00
22	75	46	2015-08-07 14:07:51.566425	2015-08-07 14:07:51.566425	2015-08-07 14:07:00
23	78	47	2015-08-07 15:21:30.914304	2015-08-07 15:21:30.914304	2015-08-07 15:21:00
24	20	50	2015-08-18 16:58:08.564963	2015-08-18 16:58:08.564963	2015-08-15 17:00:00
25	22	67	2015-08-20 14:23:24.576154	2015-08-20 14:23:24.576154	2015-08-18 14:23:00
26	21	63	2015-08-21 12:47:04.728876	2015-08-21 12:47:04.728876	2015-08-21 12:46:00
\.


--
-- Name: risk_measurements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('risk_measurements_id_seq', 26, true);


--
-- Name: risk_trajectories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('risk_trajectories_id_seq', 4, true);


--
-- Name: risk_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('risk_types_id_seq', 4, true);


--
-- Name: risks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('risks_id_seq', 45, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY schedules (id, entry_time, output_time, lunch_hours, day, schedulable_id, schedulable_type, created_at, updated_at, start_hour) FROM stdin;
1	08:00	18:00	12:00	1	16	Sector	2015-08-18 20:39:48.723688	2015-08-18 20:39:48.723688	8
2	08:00	18:00	1:00	1	9	Company	2015-08-19 20:41:39.571456	2015-08-19 20:41:39.571456	8
3	08:00	17:00	01:00	1	10	Company	2015-08-19 20:54:44.774546	2015-08-19 20:54:44.774546	8
4	08:00	18:00	01:00	2° a 6°	11	Company	2015-08-19 21:50:34.49893	2015-08-19 21:50:34.49893	8
5	07:00	18:00	01:00	seg a sex	6	Company	2015-08-26 18:40:47.303338	2015-08-26 18:40:47.303338	7
6	07:00	08:00	01:00	seg sex	12	Company	2015-10-09 14:40:42.171932	2015-10-09 14:40:42.171932	7
7	07:00	08:00	01:00	seg sex	17	Sector	2015-10-09 14:45:05.417491	2015-10-09 14:45:05.417491	7
8	07:00	12:00	01:00	sáb	17	Sector	2015-10-09 14:45:05.420505	2015-10-09 14:45:05.420505	7
\.


--
-- Name: schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('schedules_id_seq', 8, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY schema_migrations (version) FROM stdin;
20150428121828
20150428124557
20150428124606
20150428124620
20150428142318
20150428143505
20150429134044
20150429134057
20150429134121
20150429134416
20150429134545
20150429134617
20150429184516
20150430132209
20150430132259
20150504135611
20150504165009
20150505225704
20150506172915
20150507173639
20150507173957
20150511170234
20150511232337
20150512142334
20150512182209
20150512190826
20150513003344
20150513111731
20150513130755
20150513130937
20150514004628
20150515114514
20150519123202
20150519123648
20150519123743
20150519131139
20150519190345
20150520140204
20150520221858
20150521214615
20150521214628
20150521214751
20150525183212
20150526131206
20150526220831
20150527122926
20150527144649
20150527144714
20150527221434
20150527223233
20150527225415
20150528141242
20150528161551
20150528181704
20150528213400
20150528220150
20150528220208
20150528232835
20150529184455
20150529220047
20150529234311
20150529234327
20150529234339
20150529234357
20150530000057
20150530000106
20150530000119
20150530000130
20150530144320
20150601202349
20150602170025
20150602222453
20150612122650
20150612122721
20150615140724
20150616181213
20150617150236
20150622120602
20150623134748
20150624134220
20150625114326
20150626142715
20150629184555
20150629205926
20150630204125
20150630211641
20150701153720
20150702203016
20150702213629
20150704180524
20150706133718
20150707224708
20150707232440
20150708131601
20150708225405
20150708225624
20150708225919
20150708230550
20150709202231
20150709215010
20150711152732
20150711160001
20150711160034
20150715220123
20150715221649
20150715221707
20150718135017
20150718155527
20150718173708
20150718174010
20150718183658
20150720120242
20150722124839
20150724113847
20150724135643
20150724135702
20150724135718
20150724224114
20150724224225
20150724224246
20150724224253
20150724224304
20150724224831
20150724224949
20150725140136
20150725174314
20150727215908
20150727221858
20150728212320
20150728212330
20150728212923
20150729123130
20150729221839
20150730134140
20150803142100
20150803142548
20150803232948
20150804112234
20150804113837
20150804125053
20150804133414
20150805113322
20150805213434
20150805234304
20150805121740
20150805124722
20150806132006
20150806132038
20150807183249
20150807194757
20150807210239
20150807144007
20150810115500
20150810131603
20150810141343
20150812143040
20150812143127
20150815170205
20150815170226
20150815182505
20150815182511
20150815182519
20150817125537
20150818221730
20150818230156
20150819115805
20150821121610
20150824120319
20150824124121
20150825220849
20150825230816
20150825233101
20150828131137
20150829202643
20150831113617
20150831125819
20150902120021
20150902124434
20150902132736
20150903124529
20150903124728
20150902224818
20150904113837
20150904114337
20150915133031
20150917122013
20150930124812
20151001111919
20151003144038
20151015131157
20151015131530
20151021130003
\.


--
-- Data for Name: section_images; Type: TABLE DATA; Schema: public; Owner: safeverse
--

COPY section_images (id, image_file_name, image_content_type, image_file_size, image_updated_at, url, ppra_section_id, created_at, updated_at) FROM stdin;
2	RackMultipart20150807-10674-1mewrzc.jpg	image/jpeg	124102	2015-08-07 21:06:13.540157	/system/section_images/images/000/000/002/original/RackMultipart20150807-10674-1mewrzc.jpg?1438981573	12	2015-08-07 21:06:14.102471	2015-08-07 21:06:25.168232
3	RackMultipart20150824-27282-zalb90.jpg	image/jpeg	63268	2015-08-24 14:05:05.599606	/system/section_images/images/000/000/003/original/RackMultipart20150824-27282-zalb90.jpg?1440425105	\N	2015-08-24 14:05:06.092532	2015-08-24 14:05:06.092532
\.


--
-- Name: section_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('section_images_id_seq', 3, true);


--
-- Name: sectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('sectors_id_seq', 17, true);


--
-- Name: trainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('trainings_id_seq', 21, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: safeverse
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

