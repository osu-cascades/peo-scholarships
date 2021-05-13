class AddDefaultAndNullConstraintToQuestionWordLimit < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :word_limit, :int, :default => 250, :null => false
  end
end
