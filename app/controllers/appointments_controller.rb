class AppointmentsController < ApplicationController

  def new
  end

  def create
  end

  private

  def appointment_params
    params.require( :appointment ).permit( :hypnotist_id, :client_id, :start, :end )
  end

end
