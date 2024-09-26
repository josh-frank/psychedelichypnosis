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
    result = []
    self.availability_between( start_date, end_date ).each do | availability_today |
      appointments_today = self.appointments_between( start_date, end_date ).select{ | appointment | availability_today.overlaps?( appointment ) }
      if appointments_today.present?
        appointments_today_range = appointments_today.map( &:begin ).min..appointments_today.map( &:end ).max
        if appointments_today_range.begin <= availability_today.begin
          result.push( appointments_today_range.end..availability_today.end )
        elsif appointments_today_range.end >= availability_today.end
          result.push( availability_today.begin..appointments_today_range.begin )
        else
          result.push( availability_today.begin..appointments_today_range.begin )
          result.push( appointments_today_range.end..availability_today.end )
        end
      else
        result.push( availability_today )
      end
    end
    result
  end

  private

  def ranges_overlap?( a, b )
    a.include?( b.begin ) || b.include?( a.begin )
  end

  def merge_ranges( a, b )
    [ a.begin, b.begin ].min..[ a.end, b.end ].max
  end

end
