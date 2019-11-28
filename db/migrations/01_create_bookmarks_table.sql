This file records the sql that was used to create the bookmarks table

CREATE TABLE "bookmarks" (id SERIAL PRIMARY KEY, url VARCHAR(60));

SQL to add a column

ALTER TABLE bookmarks ADD COLUMN title VARCHAR;
