# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180305021051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "make_id"
    t.string "year"
    t.string "color"
    t.bigint "base_price"
    t.string "style"
    t.index ["make_id"], name: "index_models_on_make_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cost"
    t.bigint "vehicle_id"
    t.bigint "model_id"
    t.index ["model_id"], name: "index_options_on_model_id"
    t.index ["vehicle_id"], name: "index_options_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "nickname"
    t.string "mileage"
    t.integer "condition", default: 0
    t.boolean "pre_owned", default: false
    t.bigint "price"
    t.bigint "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_vehicles_on_model_id"
  end

  add_foreign_key "models", "makes"
  add_foreign_key "options", "models"
  add_foreign_key "options", "vehicles"
  add_foreign_key "vehicles", "models"
end
