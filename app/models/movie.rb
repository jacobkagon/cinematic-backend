class Movie < ApplicationRecord
    has_many :reviews
    has_many :watchlists
    has_many :users, through: :reviews
    has many :users, through: :watchlists
    
end
