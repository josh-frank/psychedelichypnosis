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

  def to_icalendar
    Icalendar::Calendar.parse( self.availability ).first
  end

  def availability_between( start_date, end_date = start_date + 1 )
    self.to_icalendar.events.flat_map do | event |
      event.occurrences_between( start_date, end_date ).map { | occurrence | occurrence.start_time..occurrence.end_time }
    end
  end

end
