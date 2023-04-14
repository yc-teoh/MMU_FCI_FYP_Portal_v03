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

ActiveRecord::Schema[7.0].define(version: 2023_04_14_035837) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", primary_key: "announcement_id", id: :string, default: -> { "nextval('announcements_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "announcement_title", null: false
    t.text "announcement_body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author_id", null: false
    t.string "announcement_file_path"
  end

  create_table "users", primary_key: "user_id", id: :string, default: -> { "nextval('users_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name", null: false
    t.string "user_gov_id", null: false
    t.string "user_gender", null: false
    t.string "user_role", default: "Undefined", null: false
    t.string "user_contact_no", null: false
    t.string "user_status", default: "Pending", null: false
    t.integer "student_batch"
    t.string "student_specialisation"
    t.string "student_status"
    t.integer "project_progress_id"
    t.bigint "batch_id"
    t.string "user_remarks"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
