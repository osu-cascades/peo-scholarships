class RemoveQuestionFromApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :question
  end
end
