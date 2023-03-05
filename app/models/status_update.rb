class StatusUpdate < ActiveRecord::Base
    belongs_to :project
  
    validates :status, presence: true
  end
  