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

ActiveRecord::Schema[7.0].define(version: 2023_04_06_043450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", primary_key: "userID", id: :bigint, default: -> { "nextval('users_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "userEmailAddress", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "userName", null: false
    t.string "userGovID", null: false
    t.string "userGender", null: false
    t.string "userRole", null: false
    t.string "userContactNo", null: false
    t.string "userStatus", null: false
    t.integer "studentBatch"
    t.string "studentSpecialisation"
    t.string "studentStatus"
    t.integer "projectProgressID"
    t.bigint "batchID"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["userEmailAddress"], name: "index_users_on_userEmailAddress", unique: true
  end

end
