require_relative '../models/status_update'

class StatusUpdateController < ApplicationController
  # create a new status update for a project
  def create
    project = Project.find(params[:project_id])
    status_update = StatusUpdate.new(status_update_params)
    status_update.project = project
    status_update.user = current_user
    
    if status_update.save
      { message: 'Status update created successfully' }.to_json
    else
      status 400
      { error: status_update.errors.full_messages.join(', ') }.to_json
    end
  end
  
  # list all status updates for a project
  def index
    project = Project.find(params[:project_id])
    status_updates = project.status_updates
    
    status_updates.to_json
  end
  
  # show details of a specific status update
  def show
    status_update = StatusUpdate.find(params[:id])
    
    status_update.to_json
  end
  
  # update a status update
  def update
    status_update = StatusUpdate.find(params[:id])
    
    if status_update.update(status_update_params)
      { message: 'Status update updated successfully' }.to_json
    else
      status 400
      { error: status_update.errors.full_messages.join(', ') }.to_json
    end
  end
  
  # delete a specific status update by id
  def delete
    status_update = StatusUpdate.find(params[:id])
    
    if status_update.destroy
      { message: 'Status update deleted successfully' }.to_json
    else
      status 400
      { error: 'Unable to delete status update' }.to_json
    end
  end
  
  private
  
  def status_update_params
    params.require(:status_update).permit(:title, :description, :status)
  end
end
