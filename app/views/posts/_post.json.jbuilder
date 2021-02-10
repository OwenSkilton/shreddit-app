json.extract! post, :id, :title, :description, :photo, :created_at, :updated_at
json.url post_url(post, format: :json)
