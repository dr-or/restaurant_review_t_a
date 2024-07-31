class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :email
      t.integer :phone, null: false

      t.timestamps
    end

    add_index :clients, :email, unique: true
    add_index :clients, :phone, unique: true
  end
end
