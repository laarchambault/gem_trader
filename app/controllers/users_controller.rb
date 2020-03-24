class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.points = 50
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = current_user
        #figure out how to create a session user
    end

    def select_cards
        
    end

    def sell_cards
        #User.sell_card method
        redirect_to user_path(@user)
    end


    private

    def user_params
        params.require(:user).permit(:name)
    end
end
