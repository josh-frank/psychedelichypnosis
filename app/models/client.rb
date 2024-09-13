class Client < ApplicationRecord

  has_secure_password
  validates_uniqueness_of :username

  has_many :user_events
  has_many :release_signatures
  has_many :appointments
  has_many :hypnotists, through: :appointments
  has_many :credits
  has_many :hypnotists, through: :credits

  def full_name
    "#{ self.first_name } #{ self.last_name }"
  end

  def balance
    self.credits.sum( :value ) - self.appointments.size
  end

end
