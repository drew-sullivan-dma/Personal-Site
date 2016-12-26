CREATE TYPE category AS ENUM ('fiction', 'non-fiction');
CREATE TABLE IF NOT EXISTS books (
	id SERIAL PRIMARY KEY,
	title text,
	author_first_name text,
	author_last_name text,
	category category,
	description text
);