class Api::V1::FriendshipsController < ApplicationController

    def create
        @friend = Friendship.new(friendship_params)
        if Friendship.find_by(followee_id: params[:followee_id], follower_id: params[:follower_id]) 
            render json: { error: 'cannot follow someone more than once' }, status: :not_acceptable
          else
           @friend.save
           render json: @friend
          end
    end

    def destroy
        friend = Friendship.find_by(follower_id: params[:follower_id], followee_id: params[:followee_id])
        friend.delete
    end

    private

    def friendship_params
        params.require(:friendship).permit(:followee_id, :follower_id)
    end

end
