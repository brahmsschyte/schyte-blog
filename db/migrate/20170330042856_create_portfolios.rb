class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.string :slug
      t.string :title
      t.string :description
      t.string :keywords
      t.string :photo
      t.string :name
      t.string :job
      t.text   :overview
      t.string :email
      t.string :phone
      t.string :social
      t.string :address
      t.string :address_line1
      t.string :address_line2

      t.timestamps
    end
  end
end
