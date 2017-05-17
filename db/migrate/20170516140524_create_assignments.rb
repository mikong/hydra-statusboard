class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.belongs_to :project, foreign_key: true
      t.belongs_to :member, foreign_key: true

      t.timestamps
    end
  end
end
