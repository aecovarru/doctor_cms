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

ActiveRecord::Schema.define(version: 20140909205602) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "fax"
    t.string   "business"
    t.string   "affiliate_number"
    t.string   "website"
    t.string   "state"
    t.string   "doctor"
    t.string   "letter",           default: "Nothing"
    t.string   "certificate",      default: "Nothing"
    t.string   "pads",             default: "Nothing"
    t.string   "sent",             default: "Nothing"
    t.string   "emailed",          default: "Nothing"
    t.string   "call",             default: "Nothing"
    t.string   "sold",             default: "Nothing"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "aff",              default: "Nothing"
  end

  create_table "admin_users", force: true do |t|
    t.string   "first_name",      default: ""
    t.string   "last_name",       default: ""
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "administrator",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.integer  "account_id"
    t.string   "created_by"
    t.string   "date"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
