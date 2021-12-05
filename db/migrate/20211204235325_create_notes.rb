class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :body, null: false
      t.references :application, foreign_key: true, null: false
      t.references :author, foreign_key: { to_table: 'users' }, null: false
      t.timestamps
    end
  end
end
