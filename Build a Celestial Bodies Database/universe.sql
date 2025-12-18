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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_count integer NOT NULL,
    visible_months integer,
    brightness numeric(5,2) NOT NULL,
    description text,
    is_zodiac boolean NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    constellation_id integer NOT NULL,
    diameter_kly integer,
    distance_mly numeric(8,2) NOT NULL,
    description text,
    is_spiral boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    mass_moon numeric(6,4) NOT NULL,
    description text,
    is_geologically_active boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    orbital_period_days integer NOT NULL,
    mass_earth numeric(6,3) NOT NULL,
    description text,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_k integer NOT NULL,
    mass_solar numeric(6,3) NOT NULL,
    description text,
    is_main_sequence boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 81, 1, 4.00, 'Prominent winter constellation', false);
INSERT INTO public.constellation VALUES (2, 'Scorpius', 47, 6, 3.00, 'Contains the red star Antares', true);
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 93, NULL, 2.50, 'Home of the Big Dipper', false);
INSERT INTO public.constellation VALUES (4, 'Leo', 52, 4, 2.80, 'Spring constellation of the zodiac', true);
INSERT INTO public.constellation VALUES (5, 'Taurus', 88, 12, 3.60, 'Contains the Pleiades cluster', true);
INSERT INTO public.constellation VALUES (6, 'Gemini', 85, 2, 3.20, 'Features the twin stars Castor and Pollux', true);
INSERT INTO public.constellation VALUES (7, 'Cygnus', 79, 8, 2.90, 'Northern Cross asterism', false);
INSERT INTO public.constellation VALUES (8, 'Lyra', 25, 7, 1.20, 'Home of Vega', false);
INSERT INTO public.constellation VALUES (9, 'Aquarius', 90, 10, 3.80, 'Large zodiac constellation', true);
INSERT INTO public.constellation VALUES (10, 'Sagittarius', 68, 9, 3.10, 'Points toward the galactic center', true);
INSERT INTO public.constellation VALUES (11, 'Cassiopeia', 76, NULL, 2.20, 'W-shaped constellation', false);
INSERT INTO public.constellation VALUES (12, 'Andromeda', 74, 11, 2.70, 'Contains the Andromeda Galaxy', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 105, 0.00, 'Home galaxy of Earth', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 12, 220, 2.54, 'Nearest major galaxy', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 12, 60, 3.00, 'Member of the Local Group', true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 1, 60, 23.00, 'Interacting spiral galaxy', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 4, 50, 29.30, 'Bright nucleus with dust lane', false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 3, NULL, 21.00, 'Face-on spiral galaxy', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 1.0000, 'Earth natural satellite', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.0001, 'Larger moon of Mars', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 0.0000, 'Smaller moon of Mars', false);
INSERT INTO public.moon VALUES (4, 'Io', 2, 3643, 0.8900, 'Highly volcanic moon', true);
INSERT INTO public.moon VALUES (5, 'Europa', 2, 3121, 0.4800, 'Subsurface ocean candidate', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2, 5268, 2.0200, 'Largest moon in the Solar System', false);
INSERT INTO public.moon VALUES (7, 'Callisto', 2, 4821, 1.0800, 'Heavily cratered moon', false);
INSERT INTO public.moon VALUES (8, 'Proxima b I', 5, NULL, 0.3000, 'Possible exomoon', false);
INSERT INTO public.moon VALUES (9, 'Proxima b II', 5, NULL, 0.4500, 'Possible exomoon', false);
INSERT INTO public.moon VALUES (10, 'Sirius I-a', 7, 1500, 0.1200, 'Hypothetical moon', false);
INSERT INTO public.moon VALUES (11, 'Sirius I-b', 7, 1200, 0.0900, 'Hypothetical moon', false);
INSERT INTO public.moon VALUES (12, 'Vega I-a', 9, 1800, 0.2000, 'Candidate moon', false);
INSERT INTO public.moon VALUES (13, 'Vega I-b', 9, 1300, 0.1500, 'Candidate moon', false);
INSERT INTO public.moon VALUES (14, 'Rigel I-a', 11, 3000, 0.8000, 'Massive moon', false);
INSERT INTO public.moon VALUES (15, 'Rigel I-b', 11, 2800, 0.7500, 'Outer moon', false);
INSERT INTO public.moon VALUES (16, 'Rigel II-a', 12, 2500, 0.6500, 'Gas giant moon', false);
INSERT INTO public.moon VALUES (17, 'Rigel II-b', 12, 2200, 0.5500, 'Outer satellite', false);
INSERT INTO public.moon VALUES (18, 'Earth II', 3, NULL, 0.5000, 'Hypothetical second moon', false);
INSERT INTO public.moon VALUES (19, 'Earth III', 3, NULL, 0.3000, 'Captured object candidate', false);
INSERT INTO public.moon VALUES (20, 'Mars Minor I', 4, 8, 0.0000, 'Hypothetical small captured moon of Mars', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 88, 0.055, 'Closest planet to the Sun', false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 225, 0.815, 'Hottest planet', false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 365, 1.000, 'Only known planet with life', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 687, 0.107, 'The Red Planet', false);
INSERT INTO public.planet VALUES (5, 'Proxima b', 4, 11, 1.270, 'Exoplanet in habitable zone', true);
INSERT INTO public.planet VALUES (6, 'Proxima c', 4, 1900, 7.000, 'Outer exoplanet', false);
INSERT INTO public.planet VALUES (7, 'Sirius I', 5, 50, 0.500, 'Hypothetical planet', false);
INSERT INTO public.planet VALUES (8, 'Sirius II', 5, 120, 2.100, 'Gas giant candidate', false);
INSERT INTO public.planet VALUES (9, 'Vega I', 6, 80, 1.500, 'Rocky exoplanet candidate', false);
INSERT INTO public.planet VALUES (10, 'Vega II', 6, 220, 3.200, 'Gas planet candidate', false);
INSERT INTO public.planet VALUES (11, 'Rigel I', 3, 400, 5.000, 'Massive exoplanet', false);
INSERT INTO public.planet VALUES (12, 'Rigel II', 3, 900, 8.200, 'Outer gas giant', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1.000, 'Central star of the Solar System', true);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 3500, 11.600, 'Red supergiant in Orion', false);
INSERT INTO public.star VALUES (3, 'Rigel', 1, 12100, 21.000, 'Blue supergiant star', false);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 3042, 0.122, 'Closest known star to the Sun', true);
INSERT INTO public.star VALUES (5, 'Sirius', 1, 9940, 2.020, 'Brightest star in the night sky', true);
INSERT INTO public.star VALUES (6, 'Vega', 3, 9602, 2.140, 'Bright star in Lyra', true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 12, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy fk_galaxy_constellation; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_constellation FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

