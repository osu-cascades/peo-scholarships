class AddRankToApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :rank, :integer, null: true
  end
end
