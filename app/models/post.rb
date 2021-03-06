class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { minimum: 5 }
  has_rich_text :body
  has_many_attached :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  #after_create_commit {broadcast_prepend_to "posts"}
end
