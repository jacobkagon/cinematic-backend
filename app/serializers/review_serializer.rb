class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating, :movie, :created_at, :user, :likes
end
