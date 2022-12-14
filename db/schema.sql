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
  ('Little Bear', 'Chris', 'https://images.unsplash.com/photo-1618523748986-e95e741e6537?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fHdvb2QlMjBjYXJ2aW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60', 'handcarved oak', 'handcarved bear', 'Work in progress'),
  ('Cactus', 'Mel', 'https://images.unsplash.com/photo-1630238083594-43d3846190d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fGNyb2NoZXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', 'yarn', 'crocheted cactus in a pot', 'Finished'),
  ('A red scarf', 'Sian', 'https://images.unsplash.com/photo-1608033087328-f282cc17a27f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjJ8fGNyb2NoZXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', 'yarn', 'winter scarf, nearly finished', 'Work in progress');

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