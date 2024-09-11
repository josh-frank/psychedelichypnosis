class Hypnotist < ApplicationRecord

  has_secure_password
  validates_uniqueness_of :username

  has_many :user_events
  has_many :appointments
  has_many :clients, through: :appointments
  has_many :credits
  has_many :clients, through: :credits

end
