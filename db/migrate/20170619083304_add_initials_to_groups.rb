class AddInitialsToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :initials, :string
  end
end
