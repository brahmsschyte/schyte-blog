class AddPositionToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :position, :integer
  end
end
