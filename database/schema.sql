BEGIN;
  
CREATE TYPE category AS ENUM ('fiction', 'non-fiction');
CREATE TABLE books (
	title text,
	author_first_name text,
	author_last_name text,
	category category,
	description text,
	id SERIAL PRIMARY_KEY
);

COMMIT;