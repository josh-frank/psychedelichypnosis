class ClientsController < ApplicationController

  before_action :set_client, only: [ :show, :edit, :update ]

  def show
    @affirmation = @@affirmations.sample
  end

  def edit
  end
  
  def update
    if @client.update( client_params )
      flash[ :messages ] ||= [ 'Updated successfully' ]
    else
      flash[ :messages ] ||= @client.errors.full_messages
    end    
    redirect_to client_path( @client )
  end

  private

  def set_client
    @client = current_user
  end

  def client_params
    params.require( :client ).permit( :username, :password, :password_confirmation, :first_name, :last_name, :phone, :email )
  end

end
