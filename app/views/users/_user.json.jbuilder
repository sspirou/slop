json.extract! user, :id, :username, :bio, :city, :password_hash, :created_at, :updated_at
json.url user_url(user, format: :json)
