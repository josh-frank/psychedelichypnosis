class CreditsController < ApplicationController

  def show
    @credit = Credit.find( params[ :id ] )
  end

end
