-- Add UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Set timezone
-- For more information, please visit:
-- https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
SET TIMEZONE = "Asia/Jakarta";

-- Create books table
CREATE TABLE users
(
  id          int                     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  uuid          UUID                     DEFAULT uuid_generate_v4(),
  first_name  VARCHAR(255) NOT NULL,
  last_name   VARCHAR(255) NULL,
  email       VARCHAR(255) NOT NULL UNIQUE,
  password    VARCHAR(255) NOT NULL,
  verified_at TIMESTAMP    NULL,
  status      user_status                 DEFAULT 'ACTIVE',
  created_at  TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at  TIMESTAMP    NULL
);
-- Add indexes
CREATE INDEX IF NOT EXISTS active_users ON users (email) WHERE status = 'ACTIVE';
