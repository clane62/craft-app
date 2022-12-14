def create_user(first_name, last_name, email, username)
  run_sql("INSERT INTO users(first_name, last_name, email, username) VALUES($1, $2, $3, $4)", [first_name, last_name, email, username])
end