class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :reviews, :followers_count, :followee_count
  has_many :followers, exclude: :email, :password_digest
  has_many :followees, exclude: :email, :password_digest
  has_many :watchlists, exclude: :created_at, :updated_at

  def followers_count
    object.followers.count
  end

  
  def followee_count
    object.followees.count
  end

end
