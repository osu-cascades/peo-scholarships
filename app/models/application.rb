class Application < ApplicationRecord

  belongs_to :applicant, class_name: 'User', foreign_key: 'user_id'
  belongs_to :scholarship
  has_many :answers, dependent: :destroy

  validates_uniqueness_of :user_id, scope: :scholarship_id
  validates :name, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false,
    format: { with: Devise.email_regexp }
  validates :dob, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :phone_number, presence: true, allow_blank: false
  validates :marital_status, presence: true, allow_blank: false
  validates :ssn, presence: true, numericality: { only_integer: true }, allow_blank: false, length: { is: 4 }

  def to_s
    "#{scholarship} application by #{applicant}"
  end

end
