get '/' do
  craft = all_crafts()
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

  create_craft(project_name, username, image_url, materials, description, status)

  redirect '/'
end

get '/crafts/:id/edit' do
  id = params['id']

  craft = get_craft(id)

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

  update_craft(id, project_name, username, image_url, materials, description, status)

  redirect '/'
end

delete '/crafts/:id' do
  id = params['id']

  delete_craft(id)
  
  redirect '/'

end