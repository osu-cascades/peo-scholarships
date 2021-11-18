class Experience < ApplicationRecord

  belongs_to :application

  enum kind: [:employment, :volunteer_experience, :school_activity]
  attribute :kind, :integer, default: :employment

  validates :title, presence: true
  validates :started_at, presence: true
  validates :frequency, presence: true
  validates :responsibilities_accomplishments_honors, presence: true
  validates :total_hours, presence: true, numericality: true

  def to_s
    title
  end

end
