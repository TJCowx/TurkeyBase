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

ActiveRecord::Schema.define(version: 20180209203200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_season_pickup_dates", primary_key: "pickup_date_id", id: :integer, default: -> { "nextval('custom_pickup_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "order_season_id"
    t.date "pickup_date"
    t.index ["order_season_id"], name: "index_order_season_pickup_dates_on_order_season_id"
  end

  create_table "order_seasons", primary_key: "order_season_id", force: :cascade do |t|
    t.string "order_season_name"
    t.boolean "current_season"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.boolean "is_admin"
    t.string "password_digest"
    t.boolean "login_role"
    t.index ["user_id"], name: "index_users_on_user_id", unique: true
  end

end
