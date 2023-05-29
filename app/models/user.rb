class User < ApplicationRecord
  has_many :bookings
  has_many :rented_planets, through: :bookings, source: :planets
  has_many :owned_planets, source: :planets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
