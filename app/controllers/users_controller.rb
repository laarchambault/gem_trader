class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def index
        @users = User.all
    end
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.points = 50
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Your account has been created. To get started, buy a box!"
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = current_user
    end

    def select_cards
        render :sell
    end

    def sell_cards
        params[:user][:cards_to_sell].each do |card_id|
            search_cards_and_remove(card_id)
        end
        flash[:notice] = "Sale successful. Congrats!"
        redirect_to user_path(current_user)
    end




    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :cards_to_sell => [])
    end

    def require_login
        if !session.include? :user_id
            flash[:alert] = "You must be logged in before viewing that page."
            redirect_to '/'
        end
    end
end
