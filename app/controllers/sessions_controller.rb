class SessionsController < ApplicationController

    skip_before_action :authorize, only: [ :client_login_form, :client_login, :logout ]

    def client_login_form
    end

    def client_login
        @user = Client.find_by( username: params[ :username ] )
        if @user && @user.authenticate( params[ :password ] )
            session[ :id ], session[ :user_type ] = @user.id, :client
            UserEvent.create( client: @user, description: 'logged in', ip_address: request.remote_ip )
            redirect_to client_path( @user )
        else
            flash[ :messages ] = [ 'Invalid username or password!' ]
            redirect_to client_login_form_path
        end
    end

    # def hypnotist_login
    # end

    def logout
        session[ :id ], session[ :user_type ] = nil, nil
        redirect_to home_path
    end

end
