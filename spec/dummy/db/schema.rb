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

ActiveRecord::Schema.define(version: 20140718200319) do

  create_table "deal_redemptions_companies", force: true do |t|
    t.string   "name",                    null: false
    t.text     "description"
    t.string   "url"
    t.string   "slug",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "active",      default: 1
  end

  create_table "deal_redemptions_mailing_lists", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deal_redemptions_products", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deal_redemptions_redeem_codes", force: true do |t|
    t.integer  "company_id"
    t.integer  "product_id"
    t.integer  "redemption_id"
    t.string   "code"
    t.integer  "status",        default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deal_redemptions_redeem_codes", ["company_id"], name: "index_deal_redemptions_redeem_codes_on_company_id"
  add_index "deal_redemptions_redeem_codes", ["product_id"], name: "index_deal_redemptions_redeem_codes_on_product_id"
  add_index "deal_redemptions_redeem_codes", ["redemption_id"], name: "index_deal_redemptions_redeem_codes_on_redemption_id"

  create_table "deal_redemptions_redeem_transactions", force: true do |t|
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deal_redemptions_redeem_transactions", ["company_id"], name: "index_deal_redemptions_redeem_transactions_on_company_id"

  create_table "deal_redemptions_redemptions", force: true do |t|
    t.integer  "transaction_id"
    t.string   "first_name",                     null: false
    t.string   "last_name",                      null: false
    t.string   "email_address",                  null: false
    t.string   "phone"
    t.string   "address1",                       null: false
    t.string   "address2"
    t.string   "state",                          null: false
    t.string   "zip_code",                       null: false
    t.string   "country",        default: "USA", null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deal_redemptions_redemptions", ["transaction_id"], name: "index_deal_redemptions_redemptions_on_transaction_id"

  create_table "deal_redemptions_tests", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deal_redemptions_users", force: true do |t|
    t.string   "first_name",                                    null: false
    t.string   "last_name",                                     null: false
    t.string   "email",                                         null: false
    t.string   "password_hash",                                 null: false
    t.string   "password_salt",                                 null: false
    t.datetime "last_login",    default: '2014-07-18 22:44:18'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
