class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :email, :last_name, :username, :reviews, :watchlists, :followers_count, :followee_count, :followers, :followees

  def followers_count
    object.followers.count
  end

  
  def followee_count
    object.followees.count
  end

end
