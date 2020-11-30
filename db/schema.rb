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

ActiveRecord::Schema.define(version: 2020_11_30_042026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "application_id", null: false
    t.bigint "question_id", null: false
    t.index ["application_id", "question_id"], name: "index_answers_on_application_id_and_question_id", unique: true
    t.index ["application_id"], name: "index_answers_on_application_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "applications", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "scholarship_id", null: false
    t.string "email", null: false
    t.date "dob", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.string "ages_of_children"
    t.string "marital_status", null: false
    t.string "student_id"
    t.string "ssn", null: false
    t.string "institution_name", null: false
    t.string "academic_year", null: false
    t.string "institution_address", null: false
    t.string "major", null: false
    t.date "completion_date", null: false
    t.string "academic_standing", null: false
    t.float "post_high_school_gpa"
    t.float "high_school_gpa", null: false
    t.text "career_plan", null: false
    t.string "previous_college1_name"
    t.string "previous_college1_years"
    t.string "previous_college1_degree"
    t.string "previous_college2_name"
    t.string "previous_college2_years"
    t.string "previous_college2_degree"
    t.string "high_school_name", null: false
    t.string "high_school_graduation_year", null: false
    t.index ["scholarship_id", "user_id"], name: "index_applications_on_scholarship_id_and_user_id", unique: true
    t.index ["scholarship_id"], name: "index_applications_on_scholarship_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "prompt", null: false
    t.bigint "scholarship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scholarship_id"], name: "index_questions_on_scholarship_id"
  end

  create_table "scholarships", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "role", default: 0, null: false
    t.boolean "active", default: true, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "applications", on_delete: :cascade
  add_foreign_key "answers", "questions"
  add_foreign_key "applications", "scholarships"
  add_foreign_key "applications", "users"
  add_foreign_key "questions", "scholarships", on_delete: :cascade
end
