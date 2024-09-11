class Client < ApplicationRecord

  has_secure_password
  validates_uniqueness_of :username

  has_many :user_events
  has_many :release_signatures
  has_many :appointments
  has_many :hypnotists, through: :appointments
  has_many :credits
  has_many :hypnotists, through: :credits

end
