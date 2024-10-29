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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_in_km integer NOT NULL,
    is_potentially_hazardous boolean NOT NULL,
    orbit_type character varying(30),
    description text,
    planet_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    galaxy_type character varying(30)
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
    name character varying(50) NOT NULL,
    radius_in_km integer NOT NULL,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean,
    orbital_period_days integer,
    description text,
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
    name character varying(50) NOT NULL,
    radius_in_km integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    has_water boolean,
    surface_temperature integer,
    description text,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    brightness integer,
    is_visible boolean NOT NULL,
    is_binary_star boolean,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939, false, 'Main Belt', 'Largest object in asteroid belt', 5);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 512, false, 'Main Belt', 'Second-largest asteroid', 5);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 525, false, 'Main Belt', 'Third-largest asteroid', 5);
INSERT INTO public.asteroid VALUES (4, 'Eros', 16, true, 'Near-Earth', 'First asteroid to be orbited by spacecraft', 3);
INSERT INTO public.asteroid VALUES (5, 'Bennu', 1, true, 'Near-Earth', 'Sampled by OSIRIS-REx mission', 3);
INSERT INTO public.asteroid VALUES (6, 'Apophis', 0, true, 'Potentially Hazardous', 'Will pass close to Earth', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0.00, 'Our home galaxy', true, true, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2.54, 'Nearest major galaxy to Milky Way', false, true, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 10000, 2.73, 'Third-largest galaxy in the Local Group', false, true, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 1101, 0.16, 'Satellite galaxy of the Milky Way', false, false, 'Irregular');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 6500, 0.20, 'Dwarf galaxy near Milky Way', false, false, 'Irregular');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 13270, 13.05, 'Peculiar galaxy in Centaurus constellation', false, false, 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, true, false, 27, 'Earth only natural satellite', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, true, false, 0, 'One of Mars moons', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, true, false, 1, 'One of Mars moons', 4);
INSERT INTO public.moon VALUES (4, 'Io', 1821, true, true, 2, 'Volcanically active moon', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1560, true, true, 4, 'Potential for extraterrestrial life', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634, true, true, 7, 'Largest moon in the Solar System', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, true, true, 17, 'Cratered surface', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 2575, true, true, 16, 'Has dense atmosphere', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252, true, true, 1, 'Geological activity', 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 198, true, false, 1, 'Heavily cratered surface', 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 763, true, false, 5, 'Saturn moon with rings', 6);
INSERT INTO public.moon VALUES (12, 'Triton', 1353, true, true, 6, 'Largest moon of Neptune', 8);
INSERT INTO public.moon VALUES (13, 'Charon', 606, true, false, 6, 'Largest moon of Pluto', 4);
INSERT INTO public.moon VALUES (14, 'Miranda', 235, true, false, 1, 'Unusual surface', 7);
INSERT INTO public.moon VALUES (15, 'Ariel', 578, true, true, 3, 'Brightest of Uranus moons', 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 584, true, false, 4, 'Dark surface', 7);
INSERT INTO public.moon VALUES (17, 'Titania', 788, true, false, 9, 'Largest moon of Uranus', 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 761, true, false, 14, 'Outer moon of Uranus', 7);
INSERT INTO public.moon VALUES (19, 'Proteus', 210, true, false, 1, 'Irregular shape', 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 170, true, false, 360, 'Highly eccentric orbit', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2439, false, false, 167, 'Closest planet to the Sun', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6051, true, false, 464, 'Hot and toxic atmosphere', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6371, true, true, 15, 'Only planet known to have life', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3389, true, false, -63, 'Red Planet', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911, true, false, -108, 'Largest planet in the Solar System', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232, true, false, -139, 'Known for its rings', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, true, false, -195, 'Ice giant', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622, true, false, -201, 'Farthest planet from the Sun', 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 7000, true, false, -39, 'Closest exoplanet', 2);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 8000, true, false, -75, 'Orbits Alpha Centauri B', 2);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 11500, true, true, 0, 'Potentially habitable exoplanet', 3);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 12500, true, true, 22, 'In the habitable zone', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 0.00, 100, true, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 5000, 4.37, 80, true, true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8000, 642.50, 1000, true, false, 3);
INSERT INTO public.star VALUES (4, 'Rigel', 8000, 860.00, 1500, true, false, 4);
INSERT INTO public.star VALUES (5, 'Vega', 455, 25.00, 50, true, false, 1);
INSERT INTO public.star VALUES (6, 'Sirius', 240, 8.60, 120, true, false, 2);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


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
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

