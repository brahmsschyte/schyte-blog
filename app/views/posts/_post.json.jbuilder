json.extract! post, :id, :title, :body, :tags, :slug, :visibility, :draft, :published_at, :created_at, :updated_at
json.url post_url(post, format: :json)
