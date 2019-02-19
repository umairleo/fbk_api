json.extract! post, :id, :content, :created_at, :updated_at
json.like_count post.likes.count