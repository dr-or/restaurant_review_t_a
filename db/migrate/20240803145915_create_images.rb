class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.references :target, polymorphic: true, null: false
      t.string :name
      t.string :url, null: false
      t.string :md5, null: false

      t.timestamps
    end

    add_index :images, :md5, unique: true
  end
end
