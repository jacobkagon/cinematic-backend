class WatchlistSerializer < ActiveModel::Serializer
  attributes :id, :movie
  belongs_to :user, serializer: UserSerializer
end
