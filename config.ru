require './app'
require './controllers/application_controller'
require './controllers/projects_controller'
require './controllers/users_controller'

use ApplicationController
use ProjectsController
use UsersController

run Sinatra::Application
