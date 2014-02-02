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

ActiveRecord::Schema.define(version: 20140202182614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.text     "title"
    t.text     "author"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "primers", force: true do |t|
    t.text     "note"
    t.text     "primer_seq"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "primers", ["user_id"], name: "index_primers_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.text     "name"
    t.text     "email"
    t.integer  "articles_id"
    t.integer  "primers_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["articles_id"], name: "index_users_on_articles_id", using: :btree
  add_index "users", ["primers_id"], name: "index_users_on_primers_id", using: :btree

end
