class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end
    
    def destroy
        session.delete :user_id
        flash[:notice] = "Logout successful. Thanks for using Gem Trader!"
        redirect_to '/'
    end


    private
    def session_params
        params.required[:session].permit[:name, :password]
    end
end 
