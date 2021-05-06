class CreateExternalScholarships < ActiveRecord::Migration[5.2]
  def change
    create_table :external_scholarships do |t|
      t.string :name
      t.integer :amount
      t.timestamps
    end
  end
end
