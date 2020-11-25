class AddPersonalInformationToApplication < ActiveRecord::Migration[5.2]
  def up
    change_column_null :applications, :name, false
    add_column :applications, :email, :string, null: false
    add_column :applications, :dob, :date, null: false
    add_column :applications, :address, :string, null: false
    add_column :applications, :phone_number, :string, null: false
    add_column :applications, :ages_of_children, :string
    add_column :applications, :marital_status, :string, null: false
    add_column :applications, :student_id, :string
    add_column :applications, :ssn, :string, null: false
  end

  def down
    change_column_null :applications, :name, true
    remove_column :applications, :email
    remove_column :applications, :dob
    remove_column :applications, :address
    remove_column :applications, :phone_number
    remove_column :applications, :ages_of_children
    remove_column :applications, :marital_status
    remove_column :applications, :student_id
    remove_column :applications, :ssn, :string
  end
end
