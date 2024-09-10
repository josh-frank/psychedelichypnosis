class User < ApplicationRecord

  has_secure_password
  validates :username, presence: true, uniqueness: true

  has_many :user_events
  has_many :release_signatures
  has_many :hypnotists, foreign_key: :hypnotist_id , class_name: "Appointment"
  has_many :clients, foreign_key: :client_id , class_name: "Appointment"

  enum user_type: {
    client: 0,
    hypnotist: 1,
    admin: 2 
  }

end
