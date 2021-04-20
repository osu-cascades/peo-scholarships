class RemoveNullConstraintAwards < ActiveRecord::Migration[5.2]
  def change
    change_column_null :awards, :name, true
    change_column_null :awards, :awarded_date, true
    change_column_null :awards, :description, true

  end
end
