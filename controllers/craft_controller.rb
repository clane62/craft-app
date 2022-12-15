get '/' do
  
  craft = all_crafts()
  # ORDER BY ID - might be impacted once add the like functionality. 

  feature_post = feature_post()

  image_url = params['image_url']

  erb :'crafts/index', locals: {
    craft: craft,
    feature_post: feature_post,
  }
end

get '/craft/new' do
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

  run_sql("UPDATE craft SET like_count = 0")

  redirect '/'
end

delete '/crafts/:id' do
  id = params['id']

  delete_craft(id)
  
  redirect '/'

end

post '/crafts/:id/likes' do
  like_project_id = params['id']
  user_id = session['user_id']
  like_count = params['like_count']



  run_sql("INSERT INTO likes(user_id, like_project_id) VALUES($1, $2)", [user_id, like_project_id])

  # run_sql("UPDATE craft SET like_count = like_count + 1")

  redirect '/'

end

# get '/crafts/:id/comment' do
#   comments = params['comments']

#   comments: comments
  
# end

