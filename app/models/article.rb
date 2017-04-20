class Article < ApplicationRecord
  validates :title, :description, :url, presence: true, uniqueness: true
  validates :title, length: {minimum: 10, maximum: 90}
  validates :description, length: {minimum: 50, maximum: 300}
  validates :url, :url => true
  validates :img, :url => true, allow_blank: true, format: { with: %r{.(jpg|png)\Z}i, message: 'must be a URL for JPG or PNG image.' }
  belongs_to :user
  has_many :comments
  has_many :votes
end
