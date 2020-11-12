class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :prompt, null: false
      t.references :scholarship, foreign_key: true

      t.timestamps
    end
  end
end
