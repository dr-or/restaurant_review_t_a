class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :client, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.integer :price, null: false

      t.timestamps
    end
  end
end
