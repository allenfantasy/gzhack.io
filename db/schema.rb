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

ActiveRecord::Schema.define(version: 20140429031745) do

  create_table "attachments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
    t.integer  "user_id"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "email"
    t.string   "role"
    t.text     "intention"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "time"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "prices"
  end

  create_table "project_attachments", force: true do |t|
    t.string   "file"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "team"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "organ"
    t.string   "homepage"
    t.string   "user_type"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
