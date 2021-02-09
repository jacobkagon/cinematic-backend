class RemoveLikesFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :likes, :integer
  end
end
