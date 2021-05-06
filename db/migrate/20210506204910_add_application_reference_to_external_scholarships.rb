class AddApplicationReferenceToExternalScholarships < ActiveRecord::Migration[5.2]
  def change
    add_reference :external_scholarships, :application, foreign_key: true
  end
end
