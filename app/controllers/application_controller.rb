class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
  
    # Get all users
    get '/users' do
      users = User.all
      users.to_json
    end
  
    # Get a specific user and their projects
    get '/users/:id' do
      user = User.find(params[:id])
      user.to_json(include: :projects)
    end
  
    # Create a new user
    post '/users' do
      user = User.create(
        name: params[:name],
        email: params[:email],
        bio: params[:bio]
      )
      user.to_json
    end
  
    # Update an existing user
    patch '/users/:id' do
      data = JSON.parse(request.body.read)
      user = User.find(params[:id])
      user.update(data)
      user.to_json
    end
  
    # Delete a user
    delete '/users/:id' do
      user = User.find(params[:id])
      user.destroy
      "User with id #{params[:id]} has been deleted"
    end
  
    # Get all projects
    get '/projects' do
      projects = Project.all
      projects.to_json
    end
  
    # Get a specific project
    get '/projects/:id' do
      project = Project.find(params[:id])
      project.to_json
    end
  
    # Create a new project
    post '/projects' do
      project = Project.create(
        title: params[:title],
        description: params[:description],
        image_url: params[:image_url],
        user_id: params[:user_id]
      )
      project.to_json
    end
  
    # Update an existing project
    patch '/projects/:id' do
      data = JSON.parse(request.body.read)
      project = Project.find(params[:id])
      project.update(data)
      project.to_json
    end
  
    # Delete a project
    delete '/projects/:id' do
      project = Project.find(params[:id])
      project.destroy
      "Project with id #{params[:id]} has been deleted"
    end
    get '/' do
        "Hello World"
      end
  end
  