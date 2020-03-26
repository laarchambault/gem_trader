class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        if session[:user_id]
            value = User.find(session[:user_id])
        else
            value = nil
        end
        value
    end

    #################     sell_card methods     #############################
    def search_cards_and_remove(card_id)
        current_user.cards.each do |card|
            if card.id == card_id.to_i
                pay_user(card)
                sold_card = find_user_card(current_user.id, card.id)
                sold_card.destroy
                return
            end
        end
    end

    def find_user_card(user_id, card_id)
        UserCard.find_by(user_id: user_id, card_id: card_id)
    end

    def pay_user(card)
        user = current_user
        user.points += card.points_worth
        user.save
    end


end
