DROP TABLE IF EXISTS book;

DROP SEQUENCE book_book_id_seq;

CREATE SEQUENCE book_book_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE book (
  book_id integer DEFAULT nextval('book_book_id_seq'::regclass) NOT NULL,
  title varchar(80) NOT NULL,
  author_first_name varchar(80) NOT NULL,
  author_last_name varchar(80) NOT NULL,
  category varchar(80) NOT NULL,
  description varchar(500) NOT NULL,
  CONSTRAINT pk_book_book_id PRIMARY KEY (book_id)
);

INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('Benjamin Franklin: An American Life', 'Walter', 'Isaacson', 'non-fiction', 'Look for the practical in everything you do');

INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('Rendezvous with Rama', 'Arthur C.', 'Clarke', 'fiction', 'The author reveals just enough to intrigue but not enough to ruin the exploration, treating the reader like a member of the expedition. You know just as much as the astronauts');
