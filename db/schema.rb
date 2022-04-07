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

ActiveRecord::Schema.define(version: 2022_04_06_231229) do

  create_table "devices", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "ip"
    t.string "mac"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "always_online"
    t.boolean "online"
  end

  create_table "home_occupancies", charset: "utf8mb4", force: :cascade do |t|
    t.integer "devices_number"
    t.boolean "is_home"
    t.datetime "created_at", precision: 6, null: false
  end

  create_table "network_settings", charset: "utf8mb4", force: :cascade do |t|
    t.integer "is_home_threshold"
    t.boolean "alarm"
    t.time "alarm_time"
    t.integer "sunset_offset"
    t.text "last_nmap_info"
  end

  create_table "settings", charset: "utf8mb4", force: :cascade do |t|
    t.integer "is_home_threshold"
    t.boolean "alarm"
    t.time "alarm_time"
    t.integer "sunset_offset"
    t.text "last_nmap_info"
  end

  create_table "statistics", charset: "utf8mb4", force: :cascade do |t|
    t.date "date"
    t.integer "home"
    t.integer "not_home"
  end

  create_table "statistics_not_home_windows", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "from"
    t.datetime "to"
    t.bigint "statistic_id", null: false
    t.index ["statistic_id"], name: "index_statistics_not_home_windows_on_statistic_id"
  end

  add_foreign_key "statistics_not_home_windows", "statistics"
end
