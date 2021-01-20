class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :reviews, :watchlists, :followers_count, :followee_count, :followers

  def followers_count
    object.followers.count
  end

  
  def followee_count
    object.followees.count
  end

end
