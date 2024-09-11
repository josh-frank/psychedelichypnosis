class ClientsController < ApplicationController

    def show
        @client = current_user
        @affirmation = @@affirmations.sample
    end

  private

  def client_params
    params.require( :client ).permit( :username, :password, :first_name, :last_name, :phone, :email )
  end

end
