class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.references :client, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
