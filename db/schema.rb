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

ActiveRecord::Schema.define(version: 20151011012218) do

  create_table "actions", primary_key: "action_name", force: :cascade do |t|
    t.integer "id", limit: 4, null: false
  end

  add_index "actions", ["id"], name: "Index 1", unique: true, using: :btree

  create_table "beacon_fields", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "field_id",   limit: 4
    t.integer  "beacon_id",  limit: 4
  end

  add_index "beacon_fields", ["beacon_id"], name: "index_beacon_fields_on_beacon_id", using: :btree
  add_index "beacon_fields", ["field_id"], name: "index_beacon_fields_on_field_id", using: :btree

  create_table "beacon_platforms", force: :cascade do |t|
    t.string   "example_url", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "platform_id", limit: 4
    t.integer  "beacon_id",   limit: 4
  end

  add_index "beacon_platforms", ["beacon_id"], name: "index_beacon_platforms_on_beacon_id", using: :btree
  add_index "beacon_platforms", ["platform_id"], name: "index_beacon_platforms_on_platform_id", using: :btree

  create_table "beacons", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id",  limit: 4
  end

  add_index "beacons", ["service_id"], name: "index_beacons_on_service_id", using: :btree

  create_table "containers", primary_key: "name", force: :cascade do |t|
    t.integer "id", limit: 4, null: false
  end

  add_index "containers", ["id"], name: "Index 1", unique: true, using: :btree

  create_table "country_codes", primary_key: "country_code", force: :cascade do |t|
    t.integer "id",      limit: 4,  null: false
    t.string  "country", limit: 50, null: false
  end

  add_index "country_codes", ["country"], name: "Index 1", using: :btree
  add_index "country_codes", ["country_code"], name: "Index 2", using: :btree
  add_index "country_codes", ["id"], name: "Index 4", unique: true, using: :btree

  create_table "fields", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "override",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modules", primary_key: "name", force: :cascade do |t|
    t.integer "id", limit: 4, null: false
  end

  add_index "modules", ["id"], name: "Index 1", unique: true, using: :btree

  create_table "monoliths", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "defaults",   limit: 255
    t.integer  "interval",   limit: 4
    t.text     "override",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id",   limit: 4
  end

  create_table "platforms", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.string   "link",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_fields", id: false, force: :cascade do |t|
    t.integer "service_id", limit: 4, null: false
    t.integer "field_id",   limit: 4, null: false
  end

  add_index "service_fields", ["field_id"], name: "field_id", using: :btree
  add_index "service_fields", ["service_id", "field_id"], name: "combine", using: :btree
  add_index "service_fields", ["service_id"], name: "service_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "servers",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_networks", id: false, force: :cascade do |t|
    t.integer "id",   limit: 4,                null: false
    t.string  "name", limit: 50, default: "0"
  end

  add_index "social_networks", ["id"], name: "Index 1", unique: true, using: :btree
  add_index "social_networks", ["name"], name: "Index 2", using: :btree

  create_table "tracking_data", force: :cascade do |t|
    t.string "page_type",      limit: 20,    default: "na",    null: false
    t.string "environment",    limit: 20,    default: "na",    null: false
    t.string "query_string",   limit: 10000, default: "na",    null: false
    t.string "service_name",   limit: 20,    default: "na",    null: false
    t.string "action_type",    limit: 20,    default: "na",    null: false
    t.string "entry_id",       limit: 50,    default: " none", null: false
    t.string "edition",        limit: 20,    default: "us",    null: false
    t.string "platform",       limit: 10,    default: "empty"
    t.string "section_name",   limit: 20,    default: "none"
    t.string "test_page_name", limit: 30,    default: "none",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "crypted_password",          limit: 40
    t.string   "salt",                      limit: 40
    t.string   "remember_token",            limit: 255
    t.datetime "remember_token_expires_at"
    t.string   "name",                      limit: 255
    t.string   "email_address",             limit: 255
    t.boolean  "administrator",                         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                     limit: 255, default: "active"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], name: "index_users_on_state", using: :btree

  create_table "values", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.string   "type",            limit: 255
    t.string   "data_format",     limit: 255
    t.string   "possible_values", limit: 255
    t.string   "regex_pattern",   limit: 255
    t.string   "example_url",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "service_fields", "fields", name: "FK_service_fields_fields"
  add_foreign_key "service_fields", "services", name: "FK_service_fields_services"
end
