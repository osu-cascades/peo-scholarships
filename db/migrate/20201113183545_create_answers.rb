class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.references :application, foreign_key: true, null: false
      t.references :question, foreign_key: true, null: false
    end
    add_index :answers, [:application_id, :question_id], unique: true
  end
end
