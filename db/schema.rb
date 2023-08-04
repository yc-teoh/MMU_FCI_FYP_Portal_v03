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

ActiveRecord::Schema[7.0].define(version: 2023_08_04_080704) do
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

  create_table "presentation_params", primary_key: "param_id", id: :string, default: -> { "nextval('presentation_params_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "param_name"
    t.string "param_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "batch_id"
    t.string "presentation_type"
    t.string "presentation_venue"
    t.date "presentation_date_start"
    t.date "presentation_date_end"
    t.string "presentation_time_slots"
  end

  create_table "presentation_slots", primary_key: "presentation_id", id: :string, default: -> { "nextval('presentation_slots_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "student_one_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "presentation_date"
    t.string "presentation_location"
    t.string "supervisor_id"
    t.string "moderator_id"
    t.string "co_supervisor_id"
    t.string "project_id"
    t.string "other_attendees"
    t.string "presentation_remarks"
    t.decimal "presentation_score"
    t.string "presentation_time"
    t.string "param_id"
    t.string "placement_id"
  end

  create_table "project_placements", primary_key: "placement_id", id: :string, default: -> { "nextval('project_placements_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "placement_status"
    t.string "placement_batch"
    t.string "project_id"
    t.string "moderator_id"
    t.string "presentation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", primary_key: "project_id", id: :string, default: -> { "nextval('projects_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "project_title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "project_approval_status", null: false
    t.string "project_proposal_party"
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
    t.string "project_background"
    t.string "project_outcomes"
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
    t.string "industry_collab_company"
    t.string "batch_id", null: false
    t.string "remarks_project"
    t.string "remarks_supervisor"
    t.string "industry_collab_contact_name"
    t.string "industry_collab_contact_number"
    t.string "placement_id"
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
    t.string "batch_id"
    t.string "user_remarks"
    t.string "user_role_original"
    t.string "is_supervisor"
    t.string "placement_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "announcements", "users", column: "author_id", primary_key: "user_id"
  add_foreign_key "projects", "batches", primary_key: "batch_id"
  add_foreign_key "projects", "users", column: "supervisor_id", primary_key: "user_id"
end
