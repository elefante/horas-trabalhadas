class SummaryReport < ActiveRecord::Base
  belongs_to :project
  belongs_to :task_type
  belongs_to :user

  def report_data
    filters = []
    project_filter = self.project ? "and proj.id = ?" : ""
    filters << self.project.id if self.project
    user_filter = self.user ? "and usr.id = ?" : ""
    filters << self.user.id if self.user
    task_type_filter = self.task_type ? "and tt.id = ?" : ""
    filters << self.task_type.id if self.task_type
    SummaryReport.find_by_sql [%Q{
    select tl.task_date, usr.name as user, proj.name as project, tt.name as task,
        sum(tl.worked_hours) as total_work
    from time_logs tl
    inner join users usr on tl.user_id=tl.id #{user_filter}
    inner join task_types tt on tl.task_type_id=tt.id #{task_type_filter}
    inner join projects proj on tt.project_id=proj.id #{project_filter}
    group by task_date, user, project, task
    order by tl.task_date desc
    }, *filters]
  end
end
