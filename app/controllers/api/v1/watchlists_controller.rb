class Api::V1::WatchlistsController < ApplicationController

    def index 
        @watchlists = Watchlist.all
        render json :watchlist
    end

    def show
        @watchlist = Watchlist.find(params[:id])
        render json: @watchlist
    end

    def user_watchlist
        watchlist = Watchlist.find_user_watchlist(current_user)
        render json: watchlist
    end

    #only want to get watchlist for user id





end
