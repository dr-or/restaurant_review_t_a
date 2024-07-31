class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :title, null: false
      t.string :address, null: false
      t.time :opening_time
      t.time :closing_time

      t.timestamps
    end

    add_index :restaurants, :title, unique: true
  end
end
