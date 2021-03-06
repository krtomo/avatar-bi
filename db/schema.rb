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

ActiveRecord::Schema.define(version: 2019_12_11_024628) do

  create_table "avatars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.integer "avatar_type", null: false
    t.integer "stage", null: false
    t.bigint "curr_station_id", null: false
    t.float "curr_location_lat"
    t.float "curr_location_long"
    t.bigint "last_station_id", null: false
    t.float "last_location_lat"
    t.float "last_location_long"
    t.bigint "home_station_id", null: false
    t.text "train_timetable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curr_station_id"], name: "fk_rails_5c73ee31ed"
    t.index ["home_station_id"], name: "fk_rails_3c17d3f601"
    t.index ["last_station_id"], name: "fk_rails_a9b2aba03b"
    t.index ["user_id"], name: "index_avatars_on_user_id"
  end

  create_table "passed_railways", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "avatar_id"
    t.bigint "railway_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_passed_railways_on_avatar_id"
    t.index ["railway_id"], name: "index_passed_railways_on_railway_id"
  end

  create_table "passed_stations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "avatar_id"
    t.bigint "station_id"
    t.integer "has_passed", default: 0, null: false
    t.time "passed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_passed_stations_on_avatar_id"
    t.index ["station_id"], name: "index_passed_stations_on_station_id"
  end

  create_table "railways", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "jname", null: false
    t.string "name", null: false
    t.string "operator", null: false
    t.integer "station_num", null: false
    t.boolean "has_TrainTimetable", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "railway_id"
    t.string "name", null: false
    t.string "odpt_sameAs", null: false
    t.float "lat", null: false
    t.float "long", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["odpt_sameAs"], name: "index_stations_on_odpt_sameAs"
    t.index ["railway_id"], name: "index_stations_on_railway_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.boolean "is_moving", default: false, null: false
    t.timestamp "start_time"
    t.timestamp "end_time"
    t.integer "this_travel_time"
    t.integer "total_travel_time"
    t.float "start_pos_lat"
    t.float "start_pos_long"
    t.float "end_pos_lat"
    t.float "end_pos_long"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "avatars", "stations", column: "curr_station_id"
  add_foreign_key "avatars", "stations", column: "home_station_id"
  add_foreign_key "avatars", "stations", column: "last_station_id"
  add_foreign_key "avatars", "users"
  add_foreign_key "passed_railways", "avatars"
  add_foreign_key "passed_railways", "railways"
  add_foreign_key "passed_stations", "avatars"
  add_foreign_key "passed_stations", "stations"
  add_foreign_key "stations", "railways"
end
