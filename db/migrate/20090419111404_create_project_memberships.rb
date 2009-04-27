class CreateProjectMemberships < ActiveRecord::Migration
  def self.up
    create_table :project_memberships do |t|
      t.date :joined, :null => false
      t.date :leaved
      t.belongs_to :user, :null => false
      t.belongs_to :project, :null => false
      t.timestamps
    end
    add_index :project_memberships, [:user_id, :project_id], :unique => true
  end

  def self.down
    drop_table :project_memberships
  end
end
