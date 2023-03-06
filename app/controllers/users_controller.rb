require_relative './application_controller.rb'
require_relative '../models/user.rb'

class UsersController < ApplicationController
  # Get all users
  get "/users" do
    @users = User.all
    @users.to_json
  end

  # Get a specific user
  get "/users/:id" do
    @user = User.find(params[:id])
    @user.to_json
  end

  # Create a new user
  post "/users" do
    @user = User.new(params)
    if @user.save
      @user.to_json
    else
      {error: "Failed to create user"}.to_json
    end
  end

  # Update a user
  patch "/users/:id" do
    @user = User.find(params[:id])
    if @user.update(params)
      @user.to_json
    else
      {error: "Failed to update user"}.to_json
    end
  end

  # Delete a user
  delete "/users/:id" do
    @user = User.find(params[:id])
    if @user.destroy
      {message: "User deleted"}.to_json
    else
      {error: "Failed to delete user"}.to_json
    end
  end
end
