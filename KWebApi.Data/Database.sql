--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 10.1

-- Started on 2018-06-13 04:46:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 216 (class 1259 OID 26275)
-- Name: AspNetRoleClaims; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE "AspNetRoleClaims" (
    "Id" integer NOT NULL,
    "ClaimType" text,
    "ClaimValue" text,
    "RoleId" text NOT NULL
);


ALTER TABLE "AspNetRoleClaims" OWNER TO test;

--
-- TOC entry 215 (class 1259 OID 26273)
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE "AspNetRoleClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AspNetRoleClaims_Id_seq" OWNER TO test;

--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 215
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE "AspNetRoleClaims_Id_seq" OWNED BY "AspNetRoleClaims"."Id";


--
-- TOC entry 185 (class 1259 OID 26103)
-- Name: AspNetRoles; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE "AspNetRoles" (
    "Id" text NOT NULL,
    "ConcurrencyStamp" text,
    "Name" character varying(256),
    "NormalizedName" character varying(256)
);


ALTER TABLE "AspNetRoles" OWNER TO test;

--
-- TOC entry 218 (class 1259 OID 26291)
-- Name: AspNetUserClaims; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE "AspNetUserClaims" (
    "Id" integer NOT NULL,
    "ClaimType" text,
    "ClaimValue" text,
    "UserId" text NOT NULL
);


ALTER TABLE "AspNetUserClaims" OWNER TO test;

--
-- TOC entry 217 (class 1259 OID 26289)
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE "AspNetUserClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AspNetUserClaims_Id_seq" OWNER TO test;

--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 217
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE "AspNetUserClaims_Id_seq" OWNED BY "AspNetUserClaims"."Id";


--
-- TOC entry 219 (class 1259 OID 26305)
-- Name: AspNetUserLogins; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE "AspNetUserLogins" (
    "LoginProvider" text NOT NULL,
    "ProviderKey" text NOT NULL,
    "ProviderDisplayName" text,
    "UserId" text NOT NULL
);


ALTER TABLE "AspNetUserLogins" OWNER TO test;

--
-- TOC entry 220 (class 1259 OID 26318)
-- Name: AspNetUserRoles; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE "AspNetUserRoles" (
    "UserId" text NOT NULL,
    "RoleId" text NOT NULL
);


ALTER TABLE "AspNetUserRoles" OWNER TO test;

--
-- TOC entry 221 (class 1259 OID 26336)
-- Name: AspNetUserTokens; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE "AspNetUserTokens" (
    "UserId" text NOT NULL,
    "LoginProvider" text NOT NULL,
    "Name" text NOT NULL,
    "Value" text
);


ALTER TABLE "AspNetUserTokens" OWNER TO test;

--
-- TOC entry 186 (class 1259 OID 26111)
-- Name: AspNetUsers; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE "AspNetUsers" (
    "Id" text NOT NULL,
    "AccessFailedCount" integer NOT NULL,
    "ConcurrencyStamp" text,
    "Email" character varying(256),
    "EmailConfirmed" boolean NOT NULL,
    "LockoutEnabled" boolean NOT NULL,
    "LockoutEnd" timestamp with time zone,
    "NormalizedEmail" character varying(256),
    "NormalizedUserName" character varying(256),
    "PasswordHash" text,
    "PhoneNumber" text,
    "PhoneNumberConfirmed" boolean NOT NULL,
    "SecurityStamp" text,
    "TwoFactorEnabled" boolean NOT NULL,
    "UserName" character varying(256)
);


ALTER TABLE "AspNetUsers" OWNER TO test;

--
-- TOC entry 188 (class 1259 OID 26121)
-- Name: Events; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE "Events" (
    "Id" integer NOT NULL,
    "Description" text,
    "Name" text
);


ALTER TABLE "Events" OWNER TO test;

--
-- TOC entry 187 (class 1259 OID 26119)
-- Name: Events_Id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE "Events_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Events_Id_seq" OWNER TO test;

--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 187
-- Name: Events_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE "Events_Id_seq" OWNED BY "Events"."Id";


