class ChangeAnswersApplicationsFkConstraint < ActiveRecord::Migration[5.2]

  def up
    remove_foreign_key 'answers', 'applications'
    add_foreign_key 'answers', 'applications', on_delete: :cascade
  end


  def down
    remove_foreign_key 'answers', 'applications' # Remove the one w/ on delete cascade
    add_foreign_key 'answers', 'applications'
  end

end
