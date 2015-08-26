# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150825194359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string   "time_booked"
    t.integer  "user_id"
    t.integer  "court_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "date_booked"
  end

  add_index "bookings", ["court_id"], name: "index_bookings_on_court_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "courts", force: :cascade do |t|
    t.integer  "club_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "booking_id"
    t.string   "type_of_court"
    t.string   "name"
  end

  add_index "courts", ["booking_id"], name: "index_courts_on_booking_id", using: :btree
  add_index "courts", ["club_id"], name: "index_courts_on_club_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "club_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["club_id"], name: "index_memberships_on_club_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "direction"
    t.string   "level"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "last_name"
    t.string   "address"
    t.string   "number_of_street"
    t.string   "flat"
    t.string   "letter_flat"
    t.string   "zip_code"
    t.string   "mobile_number"
    t.boolean  "admin"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bookings", "courts"
  add_foreign_key "bookings", "users"
  add_foreign_key "courts", "clubs"
  add_foreign_key "memberships", "clubs"
  add_foreign_key "memberships", "users"
end
