require 'icalendar/recurrence'

class Hypnotist < ApplicationRecord

  has_secure_password
  validates_uniqueness_of :username

  has_many :user_events
  has_many :appointments
  has_many :clients, through: :appointments
  has_many :credits
  has_many :clients, through: :credits

  def full_name
    "#{ self.first_name } #{ self.last_name }"
  end

  def initialed_name
    "#{ self.first_name } #{ self.last_name.first.upcase }."
  end

  def icalendar
    Icalendar::Calendar.parse( self.availability ).first
  end

  def availability_between( start_date, end_date = start_date + 1 )
    self.icalendar.events.flat_map do | event |
      event.occurrences_between( start_date, end_date ).map { | occurrence | occurrence.start_time..occurrence.end_time }
    end
  end

  def appointments_between( start_date, end_date = start_date + 1 )
    self.appointments.where( start: start_date..end_date ).map { | appointment | appointment.start.to_time..appointment.end.to_time }
  end

  def appointments_available( start_date, end_date = start_date + 1 )
    appointments = self.appointments_between( start_date, end_date ).flat_map( &:begin )
    availability = self.availability_between( start_date, end_date ).flat_map do | day |
      ( day.begin.to_i..day.end.to_i ).step( 1.hour ).map{ | slot | Time.at( slot ) }
    end
    availability.filter{ | slot | !appointments.include?( slot ) }
  end

end
