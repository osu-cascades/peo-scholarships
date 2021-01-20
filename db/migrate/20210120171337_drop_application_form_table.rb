class DropApplicationFormTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :application_forms
  end
end