--
-- TOC entry 190 (class 1259 OID 26132)
-- Name: FuncBlocks; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE "FuncBlocks" (
    "Id" integer NOT NULL,
    "Description" text,
    "Name" text
);


ALTER TABLE "FuncBlocks" OWNER TO test;

--
-- TOC entry 189 (class 1259 OID 26130)
-- Name: FuncBlocks_Id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE "FuncBlocks_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "FuncBlocks_Id_seq" OWNER TO test;

--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 189
-- Name: FuncBlocks_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE "FuncBlocks_Id_seq" OWNED BY "FuncBlocks"."Id";


--
-- TOC entry 198 (class 1259 OID 26176)
-- Name: Pricelists; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE "Pricelists" (
    "Id" integer NOT NULL,
    "Amount" numeric NOT NULL,
    "FuncId" integer NOT NULL
);


ALTER TABLE "Pricelists" OWNER TO test;

--
-- TOC entry 197 (class 1259 OID 26174)
-- Name: Pricelists_Id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE "Pricelists_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Pricelists_Id_seq" OWNER TO test;

--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 197
-- Name: Pricelists_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE "Pricelists_Id_seq" OWNED BY "Pricelists"."Id";


--
-- TOC entry 200 (class 1259 OID 26187)
-- Name: Projects; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE "Projects" (
    "Id" integer NOT NULL,
    "Description" text,
    "Name" text
);


ALTER TABLE "Projects" OWNER TO test;

--
-- TOC entry 199 (class 1259 OID 26185)
-- Name: Projects_Id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE "Projects_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Projects_Id_seq" OWNER TO test;

--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 199
-- Name: Projects_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE "Projects_Id_seq" OWNED BY "Projects"."Id";


--
-- TOC entry 2146 (class 2604 OID 26278)
-- Name: AspNetRoleClaims Id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetRoleClaims" ALTER COLUMN "Id" SET DEFAULT nextval('"AspNetRoleClaims_Id_seq"'::regclass);


--
-- TOC entry 2147 (class 2604 OID 26294)
-- Name: AspNetUserClaims Id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetUserClaims" ALTER COLUMN "Id" SET DEFAULT nextval('"AspNetUserClaims_Id_seq"'::regclass);


--
-- TOC entry 2132 (class 2604 OID 26124)
-- Name: Events Id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY "Events" ALTER COLUMN "Id" SET DEFAULT nextval('"Events_Id_seq"'::regclass);


--
-- TOC entry 2133 (class 2604 OID 26135)
-- Name: FuncBlocks Id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY "FuncBlocks" ALTER COLUMN "Id" SET DEFAULT nextval('"FuncBlocks_Id_seq"'::regclass);


--
-- TOC entry 2137 (class 2604 OID 26179)
-- Name: Pricelists Id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY "Pricelists" ALTER COLUMN "Id" SET DEFAULT nextval('"Pricelists_Id_seq"'::regclass);


--
-- TOC entry 2138 (class 2604 OID 26190)
-- Name: Projects Id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY "Projects" ALTER COLUMN "Id" SET DEFAULT nextval('"Projects_Id_seq"'::regclass);


--
-- TOC entry 2351 (class 0 OID 26275)
-- Dependencies: 216
-- Data for Name: AspNetRoleClaims; Type: TABLE DATA; Schema: public; Owner: test
--

COPY "AspNetRoleClaims" ("Id", "ClaimType", "ClaimValue", "RoleId") FROM stdin;
\.


--
-- TOC entry 2320 (class 0 OID 26103)
-- Dependencies: 185
-- Data for Name: AspNetRoles; Type: TABLE DATA; Schema: public; Owner: test
--

COPY "AspNetRoles" ("Id", "ConcurrencyStamp", "Name", "NormalizedName") FROM stdin;
\.


--
-- TOC entry 2353 (class 0 OID 26291)
-- Dependencies: 218
-- Data for Name: AspNetUserClaims; Type: TABLE DATA; Schema: public; Owner: test
--

COPY "AspNetUserClaims" ("Id", "ClaimType", "ClaimValue", "UserId") FROM stdin;
\.


