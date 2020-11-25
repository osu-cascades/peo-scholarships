class AddInstitutionToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :institution_name, :string, null: false
    add_column :applications, :academic_year, :string, null: false
    add_column :applications, :institution_address, :string, null: false
    add_column :applications, :major, :string, null: false
    add_column :applications, :completion_date, :date, null: false
    add_column :applications, :academic_standing, :string, null: false
    add_column :applications, :post_high_school_gpa, :float
    add_column :applications, :high_school_gpa, :float, null: false
    add_column :applications, :career_plan, :text, null: false
  end
end
