class UserSerializer < ActiveModel::Serializer
  attributes :user_id, :first_name, :last_name, :username, :followers, :followees, :reviews, :watchlists, :followers_count, :followee_count
 
  def followers_count
    object.followers.count
  end



  
  def followee_count
    object.followees.count
  end

end
