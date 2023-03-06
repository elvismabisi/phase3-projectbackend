require './app/app'
require './controllers/application_controller'
require './controllers/projects_controller'
require './controllers/users_controller'
require './controllers/status_update_controller'

use ApplicationController
use ProjectsController
use UsersController
use StatusUpdateController

run Sinatra::Application
