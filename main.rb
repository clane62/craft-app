require 'sinatra'
require 'pg'

def run_sql(sql, sql_params = [])
  db = PG.connect(dbname: 'craft_app_db')
  results = db.exec_params(sql, sql_params)
  db.close
  results
end

get '/' do
  craft = run_sql('SELECT * FROM craft ORDER BY id')
  # ORDER BY ID - might be impacted once add the like functionality. 

  erb :'crafts/index', locals: {
    craft: craft
  }
end

get '/crafts/new' do
  erb :'crafts/new'
end

post '/craft' do
  project_name = params['project_name']
  username = params['username']
  image_url = params['image_url']
  materials = params['materials']
  description = params['description']
  status = params['status']

  run_sql("INSERT INTO craft(project_name, username, image_url, materials, description, status) VALUES($1, $2, $3, $4, $5, $6)", [project_name, username, image_url, materials, description, status])

  redirect '/'
end

get '/crafts/:id/edit' do
  id = params['id']
  craft = run_sql('SELECT * FROM craft WHERE id = $1', [id])[0]

  erb :'crafts/edit', locals: {
    craft: craft
  }
end

put '/crafts/:id' do
  id = params['id']
  project_name = params['project_name']
  username = params['username']
  image_url = params['image_url']
  materials = params['materials']
  description = params['description']
  status = params['status']

  run_sql('UPDATE craft SET project_name = $2, username = $3, image_url = $4, materials = $5, description = $6, status = $7  WHERE id = $1', [id, project_name, username, image_url, materials, description, status])

  redirect '/'
end

delete '/crafts/:id' do
  id = params['id']

  run_sql('DELETE FROM craft WHERE id = $1', [id])

  redirect '/'

end