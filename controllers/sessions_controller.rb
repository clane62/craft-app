get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  email = params['email']
  password = params['password']

  user = find_user_by_email(email)



 
  #  Using BCRypt to check that the user provided the correct password (authentication)

  if user && BCrypt::Password.new(user['password_digest']) == password
    # log the user in. 
    session['user_id'] = user['id']
    # above will only work if we enable sessions in the main rb. 

    redirect '/'
  else
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session['user_id'] = nil

  redirect '/'
end