class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
  validates :genre, presence: true
  validates :telephone, presence: true
  validates :date_birth, presence: true
  validates :occupation, presence: true

  def self.look_up(user_search)
    where("first_name like ?", "%#{user_search}%")
  end

end
