class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :poster, :movie_id, :watchlists
end
