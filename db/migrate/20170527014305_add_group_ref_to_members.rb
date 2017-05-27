class AddGroupRefToMembers < ActiveRecord::Migration[5.1]
  def change
    add_reference :members, :group, foreign_key: true
  end
end
