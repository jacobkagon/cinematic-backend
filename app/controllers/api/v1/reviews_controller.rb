class Api::V1::ReviewsController < ApplicationController
    def index
        @reviews = Review.all
        render json: @reviews
    end

    def create
        @review = Review.create(review_params)
        render json: @review
    end

    def destroy
        @review = Review.find(params[:id])
        @review.delete
    end

   private

   def review_params
    params.require(:review).permit(:body, :user_id, :movie_id, :rating)
   end
end
