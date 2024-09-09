class AppointmentsController < ApplicationController

  private

  def appointment_params
    params.require( :appointment ).permit( :hypnotist_id, :client_id, :start, :end )
  end

end
