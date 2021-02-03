class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :follower_id, :followee_id
  belongs_to :user, serializer: UserSerializer
end
