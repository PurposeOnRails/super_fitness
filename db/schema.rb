# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_07_073041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_codes", force: :cascade do |t|
    t.string "description"
    t.string "code"
    t.integer "purpose_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "heart_rate_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.json "heart_rate"
    t.date "date"
    t.index ["user_id"], name: "index_heart_rate_logs_on_user_id"
  end

  create_table "step_day_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "step_count"
    t.date "date"
    t.index ["user_id"], name: "index_step_day_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "name_aip"
    t.string "email"
    t.string "email_aip"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_of_birth"
    t.string "date_of_birth_aip"
    t.string "gender"
    t.string "gender_aip"
    t.string "phone_number"
    t.string "phone_number_aip"
    t.string "step_day_logs_aip"
    t.string "heart_rate_logs_aip"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
