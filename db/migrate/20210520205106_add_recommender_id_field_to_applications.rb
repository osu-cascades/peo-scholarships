class AddRecommenderIdFieldToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :recommender_id, :bigint
  end
end
