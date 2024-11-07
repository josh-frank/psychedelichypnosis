class Client < ApplicationRecord

  validates_uniqueness_of :username
  validate :valid_us_phone, :phone_required_for_sms_consent
  
  has_secure_password
  has_many :user_events
  has_many :release_signatures
  has_many :appointments
  has_many :hypnotists, through: :appointments
  has_many :credits
  has_many :hypnotists, through: :credits

  def full_name
    "#{ self.first_name } #{ self.last_name }"
  end

  def balance
    self.credits.sum( :value ) - self.appointments.size
  end

  def past_appointments
    self.appointments.where( start: ..Date.today ).order( start: :desc )
  end

  def upcoming_appointments
    self.appointments.where( start: Date.today.. ).order( start: :asc )
  end

  def send_reminder?
    self.sms_consent && [ self.phone, self.past_appointments, self.upcoming_appointments ].all?( &:present? )
  end

  private

  def valid_us_phone
    if self.phone.present? && Phonelib.invalid_for_country?( self.phone, 'US' )
      errors.add( :phone, "must be a valid US phone number" )
    end
  end

  def phone_required_for_sms_consent
    if self.sms_consent && self.phone.blank?
      errors.add_to_base( "SMS consent requires a valid US phone number" )
    end
  end

end
