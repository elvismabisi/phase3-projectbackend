class StatusUpdate < ActiveRecord::Base
    belongs_to :project
    belongs_to :user
  
    validates :text, presence: true
  end
  
  