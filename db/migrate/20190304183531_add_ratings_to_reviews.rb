class AddRatingsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :communication_rating, :integer
    add_column :reviews, :quality_rating, :integer
    add_column :reviews, :delivery_on_time_rating, :integer
    remove_column :reviews, :rating, :integer
  end
end
