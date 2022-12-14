def all_crafts
  run_sql('SELECT * FROM craft ORDER BY id')
end

def create_craft(project_name, username, image_url, materials, description, status)
  run_sql("INSERT INTO craft(project_name, username, image_url, materials, description, status) VALUES($1, $2, $3 , $4, $5, $6)", [project_name, username, image_url, materials, description, status])
end

def get_craft(id)
  run_sql('SELECT * FROM craft WHERE id = $1', [id])[0]
end

def update_craft(id, project_name, username, image_url, materials, description, status)
  run_sql('UPDATE craft SET project_name = $2, username = $3, image_url = $4, materials = $5, description = $6, status = $7  WHERE id = $1', [id, project_name, username, image_url, materials, description, status])
end

def delete_craft(id)
  run_sql('DELETE FROM craft WHERE id = $1', [id])
end