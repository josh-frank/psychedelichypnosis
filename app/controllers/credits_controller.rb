class CreditsController < ApplicationController

  before_action :set_credit, only: [ :show ]

  def show
    @credit = Credit.find( params[ :id ] )
  end

  private

  def set_credit
    @credit = Credit.find( params[ :id ] )
    unless @credit.client == current_user || @credit.hypnotist == current_user
      flash[ :messages ] ||= [ "Not authorized" ]
      redirect_to client_path( current_user )
    end
  end

end
