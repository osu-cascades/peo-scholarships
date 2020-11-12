class Application < ApplicationRecord

  belongs_to :applicant, class_name: 'User', foreign_key: 'user_id'
  belongs_to :scholarship

  validates_uniqueness_of :user_id, scope: :scholarship_id

end
