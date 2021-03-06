class Api::V1::ReviewsController < ApplicationController

    skip_before_action :authorized, only: [:create, :update]
    def index
        @reviews = Review.all
        render json: @reviews
    end

    def create
        @review = Review.create(review_params)
        render json: @review
    end

    def followee_reviews
       followee_reviews = Review.find_followee_reviews(current_user.followee_ids)
       render json: followee_reviews.order(created_at: :desc)
    end

    def movie_reviews
        movie_reviews = Review.movie_reviews(params[:movie_id])
        render json: movie_reviews
    end

    # def update 
    #     @movie = Review.find(params[:id])
    #     @movie.update(review_params)
    #     render json: @movie
    # end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
    end

   private

   def review_params
    params.require(:review).permit(:body, :user_id, :movie_id, :rating)
   end

end
