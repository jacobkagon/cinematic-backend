class UserSerializer < ActiveModel::Serializer
  attributes :user_id, :first_name, :last_name, :username, :select_followers, :select_followees, :reviews, :watchlists, :followers_count, :followee_count
 
  def followers_count
    object.followers.count
  end

  def select_followers
    object.followers.select(:id, :first_name, :last_name, :username)
  end

  def select_followees
    object.followees.select(:id, :first_name, :last_name, :username)
  end

  
  def followee_count
    object.followees.count
  end

end
