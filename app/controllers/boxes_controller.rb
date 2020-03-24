class BoxesController < ApplicationController
    def index
        @boxes = Box.all
    end

    def show
        @box = Box.find(params[:id])
        @user_cards = User.first.cards
        @box_random_cards_common = @box.box_for_common
        @user_cards << @box_random_cards_common
    end
end
