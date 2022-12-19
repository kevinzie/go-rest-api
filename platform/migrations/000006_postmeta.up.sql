-- Set timezone
-- For more information, please visit:
-- https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
SET TIMEZONE = "Asia/Jakarta";
-- Create books table
CREATE TABLE postmeta
(
  id         int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  post_id    int          NOT NULL,
  meta_key   VARCHAR(255) NOT NULL,
  meta_value TEXT         NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP    NULL,
  deleted_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
  constraint fk_post_id_postmeta
    foreign key (post_id)
      REFERENCES posts (id)
);
