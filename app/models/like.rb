class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.look_up_like(user_id, post_id)
    where(user_id: user_id, post_id: post_id).first
  end

  def self.delete_like(user_id, post_id)
    where(user_id: user_id, post_id: post_id).first.destroy
  end

end
