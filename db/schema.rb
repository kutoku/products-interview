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

ActiveRecord::Schema[8.1].define(version: 2026_09_10_000000) do
  create_table "collection_assignments", force: :cascade do |t|
    t.integer "collection_id", null: false
    t.datetime "created_at", null: false
    t.integer "product_id", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_collection_assignments_on_collection_id"
    t.index ["product_id", "collection_id"], name: "index_collection_assignments_on_product_id_and_collection_id", unique: true
    t.index ["product_id"], name: "index_collection_assignments_on_product_id"
  end

  create_table "collections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_collections_on_name", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "collection_assignments", "collections"
  add_foreign_key "collection_assignments", "products"
end
