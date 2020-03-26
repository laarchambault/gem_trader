class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        User.find(session[:user_id])
    end

    def search_cards_and_remove(card_id)
        current_user.cards.each do |card|
            if card.id == card_id.to_i
                pay_user(card)
                sold_card = UserCard.find_by(user_id: current_user.id, card_id: card.id)
                sold_card.destroy
                return
            end
        end
    end

    def pay_user(card)
        user = current_user
        user.points += card.points_worth
        user.save
    end
end
