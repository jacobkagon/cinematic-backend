class Api::V1::WatchlistsController < ApplicationController

    skip_before_action :authorized, only: [:user_watchlist]

    def index 
        @watchlists = Watchlist.all
        render json :watchlist
    end

    def show
        @watchlist = Watchlist.find(params[:id])
        render json: @watchlist
    end

    def user_watchlist
        #only want to get watchlist for user id
        watchlist = Watchlist.find_user_watchlist(params[:user_id])
        render json: watchlist
    end

    def create
        watchlist = Watchlist.create(watchlist_params)
    end

    private

    def watchlist_params
        params.require(:watchlist).permit(:user_id, :movie_id)
    end

    





end
