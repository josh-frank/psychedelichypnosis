class Appointment < ApplicationRecord

  belongs_to :hypnotist
  belongs_to :client

  validates :start, presence: true
  validates :end, presence: true
  validate :release_signed, :appointment_in_future, :no_appointment_overlap, :hypnotist_available

  def format_start
    self.start.strftime( '%A, %B %-d, %Y at %-I%P' )
  end

  def format_start_time
    self.start.strftime( '%-I%P' )
  end

  private

  def release_signed
    unless self.client && self.client.release_signatures.any?
      errors.add( :client, "must sign release" )
    end
  end

  def appointment_in_future
    unless self.start > Time.now
      errors.add( :start, "must be a future date/time" )
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
