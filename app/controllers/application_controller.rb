class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :authorize
  before_action :authorize

  def current_user
    @current_user ||= User.find_by( id: session[ :id ] )
  end

  def logged_in?
    !current_user.nil?
  end

  def authorize
    unless logged_in? 
      flash[ :messages ] = [ "You must be logged in!" ]
      redirect_to home_path
    end
  end

end
