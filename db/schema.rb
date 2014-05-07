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

ActiveRecord::Schema.define(version: 20140505154015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sex"
    t.integer  "room_number"
    t.integer  "user_id"
    t.datetime "birthdate"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.integer  "wound_id"
    t.string   "stage"
    t.string   "stage_description"
    t.string   "appearance"
    t.string   "drainage"
    t.string   "odor"
    t.string   "color"
    t.string   "treatment_response"
    t.string   "treatment"
    t.integer  "length"
    t.integer  "width"
    t.integer  "depth"
    t.integer  "tunnel"
    t.boolean  "pain"
    t.text     "note"
    t.boolean  "active",             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wounds", force: true do |t|
    t.string   "location"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
