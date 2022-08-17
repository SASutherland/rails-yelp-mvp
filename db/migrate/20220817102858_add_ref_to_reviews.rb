class AddRefToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :restaurant, foreign_key: true, null: false
  end
end
