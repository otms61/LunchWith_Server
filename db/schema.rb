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

ActiveRecord::Schema.define(version: 20150218102226) do

  create_table "coupons", force: true do |t|
    t.integer  "store_id"
    t.integer  "university_id"
    t.text     "contents"
    t.integer  "status",          default: 0, null: false
    t.datetime "limit"
    t.datetime "usage_time_from"
    t.datetime "usage_time_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coupons", ["status"], name: "index_coupons_on_status"
  add_index "coupons", ["store_id"], name: "index_coupons_on_store_id"

  create_table "friend_ships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friend_ships", ["user_id"], name: "index_friend_ships_on_user_id"

  create_table "matching_times", force: true do |t|
    t.integer  "matching_id"
    t.integer  "user_id"
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matchings", force: true do |t|
    t.integer  "coupon_id"
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matchings", ["coupon_id"], name: "index_matchings_on_coupon_id"
  add_index "matchings", ["user1_id"], name: "index_matchings_on_user1_id"
  add_index "matchings", ["user2_id"], name: "index_matchings_on_user2_id"

  create_table "messages", force: true do |t|
    t.integer  "matching_id"
    t.integer  "user_id"
    t.integer  "sequential_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["matching_id"], name: "index_messages_on_matching_id"
  add_index "messages", ["sequential_id"], name: "index_messages_on_facebook_id"

  create_table "rpush_apps", force: true do |t|
    t.string   "name",                                null: false
    t.string   "environment"
    t.text     "certificate"
    t.string   "password"
    t.integer  "connections",             default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",                                null: false
    t.string   "auth_key"
    t.string   "client_id"
    t.string   "client_secret"
    t.string   "access_token"
    t.datetime "access_token_expiration"
  end

  create_table "rpush_feedback", force: true do |t|
    t.string   "device_token", limit: 64,  null: false
    t.datetime "failed_at",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_id",       limit: 255
  end

  add_index "rpush_feedback", ["device_token"], name: "index_rpush_feedback_on_device_token"

  create_table "rpush_notifications", force: true do |t|
    t.integer  "badge"
    t.string   "device_token",      limit: 64
    t.string   "sound",                         default: "default"
    t.string   "alert"
    t.text     "data"
    t.integer  "expiry",                        default: 86400
    t.boolean  "delivered",                     default: false,     null: false
    t.datetime "delivered_at"
    t.boolean  "failed",                        default: false,     null: false
    t.datetime "failed_at"
    t.integer  "error_code"
    t.text     "error_description", limit: 255
    t.datetime "deliver_after"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "alert_is_json",                 default: false
    t.string   "type",                                              null: false
    t.string   "collapse_key"
    t.boolean  "delay_while_idle",              default: false,     null: false
    t.text     "registration_ids"
    t.integer  "app_id",                                            null: false
    t.integer  "retries",                       default: 0
    t.string   "uri"
    t.datetime "fail_after"
    t.boolean  "processing",                    default: false,     null: false
    t.integer  "priority"
    t.text     "url_args"
    t.string   "category"
  end

  add_index "rpush_notifications", ["app_id", "delivered", "failed", "deliver_after"], name: "index_rapns_notifications_multi"
  add_index "rpush_notifications", ["delivered", "failed"], name: "index_rpush_notifications_multi", where: "NOT delivered AND NOT failed"

  create_table "stores", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "address"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "url"
    t.string   "tel"
    t.string   "store_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores_universities", force: true do |t|
    t.integer  "store_id"
    t.integer  "university_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores_universities", ["store_id"], name: "index_stores_universities_on_store_id"

  create_table "universities", force: true do |t|
    t.string   "name"
    t.string   "logo_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "facebook_id"
    t.string   "facebook_token"
    t.string   "access_token"
    t.string   "name"
    t.string   "facebook_img"
    t.string   "device_token"
    t.integer  "university_id"
    t.integer  "status",         default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token"
  add_index "users", ["facebook_id"], name: "index_users_on_facebook_id"
  add_index "users", ["facebook_token"], name: "index_users_on_facebook_token"

  create_table "users_coupons", force: true do |t|
    t.integer  "user_id"
    t.integer  "coupon_id"
    t.integer  "status",     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_coupons", ["user_id"], name: "index_users_coupons_on_user_id"

end
