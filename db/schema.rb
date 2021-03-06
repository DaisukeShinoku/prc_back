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

ActiveRecord::Schema.define(version: 2020_08_19_004039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "user_id", null: false
    t.bigint "time_report_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["time_report_id"], name: "index_comments_on_time_report_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "experience_records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "time_report_id"
    t.integer "experience_point", null: false
    t.float "bonus_multiplier", default: 1.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["time_report_id"], name: "index_experience_records_on_time_report_id"
    t.index ["user_id"], name: "index_experience_records_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "level", default: 1, null: false
    t.integer "total_experience", default: 0, null: false
    t.integer "experience_to_next", default: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "likeable_type"
    t.bigint "likeable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["user_id", "likeable_type", "likeable_id"], name: "index_likes_on_user_id_and_likeable_type_and_likeable_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "required_exps", force: :cascade do |t|
    t.integer "level", null: false
    t.integer "required_exp", null: false
    t.integer "total_experience", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["level"], name: "index_required_exps_on_level", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "time_report_tag_links", force: :cascade do |t|
    t.bigint "time_report_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_time_report_tag_links_on_tag_id"
    t.index ["time_report_id", "tag_id"], name: "index_time_report_tag_links_on_time_report_id_and_tag_id", unique: true
    t.index ["time_report_id"], name: "index_time_report_tag_links_on_time_report_id"
  end

  create_table "time_reports", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.time "study_time", null: false
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_time_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "uid"
    t.string "screen_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "lower((email)::text)", name: "index_users_on_LOWER_email", unique: true
    t.index ["screen_name"], name: "index_users_on_screen_name", unique: true
  end

  add_foreign_key "comments", "time_reports"
  add_foreign_key "comments", "users"
  add_foreign_key "experience_records", "time_reports"
  add_foreign_key "experience_records", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "time_reports", "users"
end
