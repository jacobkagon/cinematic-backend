class Api::V1::UsersController < ApplicationController

  
skip_before_action :authorized, only: [:user_reviews, :create, :update, :index]

    def index
        @users = User.all
        render json: @users
    end

    def show 
        @user = User.find(params[:id])
        render json: @user
    end

    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end


    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def user_reviews
      @user = User.find(params[:id])
      render json: @user.reviews.order(created_at: :desc)
    end

    def update
      new_user = User.find(params[:id])
      new_user.update(user_params)
      render json: new_user
    end

      def followers
        user = User.find(params[:id])
        render json: user.followers
      end
    
      def following
        user = User.find(params[:id])
        render json: user.followees
      end
      private 

  

      def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
    end

end
