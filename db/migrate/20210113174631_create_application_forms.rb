class CreateApplicationForms < ActiveRecord::Migration[5.2]
  def change
    create_table :application_forms do |t|

      t.timestamps
    end
  end
end
