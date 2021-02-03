class AddApplicationDeadlineToScholarship < ActiveRecord::Migration[5.2]
  def change
    add_column :scholarships, :application_deadline, :date
    execute <<-SQL.squish
      UPDATE scholarships
      SET application_deadline = '#{90.days.from_now.to_date.to_s}';
    SQL
    change_column_null :scholarships, :application_deadline, false
  end

  def down
    remove_column :scholarships, :application_deadline
  end
end
