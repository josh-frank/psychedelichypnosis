class ClientsController < ApplicationController

  before_action :set_client, only: [ :show, :edit, :update, :change_password ]

  def show
    @affirmation = @@affirmations.sample
  end

  def edit
  end
  
  def update
    if @client.update( client_params )
      UserEvent.create( client: @client, description: 'updated profile', ip_address: request.remote_ip )
      flash[ :messages ] ||= [ 'Updated successfully' ]
    else
      flash[ :messages ] ||= @client.errors.full_messages
    end    
    redirect_to client_path( @client )
  end

  def change_password
    authenticate_user = @client.authenticate( client_params[ :old_password ] )
    new_passwords_match = client_params[ :password ] == client_params[ :password_confirmation ]
    if authenticate_user && new_passwords_match
      if @client.update( password: client_params[ :password ] )
        UserEvent.create( client: @user, description: 'changed password', ip_address: request.remote_ip )
        flash[ :messages ] ||= [ 'Password changed successfully' ]
      else
        flash[ :messages ] ||= @client.errors.full_messages
      end
    end
    redirect_to client_path( @client )
  end

  private

  def set_client
    @client = current_user
  end

  def client_params
    params.require( :client ).permit( :username, :password, :old_password, :password_confirmation, :first_name, :last_name, :phone, :email )
  end

end
