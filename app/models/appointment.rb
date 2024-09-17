class Appointment < ApplicationRecord

  belongs_to :hypnotist
  belongs_to :client

  validate :no_appointment_overlap

  private

  def no_appointment_overlap
    if Appointment.where( start: self.start..self.end, hypnotist: self.hypnotist, client: self.client ).any?
      errors.add( :end, "overlaps another reservation" )
    end
  end

end
