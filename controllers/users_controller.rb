get '/users/new' do
  erb :'users/new'
end

post '/users' do
  first_name = params['first_name']
  last_name = params['last_name']
  email = params['email']
  username = ['username']
  password = ['password']

  create_user(first_name, last_name, email, username, password)

  redirect '/'
end