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
INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future', 'Ashlee', 'Vance', 'non-fiction', 'Dream as big as humanly possible');
INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('How to Win Friends & Influence People', 'Dale', 'Carnegie', 'non-fiction', 'Don''t criticize, condemn or complain');
INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('Peak: Secrets from the New Science of Expertise', 'Anders', 'Ericsson', 'non-fiction', 'How to practice deliberately - the book is worth it for this alone');
INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('Make It Stick: The Science of Successful Learning', 'Peter C.', 'Brown', 'non-fiction', 'Interleaved practice/study produces 214% greater learning speed and retention');
INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('The Personal MBA: Master the Art of Business', 'Josh', 'Kaufman', 'non-fiction', 'A great primer on all the functional areas of business. This allows you to zero-in on the areas you might be interested in, if you''re thinking of switching careers, and sample them out. I explored accounting, consulting, design, finance, and marketing before diving into software development');
INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('2001: A Space Odyssey', 'Arthur C.', 'Clarke', 'fiction', '"But please remember: this is only a work of fiction. The truth, as always, will be far stranger."');
INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('A Game of Thrones (Song of Ice and Fire: Book 1)', 'George R.R.', 'Martin', 'fiction', 'Lots of fun to read!');
INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('A Clash of Kings (Song of Ice and Fire: Book 2)', 'George R.R.', 'Martin', 'fiction', 'Lots of fun to read!');
INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('A Storm of Swords (Song of Ice and Fire: Book 3)', 'George R.R.', 'Martin', 'fiction', 'Lots of fun to read!');
INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('A Feast for Crows (Song of Ice and Fire: Book 4)', 'George R.R.', 'Martin', 'fiction', 'Lots of fun to read!');
INSERT INTO book (title, author_first_name, author_last_name, category, description)
VALUES ('A Dance with Dragons (Song of Ice and Fire: Book 5)', 'George R.R.', 'Martin', 'fiction', 'Lots of fun to read!');