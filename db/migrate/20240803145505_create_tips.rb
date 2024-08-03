class CreateTips < ActiveRecord::Migration[7.1]
  def change
    create_table :tips do |t|
      t.references :order, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
