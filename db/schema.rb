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

ActiveRecord::Schema.define(version: 2024_09_11_181607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "hypnotist_id"
    t.bigint "client_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_appointments_on_client_id"
    t.index ["hypnotist_id"], name: "index_appointments_on_hypnotist_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credits", force: :cascade do |t|
    t.bigint "hypnotist_id"
    t.bigint "client_id"
    t.integer "value"
    t.decimal "paid", precision: 10, scale: 2
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_credits_on_client_id"
    t.index ["hypnotist_id"], name: "index_credits_on_hypnotist_id"
  end

  create_table "hypnotists", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "release_signatures", force: :cascade do |t|
    t.bigint "client_id"
    t.string "e_signature", null: false
    t.date "date", null: false
    t.string "release_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_release_signatures_on_client_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "hypnotist_id"
    t.string "description"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_user_events_on_client_id"
    t.index ["hypnotist_id"], name: "index_user_events_on_hypnotist_id"
  end

  add_foreign_key "credits", "clients"
  add_foreign_key "credits", "hypnotists"
end
