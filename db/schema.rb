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

ActiveRecord::Schema.define(version: 2021_04_05_045955) do

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

  create_table "applications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "institution_name"
    t.string "academic_year"
    t.string "institution_address"
    t.string "major"
    t.date "completion_date"
    t.string "academic_standing"
    t.float "post_high_school_gpa"
    t.float "high_school_gpa"
    t.text "career_plan"
    t.string "previous_college1_name"
    t.string "previous_college1_years"
    t.string "previous_college1_degree"
    t.string "previous_college2_name"
    t.string "previous_college2_years"
    t.string "previous_college2_degree"
    t.string "high_school_name"
    t.string "high_school_graduation_year"
    t.integer "total_monthly_income"
    t.integer "total_scholarship_monthly"
    t.string "scholarship1"
    t.integer "scholarship1_per_month"
    t.string "scholarship2"
    t.integer "scholarship2_per_month"
    t.string "scholarship3"
    t.integer "scholarship3_per_month"
    t.integer "tuition_cost"
    t.integer "supplies"
    t.integer "childcare"
    t.integer "transportation"
    t.integer "other"
    t.integer "monthly_expenses"
    t.integer "savings"
    t.integer "investments"
    t.integer "school_loan_debt"
    t.integer "other_debt"
    t.boolean "submitted", default: false
    t.index ["scholarship_id", "user_id"], name: "index_applications_on_scholarship_id_and_user_id", unique: true
    t.index ["scholarship_id"], name: "index_applications_on_scholarship_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "awards", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.date "awarded_date", null: false
    t.bigint "application_id"
    t.index ["application_id"], name: "index_awards_on_application_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "application_id", null: false
    t.integer "kind", default: 0, null: false
    t.string "title"
    t.date "started_at"
    t.date "ended_at"
    t.string "frequency"
    t.integer "hours_per_week"
    t.integer "total_hours"
    t.string "responsibilities_accomplishments_honors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_experiences_on_application_id"
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
    t.boolean "published", default: false, null: false
    t.date "application_deadline", null: false
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
  add_foreign_key "applications", "scholarships"
  add_foreign_key "applications", "users"
  add_foreign_key "awards", "applications"
  add_foreign_key "experiences", "applications"
  add_foreign_key "questions", "scholarships", on_delete: :cascade
end
