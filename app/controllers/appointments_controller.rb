class AppointmentsController < ApplicationController

  before_action :set_appointment, only: []

  def new
    @hypnotists = Hypnotist.all
    @hypnotist = Hypnotist.find( params[ :id ] )
    availability_start = params[ :start_date ].present? ? Date.parse( params[ :start_date ] ) : Date.today.beginning_of_week
    availability_end = availability_start + 7
    @availability = @hypnotist.appointments_available( availability_start, availability_end )

  end

  def create
  end

  private

  def set_appointment
    @appointment = Appointment.find( params[ :id ] )
    unless @appointment.client == current_user || @appointment.hypnotist == current_user
      flash[ :messages ] ||= [ "Not authorized" ]
      redirect_to client_path( current_user )
    end
  end

  def appointment_params
    params.require( :appointment ).permit( :hypnotist_id, :client_id, :start, :end, :location, :lng, :lat, :notes )
  end

end
