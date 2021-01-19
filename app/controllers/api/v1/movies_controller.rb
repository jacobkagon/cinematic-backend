class Api::V1::MoviesController < ApplicationController

    skip_before_action :authorized, only: [:index, :find_movie, :create, :movie_reviews]
    def index
        @movies = Movie.all
        render json: @movies
    end 

    def show
        movie = Movie.find(params[:id])
        render json: movie
    end

    def create
        @movie = Movie.new(movie_params)
         if Movie.find_by(movie_id: params[:movie_id])
           render json: { error: 'failed to create movie' }, status: :not_acceptable
         else
          @movie.save
          render json: @movie
         end
    end

    def find_movie
        movie = Movie.find_by(movie_id: params[:movie_id])
        render json: movie
    end

    def movie_reviews
        #this is to get all the reviews for a particular movie
        movie = Movie.find_by(movie_id: params[:movie_id])
        if movie.present?
            reviews = movie.reviews
           render json: reviews.order(created_at: :desc)
        else 
            render json: {error: 'movie does not have reviews'}, status: :not_acceptable
        end
    end


    private

    def set_movie
        @movie = Movie.find(params[:id])
    end

    def movie_params
        params.require(:movie).permit(:movie_id, :title, :poster)
    end
end
