json.extract! article, :id, :title, :description, :url, :vote_up, :vote_down, :created_at, :updated_at
json.url article_url(article, format: :json)
