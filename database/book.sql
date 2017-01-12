DROP TABLE IF EXISTS author_book;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS category;

DROP SEQUENCE copy_book_book_id_seq;
DROP SEQUENCE author_author_id_seq;
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
  PRIMARY KEY (category_id)
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
  description varchar(500) NOT NULL,
  PRIMARY KEY (book_id)
);

CREATE SEQUENCE author_author_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE author (
  author_id integer DEFAULT nextval('author_author_id_seq'::regclass) NOT NULL,
  first_name varchar(80) NOT NULL,
  middle_initials varchar(80),
  last_name varchar(80) NOT NULL,
  post_nominal_initials varchar(80),
  PRIMARY KEY (author_id)
);

CREATE SEQUENCE copy_book_book_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE author_book (
  author_id integer NOT NULL,
  book_id integer NOT NULL,
  PRIMARY KEY (author_id, book_id)
);

INSERT INTO author_book (author_id, book_id) VALUES (1, 1); --1 (Counting book ids)
INSERT INTO author_book (author_id, book_id) VALUES (1, 2);
INSERT INTO author_book (author_id, book_id) VALUES (2, 3);
INSERT INTO author_book (author_id, book_id) VALUES (2, 4);
INSERT INTO author_book (author_id, book_id) VALUES (2, 5); --5
INSERT INTO author_book (author_id, book_id) VALUES (2, 6);
INSERT INTO author_book (author_id, book_id) VALUES (2, 7);
INSERT INTO author_book (author_id, book_id) VALUES (3, 8);
INSERT INTO author_book (author_id, book_id) VALUES (7, 9);
INSERT INTO author_book (author_id, book_id) VALUES (8, 10); --10
INSERT INTO author_book (author_id, book_id) VALUES (9, 11);
INSERT INTO author_book (author_id, book_id) VALUES (10, 12);
INSERT INTO author_book (author_id, book_id) VALUES (11, 12);
INSERT INTO author_book (author_id, book_id) VALUES (12, 13);
INSERT INTO author_book (author_id, book_id) VALUES (13, 13); 
INSERT INTO author_book (author_id, book_id) VALUES (14, 13);
INSERT INTO author_book (author_id, book_id) VALUES (15, 14);
INSERT INTO author_book (author_id, book_id) VALUES (16, 15); --15
INSERT INTO author_book (author_id, book_id) VALUES (17, 15); --15
INSERT INTO author_book (author_id, book_id) VALUES (18, 16);
INSERT INTO author_book (author_id, book_id) VALUES (19, 16);
INSERT INTO author_book (author_id, book_id) VALUES (4, 17);
INSERT INTO author_book (author_id, book_id) VALUES (4, 18);
INSERT INTO author_book (author_id, book_id) VALUES (5, 19);
INSERT INTO author_book (author_id, book_id) VALUES (6, 19);

--fiction: 1
INSERT INTO book (category_id, title, description)
VALUES (1, 'Rendezvous with Rama', 'The author reveals just enough to intrigue but not enough to ruin the exploration, treating the reader like a member of the expedition. You know just as much as the astronauts.');
INSERT INTO book (category_id, title, description)
VALUES (1, '2001: A Space Odyssey', '"But please remember: this is only a work of fiction. The truth, as always, will be far stranger."');
INSERT INTO book (category_id, title, description)
VALUES (1, 'A Game of Thrones (Song of Ice and Fire: Book 1)', 'Lots of fun to read!');
INSERT INTO book (category_id, title, description)
VALUES (1, 'A Clash of Kings (Song of Ice and Fire: Book 2)', 'Lots of fun to read!');
INSERT INTO book (category_id, title, description)
VALUES (1, 'A Storm of Swords (Song of Ice and Fire: Book 3)', 'Lots of fun to read!');
INSERT INTO book (category_id, title, description)
VALUES (1, 'A Feast for Crows (Song of Ice and Fire: Book 4)', 'Lots of fun to read!');
INSERT INTO book (category_id, title, description)
VALUES (1, 'A Dance with Dragons (Song of Ice and Fire: Book 5)', 'Lots of fun to read!');
INSERT INTO book (category_id, title, description)
VALUES (1, 'The Things They Carried', 'I was tempted to put this in non-fiction, but the author does dedicate the book to fictional characters, so I made a judgement call. Like Authur C. Clarke, O''Brien blurs the line between what is being told and what the reader is supposed to experience. O''Brien''s writing encourages the reader the experience the war, rather than just read about it.');	

