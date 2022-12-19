-- Add UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Set timezone
-- For more information, please visit:
-- https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
SET TIMEZONE = "Asia/Jakarta";
DO $$ BEGIN
CREATE TYPE post_status AS ENUM ('DRAFT', 'PUBLISH', 'CLOSED');
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;
-- Create books table
CREATE TABLE posts
(
  id         int                                      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title      VARCHAR(255) NOT NULL,
  slug       VARCHAR(255) NOT NULL UNIQUE,
  excerpt    TEXT         NULL,
  content    TEXT         NULL,
  type    VARCHAR(50)         NULL,
  status     post_status DEFAULT 'DRAFT',
  author     int NOT NULL,
  post_date  TIMESTAMP WITH TIME ZONE                  DEFAULT NOW(),
  created_at TIMESTAMP WITH TIME ZONE                  DEFAULT NOW(),
  updated_at TIMESTAMP    NULL,
  deleted_at TIMESTAMP WITH TIME ZONE                  DEFAULT NULL,
  constraint fk_post_author
    foreign key (author)
      REFERENCES authors (id)
);
