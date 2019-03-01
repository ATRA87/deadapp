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

ActiveRecord::Schema.define(version: 2019_02_28_200907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customizations", force: :cascade do |t|
    t.bigint "project_id"
    t.string "description"
    t.index ["project_id"], name: "index_customizations_on_project_id"
  end

  create_table "features", force: :cascade do |t|
    t.bigint "order_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_features_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.string "state", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_orders_on_project_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "project_assets", force: :cascade do |t|
    t.bigint "project_id"
    t.string "web_url"
    t.integer "priority", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["project_id"], name: "index_project_assets_on_project_id"
  end

  create_table "project_members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.integer "state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_members_on_project_id"
    t.index ["user_id"], name: "index_project_members_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "category"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "order_id"
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_reviews_on_order_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "provider"
    t.string "uid"
    t.string "access_token"
    t.string "first_name"
    t.string "last_name"
    https://res.cloudinary.com/dy3nldgkf/image/upload/c_scale,h_60,w_60/v1551213914/profile-placeholder.png
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customizations", "projects"
  add_foreign_key "features", "orders"
  add_foreign_key "orders", "projects"
  add_foreign_key "orders", "users"
  add_foreign_key "project_assets", "projects"
  add_foreign_key "project_members", "projects"
  add_foreign_key "project_members", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "reviews", "orders"
  add_foreign_key "reviews", "users"
end
