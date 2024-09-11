class SessionsController < ApplicationController

    skip_before_action :authorize, only: [ :login_form, :login, :logout ]

    def login_form
    end

    def login
        @user = Client.find_by( username: params[ :username ] )
        if @user && @user.authenticate( params[ :password ] )
            session[ :id ] = @user.id
            session[ :user_type ] = :client
            UserEvent.create( client: @user, description: 'logged in', ip_address: request.remote_ip )
            redirect_to client_path( @user )
        else
            flash[ :messages ] = [ 'Invalid username or password!' ]
            redirect_to login_path
        end
    end

    def logout
        session[ :id ] = nil
        session[ :user_type ] = nil
        redirect_to home_path
    end

end
