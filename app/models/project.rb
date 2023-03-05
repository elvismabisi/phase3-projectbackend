class Project < ActiveRecord::Base
    has_many :project_users
    has_many :users, through: :project_users
    has_many :status_updates
  
    validates :name, presence: true
    validates :description, presence: true
  end
  