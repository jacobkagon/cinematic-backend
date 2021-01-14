class ApplicationController < ActionController::API

    def current_user 
        @user = User.find_by(id: 18)
    end
end

