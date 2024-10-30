class Appointment < ApplicationRecord

  belongs_to :hypnotist
  belongs_to :client

  validates :start, presence: true
  validates :end, presence: true
  validate :release_signed
  validate :no_appointment_overlap
  validate :hypnotist_available

  private

  def release_signed
    unless self.client && self.client.release_signatures.any?
      errors.add( :client, "must sign release" )
    end
  end

  def no_appointment_overlap
    if Appointment.where.not( id: self.id ).where( start: self.start..self.end, hypnotist: self.hypnotist ).any?
      errors.add( :start, "overlaps another appointment" )
    end
  end

  def hypnotist_available
    unless [ self.hypnotist, self.start, self.end ].all? && self.hypnotist.availability_between( self.start.to_datetime ).any?{ | availability | availability.cover?( self.start.to_datetime ) || availability.cover?( self.end.to_datetime ) }
      errors.add( :start, "must match Hypnotist availability" )
    end
  end

end
