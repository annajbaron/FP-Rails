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

ActiveRecord::Schema.define(version: 20180213201909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.integer "founded"
    t.string "hq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "longitude"
    t.float "latitude"
  end

  create_table "collaborators", force: :cascade do |t|
    t.bigint "brand_id"
    t.bigint "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_collaborators_on_brand_id"
    t.index ["collection_id"], name: "index_collaborators_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pictures"
    t.index ["pictures"], name: "index_collections_on_pictures"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "brand_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_follows_on_brand_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "collection_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_likes_on_collection_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "pitches", force: :cascade do |t|
    t.string "brand_1"
    t.string "brand_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "api_key"
    t.index ["api_key"], name: "index_users_on_api_key"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pitch_id"
    t.boolean "is_up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pitch_id"], name: "index_votes_on_pitch_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "collaborators", "brands"
  add_foreign_key "collaborators", "collections"
  add_foreign_key "follows", "brands"
  add_foreign_key "follows", "users"
  add_foreign_key "likes", "collections"
  add_foreign_key "likes", "users"
  add_foreign_key "votes", "pitches"
  add_foreign_key "votes", "users"
end
