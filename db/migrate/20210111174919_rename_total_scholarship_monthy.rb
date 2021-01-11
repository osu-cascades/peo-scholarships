class RenameTotalScholarshipMonthy < ActiveRecord::Migration[5.2]
  def change
    rename_column :applications, :total_scholarship_monthy, :total_scholarship_monthly
  end
end
