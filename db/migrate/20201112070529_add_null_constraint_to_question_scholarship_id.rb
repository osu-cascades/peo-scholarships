class AddNullConstraintToQuestionScholarshipId < ActiveRecord::Migration[5.2]
  def change
    change_column_null :questions, :scholarship_id, false
  end
end