--
-- TOC entry 2354 (class 0 OID 26305)
-- Dependencies: 219
-- Data for Name: AspNetUserLogins; Type: TABLE DATA; Schema: public; Owner: test
--

COPY "AspNetUserLogins" ("LoginProvider", "ProviderKey", "ProviderDisplayName", "UserId") FROM stdin;
\.


--
-- TOC entry 2355 (class 0 OID 26318)
-- Dependencies: 220
-- Data for Name: AspNetUserRoles; Type: TABLE DATA; Schema: public; Owner: test
--

COPY "AspNetUserRoles" ("UserId", "RoleId") FROM stdin;
\.


--
-- TOC entry 2356 (class 0 OID 26336)
-- Dependencies: 221
-- Data for Name: AspNetUserTokens; Type: TABLE DATA; Schema: public; Owner: test
--

COPY "AspNetUserTokens" ("UserId", "LoginProvider", "Name", "Value") FROM stdin;
\.


--
-- TOC entry 2321 (class 0 OID 26111)
-- Dependencies: 186
-- Data for Name: AspNetUsers; Type: TABLE DATA; Schema: public; Owner: test
--

COPY "AspNetUsers" ("Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName") FROM stdin;
da4ec8e5-2ae5-4e12-b590-83fa6370d1b1	0	c5250d11-fa63-460c-a2c3-b44848dc0857	me@json.me	f	t	\N	ME@JSON.ME	ME@JSON.ME	AQAAAAEAACcQAAAAEDDlNIYXRzjcUYtv0WCkiDtksNohoRwXHKlFINN5TRofMHfnUb/EvKJdW+oFtkg7PQ==	\N	f	9c8f01bd-28bf-4519-a1a0-3816b3c6bbba	f	me@json.me
\.


--
-- TOC entry 2323 (class 0 OID 26121)
-- Dependencies: 188
-- Data for Name: Events; Type: TABLE DATA; Schema: public; Owner: test
--

COPY "Events" ("Id", "Description", "Name") FROM stdin;
\.


--
-- TOC entry 2325 (class 0 OID 26132)
-- Dependencies: 190
-- Data for Name: FuncBlocks; Type: TABLE DATA; Schema: public; Owner: test
--

COPY "FuncBlocks" ("Id", "Description", "Name") FROM stdin;
1	Whitepaper	WP
2	Landingpage	LP
3	Smartcontracts	SC
4	Presentation	PR
5	Events	Events
6	User profile	Profile
7	Payment information	Payment
\.


--
-- TOC entry 2333 (class 0 OID 26176)
-- Dependencies: 198
-- Data for Name: Pricelists; Type: TABLE DATA; Schema: public; Owner: test
--

COPY "Pricelists" ("Id", "Amount", "FuncId") FROM stdin;
\.


--
-- TOC entry 2335 (class 0 OID 26187)
-- Dependencies: 200
-- Data for Name: Projects; Type: TABLE DATA; Schema: public; Owner: test
--

COPY "Projects" ("Id", "Description", "Name") FROM stdin;
\.


--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 215
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('"AspNetRoleClaims_Id_seq"', 1, false);


--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 217
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('"AspNetUserClaims_Id_seq"', 1, false);


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 187
-- Name: Events_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('"Events_Id_seq"', 1, false);


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 189
-- Name: FuncBlocks_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('"FuncBlocks_Id_seq"', 7, true);


--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 197
-- Name: Pricelists_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('"Pricelists_Id_seq"', 1, false);


--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 199
-- Name: Projects_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('"Projects_Id_seq"', 1, false);


--
-- TOC entry 2185 (class 2606 OID 26283)
-- Name: AspNetRoleClaims PK_AspNetRoleClaims; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetRoleClaims"
    ADD CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id");


--
-- TOC entry 2149 (class 2606 OID 26110)
-- Name: AspNetRoles PK_AspNetRoles; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetRoles"
    ADD CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id");


--
-- TOC entry 2188 (class 2606 OID 26299)
-- Name: AspNetUserClaims PK_AspNetUserClaims; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetUserClaims"
    ADD CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id");


--
-- TOC entry 2191 (class 2606 OID 26312)
-- Name: AspNetUserLogins PK_AspNetUserLogins; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetUserLogins"
    ADD CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey");


