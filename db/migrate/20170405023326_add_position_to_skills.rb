class AddPositionToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :position, :integer
  end
end
