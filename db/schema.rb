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

ActiveRecord::Schema.define(version: 20151007235505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.inet     "ip"
    t.cidr     "netmask"
    t.integer  "server_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["server_id"], name: "index_addresses_on_server_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.text     "name"
    t.integer  "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servers", force: :cascade do |t|
    t.text     "hostname"
    t.text     "serial"
    t.text     "os"
    t.text     "server_type"
    t.text     "asset_tag"
    t.integer  "account_id"
    t.integer  "room_id"
    t.integer  "site_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "servers", ["account_id"], name: "index_servers_on_account_id", using: :btree
  add_index "servers", ["room_id"], name: "index_servers_on_room_id", using: :btree
  add_index "servers", ["site_id"], name: "index_servers_on_site_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.text     "name"
    t.text     "address"
    t.text     "city"
    t.text     "country"
    t.text     "lon"
    t.text     "lat"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sites", ["account_id"], name: "index_sites_on_account_id", using: :btree

  add_foreign_key "addresses", "servers"
  add_foreign_key "servers", "accounts"
  add_foreign_key "servers", "rooms"
  add_foreign_key "servers", "sites"
  add_foreign_key "sites", "accounts"
end
