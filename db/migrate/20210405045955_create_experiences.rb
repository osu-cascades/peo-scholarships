class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.references :application, foreign_key: true, null: false
      t.integer :kind, null: false, default: 0
      t.string :title
      t.date :started_at
      t.date :ended_at
      t.string :frequency
      t.integer :hours_per_week
      t.integer :total_hours
      t.string :responsibilities_accomplishments_honors
      t.timestamps
    end
  end
end
