--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: author_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE author_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE author_author_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE author (
    author_id integer DEFAULT nextval('author_author_id_seq'::regclass) NOT NULL,
    first_name character varying(80) NOT NULL,
    middle_initials character varying(80),
    last_name character varying(80) NOT NULL,
    post_nominal_initials character varying(80)
);


ALTER TABLE author OWNER TO postgres;

--
-- Name: author_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE author_book (
    author_id integer NOT NULL,
    book_id integer NOT NULL
);


ALTER TABLE author_book OWNER TO postgres;

--
-- Name: book_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE book_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book_book_id_seq OWNER TO postgres;

--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE book (
    book_id integer DEFAULT nextval('book_book_id_seq'::regclass) NOT NULL,
    title character varying(80) NOT NULL
);


ALTER TABLE book OWNER TO postgres;

--
-- Name: book_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE book_category (
    book_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE book_category OWNER TO postgres;

--
-- Name: book_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE book_description (
    book_id integer NOT NULL,
    description_id integer NOT NULL
);


ALTER TABLE book_description OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_category_id_seq OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category (
    category_id integer DEFAULT nextval('category_category_id_seq'::regclass) NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE category OWNER TO postgres;

--
-- Name: description_description_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE description_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE description_description_id_seq OWNER TO postgres;

--
-- Name: description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE description (
    description_id integer DEFAULT nextval('description_description_id_seq'::regclass) NOT NULL,
    description character varying(500) NOT NULL
);


ALTER TABLE description OWNER TO postgres;

--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY author (author_id, first_name, middle_initials, last_name, post_nominal_initials) FROM stdin;
1	Arthur	C.	Clarke	\N
2	George	R.R.	Martin	\N
3	Tim	\N	O'Brien	\N
4	Robert	B.	Cialdini	Ph.D.
5	Gene	\N	Kim	\N
6	Kevin	\N	Behr	\N
7	Walter	\N	Isaacson	\N
8	Ashlee	\N	Vance	\N
9	Dale	\N	Carnegie	\N
10	Anders	\N	Ericsson	\N
11	Robert	\N	Pool	\N
12	Peter	C.	Brown	\N
13	Henry	L.	Roediger	III
14	Mark	A.	McDaniel	\N
15	Josh	\N	Kaufman	\N
16	Bill	\N	Burnett	\N
17	Dave	\N	Evans	\N
18	Helaine	\N	Olen	\N
19	Harold	\N	Pollack	\N
\.


--
-- Name: author_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('author_author_id_seq', 19, true);


--
-- Data for Name: author_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY author_book (author_id, book_id) FROM stdin;
1	1
1	2
2	3
2	4
2	5
2	6
2	7
3	8
7	9
8	10
9	11
10	12
11	12
12	13
13	13
14	13
15	14
16	15
17	15
18	16
19	16
4	17
4	18
5	19
6	19
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY book (book_id, title) FROM stdin;
1	Rendezvous with Rama
2	2001: A Space Odyssey
3	A Game of Thrones (Song of Ice and Fire: Book 1)
4	A Clash of Kings (Song of Ice and Fire: Book 2)
5	A Storm of Swords (Song of Ice and Fire: Book 3)
6	A Feast for Crows (Song of Ice and Fire: Book 4)
7	A Dance with Dragons (Song of Ice and Fire: Book 5)
8	The Things They Carried
9	Benjamin Franklin: An American Life
10	Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future
11	How to Win Friends & Influence People
12	Peak: Secrets from the New Science of Expertise
13	Make It Stick: The Science of Successful Learning
14	The Personal MBA: Master the Art of Business
15	Designing Your Life: How to Build a Well-Lived, Joyful Life
16	The Index Card: Why Personal Finance Doesn't Have to Be Complicated
17	Influence: The Psychology of Persuasion
18	Pre-Suasion: A Revolutionary Way to Influence and Persuade
19	The Phoenix Project: A Novel about IT, DevOps, and Helping Your Business Win
\.


--
-- Name: book_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('book_book_id_seq', 19, true);


--
-- Data for Name: book_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY book_category (book_id, category_id) FROM stdin;
1	10
1	1
2	1
2	10
3	1
4	1
5	1
6	1
7	1
8	1
8	2
8	6
8	9
9	2
9	3
9	6
9	9
10	2
10	5
10	6
10	9
11	3
11	4
11	5
11	9
12	3
12	7
12	8
12	9
13	3
13	7
13	9
14	3
14	5
14	7
14	8
14	9
15	3
15	5
15	9
16	3
16	9
17	3
17	4
17	5
17	6
17	7
17	9
18	3
18	4
18	5
18	6
18	7
18	9
19	3
19	5
19	7
19	8
19	9
\.


--
-- Data for Name: book_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY book_description (book_id, description_id) FROM stdin;
1	1
2	2
3	3
4	3
5	3
6	3
7	3
8	4
9	5
10	6
11	7
12	8
13	9
14	10
15	11
16	12
17	13
18	14
19	15
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY category (category_id, name) FROM stdin;
1	Fiction
2	Biography
3	Self-Help
4	Behavioral-/Social-Economics
5	Career-Development
6	Plain-Old Interesting
7	Skill-Development
8	Productivity
9	Non-Fiction
10	Sci-Fi
\.


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_category_id_seq', 10, true);


--
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY description (description_id, description) FROM stdin;
1	The author reveals just enough to intrigue but not enough to ruin the exploration, treating the reader like a member of the expedition. You know just as much as the astronauts.
2	"But please remember: this is only a work of fiction. The truth, as always, will be far stranger."
3	Lots of fun to read!
4	I was tempted to put this in non-fiction, but the author does dedicate the book to fictional characters, so I made a judgement call. Like Authur C. Clarke, O'Brien blurs the line between what is being told and what the reader is supposed to experience. O'Brien's writing encourages the reader the experience the war, rather than just read about it.
5	Look for the practical in everything you do.
6	Dream as big as humanly possible.
7	"Don't criticize, condemn or complain."
8	How to practice deliberately - the book is worth it for this alone.
9	Interleaved practice/study produces 214% greater learning speed and retention.
10	A great primer on all the functional areas of business. This allows you to zero-in on the areas you might be interested in, if you're thinking of switching careers, and sample them out. I explored accounting, consulting, design, finance, and marketing before diving into software development.
11	After I finished this one, I immediately ordered my wife a copy, and we've gone through it together. Directly applicable to wherever you are. I wish I would have had this book when I was switching careers.
12	Basic guidelines for personal finance. On par with Ramit Sethi's "I Will Teach You To Be Rich".
13	I learned so much from this book: how to negotiate for a salary, how to avoid buying things from a pushy salesman, how to avoid being taken advantage of in a negotiation or when being sold to. A masterpiece of the genre.
14	My favorite among the stories in this book is one about a consultant where he finds a way to negotiate with potential clients and they never reject his initial offer. No more bartering and no more raising his price just because of a potential counter-offer.
15	Provides all the questions someone going into a management position in dev-ops or a leadership role in IT could ever want. Based on Eliyahu M. Goldratt's "The Goal," this book is essentially the a modern, IT version.
\.


--
-- Name: description_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('description_description_id_seq', 15, true);


--
-- Name: author_book author_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY author_book
    ADD CONSTRAINT author_book_pkey PRIMARY KEY (author_id, book_id);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);


--
-- Name: book_category book_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book_category
    ADD CONSTRAINT book_category_pkey PRIMARY KEY (book_id, category_id);


--
-- Name: book_description book_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book_description
    ADD CONSTRAINT book_description_pkey PRIMARY KEY (book_id, description_id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


--
-- Name: author_book author_book_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY author_book
    ADD CONSTRAINT author_book_author_id_fkey FOREIGN KEY (author_id) REFERENCES author(author_id);


--
-- Name: author_book author_book_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY author_book
    ADD CONSTRAINT author_book_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(book_id);


--
-- Name: book_category book_category_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book_category
    ADD CONSTRAINT book_category_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(book_id);


--
-- Name: book_category book_category_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book_category
    ADD CONSTRAINT book_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES category(category_id);


--
-- Name: book_description book_description_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book_description
    ADD CONSTRAINT book_description_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(book_id);


--
-- Name: book_description book_description_description_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book_description
    ADD CONSTRAINT book_description_description_id_fkey FOREIGN KEY (description_id) REFERENCES description(description_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

