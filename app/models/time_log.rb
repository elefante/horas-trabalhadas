class TimeLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :task_type
  validates_presence_of :task_date
  validates_presence_of :worked_hours
end
