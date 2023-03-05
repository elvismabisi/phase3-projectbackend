class User < ActiveRecord::Base
    has_many :project_users
    has_many :projects, through: :project_users
  
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
  end
  