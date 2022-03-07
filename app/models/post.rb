class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { minimum: 5 }
  has_rich_text :body
  has_many_attached :images
  after_create_commit { broadcast_prepend_to "posts" }
  after_update_commit { broadcast_replace_to "posts" }
  after_destroy_commit { broadcast_remove_to "posts" }
end
