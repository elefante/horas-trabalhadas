class TaskType < ActiveRecord::Base
  belongs_to :project
  has_many :time_logs
  validates_associated :project
  validates_uniqueness_of :name, :scope => :project_id
  validates_presence_of :name
  validates_length_of :name, :within => 5..50
end
