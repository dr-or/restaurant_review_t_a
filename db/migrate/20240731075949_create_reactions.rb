class CreateReactions < ActiveRecord::Migration[7.1]
  def change
    create_table :reactions do |t|
      t.references :target, polymorphic: true, null: false
      t.references :client, null: false, foreign_key: true
      t.integer :type, null: false

      t.timestamps
    end
  end
end
