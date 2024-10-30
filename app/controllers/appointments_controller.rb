class AppointmentsController < ApplicationController

  before_action :set_appointment, only: [ :show, :destroy ]

  def new
    @hypnotists = Hypnotist.all
    @hypnotist = Hypnotist.find( params[ :id ] )
    availability_start = params[ :start_date ].present? ? Date.parse( params[ :start_date ] ) : Date.today.beginning_of_week
    availability_end = availability_start + 7
    @availability = @hypnotist.appointments_available( availability_start, availability_end )

  end

  def create
    @appointment = Appointment.new( appointment_params.except( :cancellation_policy ) )
    appointment_start = appointment_params[ :start ].to_datetime
    @appointment.update( start: appointment_start, end: 1.hour.after( appointment_start ) )
    @appointment.save
    if @appointment.valid?
      UserEvent.create( client: @appointment.client, description: 'scheduled an appointment', ip_address: request.remote_ip )
      flash[ :messages ] ||= [ "Appointment scheduled successfully" ]
      redirect_to client_path( current_user )
    else
      flash[ :messages ] ||= @appointment.errors.full_messages
      redirect_to new_appointment_path( @appointment.hypnotist.id )
    end
  end

  def show
  end

  def destroy
    @appointment.destroy
    flash[ :messages ] ||= [ "Appointment cancelled successfully" ]
    redirect_to client_path( current_user )
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
    params.require( :appointment ).permit( :hypnotist_id, :client_id, :start, :end, :location, :lng, :lat, :notes, :cancellation_policy )
  end

end
