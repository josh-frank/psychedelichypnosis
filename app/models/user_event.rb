class UserEvent < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :hypnotist, optional: true
end
