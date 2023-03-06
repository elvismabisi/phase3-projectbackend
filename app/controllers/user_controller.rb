class UserController < Sinatra::Base
  
    set :default_content_type, 'application/json'
  
  # User registration - create new user credential
    # during registration, the user email data is stored automatically in both the users and credentials table.
    post '/register' do
      user = User.create(
        email: params[:email],
        name: params[:name]
      )
      user.to_json
  
      userCredential = Credential.create(
        username: params[:username],
        email: user.email,
        password: params[:password],
        user_id: user.id
      )
      userCredential.to_json
    end
  
  #   log in the user using email/username and password
    post '/login' do
        user_data = JSON.parse(request.body.read)
        if  user = Credential.find_by(email: user_data['email']) || user = Credential.find_by(username: user_data['username']) && user = Credential.find_by(password: user_data['password'])
          user.to_json
        else
          {message: "Invalid email, username or password."}.to_json
        end    
    end
  end