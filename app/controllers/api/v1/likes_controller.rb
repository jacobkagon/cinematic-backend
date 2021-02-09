class Api::V1::LikesController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @like = Like.create(user_id: params[:user_id], review_id: params[:review_id])
        render json: @like
    end

end
