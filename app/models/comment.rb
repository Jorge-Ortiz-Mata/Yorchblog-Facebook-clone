class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true

  def self.look_up_comment(comment_id)
    where(id: comment_id).first.destroy
  end

end
