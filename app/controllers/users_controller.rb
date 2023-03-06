require_relative './application_controller.rb'
class UsersController < ApplicationController
    # Get all users
    get "/users" do
      # code to get all users from the database
    end
  
    # Get a specific user
    get "/users/:id" do
      # code to get a specific user from the database
    end
  
    # Create a new user
    post "/users" do
      # code to create a new user in the database
    end
  
    # Update a user
    patch "/users/:id" do
      # code to update a user in the database
    end
  
    # Delete a user
    delete "/users/:id" do
      # code to delete a user from the database
    end
  end
  