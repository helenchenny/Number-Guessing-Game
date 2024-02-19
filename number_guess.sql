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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer,
    guesses integer,
    game_won boolean DEFAULT false NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (46, 615, false);
INSERT INTO public.games VALUES (46, 968, false);
INSERT INTO public.games VALUES (47, 647, false);
INSERT INTO public.games VALUES (47, 598, false);
INSERT INTO public.games VALUES (46, 662, false);
INSERT INTO public.games VALUES (46, 676, false);
INSERT INTO public.games VALUES (46, 838, false);
INSERT INTO public.games VALUES (48, 769, false);
INSERT INTO public.games VALUES (48, 244, false);
INSERT INTO public.games VALUES (49, 635, false);
INSERT INTO public.games VALUES (49, 711, false);
INSERT INTO public.games VALUES (48, 255, false);
INSERT INTO public.games VALUES (48, 824, false);
INSERT INTO public.games VALUES (48, 378, false);
INSERT INTO public.games VALUES (50, 87, false);
INSERT INTO public.games VALUES (50, 221, false);
INSERT INTO public.games VALUES (51, 610, false);
INSERT INTO public.games VALUES (51, 368, false);
INSERT INTO public.games VALUES (50, 387, false);
INSERT INTO public.games VALUES (50, 793, false);
INSERT INTO public.games VALUES (50, 187, false);
INSERT INTO public.games VALUES (52, 532, false);
INSERT INTO public.games VALUES (52, 231, false);
INSERT INTO public.games VALUES (53, 754, false);
INSERT INTO public.games VALUES (53, 814, false);
INSERT INTO public.games VALUES (52, 929, false);
INSERT INTO public.games VALUES (52, 409, false);
INSERT INTO public.games VALUES (52, 986, false);
INSERT INTO public.games VALUES (54, 223, false);
INSERT INTO public.games VALUES (54, 91, false);
INSERT INTO public.games VALUES (55, 811, false);
INSERT INTO public.games VALUES (55, 830, false);
INSERT INTO public.games VALUES (54, 126, false);
INSERT INTO public.games VALUES (54, 825, false);
INSERT INTO public.games VALUES (54, 314, false);
INSERT INTO public.games VALUES (56, 121, false);
INSERT INTO public.games VALUES (56, 366, false);
INSERT INTO public.games VALUES (57, 258, false);
INSERT INTO public.games VALUES (57, 810, false);
INSERT INTO public.games VALUES (56, 858, false);
INSERT INTO public.games VALUES (56, 51, false);
INSERT INTO public.games VALUES (56, 591, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (45, 'hELEN');
INSERT INTO public.users VALUES (46, 'user_1708355893379');
INSERT INTO public.users VALUES (47, 'user_1708355893378');
INSERT INTO public.users VALUES (48, 'user_1708355919123');
INSERT INTO public.users VALUES (49, 'user_1708355919122');
INSERT INTO public.users VALUES (50, 'user_1708356134011');
INSERT INTO public.users VALUES (51, 'user_1708356134010');
INSERT INTO public.users VALUES (52, 'user_1708356194618');
INSERT INTO public.users VALUES (53, 'user_1708356194617');
INSERT INTO public.users VALUES (54, 'user_1708356204315');
INSERT INTO public.users VALUES (55, 'user_1708356204314');
INSERT INTO public.users VALUES (56, 'user_1708356220037');
INSERT INTO public.users VALUES (57, 'user_1708356220036');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 57, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

