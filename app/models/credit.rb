class Credit < ApplicationRecord
  belongs_to :hypnotist
  belongs_to :client
end
