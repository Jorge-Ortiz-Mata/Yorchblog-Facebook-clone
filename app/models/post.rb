class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { minimum: 5 }
  has_rich_text :body
  after_create_commit { broadcast_prepend_to "posts" }
end
