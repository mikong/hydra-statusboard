class CreateGroupAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :group_assignments do |t|
      t.belongs_to :project, foreign_key: true
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end
