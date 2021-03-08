class Application < ApplicationRecord

  belongs_to :applicant, class_name: 'User', foreign_key: 'user_id'
  belongs_to :scholarship
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers
  has_one :award, dependent: :destroy
  accepts_nested_attributes_for :award
  has_one_attached :recommendation_letter
  has_many_attached :transcripts

  validates_uniqueness_of :user_id, scope: :scholarship_id
  validates :name, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false,
    format: { with: Devise.email_regexp }
  validates :dob, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :phone_number, presence: true, allow_blank: false
  validates :marital_status, presence: true, allow_blank: false
  validates :ssn, presence: true, numericality: { only_integer: true }, allow_blank: false, length: { is: 4 }

  validates :high_school_name, presence: true, allow_blank: false
  validates :high_school_graduation_year, presence: true, numericality: { only_integer: true }, allow_blank: false, length: { is: 4 }

  validates :total_monthly_income, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :total_scholarship_monthly, presence: true, numericality: { only_integer: true }
  validates :tuition_cost, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :supplies, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :childcare, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :transportation, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :other, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :monthly_expenses, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :investments, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :school_loan_debt, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :other_debt, presence: true, allow_blank: false, numericality: { only_integer: true }

  validates :institution_name, presence: true, allow_blank: false
  validates :academic_year, presence: true, allow_blank: false
  validates :institution_address, presence: true, allow_blank: false
  validates :major, presence: true, allow_blank: false
  validates :completion_date, presence: true, allow_blank: false
  validates :academic_standing, presence: true, allow_blank: false
  validates :high_school_gpa, presence: true, allow_blank: false
  validates :career_plan, presence: true, allow_blank: false

  def to_s
    "#{scholarship} application by #{applicant}"
  end

end
