class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :review, null: false, foreign_key: true
      t.text :body, null: false
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
