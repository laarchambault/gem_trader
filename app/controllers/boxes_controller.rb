class BoxesController < ApplicationController
    before_action :require_login

    def index
        @boxes = Box.all
    end

    def show
        @box = Box.find(params[:id])
        @box_cards = @box.cards_at_least_50
        if @box.enough_points?(current_user.points)
            current_user.cards << @box_cards
            current_user.update(points: current_user.points - @box.cost)
        else
            return redirect_to user_path(current_user)
        end
    end

    private 
    def require_login
        if !session.include? :user_id
            flash[:message] = "You must be logged in before viewing that page."
            redirect_to '/'
        end
    end
end
