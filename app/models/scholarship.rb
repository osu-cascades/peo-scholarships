class Scholarship < ApplicationRecord

  has_many :questions, dependent: :destroy
  has_many :applications, dependent: :restrict_with_error

  validates :name, presence: true
  validates :application_deadline, presence: true
  validate :application_deadline_cannot_be_in_the_past, on: :create
  validate :application_deadline_cannot_be_changed_to_a_past_date, on: :update

  scope :published, -> { where(published: true) }
  scope :open, -> { published.where('application_deadline >= ?', Date.current) }

  def open?
    published && application_deadline >= Date.current
  end

  def closed?
    !open?
  end

  def status
    if !published?
      'Not visible'
    elsif closed?
      'Closed'
    elsif open?
      'Open'
    end
  end

  def to_s
    name
  end

  def application_deadline_cannot_be_in_the_past
    if application_deadline.present? && application_deadline < Date.current
      errors.add(:application_deadline, "can't be in the past")
    end
  end

  def application_deadline_cannot_be_changed_to_a_past_date
    if application_deadline_changed? && application_deadline < Date.current
      errors.add(:application_deadline, "can't be in the past")
    end
  end

  def updatable_by? current_user
    if current_user.admin? && !self.published?
      return true
    end
    false
  end

end
