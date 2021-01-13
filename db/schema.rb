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

ActiveRecord::Schema.define(version: 2021_01_13_172107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "application_id", null: false
    t.bigint "question_id", null: false
    t.index ["application_id", "question_id"], name: "index_answers_on_application_id_and_question_id", unique: true
    t.index ["application_id"], name: "index_answers_on_application_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "application_forms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "scholarship_id", null: false
    t.string "name"
    t.string "email"
    t.date "dob"
    t.string "address"
    t.string "phone_number"
    t.string "ages_of_children"
    t.string "marital_status"
    t.string "student_id"
    t.string "ssn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scholarship_id"], name: "index_application_forms_on_scholarship_id"
    t.index ["user_id"], name: "index_application_forms_on_user_id"
  end

  create_table "applications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "scholarship_id", null: false
    t.string "name", null: false
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
    t.integer "total_monthly_income", null: false
    t.integer "total_scholarship_monthly", null: false
    t.string "scholarship1"
    t.integer "scholarship1_per_month"
    t.string "scholarship2"
    t.integer "scholarship2_per_month"
    t.string "scholarship3"
    t.integer "scholarship3_per_month"
    t.integer "tuition_cost", null: false
    t.integer "supplies", null: false
    t.integer "childcare", null: false
    t.integer "transportation", null: false
    t.integer "other", null: false
    t.integer "monthly_expenses", null: false
    t.integer "savings", null: false
    t.integer "investments", null: false
    t.integer "school_loan_debt", null: false
    t.integer "other_debt", null: false
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "applications", on_delete: :cascade
  add_foreign_key "answers", "questions"
  add_foreign_key "application_forms", "scholarships"
  add_foreign_key "application_forms", "users"
  add_foreign_key "applications", "scholarships"
  add_foreign_key "applications", "users"
  add_foreign_key "questions", "scholarships", on_delete: :cascade
end
