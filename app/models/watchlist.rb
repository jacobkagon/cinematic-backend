class Watchlist < ApplicationRecord
    belongs_to :user
    belongs_to :movie

    def self.find_user_watchlist(id) 
        Watchlist.where(user_id: id)
    end


end
