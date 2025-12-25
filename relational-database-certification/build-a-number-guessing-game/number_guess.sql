--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1766683890575', 5, 239);
INSERT INTO public.users VALUES ('user_1766682499676', 2, 466);
INSERT INTO public.users VALUES ('user_1766682499677', 5, 261);
INSERT INTO public.users VALUES ('user_1766682896528', 2, 665);
INSERT INTO public.users VALUES ('user_1766682526912', 2, 558);
INSERT INTO public.users VALUES ('user_1766682896529', 5, 269);
INSERT INTO public.users VALUES ('user_1766682526913', 5, 63);
INSERT INTO public.users VALUES ('user_1766683224190', 2, 84);
INSERT INTO public.users VALUES ('user_1766682535673', 2, 307);
INSERT INTO public.users VALUES ('user_1766682535674', 5, 22);
INSERT INTO public.users VALUES ('user_1766682924397', 2, 465);
INSERT INTO public.users VALUES ('user_1766683224191', 5, 115);
INSERT INTO public.users VALUES ('user_1766682924398', 5, 569);
INSERT INTO public.users VALUES ('user_1766682577262', 2, 234);
INSERT INTO public.users VALUES ('user_1766683632479', 2, 518);
INSERT INTO public.users VALUES ('user_1766682577263', 5, 5);
INSERT INTO public.users VALUES ('user_1766683913084', 2, 437);
INSERT INTO public.users VALUES ('user_1766682679006', 2, 124);
INSERT INTO public.users VALUES ('user_1766682959469', 2, 350);
INSERT INTO public.users VALUES ('user_1766682679007', 5, 14);
INSERT INTO public.users VALUES ('user_1766683632480', 5, 148);
INSERT INTO public.users VALUES ('user_1766683286966', 2, 835);
INSERT INTO public.users VALUES ('user_1766682959470', 5, 198);
INSERT INTO public.users VALUES ('jane', 3, 1);
INSERT INTO public.users VALUES ('user_1766682759406', 2, 663);
INSERT INTO public.users VALUES ('user_1766682759407', 5, 229);
INSERT INTO public.users VALUES ('user_1766683286967', 5, 170);
INSERT INTO public.users VALUES ('user_1766682791760', 2, 736);
INSERT INTO public.users VALUES ('user_1766683006484', 2, 117);
INSERT INTO public.users VALUES ('user_1766682791761', 5, 49);
INSERT INTO public.users VALUES ('user_1766683006485', 5, 387);
INSERT INTO public.users VALUES ('user_1766683913085', 5, 298);
INSERT INTO public.users VALUES ('user_1766683307515', 2, 341);
INSERT INTO public.users VALUES ('user_1766683650667', 2, 158);
INSERT INTO public.users VALUES ('user_1766683048917', 2, 221);
INSERT INTO public.users VALUES ('user_1766683307516', 5, 2);
INSERT INTO public.users VALUES ('user_1766683048918', 5, 138);
INSERT INTO public.users VALUES ('user_1766683650668', 5, 476);
INSERT INTO public.users VALUES ('john', 17, 1);
INSERT INTO public.users VALUES ('user_1766683068596', 2, 310);
INSERT INTO public.users VALUES ('user_1766683068597', 5, 7);
INSERT INTO public.users VALUES ('user_1766683399654', 2, 56);
INSERT INTO public.users VALUES ('user_1766683399655', 5, 47);
INSERT INTO public.users VALUES ('user_1766683160371', 2, 245);
INSERT INTO public.users VALUES ('user_1766683160372', 5, 81);
INSERT INTO public.users VALUES ('user_1766683721494', 2, 519);
INSERT INTO public.users VALUES ('user_1766683962333', 2, 13);
INSERT INTO public.users VALUES ('user_1766683183137', 2, 70);
INSERT INTO public.users VALUES ('user_1766683458126', 2, 816);
INSERT INTO public.users VALUES ('user_1766683183138', 5, 300);
INSERT INTO public.users VALUES ('user_1766683721495', 5, 141);
INSERT INTO public.users VALUES ('jogn', 3, 1);
INSERT INTO public.users VALUES ('user_1766683458127', 5, 41);
INSERT INTO public.users VALUES ('user_1766683962334', 5, 152);
INSERT INTO public.users VALUES ('user_1766683475560', 2, 84);
INSERT INTO public.users VALUES ('user_1766683781285', 2, 764);
INSERT INTO public.users VALUES ('user_1766683475561', 5, 42);
INSERT INTO public.users VALUES ('user_1766683781286', 5, 182);
INSERT INTO public.users VALUES ('user_1766683528676', 2, 316);
INSERT INTO public.users VALUES ('user_1766683528677', 5, 124);
INSERT INTO public.users VALUES ('user_1766683563799', 2, 727);
INSERT INTO public.users VALUES ('user_1766683794480', 2, 84);
INSERT INTO public.users VALUES ('user_1766683563800', 5, 509);
INSERT INTO public.users VALUES ('user_1766683794481', 5, 59);
INSERT INTO public.users VALUES ('user_1766683796857', 2, 174);
INSERT INTO public.users VALUES ('user_1766683796858', 5, 383);
INSERT INTO public.users VALUES ('user_1766683860077', 2, 144);
INSERT INTO public.users VALUES ('user_1766683860078', 5, 43);
INSERT INTO public.users VALUES ('user_1766683890574', 2, 558);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

