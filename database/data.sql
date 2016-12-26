BEGIN;

INSERT INTO books (title, author_first_name, author_last_name, category, description)
	VALUES ('Benjamin Franklin: An American Life', 'Walter', 'Isaacson', 'non-fiction', 'Look for the practical in everything you do');
INSERT INTO books (title, author_first_name, author_last_name, category, description)
	VALUES ('Rendezvous with Rama', 'Arthur C.', 'Clarke', 'fiction', 'The author reveals just enough to intrigue but not enough to ruin the exploration, treating the reader like a member of the expedition. You know just as much as the astronauts');
	
COMMIT;