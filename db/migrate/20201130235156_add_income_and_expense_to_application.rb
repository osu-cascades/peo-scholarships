class AddIncomeAndExpenseToApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :total_monthly_income, :int, null:false
    add_column :applications, :total_scholarship_monthy, :int, null:false
    add_column :applications, :scholarship1, :string
    add_column :applications, :scholarship1_per_month, :int
    add_column :applications, :scholarship2, :string
    add_column :applications, :scholarship2_per_month, :int
    add_column :applications, :scholarship3, :string
    add_column :applications, :scholarship3_per_month, :int
    add_column :applications, :tuition_cost, :int, null:false
    add_column :applications, :supplies, :int, null:false
    add_column :applications, :childcare, :int, null:false
    add_column :applications, :transportation, :int, null:false
    add_column :applications, :other, :int, null:false
    add_column :applications, :monthly_expenses, :int, null:false
    add_column :applications, :savings, :int, null:false
    add_column :applications, :investments, :int, null:false
    add_column :applications, :school_loan_debt, :int, null:false
    add_column :applications, :other_debt, :int, null:false
  end
end
