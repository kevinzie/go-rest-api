-- Set timezone
-- For more information, please visit:
-- https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
SET
  TIMEZONE = "Asia/Jakarta";
DO $$ BEGIN
  CREATE TYPE user_status AS ENUM ('DISABLED', 'ACTIVE', 'INACTIVE');
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;


-- Create authors table
CREATE TABLE authors
(
  id           int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
  uuid         UUID                     DEFAULT uuid_generate_v4(),
  user_id      integer   not null,
  display_name varchar   NOT NULL,
  tagline      varchar   NULL,
  content      varchar   NULL,
  status       user_status              DEFAULT 'ACTIVE',
  created_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at   TIMESTAMP NULL,
  deleted_at   TIMESTAMP WITH TIME ZONE DEFAULT NULL,
  constraint fk_users_author
    foreign key (user_id)
      REFERENCES users (id)
);
-- Add indexes
  CREATE INDEX  IF NOT EXISTS active_author ON authors (id) WHERE status = 'ACTIVE';
