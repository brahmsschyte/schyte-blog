class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string  :name
      t.integer :mastery
      t.text    :info
      t.integer :portfolio_id

      t.timestamps
    end
  end
end
