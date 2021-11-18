class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable, :recoverable,
         :rememberable, :validatable

  has_many :applications, dependent: :restrict_with_error

  enum role: [:applicant, :admin, :member, :recommender]
  attribute :role, :integer, default: :applicant

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :active, inclusion: { in: [true, false] }

  default_scope { order(:last_name) }
  scope :active, -> { where(active: true) }
  scope :deactivated, -> { where(active: false) }

  def to_s
    full_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def last_name_first_name
    "#{last_name}, #{first_name}"
  end

  def active_for_authentication?
    super && active?
  end

  def status
    active? ? 'active' : 'inactive'
  end

  def name_was
    "#{first_name_was} #{last_name_was}"
  end

  def application_for(scholarship)
    scholarship.applications.where(applicant: self).first
  end

  def deletable?
    applications.none?
  end

  def started_application_for?(scholarship)
    application_for(scholarship).present?
  end

end
