class CreateTimeLogs < ActiveRecord::Migration
  def self.up
    create_table :time_logs do |t|
      t.belongs_to :user, :null => false
      t.belongs_to :task_type, :null => false
      t.text :description
      t.date :tak_date, :null => false
      t.time :worked_hours, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :time_logs
  end
end
