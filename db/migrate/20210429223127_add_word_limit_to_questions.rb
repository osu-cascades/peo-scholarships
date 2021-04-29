class AddWordLimitToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :word_limit, :integer
  end
end
