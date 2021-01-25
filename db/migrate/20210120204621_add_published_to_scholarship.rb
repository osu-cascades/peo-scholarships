class AddPublishedToScholarship < ActiveRecord::Migration[5.2]
  def change
    add_column :scholarships, :published, :boolean, null: false, default: false
  end
end
