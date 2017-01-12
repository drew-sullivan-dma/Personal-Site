DROP TABLE IF EXISTS author_book;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS book_description;
DROP TABLE IF EXISTS description;
DROP TABLE IF EXISTS book_category;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS category;

DROP SEQUENCE author_author_id_seq;
DROP SEQUENCE description_description_id_seq;
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
  title varchar(80) NOT NULL,
  PRIMARY KEY (book_id)
);

CREATE TABLE book_category (
  book_id integer NOT NULL,
  category_id integer NOT NULL,
  PRIMARY KEY (book_id, category_id)
);

CREATE SEQUENCE description_description_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE description (
  description_id integer DEFAULT nextval('description_description_id_seq'::regclass) NOT NULL,
  description varchar(500) NOT NULL,
  PRIMARY KEY (description_id)
);

CREATE TABLE book_description (
  book_id integer NOT NULL,
  description_id integer NOT NULL,
  PRIMARY KEY (book_id, description_id)
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

CREATE TABLE author_book (
  author_id integer NOT NULL,
  book_id integer NOT NULL,
  PRIMARY KEY (author_id, book_id)
);

INSERT INTO category (name) VALUES ('Fiction'); --1
INSERT INTO category (name) VALUES ('Biography'); --2
INSERT INTO category (name) VALUES ('Self-Help'); --3
INSERT INTO category (name) VALUES ('Behavioral-/Social-Economics'); --4
INSERT INTO category (name) VALUES ('Career-Development'); --5
INSERT INTO category (name) VALUES ('Plain-Old Interesting'); --6
INSERT INTO category (name) VALUES ('Skill-Development'); --7
INSERT INTO category (name) VALUES ('Productivity'); --8
INSERT INTO category (name) VALUES ('Non-Fiction'); --9
INSERT INTO category (name) VALUES ('Sci-Fi'); --10

INSERT INTO book (title) VALUES ('Rendezvous with Rama');
INSERT INTO book (title) VALUES ('2001: A Space Odyssey');
INSERT INTO book (title) VALUES ('A Game of Thrones (Song of Ice and Fire: Book 1)');
INSERT INTO book (title) VALUES ('A Clash of Kings (Song of Ice and Fire: Book 2)');
INSERT INTO book (title) VALUES ('A Storm of Swords (Song of Ice and Fire: Book 3)');
INSERT INTO book (title) VALUES ('A Feast for Crows (Song of Ice and Fire: Book 4)');
INSERT INTO book (title) VALUES ('A Dance with Dragons (Song of Ice and Fire: Book 5)');
INSERT INTO book (title) VALUES ('The Things They Carried');	
INSERT INTO book (title) VALUES ('Benjamin Franklin: An American Life');
INSERT INTO book (title) VALUES ('Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future');
INSERT INTO book (title) VALUES ('How to Win Friends & Influence People');
INSERT INTO book (title) VALUES ('Peak: Secrets from the New Science of Expertise');
INSERT INTO book (title) VALUES ('Make It Stick: The Science of Successful Learning');
INSERT INTO book (title) VALUES ('The Personal MBA: Master the Art of Business');
INSERT INTO book (title) VALUES ('Designing Your Life: How to Build a Well-Lived, Joyful Life');
INSERT INTO book (title) VALUES ('The Index Card: Why Personal Finance Doesn''t Have to Be Complicated');
INSERT INTO book (title) VALUES ('Influence: The Psychology of Persuasion');
INSERT INTO book (title) VALUES ('Pre-Suasion: A Revolutionary Way to Influence and Persuade');
INSERT INTO book (title) VALUES ('The Phoenix Project: A Novel about IT, DevOps, and Helping Your Business Win');

INSERT INTO book_category (book_id, category_id) VALUES (1, 10); --1 (book ids);
INSERT INTO book_category (book_id, category_id) VALUES (1, 1); 
INSERT INTO book_category (book_id, category_id) VALUES (2, 10); --2
INSERT INTO book_category (book_id, category_id) VALUES (2, 1); 
INSERT INTO book_category (book_id, category_id) VALUES (3, 1); --3
INSERT INTO book_category (book_id, category_id) VALUES (3, 10); 
INSERT INTO book_category (book_id, category_id) VALUES (4, 1); --4
INSERT INTO book_category (book_id, category_id) VALUES (4, 10); 
INSERT INTO book_category (book_id, category_id) VALUES (5, 1); --5
INSERT INTO book_category (book_id, category_id) VALUES (5, 10); 
INSERT INTO book_category (book_id, category_id) VALUES (6, 1); --6
INSERT INTO book_category (book_id, category_id) VALUES (6, 10); 
INSERT INTO book_category (book_id, category_id) VALUES (7, 1); --7
INSERT INTO book_category (book_id, category_id) VALUES (7, 10);
INSERT INTO book_category (book_id, category_id) VALUES (8, 1); --8
INSERT INTO book_category (book_id, category_id) VALUES (8, 2); 
INSERT INTO book_category (book_id, category_id) VALUES (8, 6); 
INSERT INTO book_category (book_id, category_id) VALUES (8, 9); 
INSERT INTO book_category (book_id, category_id) VALUES (9, 2); --9
INSERT INTO book_category (book_id, category_id) VALUES (9, 3); 
INSERT INTO book_category (book_id, category_id) VALUES (9, 6); 
INSERT INTO book_category (book_id, category_id) VALUES (9, 9); 
INSERT INTO book_category (book_id, category_id) VALUES (10, 2); --10
INSERT INTO book_category (book_id, category_id) VALUES (10, 5); 
INSERT INTO book_category (book_id, category_id) VALUES (10, 6); 
INSERT INTO book_category (book_id, category_id) VALUES (10, 9); 
INSERT INTO book_category (book_id, category_id) VALUES (11, 3); --11
INSERT INTO book_category (book_id, category_id) VALUES (11, 4); 
INSERT INTO book_category (book_id, category_id) VALUES (11, 5); 
INSERT INTO book_category (book_id, category_id) VALUES (11, 9); 
INSERT INTO book_category (book_id, category_id) VALUES (12, 3); --12
INSERT INTO book_category (book_id, category_id) VALUES (12, 7); 
INSERT INTO book_category (book_id, category_id) VALUES (12, 8); 
INSERT INTO book_category (book_id, category_id) VALUES (12, 9); 
INSERT INTO book_category (book_id, category_id) VALUES (13, 3); --13
INSERT INTO book_category (book_id, category_id) VALUES (13, 7); 
INSERT INTO book_category (book_id, category_id) VALUES (13, 9); 
INSERT INTO book_category (book_id, category_id) VALUES (14, 3); --14
INSERT INTO book_category (book_id, category_id) VALUES (14, 5);
INSERT INTO book_category (book_id, category_id) VALUES (14, 7);
INSERT INTO book_category (book_id, category_id) VALUES (14, 8);
INSERT INTO book_category (book_id, category_id) VALUES (14, 9);
INSERT INTO book_category (book_id, category_id) VALUES (15, 3); --15
INSERT INTO book_category (book_id, category_id) VALUES (15, 5);
INSERT INTO book_category (book_id, category_id) VALUES (15, 9);
INSERT INTO book_category (book_id, category_id) VALUES (16, 3); --16
INSERT INTO book_category (book_id, category_id) VALUES (16, 9);
INSERT INTO book_category (book_id, category_id) VALUES (17, 3); --17
INSERT INTO book_category (book_id, category_id) VALUES (17, 4);
INSERT INTO book_category (book_id, category_id) VALUES (17, 5);
INSERT INTO book_category (book_id, category_id) VALUES (17, 6);
INSERT INTO book_category (book_id, category_id) VALUES (17, 7);
INSERT INTO book_category (book_id, category_id) VALUES (17, 9);
INSERT INTO book_category (book_id, category_id) VALUES (18, 3); --18
INSERT INTO book_category (book_id, category_id) VALUES (18, 4);
INSERT INTO book_category (book_id, category_id) VALUES (18, 5);
INSERT INTO book_category (book_id, category_id) VALUES (18, 6);
INSERT INTO book_category (book_id, category_id) VALUES (18, 7);
INSERT INTO book_category (book_id, category_id) VALUES (18, 9);
INSERT INTO book_category (book_id, category_id) VALUES (19, 3); --19
INSERT INTO book_category (book_id, category_id) VALUES (19, 5);
INSERT INTO book_category (book_id, category_id) VALUES (19, 7);
INSERT INTO book_category (book_id, category_id) VALUES (19, 8);
INSERT INTO book_category (book_id, category_id) VALUES (19, 9);

INSERT INTO description (description) VALUES ('The author reveals just enough to intrigue but not enough to ruin the exploration, treating the reader like a member of the expedition. You know just as much as the astronauts.');
INSERT INTO description (description) VALUES ('"But please remember: this is only a work of fiction. The truth, as always, will be far stranger."');
INSERT INTO description (description) VALUES ('Lots of fun to read!');
INSERT INTO description (description) VALUES ('I was tempted to put this in non-fiction, but the author does dedicate the book to fictional characters, so I made a judgement call. Like Authur C. Clarke, O''Brien blurs the line between what is being told and what the reader is supposed to experience. O''Brien''s writing encourages the reader the experience the war, rather than just read about it.');
INSERT INTO description (description) VALUES ('Look for the practical in everything you do.');
INSERT INTO description (description) VALUES ('Dream as big as humanly possible.');
INSERT INTO description (description) VALUES ('"Don''t criticize, condemn or complain."');
INSERT INTO description (description) VALUES ('How to practice deliberately - the book is worth it for this alone.');
INSERT INTO description (description) VALUES ('Interleaved practice/study produces 214% greater learning speed and retention.');
INSERT INTO description (description) VALUES ('A great primer on all the functional areas of business. This allows you to zero-in on the areas you might be interested in, if you''re thinking of switching careers, and sample them out. I explored accounting, consulting, design, finance, and marketing before diving into software development.');
INSERT INTO description (description) VALUES ('After I finished this one, I immediately ordered my wife a copy, and we''ve gone through it together. Directly applicable to wherever you are. I wish I would have had this book when I was switching careers.');
INSERT INTO description (description) VALUES ('Basic guidelines for personal finance. On par with Ramit Sethi''s "I Will Teach You To Be Rich".');
INSERT INTO description (description) VALUES ('I learned so much from this book: how to negotiate for a salary, how to avoid buying things from a pushy salesman, how to avoid being taken advantage of in a negotiation or when being sold to. A masterpiece of the genre.');
INSERT INTO description (description) VALUES ('My favorite among the stories in this book is one about a consultant where he finds a way to negotiate with potential clients and they never reject his initial offer. No more bartering and no more raising his price just because of a potential counter-offer.');
INSERT INTO description (description) VALUES ('Provides all the questions someone going into a management position in dev-ops or a leadership role in IT could ever want. Based on Eliyahu M. Goldratt''s "The Goal," this book is essentially the a modern, IT version.');

INSERT INTO book_description (book_id, description_id) VALUES (1, 1); --1 (book ids)
INSERT INTO book_description (book_id, description_id) VALUES (2, 2);
INSERT INTO book_description (book_id, description_id) VALUES (3, 3);
INSERT INTO book_description (book_id, description_id) VALUES (4, 3);
INSERT INTO book_description (book_id, description_id) VALUES (5, 3); --5
INSERT INTO book_description (book_id, description_id) VALUES (6, 3);
INSERT INTO book_description (book_id, description_id) VALUES (7, 3);
INSERT INTO book_description (book_id, description_id) VALUES (8, 4);
INSERT INTO book_description (book_id, description_id) VALUES (9, 5);
INSERT INTO book_description (book_id, description_id) VALUES (10, 6); --10
INSERT INTO book_description (book_id, description_id) VALUES (11, 7);
INSERT INTO book_description (book_id, description_id) VALUES (12, 8);
INSERT INTO book_description (book_id, description_id) VALUES (13, 9);
INSERT INTO book_description (book_id, description_id) VALUES (14, 10);
INSERT INTO book_description (book_id, description_id) VALUES (15, 11); --15
INSERT INTO book_description (book_id, description_id) VALUES (16, 12);
INSERT INTO book_description (book_id, description_id) VALUES (17, 13);
INSERT INTO book_description (book_id, description_id) VALUES (18, 14);
INSERT INTO book_description (book_id, description_id) VALUES (19, 15);

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

ALTER TABLE book_category ADD FOREIGN KEY (category_id) REFERENCES category(category_id);
ALTER TABLE book_category ADD FOREIGN KEY (book_id) REFERENCES book(book_id);
ALTER TABLE book_description ADD FOREIGN KEY (description_id) REFERENCES description(description_id);
ALTER TABLE book_description ADD FOREIGN KEY (book_id) REFERENCES book(book_id);
ALTER TABLE author_book ADD FOREIGN KEY (author_id) REFERENCES author(author_id);
ALTER TABLE author_book ADD FOREIGN KEY (book_id) REFERENCES book(book_id);