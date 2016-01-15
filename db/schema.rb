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

ActiveRecord::Schema.define(version: 20160115194750) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "contacts", force: true do |t|
    t.string   "email"
    t.string   "twitter_handle"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "phone"
  end

  create_table "game_contestants", force: true do |t|
    t.integer "game_id"
    t.boolean "is_drawing_winner", default: false
    t.integer "retweet_count",     default: 0
    t.integer "contact_id"
  end

  add_index "game_contestants", ["contact_id"], name: "index_game_contestants_on_contact_id"
  add_index "game_contestants", ["game_id"], name: "index_game_contestants_on_game_id"

  create_table "games", force: true do |t|
    t.string   "twitter_handle"
    t.string   "hash_tag"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "ended_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "game_contestant_id"
    t.integer  "game_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "tickets", ["game_contestant_id"], name: "index_tickets_on_game_contestant_id"
  add_index "tickets", ["game_id"], name: "index_tickets_on_game_id"

end
