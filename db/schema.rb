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

ActiveRecord::Schema.define(version: 20150920004532) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accounts", ["name"], name: "index_accounts_on_name", unique: true
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "apartments", force: :cascade do |t|
    t.integer  "property_id"
    t.string   "unit"
    t.integer  "square_footage"
    t.float    "rent"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "apartments", ["property_id"], name: "index_apartments_on_property_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.string   "public_id"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"

  create_table "properties", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "account_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.string   "description"
  end

  add_index "properties", ["account_id"], name: "index_properties_on_account_id"
  add_index "properties", ["slug"], name: "index_properties_on_slug", unique: true

  create_table "settings", force: :cascade do |t|
    t.boolean  "collapse_menu", default: false
    t.boolean  "fixed_sidebar", default: false
    t.boolean  "top_navbar",    default: false
    t.boolean  "boxed_layout",  default: false
    t.boolean  "fixed_footer",  default: false
    t.integer  "account_id",                    null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "subscription_payments", force: :cascade do |t|
    t.integer  "subscription_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "subscription_payments", ["subscription_id"], name: "index_subscription_payments_on_subscription_id"

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "type_of"
    t.boolean  "active",     default: false
    t.date     "start_date", default: '2015-09-26'
    t.date     "end_date"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "subscriptions", ["account_id"], name: "index_subscriptions_on_account_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
