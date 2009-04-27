class Project < ActiveRecord::Base
  has_many :tast_types
  has_many :project_memberships, :conditions => "leaved is null"
  has_many :users, :through => :project_memberships
  has_many :time_logs, :through => :task_types
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :within => 5..50
end
