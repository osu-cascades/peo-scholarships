class CreateAwards < ActiveRecord::Migration[5.2]
  def change
    create_table :awards do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.date :awarded_date, null: false
    end
  end
end
