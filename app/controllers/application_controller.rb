class ApplicationController < ActionController::Base

  @@affirmations = [
      "Every day, in every way, you're getting better and better.",
      "You can do what has to be done.",
      "You are nourished by the fundamental life-force of the universe.",
      "Your love is the strongest force in the universe.",
      "You are pure enlightenment - nothing less.",
      "You deserve nothing less than love, happiness and complete enlightenment.",
      "Your potential is limitless.",
      "You are a vital part of the greatest story in the universe.",
      "Your enlightenment has already been achieved.",
      # "",
      # "",
  ]

  helper_method :current_user, :logged_in?, :authorize
  before_action :authorize

  def current_user
    @current_user ||= Client.find_by( id: session[ :id ] )
  end

  def logged_in?
    !current_user.nil?
  end

  def authorize
    unless logged_in? 
      flash[ :messages ] ||= [ "You must be logged in!" ]
      redirect_to home_path
    end
  end

end
