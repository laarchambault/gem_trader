class BoxesController < ApplicationController
    def index
        @boxes = Box.all
    end

    def show
        @box = Box.find(params[:id])
        @box_random_cards_common = @box.box_for_common
        if @box.enough_points?(current_user.points)
            current_user.cards << @box_random_cards_common
            current_user.update(points: current_user.points - @box.cost)
        else
            return redirect_to user_path(current_user)
        end
    end
end
