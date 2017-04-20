class Comment < ApplicationRecord
  validates :comment_text, length: {minimum: 1, maximum: 2000}
  belongs_to :user
  belongs_to :article
end
