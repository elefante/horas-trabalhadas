class ProjectMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  validates_associated :user
  validates_associated :project
  validates_presence_of :joined
end
