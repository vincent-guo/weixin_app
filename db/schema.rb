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

ActiveRecord::Schema.define(version: 20140320141544) do

  create_table "businesses", force: true do |t|
    t.integer  "business_id"
    t.string   "name"
    t.string   "branch_name"
    t.string   "address"
    t.string   "telephone"
    t.string   "city"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "avg_rating"
    t.string   "rating_img_url"
    t.string   "rating_s_img_url"
    t.integer  "product_grade"
    t.integer  "decoration_grade"
    t.integer  "service_grade"
    t.float    "product_score"
    t.float    "decoration_score"
    t.float    "service_score"
    t.integer  "avg_price"
    t.integer  "review_count"
    t.integer  "distance"
    t.string   "business_url"
    t.string   "photo_url"
    t.string   "s_photo_url"
    t.integer  "has_coupon"
    t.integer  "coupon_id"
    t.string   "coupon_description"
    t.string   "coupon_url"
    t.integer  "has_deal"
    t.integer  "deal_count"
    t.integer  "has_online_reservation"
    t.string   "online_reservation_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards_shops", id: false, force: true do |t|
    t.integer "card_id", null: false
    t.integer "shop_id", null: false
  end

  add_index "cards_shops", ["card_id", "shop_id"], name: "index_cards_shops_on_card_id_and_shop_id"
  add_index "cards_shops", ["shop_id", "card_id"], name: "index_cards_shops_on_shop_id_and_card_id"

  create_table "cards_users", id: false, force: true do |t|
    t.integer "card_id", null: false
    t.integer "user_id", null: false
  end

  add_index "cards_users", ["card_id", "user_id"], name: "index_cards_users_on_card_id_and_user_id"
  add_index "cards_users", ["user_id", "card_id"], name: "index_cards_users_on_user_id_and_card_id"

  create_table "deals", id: false, force: true do |t|
    t.string   "id"
    t.string   "description"
    t.string   "url"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "t_card_info", force: true do |t|
    t.string   "card_name"
    t.string   "card_logo"
    t.string   "card_publisher"
    t.integer  "shops_maxcount"
    t.text     "card_intro"
    t.string   "website"
    t.datetime "create_time"
  end

  create_table "t_shop_public_info", force: true do |t|
    t.string   "shop_name"
    t.string   "shop_logo"
    t.string   "phone"
    t.string   "category"
    t.string   "province"
    t.string   "city"
    t.string   "district"
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.string   "website"
    t.string   "card_type"
    t.integer  "business_id"
    t.datetime "last_update_time"
    t.datetime "create_time"
  end

  create_table "users", force: true do |t|
    t.integer  "subscribe"
    t.string   "openid"
    t.string   "nickname"
    t.integer  "sex"
    t.string   "language"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "headimgurl"
    t.datetime "subscribe_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weixin_users", force: true do |t|
    t.integer  "subscribe"
    t.string   "openid"
    t.string   "nickname"
    t.integer  "sex"
    t.string   "language"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "headimgurl"
    t.integer  "subscribe_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
