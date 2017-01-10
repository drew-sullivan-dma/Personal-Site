DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS category;

DROP SEQUENCE book_book_id_seq;
DROP SEQUENCE category_category_id_seq;

CREATE SEQUENCE category_category_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE TABLE category (
  category_id integer DEFAULT nextval('category_category_id_seq'::regclass) NOT NULL,
  name varchar(80) NOT NULL,
  CONSTRAINT pk_category_category_id PRIMARY KEY (category_id)
);

CREATE SEQUENCE book_book_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE book (
  book_id integer DEFAULT nextval('book_book_id_seq'::regclass) NOT NULL,
  category_id integer NOT NULL,
  title varchar(80) NOT NULL,
  author_first_name varchar(80) NOT NULL,
  author_last_name varchar(80) NOT NULL,
  description varchar(500) NOT NULL,
  CONSTRAINT pk_book_book_id PRIMARY KEY (book_id)
);

	

INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (2, 'Benjamin Franklin: An American Life', 'Walter', 'Isaacson', 'Look for the practical in everything you do');
INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (1, 'Rendezvous with Rama', 'Arthur C.', 'Clarke', 'The author reveals just enough to intrigue but not enough to ruin the exploration, treating the reader like a member of the expedition. You know just as much as the astronauts');
INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (2, 'Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future', 'Ashlee', 'Vance', 'Dream as big as humanly possible');
INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (2, 'How to Win Friends & Influence People', 'Dale', 'Carnegie', 'Don''t criticize, condemn or complain');
INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (2, 'Peak: Secrets from the New Science of Expertise', 'Anders', 'Ericsson', 'How to practice deliberately - the book is worth it for this alone');
INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (2, 'Make It Stick: The Science of Successful Learning', 'Peter C.', 'Brown', 'Interleaved practice/study produces 214% greater learning speed and retention');
INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (2, 'The Personal MBA: Master the Art of Business', 'Josh', 'Kaufman', 'A great primer on all the functional areas of business. This allows you to zero-in on the areas you might be interested in, if you''re thinking of switching careers, and sample them out. I explored accounting, consulting, design, finance, and marketing before diving into software development');
INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (1, '2001: A Space Odyssey', 'Arthur C.', 'Clarke', '"But please remember: this is only a work of fiction. The truth, as always, will be far stranger."');
INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (1, 'A Game of Thrones (Song of Ice and Fire: Book 1)', 'George R.R.', 'Martin', 'Lots of fun to read!');
INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (1, 'A Clash of Kings (Song of Ice and Fire: Book 2)', 'George R.R.', 'Martin', 'Lots of fun to read!');
INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (1, 'A Storm of Swords (Song of Ice and Fire: Book 3)', 'George R.R.', 'Martin', 'Lots of fun to read!');
INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (1, 'A Feast for Crows (Song of Ice and Fire: Book 4)', 'George R.R.', 'Martin', 'Lots of fun to read!');
INSERT INTO book (category_id, title, author_first_name, author_last_name, description)
VALUES (1, 'A Dance with Dragons (Song of Ice and Fire: Book 5)', 'George R.R.', 'Martin', 'Lots of fun to read!');

INSERT INTO category (name)
VALUES ('Fiction');
INSERT INTO category (name)
VALUES ('Non-Fiction');


ALTER TABLE book ADD FOREIGN KEY (category_id) REFERENCES category(category_id);