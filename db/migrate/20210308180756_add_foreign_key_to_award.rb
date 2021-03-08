class AddForeignKeyToAward < ActiveRecord::Migration[5.2]
  def change
    add_reference :awards, :application, foreign_key: true
  end
end
