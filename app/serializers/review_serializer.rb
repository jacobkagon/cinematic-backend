class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating, :user, :movie


end
