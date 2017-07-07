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

ActiveRecord::Schema.define(version: 20170706064905) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "plan_code"
    t.integer  "no_of_videos"
    t.integer  "expiry_in_days"
    t.integer  "cost"
    t.boolean  "is_active",      default: true, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",           null: false
    t.string   "encrypted_password",     default: "",           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "address"
    t.date     "date_of_birth"
    t.string   "city"
    t.string   "country"
    t.string   "user_type",              default: "subscriber"
    t.integer  "subscription_id"
    t.datetime "subscription_date"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.integer  "category_id"
    t.string   "video_url"
    t.string   "composer"
    t.boolean  "is_active",   default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
  end

  add_index "videos", ["category_id"], name: "index_videos_on_category_id"
  add_index "videos", ["user_id"], name: "index_videos_on_user_id"

end
