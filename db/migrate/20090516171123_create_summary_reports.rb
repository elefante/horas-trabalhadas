class CreateSummaryReports < ActiveRecord::Migration
  def self.up
    create_table :summary_reports do |t|
      t.references :project
      t.references :task_type
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :summary_reports
  end
end
