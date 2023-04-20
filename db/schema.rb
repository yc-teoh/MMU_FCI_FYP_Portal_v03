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

ActiveRecord::Schema[7.0].define(version: 2023_04_20_100251) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", primary_key: "announcement_id", id: :string, default: -> { "nextval('announcements_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "announcement_title", null: false
    t.text "announcement_body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author_id", null: false
    t.string "announcement_file_path"
    t.string "announcement_status", default: "ACT", null: false
  end

  create_table "batches", primary_key: "batch_id", id: :string, default: -> { "nextval('batches_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "batch_name", null: false
    t.string "batch_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", primary_key: "project_id", id: :string, default: -> { "nextval('projects_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "project_title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "project_approval_status", null: false
    t.string "project_proposal_party", null: false
    t.string "project_type", null: false
    t.string "project_category", null: false
    t.string "project_focus", null: false
    t.date "project_date"
    t.string "project_other_specialisations"
    t.string "project_description", null: false
    t.string "project_objective", null: false
    t.string "project_scope", null: false
    t.string "project_status", null: false
    t.string "project_specialisation", null: false
    t.string "project_background", null: false
    t.string "project_outcomes", null: false
    t.string "project_doc_id"
    t.string "supervisor_id", null: false
    t.string "co_supervisor_id"
    t.string "moderator_id"
    t.string "reviewed_by"
    t.string "student_one_user_id"
    t.string "student_one_subtitle"
    t.string "student_one_work_distribution"
    t.string "student_two_user_id"
    t.string "student_two_subtitle"
    t.string "student_two_work_distribution"
    t.string "is_industry_collab", null: false
    t.string "industry_collab_details"
    t.string "batch_id", null: false
    t.string "remarks_project"
    t.string "remarks_supervisor"
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

  add_foreign_key "announcements", "users", column: "author_id", primary_key: "user_id"
  add_foreign_key "projects", "batches", primary_key: "batch_id"
  add_foreign_key "projects", "users", column: "co_supervisor_id", primary_key: "user_id"
  add_foreign_key "projects", "users", column: "moderator_id", primary_key: "user_id"
  add_foreign_key "projects", "users", column: "student_one_user_id", primary_key: "user_id"
  add_foreign_key "projects", "users", column: "student_two_user_id", primary_key: "user_id"
  add_foreign_key "projects", "users", column: "supervisor_id", primary_key: "user_id"
end
