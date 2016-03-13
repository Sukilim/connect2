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

ActiveRecord::Schema.define(version: 20160311083757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_listings", force: :cascade do |t|
    t.string "area"
    t.string "location"
    t.string "sq_ft"
    t.string "avatar"
  end

  create_table "agent_profiles", force: :cascade do |t|
    t.string  "first_name",     null: false
    t.string  "last_name",      null: false
    t.string  "contact_no"
    t.string  "ren_id",         null: false
    t.string  "company_name"
    t.string  "company_reg_no"
    t.text    "about_me"
    t.integer "user_id"
    t.string  "pin_code"
    t.string  "avatar"
    t.integer "credits"
  end

  add_index "agent_profiles", ["user_id"], name: "index_agent_profiles_on_user_id", using: :btree

  create_table "areas", force: :cascade do |t|
    t.string "area"
  end

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree

  create_table "instructions", force: :cascade do |t|
    t.string "title"
    t.text   "description"
    t.string "avatar"
  end

  create_table "listings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "area_id"
    t.integer "location_id"
    t.string  "rent_sale"
    t.string  "house_condo"
    t.date    "date_available"
    t.string  "unit_no"
    t.string  "price"
    t.integer "sq_ft"
    t.integer "no_of_rooms"
    t.integer "no_of_baths"
    t.integer "no_of_carpark"
    t.string  "pet_friendly"
    t.text    "additional_info"
    t.string  "status"
  end

  add_index "listings", ["area_id"], name: "index_listings_on_area_id", using: :btree
  add_index "listings", ["location_id"], name: "index_listings_on_location_id", using: :btree
  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string  "location"
    t.integer "area_id"
  end

  add_index "locations", ["area_id"], name: "index_locations_on_area_id", using: :btree

  create_table "media_coverages", force: :cascade do |t|
    t.string "avatar"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "area_id"
    t.integer "location_id"
    t.integer "budget_min"
    t.integer "budget_max"
    t.integer "user_id"
    t.string  "pet_friendly"
    t.string  "furnished"
    t.integer "no_of_rooms"
    t.integer "no_of_carpark"
    t.date    "date_needed"
    t.text    "special_req"
    t.integer "sq_ft"
    t.string  "rent_sale"
    t.string  "house_condo"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_no"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "avatar"
    t.string   "pin_code"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role",                            default: 0
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
    t.integer  "status"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

  add_foreign_key "agent_profiles", "users"
  add_foreign_key "listings", "areas"
  add_foreign_key "listings", "locations"
  add_foreign_key "listings", "users"
  add_foreign_key "locations", "areas"
end
