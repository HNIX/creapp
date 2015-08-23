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

ActiveRecord::Schema.define(version: 20150822230742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "asset_listings", force: true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.text     "description"
    t.integer  "size"
    t.integer  "land_size"
    t.float    "price"
    t.float    "price_psf"
    t.boolean  "hide_price"
    t.float    "cap_rate"
    t.float    "occupancy"
    t.text     "highlights"
    t.string   "year_built"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "title"
    t.date     "offer_date"
    t.string   "visibility"
    t.boolean  "ended"
  end

  add_index "asset_listings", ["client_id"], name: "index_asset_listings_on_client_id", using: :btree

  create_table "asset_messages", force: true do |t|
    t.integer  "asset_id"
    t.boolean  "sender_is_client"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asset_messages", ["asset_id"], name: "index_asset_messages_on_asset_id", using: :btree

  create_table "assets", force: true do |t|
    t.integer  "investor_id"
    t.integer  "client_id"
    t.string   "state"
    t.string   "name"
    t.integer  "price"
    t.integer  "asset_listing_id"
    t.string   "type"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["client_id"], name: "index_assets_on_client_id", using: :btree
  add_index "assets", ["investor_id"], name: "index_assets_on_investor_id", using: :btree

  create_table "clients", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "subdomain"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "stock_symbol"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investors", force: true do |t|
    t.integer  "company_id"
    t.string   "title"
    t.string   "linked_in"
    t.string   "fax"
    t.integer  "price_from"
    t.integer  "price_to"
    t.boolean  "verified"
    t.boolean  "principal"
    t.boolean  "subscribed"
    t.integer  "user_id"
    t.string   "phone"
    t.string   "phone_2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "visibility"
    t.string   "state"
    t.boolean  "qualified"
    t.float    "modified_rank_score"
    t.integer  "rank_score"
  end

  add_index "investors", ["company_id"], name: "index_investors_on_company_id", using: :btree
  add_index "investors", ["user_id"], name: "index_investors_on_user_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "addressable_id"
    t.string   "addressable_type"
  end

  add_index "locations", ["addressable_type", "addressable_id"], name: "index_locations_on_addressable_type_and_addressable_id", unique: true, using: :btree
  add_index "locations", ["asset_id"], name: "index_locations_on_asset_id", using: :btree
  add_index "locations", ["company_id"], name: "index_locations_on_company_id", using: :btree
  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "tenants", force: true do |t|
    t.string   "name"
    t.integer  "size"
    t.text     "description"
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tenants", ["asset_id"], name: "index_tenants_on_asset_id", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "checked_terms"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
    t.string   "industry_role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
