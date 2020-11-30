class AddEducationalHistoryToApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :previous_college1_name, :string
    add_column :applications, :previous_college1_years, :string
    add_column :applications, :previous_college1_degree, :string
    add_column :applications, :previous_college2_name, :string
    add_column :applications, :previous_college2_years, :string
    add_column :applications, :previous_college2_degree, :string
    add_column :applications, :high_school_name, :string, null: false
    add_column :applications, :high_school_graduation_year, :string, null: false
  end
end
