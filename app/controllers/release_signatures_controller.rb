class ReleaseSignaturesController < ApplicationController

  def create
    @release_signature = ReleaseSignature.create( release_signature_params )
    if @release_signature.valid?
      UserEvent.create( client: @release_signature.client, description: 'signed the release form', ip_address: request.remote_ip )
      flash[ :messages ] = [ "Release signed successfully" ]
      redirect_to client_path( current_user )
    else
      flash[ :messages ] ||= @release_signature.errors.full_messages
      redirect_to release_form_path
    end
  end

  private

    def release_signature_params
      params.require( :release_signature ).permit( :client_id, :e_signature, :date, :release_version )
    end

end
