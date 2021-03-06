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

ActiveRecord::Schema.define(version: 20170729203819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annonymous_users", force: :cascade do |t|
    t.string "key"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_annonymous_users_on_key"
    t.index ["user_id"], name: "index_annonymous_users_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "annonymous_key"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annonymous_key"], name: "index_events_on_annonymous_key"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "email"
    t.string "phone_number", limit: 12
    t.string "zip_code", limit: 6
    t.boolean "over_21", default: false
    t.boolean "access_car", default: false
    t.boolean "background_check", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["zip_code"], name: "index_users_on_zip_code"
  end

end
