--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    type character varying(20),
    age_in_millions_of_years numeric(10,1),
    number_of_stars integer
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
    name character varying(40) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,1),
    orbit_time_in_days numeric(6,1),
    planet_id integer
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
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years numeric,
    distance_from_earth_in_km numeric,
    habitable boolean,
    no_of_moons integer,
    planet_type_id integer,
    star_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    type_classification character varying(20) NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,1),
    surface_temp_in_celsius numeric,
    star_type character varying(30),
    galaxy_id integer
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is a barred spiral galaxy...', NULL, 13600.0, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The Andromeda Galaxy is the closest spiral galaxy to the Milky Way...', 'Spiral', 13000.0, 100000000);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 'The Whirlpool Galaxy is an interacting grand-design spiral galaxy...', 'Spiral', 23000.2, 200000000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'The Sombrero Galaxy is an unbarred spiral galaxy...', 'Spiral', 28000.8, 50000000);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Centaurus A is a peculiar elliptical galaxy with a supermassive black hole at its center...', 'Elliptical', 12000.3, 20000000);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'The Triangulum Galaxy is a spiral galaxy...', 'Spiral', 30000.0, 50000000);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel Galaxy', 'The Pinwheel Galaxy is a face-on spiral galaxy...', 'Spiral', 25000.5, 150000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (8, 'Luna', 'Earth''s natural satellite, also known as the Moon.', 4500.0, 27.3, 1);
INSERT INTO public.moon VALUES (9, 'Phobos', 'The larger and closer of Mars''s two moons.', 4000.0, 0.3, 2);
INSERT INTO public.moon VALUES (10, 'Deimos', 'The smaller and more distant of Mars''s two moons.', 4000.0, 1.3, 2);
INSERT INTO public.moon VALUES (11, 'Io', 'One of Jupiter''s four Galilean moons, known for its volcanic activity.', 4600.0, 1.8, 5);
INSERT INTO public.moon VALUES (12, 'Europa', 'One of Jupiter''s four Galilean moons, believed to have a subsurface ocean.', 4600.0, 3.5, 5);
INSERT INTO public.moon VALUES (13, 'Ganymede', 'One of Jupiter''s four Galilean moons, the largest moon in the Solar System.', 4600.0, 7.2, 5);
INSERT INTO public.moon VALUES (14, 'Callisto', 'One of Jupiter''s four Galilean moons, known for its heavily cratered surface.', 4600.0, 16.7, 5);
INSERT INTO public.moon VALUES (15, 'Titan', 'Saturn''s largest moon, with a thick atmosphere and hydrocarbon lakes.', 4600.0, 15.9, 6);
INSERT INTO public.moon VALUES (16, 'Enceladus', 'An icy moon of Saturn with geysers of water vapor erupting from its south pole.', 4600.0, 1.4, 6);
INSERT INTO public.moon VALUES (17, 'Mimas', 'A moon of Saturn known for its large impact crater Herschel.', 4600.0, 0.9, 6);
INSERT INTO public.moon VALUES (18, 'Triton', 'Neptune''s largest moon and the only large moon in the Solar System with a retrograde orbit.', 4600.0, 5.9, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 'Neptune''s second largest moon and one of the darkest known moons in the Solar System.', 4600.0, 1.1, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 'Pluto''s largest moon, tidally locked with Pluto.', 4000.0, 6.4, 9);
INSERT INTO public.moon VALUES (21, 'Nix', 'One of Pluto''s smaller moons, discovered in 2005.', 4000.0, 24.9, 9);
INSERT INTO public.moon VALUES (22, 'Hydra', 'Another of Pluto''s smaller moons, discovered in 2005.', 4000.0, 38.2, 9);
INSERT INTO public.moon VALUES (23, 'Phoebe', 'Saturn''s outermost large moon, with a retrograde orbit and dark surface.', 4600.0, 550.5, 6);
INSERT INTO public.moon VALUES (24, 'Hyperion', 'One of Saturn''s irregularly shaped moons, known for its chaotic rotation.', 4600.0, 21.3, 6);
INSERT INTO public.moon VALUES (25, 'Miranda', 'One of Uranus''s smaller moons, with a surface featuring diverse terrains.', 4500.0, 1.4, 7);
INSERT INTO public.moon VALUES (26, 'Ariel', 'One of Uranus''s larger moons, with an icy and cratered surface.', 4500.0, 2.5, 7);
INSERT INTO public.moon VALUES (27, 'Oberon', 'The second largest moon of Uranus, known for its heavily cratered and icy surface.', 4500.0, 13.5, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun and the only known planet to support life.', true, 4500, 149600000, true, 1, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the Sun, often called the Red Planet due to its reddish appearance.', false, 4000, 227900000, false, 2, 1, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', 'The smallest planet in the Solar System and closest to the Sun.', false, 3500, 57910000, false, 0, 1, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 'The second planet from the Sun, known for its thick atmosphere of carbon dioxide and sulfuric acid clouds.', false, 4200, 108200000, false, 0, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System, known for its Great Red Spot and numerous moons.', false, 4600, 778500000, false, 79, 2, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The sixth planet from the Sun, known for its extensive ring system and numerous moons.', false, 4600, 1434000000, false, 82, 1, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet from the Sun, notable for its extreme axial tilt and faint ring system.', false, 4500, 2871000000, false, 27, 1, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The eighth planet from the Sun, known for its deep blue color and strong winds.', false, 4600, 4495000000, false, 14, 1, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Once considered the ninth planet, now classified as a dwarf planet beyond Neptune.', false, 4000, 5906400000, false, 5, 10, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 'A dwarf planet located in the scattered disc region of the Solar System, known for its size and distance from the Sun.', false, 4300, 10183600000, false, 1, 10, 1);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 'An exoplanet orbiting within the habitable zone of the Sun-like star Kepler-22.', false, 6000, 63800, true, 0, 2, 3);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 'An unconfirmed exoplanet that may reside in the habitable zone of its host star Gliese 581.', false, 20000, 20200000, true, 1, 2, 4);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'By Composition', 'Ocean Planet');
INSERT INTO public.planet_type VALUES (2, 'By Composition', 'Super-Earth');
INSERT INTO public.planet_type VALUES (3, 'By Composition', 'Carbon Planet');
INSERT INTO public.planet_type VALUES (4, 'By Composition', 'Waterworld');
INSERT INTO public.planet_type VALUES (5, 'By Composition', 'Silicate Planet');
INSERT INTO public.planet_type VALUES (6, 'By Composition', 'Iron Planet');
INSERT INTO public.planet_type VALUES (7, 'By Composition', 'Ice Planet');
INSERT INTO public.planet_type VALUES (8, 'By Composition', 'Titan');
INSERT INTO public.planet_type VALUES (9, 'By Composition', 'Hydrocarbon Planet');
INSERT INTO public.planet_type VALUES (10, 'By Composition', 'Coreless Planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the star at the center of the Solar System.', 4600.0, 5778, 'G-type main-sequence', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Proxima Centauri is the closest star to the Sun.', 5617.5, 3042, 'M-type red dwarf', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'Alpha Centauri A is the primary star in the Alpha Centauri system.', 6000.0, 5790, 'G-type main-sequence', 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'Alpha Centauri B is the secondary star in the Alpha Centauri system.', 6000.0, 5260, 'K-type main-sequence', 1);
INSERT INTO public.star VALUES (5, 'Sirius', 'Sirius is the brightest star in the night sky.', 2486.0, 9940, 'A-type main-sequence', 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Betelgeuse is a red supergiant star in the constellation of Orion.', 10000.0, 3500, 'M-type red supergiant', 2);
INSERT INTO public.star VALUES (7, 'Rigel', 'Rigel is a blue supergiant star in the constellation of Orion.', 8000.0, 12100, 'B-type blue supergiant', 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

