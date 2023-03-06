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
require_relative 'controllers/status_update_controller'

# enable sessions
enable :sessions

# enable debug logging
set :logging, true

# welcome page
get '/' do
  { message: 'Welcome to the project management API!' }.to_json
end

# user signup
post '/signup', to: 'users#create'

# user login
post '/login', to: 'users#login'

# user logout
post '/logout', to: 'users#logout'

# list all projects
get '/projects', to: 'projects#index'

# create a new project
post '/projects', to: 'projects#create'

# show details of a specific project
get '/projects/:id', to: 'projects#show'

# update a project
patch '/projects/:id', to: 'projects#update'

# delete a specific project by id
delete '/projects/:id', to: 'projects#delete'

# create a new status update for a project
post '/projects/:project_id/status_updates', to: 'status_updates#create'

# list all status updates for a project
get '/projects/:project_id/status_updates', to: 'status_updates#index'

# show details of a specific status update
get '/status_updates/:id', to: 'status_updates#show'

# update a status update
patch '/status_updates/:id', to: 'status_updates#update'

# delete a specific status update by id
delete '/status_updates/:id', to: 'status_updates#delete'
