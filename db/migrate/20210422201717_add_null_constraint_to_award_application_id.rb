class AddNullConstraintToAwardApplicationId < ActiveRecord::Migration[5.2]
  def change
    change_column :awards, :application_id, :int, :null => false
  end
end
