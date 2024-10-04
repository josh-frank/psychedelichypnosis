class Appointment < ApplicationRecord

  belongs_to :hypnotist
  belongs_to :client

  validate :release_signed
  validate :no_appointment_overlap
  validate :hypnotist_available
  validates :hypnotist, :client, presence: true

  private

  def release_signed
    unless self.client.release_signatures.any?
      errors.add( :client, "must sign release" )
    end
  end

  def no_appointment_overlap
    if Appointment.where( start: self.start..self.end, hypnotist: self.hypnotist, client: self.client ).any?
      errors.add( :start, "overlaps another reservation" )
    end
  end

  def hypnotist_available
    unless self.hypnotist.availability_between( self.start ).any?{ | availability | availability.cover?( self.start..self.end ) }
      errors.add( :start, "must match Hypnotist availability" )
    end
  end

end
