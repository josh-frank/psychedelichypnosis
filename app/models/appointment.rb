class Appointment < ApplicationRecord

  belongs_to :hypnotist
  belongs_to :client

  # validate :no_appointment_overlap

  # private

  # def no_appointment_overlap
  #   if Appointment.where( "(DATETIME(#{ self.start }) BETWEEN start AND end OR DATETIME(#{ self.end }) BETWEEN start AND end) AND hypnotist_id = #{ self.hypnotist_id } AND client_id = #{ client_id }", self.start, self.end, self.hypnotist_id, self.client_id ).any?
  #     errors.add( :end, "overlaps another reservation" )
  #   end
  # end

end
