class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
  validates :genre, presence: true
  validates :telephone, presence: true
  validates :date_birth, presence: true
  validates :occupation, presence: true
end
