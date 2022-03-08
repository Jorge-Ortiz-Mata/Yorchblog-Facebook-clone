class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def self.look_connection(id_1, id_2)
    where(user_id: id_1, friend_id: id_2).exists? || where(user_id: id_2, friend_id: id_1).exists? 
  end

  def self.delete_connections(id_1, id_2)
    where(user_id: id_1, friend_id: id_2).first.destroy
    where(user_id: id_2, friend_id: id_1).first.destroy
  end

end
