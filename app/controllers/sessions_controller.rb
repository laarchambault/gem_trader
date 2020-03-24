class SessionsController < ApplicationController
    def new

    end

    def create
        #this is where a user logs in
    end
    
    def destroy
        session.delete :user_id
    end
end
