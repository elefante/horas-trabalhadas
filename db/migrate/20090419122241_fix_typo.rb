class FixTypo < ActiveRecord::Migration
  def self.up
    rename_column :time_logs, :tak_date, :task_date
  end

  def self.down
    rename_column :time_logs, :task_date, :tak_date
  end
end
