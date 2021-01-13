class CreateApplicationForm < ActiveRecord::Migration[5.2]
  def change
    create_table :application_forms do |t|
      t.bigint :user_id, null: false
      t.bigint :scholarship_id, null: false
      t.string :name
      t.string :email
      t.date :dob
      t.string :address
      t.string :phone_number
      t.string :ages_of_children
      t.string :marital_status
      t.string :student_id
      t.string :ssn

      t.timestamps
    end
  end
end