--
-- TOC entry 2194 (class 2606 OID 26325)
-- Name: AspNetUserRoles PK_AspNetUserRoles; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetUserRoles"
    ADD CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- TOC entry 2196 (class 2606 OID 26343)
-- Name: AspNetUserTokens PK_AspNetUserTokens; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetUserTokens"
    ADD CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name");


--
-- TOC entry 2153 (class 2606 OID 26118)
-- Name: AspNetUsers PK_AspNetUsers; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetUsers"
    ADD CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id");


--
-- TOC entry 2156 (class 2606 OID 26129)
-- Name: Events PK_Events; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "Events"
    ADD CONSTRAINT "PK_Events" PRIMARY KEY ("Id");


--
-- TOC entry 2158 (class 2606 OID 26140)
-- Name: FuncBlocks PK_FuncBlocks; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "FuncBlocks"
    ADD CONSTRAINT "PK_FuncBlocks" PRIMARY KEY ("Id");


--
-- TOC entry 2166 (class 2606 OID 26184)
-- Name: Pricelists PK_Pricelists; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "Pricelists"
    ADD CONSTRAINT "PK_Pricelists" PRIMARY KEY ("Id");


--
-- TOC entry 2168 (class 2606 OID 26195)
-- Name: Projects PK_Projects; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "Projects"
    ADD CONSTRAINT "PK_Projects" PRIMARY KEY ("Id");


--
-- TOC entry 2151 (class 1259 OID 26354)
-- Name: EmailIndex; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX "EmailIndex" ON "AspNetUsers" USING btree ("NormalizedEmail");


--
-- TOC entry 2183 (class 1259 OID 26349)
-- Name: IX_AspNetRoleClaims_RoleId; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON "AspNetRoleClaims" USING btree ("RoleId");


--
-- TOC entry 2186 (class 1259 OID 26351)
-- Name: IX_AspNetUserClaims_UserId; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX "IX_AspNetUserClaims_UserId" ON "AspNetUserClaims" USING btree ("UserId");


--
-- TOC entry 2189 (class 1259 OID 26352)
-- Name: IX_AspNetUserLogins_UserId; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX "IX_AspNetUserLogins_UserId" ON "AspNetUserLogins" USING btree ("UserId");


--
-- TOC entry 2192 (class 1259 OID 26353)
-- Name: IX_AspNetUserRoles_RoleId; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX "IX_AspNetUserRoles_RoleId" ON "AspNetUserRoles" USING btree ("RoleId");


--
-- TOC entry 2150 (class 1259 OID 26350)
-- Name: RoleNameIndex; Type: INDEX; Schema: public; Owner: test
--

CREATE UNIQUE INDEX "RoleNameIndex" ON "AspNetRoles" USING btree ("NormalizedName");


--
-- TOC entry 2154 (class 1259 OID 26355)
-- Name: UserNameIndex; Type: INDEX; Schema: public; Owner: test
--

CREATE UNIQUE INDEX "UserNameIndex" ON "AspNetUsers" USING btree ("NormalizedUserName");


--
-- TOC entry 2197 (class 2606 OID 26284)
-- Name: AspNetRoleClaims FK_AspNetRoleClaims_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetRoleClaims"
    ADD CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE;


--
-- TOC entry 2198 (class 2606 OID 26300)
-- Name: AspNetUserClaims FK_AspNetUserClaims_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetUserClaims"
    ADD CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 2199 (class 2606 OID 26313)
-- Name: AspNetUserLogins FK_AspNetUserLogins_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetUserLogins"
    ADD CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 2200 (class 2606 OID 26326)
-- Name: AspNetUserRoles FK_AspNetUserRoles_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE;


--
-- TOC entry 2201 (class 2606 OID 26331)
-- Name: AspNetUserRoles FK_AspNetUserRoles_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 2202 (class 2606 OID 26344)
-- Name: AspNetUserTokens FK_AspNetUserTokens_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY "AspNetUserTokens"
    ADD CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


-- Completed on 2018-06-13 04:46:50

--
-- PostgreSQL database dump complete
--

