class Appointment < ApplicationRecord

  belongs_to :hypnotist, class_name: "User"
  belongs_to :client, class_name: "User"
  
  validate :validate_hypnotist_id
  validate :validate_client_id
  # validate :no_appointment_overlap

  private

  def validate_hypnotist_id
    unless User.find( self.hypnotist_id ).hypnotist?
      errors.add( :hypnotist_id, "not valid" )
    end
  end

  def validate_client_id
    unless User.find( self.client_id ).client?
      errors.add( :client_id, "not valid" )
    end
  end

  # def no_appointment_overlap
  #   if Appointment.where( "(DATETIME(#{ self.start }) BETWEEN start AND end OR DATETIME(#{ self.end }) BETWEEN start AND end) AND hypnotist_id = #{ self.hypnotist_id } AND client_id = #{ client_id }", self.start, self.end, self.hypnotist_id, self.client_id ).any?
  #     errors.add( :end, "overlaps another reservation" )
  #   end
  # end

end
