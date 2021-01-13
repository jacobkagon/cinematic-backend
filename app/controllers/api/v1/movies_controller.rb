class Api::V1::MoviesController < ApplicationController
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
     if movie.find_by(movie_id: params[:movie_id])
           render json: { error: 'failed to create movie' }, status: :not_acceptable
         else
          @movie.save
          render json: @movie
         end
    end


    private

    def set_movie
        @movie = Movie.find(params[:id])
    end

    def movie_params
        params.require(:movie).permit(:movie_id)
    end
end
