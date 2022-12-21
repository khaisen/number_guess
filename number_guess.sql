--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    user_id integer NOT NULL,
    number_of_guesses integer DEFAULT 0 NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    game_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 0 NOT NULL
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

INSERT INTO public.games VALUES (19, 0, 6421);
INSERT INTO public.games VALUES (19, 0, 4487);
INSERT INTO public.games VALUES (20, 0, 828);
INSERT INTO public.games VALUES (20, 0, 5607);
INSERT INTO public.games VALUES (19, 0, 4079);
INSERT INTO public.games VALUES (19, 0, 2174);
INSERT INTO public.games VALUES (19, 0, 4101);
INSERT INTO public.games VALUES (21, 0, 1820);
INSERT INTO public.games VALUES (21, 0, 1650);
INSERT INTO public.games VALUES (22, 0, 4360);
INSERT INTO public.games VALUES (22, 0, 9900);
INSERT INTO public.games VALUES (21, 13, 6285);
INSERT INTO public.games VALUES (21, 0, 213);
INSERT INTO public.games VALUES (21, 0, 8832);
INSERT INTO public.games VALUES (23, 0, 7079);
INSERT INTO public.games VALUES (23, 0, 6207);
INSERT INTO public.games VALUES (24, 0, 7109);
INSERT INTO public.games VALUES (24, 0, 2776);
INSERT INTO public.games VALUES (23, 0, 4890);
INSERT INTO public.games VALUES (23, 0, 1931);
INSERT INTO public.games VALUES (23, 0, 2325);
INSERT INTO public.games VALUES (25, 4, 9286);
INSERT INTO public.games VALUES (25, 0, 5266);
INSERT INTO public.games VALUES (25, 4, 3291);
INSERT INTO public.games VALUES (25, 17, 879);
INSERT INTO public.games VALUES (26, 0, 4051);
INSERT INTO public.games VALUES (26, 0, 3182);
INSERT INTO public.games VALUES (27, 0, 7299);
INSERT INTO public.games VALUES (27, 0, 3462);
INSERT INTO public.games VALUES (26, 0, 4528);
INSERT INTO public.games VALUES (26, 0, 2485);
INSERT INTO public.games VALUES (26, 0, 2545);
INSERT INTO public.games VALUES (28, 0, 6495);
INSERT INTO public.games VALUES (28, 0, 3002);
INSERT INTO public.games VALUES (29, 0, 6587);
INSERT INTO public.games VALUES (29, 0, 111);
INSERT INTO public.games VALUES (28, 0, 9382);
INSERT INTO public.games VALUES (28, 0, 7314);
INSERT INTO public.games VALUES (28, 0, 7441);
INSERT INTO public.games VALUES (30, 0, 7909);
INSERT INTO public.games VALUES (30, 0, 3722);
INSERT INTO public.games VALUES (31, 0, 5199);
INSERT INTO public.games VALUES (31, 0, 247);
INSERT INTO public.games VALUES (30, 0, 4127);
INSERT INTO public.games VALUES (30, 0, 1789);
INSERT INTO public.games VALUES (30, 0, 8574);
INSERT INTO public.games VALUES (32, 13, 1234);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (30, 'user_1671653909204', 1, 0);
INSERT INTO public.users VALUES (28, 'user_1671653609794', 1, 0);
INSERT INTO public.users VALUES (23, 'user_1671652895423', 1, 0);
INSERT INTO public.users VALUES (19, 'user_1671652439765', 1, 0);
INSERT INTO public.users VALUES (20, 'user_1671652439764', 1, 0);
INSERT INTO public.users VALUES (22, 'user_1671652674658', 1, 0);
INSERT INTO public.users VALUES (21, 'user_1671652674659', 1, 0);
INSERT INTO public.users VALUES (24, 'user_1671652895422', 1, 0);
INSERT INTO public.users VALUES (25, 'Khai', 1, 0);
INSERT INTO public.users VALUES (26, 'user_1671653431243', 1, 0);
INSERT INTO public.users VALUES (27, 'user_1671653431242', 1, 0);
INSERT INTO public.users VALUES (29, 'user_1671653609793', 1, 0);
INSERT INTO public.users VALUES (31, 'user_1671653909203', 1, 0);
INSERT INTO public.users VALUES (32, 'solomon_khai_lamh_cinn', 1, 13);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 32, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

