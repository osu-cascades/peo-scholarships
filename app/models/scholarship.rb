class Scholarship < ApplicationRecord

  has_many :questions, dependent: :destroy
  has_many :applications, dependent: :restrict_with_error

  validates :name, presence: true
  validates :application_deadline, presence: true
  validate :application_deadline_cannot_be_in_the_past

  scope :published, -> { where(published: true) }

  def to_s
    name
  end

  def application_deadline_cannot_be_in_the_past
    if application_deadline.present? && application_deadline < Date.today
      errors.add(:application_deadline, "can't be in the past")
    end
  end

end
