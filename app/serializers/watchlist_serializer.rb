class WatchlistSerializer < ActiveModel::Serializer
  attributes :id, :movie

  belongs_to :user

end
