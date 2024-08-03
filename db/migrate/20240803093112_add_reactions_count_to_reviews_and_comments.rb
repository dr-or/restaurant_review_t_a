class AddReactionsCountToReviewsAndComments < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :reactions_count, :integer, null: false, default: 0
    add_column :comments, :reactions_count, :integer, null: false, default: 0
  end
end
