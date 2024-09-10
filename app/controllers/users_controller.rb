class UsersController < ApplicationController

    @@affirmations = [
        "Every day, in every way, you're getting better and better.",
        "You have within yourself all the instruments of your own well-being.",
        "You can do what has to be done.",
        "You are nourished by the fundamental life-force of the universe.",
        "Your love is the strongest force in the universe.",
        "You are pure enlightenment - nothing more, nothing less.",
        "You deserve love, happiness and enlightenment.",
        "Your potential is limitless.",
        # "",
        # "",
    ]

    def show
        @user = User.find( params[ :id ] )
        @affirmation = @@affirmations.sample
    end

  private

  def user_params
    params.require( :user ).permit( :username, :password, :first_name, :last_name, :phone, :email )
  end

end
