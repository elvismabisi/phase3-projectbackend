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

# load controllers
require_relative 'controllers/users_controller'
require_relative 'controllers/projects_controller'
require_relative 'controllers/application_controller'

# enable sessions
enable :sessions

# define routes

# welcome page
get '/' do
  { message: 'Welcome to the project management API!' }.to_json
end

# user signup
post '/signup', to: 'user#create'

# user login
post '/login', to: 'user#login'

# user logout
post '/logout', to: 'user#logout'

# list all projects
get '/projects', to: 'project#index'

# create a new project
post '/projects', to: 'project#create'

# show details of a specific project
get '/projects/:id', to: 'project#show'

# update a project
patch '/projects/:id', to: 'project#update'

# delete a specific project by id
delete '/projects/:id', to: 'project#delete'

# create a new status update for a project
post '/projects/:project_id/status_updates', to: 'status_update#create'

# list all status updates for a project
get '/projects/:project_id/status_updates', to: 'status_update#index'

# show details of a specific status update
get '/status_updates/:id', to: 'status_update#show'

# update a status update
patch '/status_updates/:id', to: 'status_update#update'

# delete a specific status update by id
delete '/status_updates/:id', to: 'status_update#delete'
