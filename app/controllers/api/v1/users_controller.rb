class Api::V1::UsersController < ApplicationController
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

    def follow_unfollow_user
        if current_user.followees.exists?(params[:id])
          current_user.followed_users.find_by(followee_id: params[:id]).destroy()
          is_following = false
        else
          user = User.find(params[:id])
          current_user.followees << user
          is_following = true
        end

        def profile
            render json: { user: UserSerializer.new(current_user) }, status: :accepted
        end
    
        render json: { is_following: is_following }, status: :ok
      end

      def followers
        user = User.find(params[:id])
        render json: user.followers, status: :ok
      end
    
      def following
        user = User.find(params[:id])
        render json: user.followees, status: :ok
      end
      private 

      def user_params
        params.require(:user).permit(:username, :password, :email)
    end

end
