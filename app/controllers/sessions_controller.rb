class SessionsController < ApplicationController
    skip_before_action :authorize, only: [ :login_form, :login, :logout ]

    def login_form
    end

    def login
        @user = User.find_by( username: params[ :username ] )
        if @user && @user.authenticate( params[ :password ] )
            session[ :id ] = @user.id
            redirect_to user_path( @user )
        else
            flash[ :messages ] = [ "Invalid username or password!" ]
            redirect_to login_path
        end
    end

    def logout
        session[ :id ] = nil
        redirect_to home_path
    end

end
