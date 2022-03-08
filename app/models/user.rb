class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :connections, dependent: :destroy
  has_many :friends, through: :connections, dependent: :destroy
  validates :email, uniqueness: true
end
