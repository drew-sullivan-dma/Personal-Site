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
  author_middle_initials varchar(80),
  author_last_name varchar(80) NOT NULL,
  author_post_nominal_initials varchar(80),
  second_author_first_name varchar(80),
  second_author_middle_initials varchar(80),
  second_author_last_name varchar(80),
  second_author_post_nominal_initials varchar(80),
  et_al varchar(80),
  description varchar(500) NOT NULL,
  CONSTRAINT pk_book_book_id PRIMARY KEY (book_id)
);

--fiction: 1
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (1, 'Rendezvous with Rama', 'Arthur', 'C.', 'Clarke', null, null, null, null, null, null, 'The author reveals just enough to intrigue but not enough to ruin the exploration, treating the reader like a member of the expedition. You know just as much as the astronauts');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (1, '2001: A Space Odyssey', 'Arthur', 'C.', 'Clarke', null, null, null, null, null, null, '"But please remember: this is only a work of fiction. The truth, as always, will be far stranger."');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (1, 'A Game of Thrones (Song of Ice and Fire: Book 1)', 'George', 'R.R.', 'Martin', null, null, null, null, null, null, 'Lots of fun to read!');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (1, 'A Clash of Kings (Song of Ice and Fire: Book 2)', 'George', 'R.R.', 'Martin', null, null, null, null, null, null, 'Lots of fun to read!');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (1, 'A Storm of Swords (Song of Ice and Fire: Book 3)', 'George', 'R.R.', 'Martin', null, null, null, null, null, null, 'Lots of fun to read!');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (1, 'A Feast for Crows (Song of Ice and Fire: Book 4)', 'George', 'R.R.', 'Martin', null, null, null, null, null, null, 'Lots of fun to read!');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (1, 'A Dance with Dragons (Song of Ice and Fire: Book 5)', 'George', 'R.R.', 'Martin', null, null, null, null, null, null, 'Lots of fun to read!');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (1, 'The Things They Carried', 'Tim', null, 'O''Brien', null, null, null, null, null, null, 'I was tempted to put this in non-fiction, but the author does dedicate the book to fictional characters, so I made a judgement call. Like Authur C. Clarke, O''Brien blurs the line between what is being told and what the reader is supposed to experience. O''Brien''s writing encourages the reader the experience the war, rather than just read about it.');	

--biography: 2
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (2, 'Benjamin Franklin: An American Life', 'Walter',null, 'Isaacson',null, null, null, null, null, null, 'Look for the practical in everything you do.');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (2, 'Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future', 'Ashlee',null, 'Vance',null, null, null, null, null, null, 'Dream as big as humanly possible.');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (2, 'How to Win Friends & Influence People', 'Dale',null, 'Carnegie',null, null, null, null, null, null, '"Don''t criticize, condemn or complain."');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (2, 'Peak: Secrets from the New Science of Expertise', 'Anders',null, 'Ericsson',null, 'Robert', null, 'Pool', null, null, 'How to practice deliberately - the book is worth it for this alone');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (2, 'Make It Stick: The Science of Successful Learning', 'Peter', 'C.', 'Brown', null, 'Henry', 'L.', 'Roediger', 'III', null, 'Interleaved practice/study produces 214% greater learning speed and retention');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (2, 'The Personal MBA: Master the Art of Business', 'Josh',null, 'Kaufman',null, null, null, null, null, null, 'A great primer on all the functional areas of business. This allows you to zero-in on the areas you might be interested in, if you''re thinking of switching careers, and sample them out. I explored accounting, consulting, design, finance, and marketing before diving into software development');

--Self-Help: 3
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (3, 'Designing Your Life: How to Build a Well-Lived, Joyful Life', 'Bill',null, 'Burnett',null, 'Dave',null, 'Evans',null,null, 'After I finished this one, I immediately ordered my wife a copy, and we''ve gone through it together. Directly applicable to wherever you are. I wish I would have had this book when I was switching careers');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (3, 'The Index Card: Why Personal Finance Doesn''t Have to Be Complicated', 'Helaine',null, 'Olen',null,'Harold',null,'Pollack',null, null, 'Basic guidelines for personal finance. On par with Ramit Sethi''s "I Will Teach You To Be Rich".');

--Behavioral-/Social-Economics: 4
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (4, 'Influence: The Psychology of Persuasion', 'Robert', 'B.', 'Cialdini', 'Ph.D.',null, null, null, null, null, 'I learned so much from this book: how to negotiate for a salary, how to avoid buying things from a pushy salesman, how to avoid being taken advantage of in a negotiation or when being sold to. A masterpiece of the genre.');
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (4, 'Pre-Suasion: A Revolutionary Way to Influence and Persuade', 'Robert', 'B.', 'Cialdini', 'Ph.D.',null, null, null, null, null, 'My favorite among the stories in this book is one about a consultant where he finds a way to negotiate with potential clients and they never reject his initial offer. No more bartering and no more raising his price just because of a potential counter-offer.');

--Career-Development: 5
INSERT INTO book (category_id, title, author_first_name, author_middle_initials, author_last_name, author_post_nominal_initials, second_author_first_name, second_author_middle_initials, second_author_last_name, second_author_post_nominal_initials, et_al, description)
VALUES (5, 'The Phoenix Project: A Novel about IT, DevOps, and Helping Your Business Win', 'Gene',null, 'Kim',null,'Kevin',null,'Behr',null,null, 'Provides all the questions someone going into a management position in dev-ops or a leadership role in IT could ever want. Based on Eliyahu M. Goldratt''s "The Goal," this book is essentially the a modern, IT version.');

--Plain-Old Interesting: 6
--Skill-Development: 7
--Technology: 8
--Productivity: 9

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


ALTER TABLE book ADD FOREIGN KEY (category_id) REFERENCES category(category_id);