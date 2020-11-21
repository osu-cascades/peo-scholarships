class ChangeQuestionsScholarshipsFkConstraint < ActiveRecord::Migration[5.2]
  def up
    remove_foreign_key 'questions', 'scholarships'
    add_foreign_key 'questions', 'scholarships', on_delete: :cascade
  end

  def down
    remove_foreign_key 'questions', 'scholarships' # Remove the one w/ on delete cascade
    add_foreign_key 'questions', 'scholarships'
  end
end
