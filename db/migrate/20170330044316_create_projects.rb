class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string  :name
      t.string  :timeline
      t.text    :info
      t.string  :featured_image
      t.integer :portfolio_id

      t.timestamps
    end
  end
end
