class RenameAwardAwardedDateToDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :awards, :awarded_date, :date
  end
end
