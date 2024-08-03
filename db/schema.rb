# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_03_145915) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.integer "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["phone"], name: "index_clients_on_phone", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "review_id", null: false
    t.text "body", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reactions_count", default: 0, null: false
    t.index ["client_id"], name: "index_comments_on_client_id"
    t.index ["review_id"], name: "index_comments_on_review_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "target_type", null: false
    t.bigint "target_id", null: false
    t.string "name"
    t.string "url", null: false
    t.string "md5", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["md5"], name: "index_images_on_md5", unique: true
    t.index ["target_type", "target_id"], name: "index_images_on_target"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "restaurant_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id"
  end

  create_table "reactions", force: :cascade do |t|
    t.string "target_type", null: false
    t.bigint "target_id", null: false
    t.bigint "client_id", null: false
    t.integer "reaction_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_reactions_on_client_id"
    t.index ["target_type", "target_id"], name: "index_reactions_on_target"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "title", null: false
    t.string "address", null: false
    t.time "opening_time"
    t.time "closing_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_restaurants_on_title", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.bigint "client_id", null: false
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reactions_count", default: 0, null: false
    t.index ["client_id"], name: "index_reviews_on_client_id"
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
  end

  create_table "tips", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "client_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_tips_on_client_id"
    t.index ["order_id"], name: "index_tips_on_order_id"
  end

  add_foreign_key "comments", "clients"
  add_foreign_key "comments", "reviews"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "restaurants"
  add_foreign_key "reactions", "clients"
  add_foreign_key "reviews", "clients"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "tips", "clients"
  add_foreign_key "tips", "orders"
end
