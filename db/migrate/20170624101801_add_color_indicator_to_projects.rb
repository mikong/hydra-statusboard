class AddColorIndicatorToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :color_indicator, :string
  end
end
