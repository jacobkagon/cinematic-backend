class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating, :likes, :user, :movie, :created_at
end
