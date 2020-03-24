class BoxesController < ApplicationController
    def index
        @boxes = Box.all
    end

    def show
        @box = Box.find(params[:id])
        @box_random_cards_common = @box.box_for_common
        current_user.cards << @box_random_cards_common
    end
end