--biography: 2
INSERT INTO book (category_id, title, description)
VALUES (2, 'Benjamin Franklin: An American Life', 'Look for the practical in everything you do.');
INSERT INTO book (category_id, title, description)
VALUES (2, 'Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future', 'Dream as big as humanly possible.');
INSERT INTO book (category_id, title, description)
VALUES (2, 'How to Win Friends & Influence People', '"Don''t criticize, condemn or complain."');
INSERT INTO book (category_id, title, description)
VALUES (2, 'Peak: Secrets from the New Science of Expertise', 'How to practice deliberately - the book is worth it for this alone.');
INSERT INTO book (category_id, title, description)
VALUES (2, 'Make It Stick: The Science of Successful Learning', 'Interleaved practice/study produces 214% greater learning speed and retention.');
INSERT INTO book (category_id, title, description)
VALUES (2, 'The Personal MBA: Master the Art of Business', 'A great primer on all the functional areas of business. This allows you to zero-in on the areas you might be interested in, if you''re thinking of switching careers, and sample them out. I explored accounting, consulting, design, finance, and marketing before diving into software development.');

--Self-Help: 3
INSERT INTO book (category_id, title, description)
VALUES (3, 'Designing Your Life: How to Build a Well-Lived, Joyful Life', 'After I finished this one, I immediately ordered my wife a copy, and we''ve gone through it together. Directly applicable to wherever you are. I wish I would have had this book when I was switching careers.');
INSERT INTO book (category_id, title, description)
VALUES (3, 'The Index Card: Why Personal Finance Doesn''t Have to Be Complicated', 'Basic guidelines for personal finance. On par with Ramit Sethi''s "I Will Teach You To Be Rich".');

--Behavioral-/Social-Economics: 4
INSERT INTO book (category_id, title, description)
VALUES (4, 'Influence: The Psychology of Persuasion', 'I learned so much from this book: how to negotiate for a salary, how to avoid buying things from a pushy salesman, how to avoid being taken advantage of in a negotiation or when being sold to. A masterpiece of the genre.');
INSERT INTO book (category_id, title, description)
VALUES (4, 'Pre-Suasion: A Revolutionary Way to Influence and Persuade', 'My favorite among the stories in this book is one about a consultant where he finds a way to negotiate with potential clients and they never reject his initial offer. No more bartering and no more raising his price just because of a potential counter-offer.');

--Career-Development: 5
INSERT INTO book (category_id, title, description)
VALUES (5, 'The Phoenix Project: A Novel about IT, DevOps, and Helping Your Business Win', 'Provides all the questions someone going into a management position in dev-ops or a leadership role in IT could ever want. Based on Eliyahu M. Goldratt''s "The Goal," this book is essentially the a modern, IT version.');

--Plain-Old Interesting: 6
--Skill-Development: 7
--Technology: 8
--Productivity: 9

INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Arthur', 'C.', 'Clarke', null); --1
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('George', 'R.R.', 'Martin', null);
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Tim', null, 'O''Brien', null);
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Robert', 'B.', 'Cialdini', 'Ph.D.');
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Gene', null, 'Kim', null); --5
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Kevin', null, 'Behr', null);
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Walter', null, 'Isaacson', null);
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Ashlee', null, 'Vance', null);
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Dale', null, 'Carnegie', null);
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Anders', null, 'Ericsson', null); --10
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Robert', null, 'Pool', null);
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Peter', 'C.', 'Brown', null);
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Henry', 'L.', 'Roediger', 'III');
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Mark', 'A.', 'McDaniel', null);
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Josh', null, 'Kaufman', null); --15
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Bill', null, 'Burnett', null); 
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Dave', null, 'Evans', null); 
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Helaine', null, 'Olen', null); 
INSERT INTO author (first_name, middle_initials, last_name, post_nominal_initials) VALUES ('Harold', null, 'Pollack', null); 

INSERT INTO category (name)
VALUES ('Fiction'); --1
INSERT INTO category (name)
VALUES ('Biography'); --2
INSERT INTO category (name)
VALUES ('Self-Help'); --3
INSERT INTO category (name)
VALUES ('Behavioral-/Social-Economics'); --4
INSERT INTO category (name)
VALUES ('Career-Development'); --5
INSERT INTO category (name)
VALUES ('Plain-Old Interesting'); --6
INSERT INTO category (name)
VALUES ('Skill-Development'); --7
INSERT INTO category (name)
VALUES ('Technology'); --8
INSERT INTO category (name)
VALUES ('Productivity'); --9

ALTER TABLE author_book ADD FOREIGN KEY (author_id) REFERENCES author(author_id);
ALTER TABLE author_book ADD FOREIGN KEY (book_id) REFERENCES book(book_id);
ALTER TABLE book ADD FOREIGN KEY (category_id) REFERENCES category(category_id);