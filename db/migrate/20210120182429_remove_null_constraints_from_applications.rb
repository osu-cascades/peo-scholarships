class RemoveNullConstraintsFromApplications < ActiveRecord::Migration[5.2]
  def change
    change_column_null :applications, :name, true
    change_column_null :applications, :email, true
    change_column_null :applications, :dob, true
    change_column_null :applications, :address, true
    change_column_null :applications, :phone_number, true
    change_column_null :applications, :marital_status, true
    change_column_null :applications, :ssn, true
    change_column_null :applications, :institution_name, true
    change_column_null :applications, :academic_year, true
    change_column_null :applications, :institution_address, true
    change_column_null :applications, :major, true
    change_column_null :applications, :completion_date, true
    change_column_null :applications, :academic_standing, true
    change_column_null :applications, :high_school_gpa, true
    change_column_null :applications, :career_plan, true
    change_column_null :applications, :high_school_name, true
    change_column_null :applications, :high_school_graduation_year, true
    change_column_null :applications, :total_monthly_income, true
    change_column_null :applications, :total_scholarship_monthly, true
    change_column_null :applications, :tuition_cost, true
    change_column_null :applications, :supplies, true
    change_column_null :applications, :childcare, true
    change_column_null :applications, :transportation, true
    change_column_null :applications, :other, true
    change_column_null :applications, :monthly_expenses, true
    change_column_null :applications, :savings, true
    change_column_null :applications, :investments, true
    change_column_null :applications, :school_loan_debt, true
    change_column_null :applications, :other_debt, true
  end
end
