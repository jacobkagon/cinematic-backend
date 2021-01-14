class Review < ApplicationRecord
    belongs_to :user
    belongs_to :movie


    def self.find_followee_reviews(id) 
        Review.where(user_id: id)
    end


end
