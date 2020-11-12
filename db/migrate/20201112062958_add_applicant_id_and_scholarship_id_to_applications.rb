class AddApplicantIdAndScholarshipIdToApplications < ActiveRecord::Migration[5.2]
  def change
    add_reference :applications, :user, foreign_key: true, null: false
    add_reference :applications, :scholarship, foreign_key: true, null: false
    add_index :applications, [:scholarship_id, :user_id], unique: true
  end
end
