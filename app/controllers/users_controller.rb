class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

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
        render :sell
    end

    def sell_cards
        params[:user][:cards_to_sell].each do |card_id|
            #byebug
            search_cards_and_remove(card_id)
        end
        redirect_to user_path(current_user)
    end







    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :cards_to_sell => [])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
