class ApplicationForm < ApplicationRecord

  belongs_to :applicant, class_name: 'User', foreign_key: 'user_id'
  belongs_to :scholarship
  has_many :answers, dependent: :destroy

end
