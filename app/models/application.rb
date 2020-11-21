class Application < ApplicationRecord

  belongs_to :applicant, class_name: 'User', foreign_key: 'user_id'
  belongs_to :scholarship
  has_many :answers, dependent: :destroy

  validates_uniqueness_of :user_id, scope: :scholarship_id

  def to_s
    "#{scholarship} application by #{applicant}"
  end

end
