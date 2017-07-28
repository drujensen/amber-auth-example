-- +micrate Up
CREATE TABLE users (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255),
  encrypted_password VARCHAR(255),
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

-- +micrate Down
DROP TABLE IF EXISTS users;
