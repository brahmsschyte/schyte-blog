class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string   :title,        index: true
      t.text     :body,         index: true
      t.string   :tags,         index: true
      t.string   :slug,         index: true
      t.string   :visibility,   index: true
      t.boolean  :draft,        index: true
      t.datetime :published_at, index: true
      t.string :featured_image, index: true
      t.string   :description,  index: true
      t.string   :keywords,     index: true
      t.integer  :user_id,      index: true

      t.timestamps
    end
  end
end
