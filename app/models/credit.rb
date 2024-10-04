class Credit < ApplicationRecord

  belongs_to :hypnotist
  belongs_to :client

  validates :hypnotist, :client, presence: true

end
