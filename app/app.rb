require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

# configure database connection
set :database, { adapter: 'sqlite3', database: 'db.sqlite3' }

# load models
require_relative 'models/user'
require_relative 'models/project'
require_relative 'models/status_update'
require_relative 'models/project_user'

# enable sessions
enable :sessions

# define routes

# welcome page
get '/' do
  { message: 'Welcome to the project management API!' }.to_json
end

# user signup
post '/signup' do
  # create a new user object
  user = User.new(name: params[:name], email: params[:email], password: params[:password])

  if user.save
    # if the user is saved to the database, store their id in the session and return a success message
    session[:user_id] = user.id
    { message: 'Signup successful!', user: user }.to_json
  else
    # if there are errors while saving the user, return an error message with the list of errors
    { error: user.errors.full_messages.join(', ') }.to_json
  end
end

# user login
post '/login' do
  # find the user with the given email address
  user = User.find_by(email: params[:email])

  # check if the password is correct
  if user && user.authenticate(params[:password])
    # if the user is found and the password is correct, store their id in the session and return a success message
    session[:user_id] = user.id
    { message: 'Login successful!', user: user }.to_json
  else
    # if the email or password is invalid, return an error message
    { error: 'Invalid email or password' }.to_json
  end
end

# user logout
post '/logout' do
  # destroy the session to log the user out
  session.destroy
  { message: 'Logout successful!' }.to_json
end

# list all projects
get '/projects' do
  # get all projects from the database and return them as JSON
  projects = Project.all.to_json
end

# create a new project
post '/projects' do
  # create a new project object with the title, description, and the user_id of the user who created it
  project = Project.new(title: params[:title], description: params[:description], user_id: session[:user_id])

  if project.save
    # if the project is saved to the database, return a success message with the project information
    { message: 'Project created!', project: project }.to_json
  else
    # if there are errors while saving the project, return an error message with the list of errors
    { error: project.errors.full_messages.join(', ') }.to_json
  end
end

# show details of a specific project
get '/projects/:id' do
  # find the project with the given id and return it as JSON
  project = Project.find(params[:id]).to_json
end

# update a project
patch '/projects/:id' do
  # find the project with the given id
  project = Project.find(params[:id])

  if project.user_id == session[:user_id]
    # if the user has permission to edit the project, update the title and description and return a success message
    project.update(title: params[:title], description: params[:description])
    { message: 'Project updated!', project: project }.to_json
  else
    delete '/projects/:id' do
        # delete a specific project by id
        project = Project.find(params[:id])
      
        # check if the user has access to the project
        if project.user_id == session[:user_id]
          project.destroy
          { message: 'Project deleted!', project: project }.to_json
        else
          { error: 'Access denied' }.to_json
        end
      end
      