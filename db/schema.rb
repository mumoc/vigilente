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

ActiveRecord::Schema.define(version: 20150521211927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boxes", force: :cascade do |t|
    t.string   "number"
    t.string   "integer"
    t.integer  "district"
    t.integer  "section"
    t.string   "location"
    t.text     "address"
    t.text     "references"
    t.string   "district_head"
    t.integer  "nominal_list"
    t.string   "kind"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "report_id"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "reports", force: :cascade do |t|
    t.text     "comment"
    t.float    "lat"
    t.float    "lng"
    t.string   "report_type"
    t.string   "provider"
    t.string   "uid"
    t.string   "user"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "anonymus"
    t.integer  "section"
    t.integer  "district"
  end

end
