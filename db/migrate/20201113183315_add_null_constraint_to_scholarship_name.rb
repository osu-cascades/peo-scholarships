class AddNullConstraintToScholarshipName < ActiveRecord::Migration[5.2]
  def change
    change_column_null :scholarships, :name, false
  end
end
