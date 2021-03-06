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

ActiveRecord::Schema.define(version: 20180308201148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_season_products", force: :cascade do |t|
    t.bigint "order_seasons_id"
    t.bigint "products_id"
    t.index ["order_seasons_id"], name: "index_order_season_products_on_order_seasons_id"
    t.index ["products_id"], name: "index_order_season_products_on_products_id"
  end

  create_table "order_seasons", primary_key: "order_season_id", id: :integer, default: -> { "nextval('custom_order_season_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "order_season_name"
    t.boolean "current_season"
  end

  create_table "orders", primary_key: "order_id", id: :integer, default: -> { "nextval('custom_order_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "cust_fname"
    t.string "cust_lname"
    t.string "cust_phone"
    t.string "order_requests"
    t.boolean "picked_up"
    t.string "users_id"
    t.bigint "pickup_dates_id"
    t.bigint "products_id"
    t.bigint "product_styles_id"
    t.bigint "product_sizes_id"
    t.bigint "order_season_id"
    t.index ["order_season_id"], name: "index_orders_on_order_season_id"
    t.index ["pickup_dates_id"], name: "index_orders_on_pickup_dates_id"
    t.index ["product_sizes_id"], name: "index_orders_on_product_sizes_id"
    t.index ["product_styles_id"], name: "index_orders_on_product_styles_id"
    t.index ["products_id"], name: "index_orders_on_products_id"
    t.index ["users_id"], name: "index_orders_on_users_id"
  end

  create_table "pickup_dates", primary_key: "pickup_date_id", id: :integer, default: -> { "nextval('custom_pickup_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "order_season_id"
    t.date "pickup_date"
    t.index ["order_season_id"], name: "index_pickup_dates_on_order_season_id"
  end

  create_table "product_sizes", primary_key: "product_size_id", id: :integer, default: -> { "nextval('custom_product_size_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "product_id"
    t.string "product_size_name"
    t.boolean "active_size"
    t.index ["product_id"], name: "index_product_sizes_on_product_id"
  end

  create_table "product_styles", primary_key: "product_style_id", id: :integer, default: -> { "nextval('custom_product_style_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "product_id"
    t.string "product_style_name"
    t.boolean "active_style"
    t.index ["product_id"], name: "index_product_styles_on_product_id"
  end

  create_table "products", primary_key: "product_id", id: :integer, default: -> { "nextval('custom_product_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "product_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.boolean "is_admin"
    t.string "password_digest"
    t.boolean "login_role"
    t.boolean "active_user"
    t.index ["user_id"], name: "index_users_on_user_id", unique: true
  end

end
