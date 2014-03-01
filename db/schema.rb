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

ActiveRecord::Schema.define(version: 20140227161219) do

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

  create_table "deals", id: false, force: true do |t|
    t.string   "id"
    t.string   "description"
    t.string   "url"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
