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
        render json: watchlist.order(created_at: :asc)
    end

    def followee_watchlists
        followee_watchlist = Watchlist.find_followee_watchlist(current_user.followee_ids)
        render json: followee_watchlist.uniq { |p| p.movie }
    end

    def create
        watchlist = Watchlist.new(watchlist_params)
        if Watchlist.find_by(movie_id: params[:movie_id], user_id: params[:user_id])
            render json: {error: "Movie is already in user watchlist"}, status: :not_acceptable
        else
            watchlist.save
            render json: watchlist
        end
    end

    def destroy
        @watchlist = Watchlist.find_by(user_id: params[:user_id], movie_id: params[:movie_id])
        @watchlist.delete
    end


    private

    def watchlist_params
        params.require(:watchlist).permit(:user_id, :movie_id)
    end

    





end
