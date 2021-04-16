class Application < ApplicationRecord

  ALLOWED_ATTACHMENT_MIME_TYPES = [
    'application/pdf',
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
  ]

  belongs_to :applicant, class_name: 'User', foreign_key: 'user_id'
  belongs_to :scholarship
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers
  has_many :awards, dependent: :destroy
  accepts_nested_attributes_for :awards, allow_destroy: true
  has_many :experiences, dependent: :destroy
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

  validate :correct_recommendation_letter_mime_type
  validate :correct_transcript_mime_type

  scope :submitted, -> { where(submitted: true) }
  scope :incomplete, -> { where(submitted: false) }

  def to_s
    "#{scholarship} application by #{applicant}"
  end

  def delete_application(current_user)
    if modifiable_by? current_user
      return self.destroy
    end
    false
  end

  def update_application(current_user)
    if modifiable_by? current_user
      return self.save(validate: false)
    end
    false
  end

  private

  def modifiable_by? current_user
    current_user.admin? || (current_user == self.applicant && !self.submitted? && current_user.applicant?)
  end

  def correct_recommendation_letter_mime_type
    if recommendation_letter.attached? && !recommendation_letter.content_type.in?(ALLOWED_ATTACHMENT_MIME_TYPES)
      recommendation_letter.purge
      errors.add(:recommendation_letter, 'Must be a PDF or Word file')
    end
  end

  def correct_transcript_mime_type
    return unless transcripts.attached?
    transcripts.each do |transcript|
      if !transcript.content_type.in?(ALLOWED_ATTACHMENT_MIME_TYPES)
        transcript.purge
        errors.add(:transcripts, 'Must be a PDF or Word file')
        return
      end
    end
  end

end
