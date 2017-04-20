json.extract! comment, :id, :comment_text, :vote_up, :vote_down, :user_id, :article_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
