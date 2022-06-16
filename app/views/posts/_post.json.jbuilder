json.extract! post, :id, :recipe_id, :workout_id, :user_id, :description, :created_at, :updated_at
json.url post_url(post, format: :json)
