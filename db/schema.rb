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

ActiveRecord::Schema.define(version: 20170501222628) do

  create_table "budgets", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "tour_name"
    t.integer  "quantity_adults"
    t.integer  "quantity_children"
    t.integer  "quantity_babies"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "high_seasons", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "tour_id"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "adult_price"
    t.decimal  "child_price"
    t.decimal  "baby_price"
    t.integer  "season_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["tour_id"], name: "index_prices_on_tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "attraction"
    t.integer  "duration"
    t.decimal  "distance"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id"
    t.string   "site"
    t.integer  "minimum_age", default: 0
    t.index ["category_id"], name: "index_tours_on_category_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.integer  "tour_id"
    t.string   "name"
    t.integer  "seat_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_transfers_on_tour_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
