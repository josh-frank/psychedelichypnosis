class HypnotistsController < ApplicationController

  before_action :set_hypnotist
  skip_before_action :authorize, only: [ :show ]

  def show
    availability_start = params[ :start_date ].present? ? Date.parse( params[ :start_date ] ) : Date.today.beginning_of_week
    availability_end = availability_start + 7
    @availability = @hypnotist.appointments_available( availability_start, availability_end )
  end

  private

  def set_hypnotist
    @hypnotist = Hypnotist.find( params[ :id ] )
  end

end
