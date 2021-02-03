class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating, :likes, :movie, :created_at
end
