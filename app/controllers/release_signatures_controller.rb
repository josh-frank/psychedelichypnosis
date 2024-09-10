class ReleaseSignaturesController < ApplicationController

  def new
    @release_signature = ReleaseSignature.new
  end

  def create
    @release_signature = ReleaseSignature.create( release_signature_params )
    if @release_signature.valid?
      flash[ :messages ] = [ "Release signed successfully" ]
      redirect_to user_path( current_user )
    else
      flash[ :messages ] ||= @release_signature.errors.full_messages
      redirect_to release_form_path
    end
  end

  private

    def release_signature_params
      params.require( :release_signature ).permit( :user_id, :e_signature, :date, :release_version )
    end

end
