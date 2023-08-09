# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_07_093827) do
  create_table "buses", force: :cascade do |t|
    t.string "starding_city"
    t.string "destination_city"
    t.string "despeture_time"
    t.string "bus_type"
    t.string "arrival_time"
    t.string "name"
    t.string "number"
    t.integer "price"
    t.integer "total_seats"
    t.integer "available_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "bus_id", null: false
    t.integer "route_id", null: false
    t.date "journey_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_schedules_on_bus_id"
    t.index ["route_id"], name: "index_schedules_on_route_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "bus_id", null: false
    t.integer "route_id", null: false
    t.integer "user_id", null: false
    t.integer "price"
    t.string "name"
    t.string "age"
    t.string "status"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_tickets_on_bus_id"
    t.index ["route_id"], name: "index_tickets_on_route_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "mobile_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "schedules", "buses"
  add_foreign_key "schedules", "routes"
  add_foreign_key "tickets", "buses"
  add_foreign_key "tickets", "routes"
  add_foreign_key "tickets", "users"
end
