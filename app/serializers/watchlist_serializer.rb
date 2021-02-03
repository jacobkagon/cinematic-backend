class WatchlistSerializer < ActiveModel::Serializer
  attributes :id, :movie, :user

  belongs_to :user

end
