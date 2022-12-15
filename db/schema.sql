CREATE DATABASE craft_app_db;
\c craft_app_db

CREATE TABLE craft(
  id SERIAL PRIMARY KEY,
  project_name TEXT,
  username TEXT,
  image_url TEXT,
  materials TEXT,
  description TEXT,
  status TEXT
);

INSERT INTO craft(project_name, username, image_url, materials, description, status)
VALUES
  ('Baby Bonnet', 'Wendy', 'https://images.unsplash.com/photo-1576860525375-4e7b4e00155c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGNyb2NoZXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', 'Yarn', 'Crocheted matching baby set for my grandaughter', 'Finished'),
  ('Sugar Pot', 'Bert', 'https://images.unsplash.com/photo-1523976714396-3ee195e3b3a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNlcmFtaWNzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60', 'ceramic with white glaze', 'Pots from my sugar pot range', 'Finished'),
  ('singlet', 'Chris', 'https://images.unsplash.com/photo-1622648147611-e817249f3b73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGNyb2NoZXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', 'yarn', 'knitted singlet', 'Work in progress'),
  ('Cactus', 'Mel', 'https://images.unsplash.com/photo-1630238083594-43d3846190d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fGNyb2NoZXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', 'yarn', 'crocheted cactus in a pot', 'Finished'),
  ('A red scarf', 'Sian', 'https://images.unsplash.com/photo-1608033087328-f282cc17a27f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjJ8fGNyb2NoZXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', 'yarn', 'winter scarf, work in progress', 'Work in progress'),
  ('jeans', 'Sian', 'https://images.unsplash.com/photo-1662219708541-3a74d96330eb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTU5fHxjcm9jaGV0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60', 'yarn', 'winter scarf', 'Work in progress'),
  ('bike', 'peter', 'https://images.unsplash.com/photo-1665172650926-a8842203591d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTYxfHxjcm9jaGV0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60', 'yarn', 'flashy bike', 'finished');

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  username TEXT,
  admin INTEGER
);

ALTER TABLE users ADD COLUMN password_digest TEXT;

CREATE TABLE likes(
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  project_id INTEGER
);


ALTER TABLE likes
ADD CONSTRAINT unique_likes
UNIQUE(user_id, project_id); 

ALTER TABLE craft ADD COLUMN like_count INTEGER;

-- UPDATE craft SET like_count = like_count + 1;

-- UPDATE craft SET like_count = 0;

ALTER TABLE craft ALTER COLUMN like_count SET DEFAULT 0;

ALTER TABLE users
ADD CONSTRAINT unique_users
UNIQUE(email);



-- UPDATE users SET admin = 1 WHERE id = 22;

ALTER TABLE likes
RENAME COLUMN project_id to like_project_id;

-- SELECT project_name, like_project_id
-- FROM craft
-- JOIN likes
-- on craft.id = likes.user_id
-- ORDER BY project_name DESC;
--  Select sum?
