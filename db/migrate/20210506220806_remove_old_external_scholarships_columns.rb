class RemoveOldExternalScholarshipsColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :scholarship1
    remove_column :applications, :scholarship1_per_month
    remove_column :applications, :scholarship2
    remove_column :applications, :scholarship2_per_month
    remove_column :applications, :scholarship3
    remove_column :applications, :scholarship3_per_month
  end
end
