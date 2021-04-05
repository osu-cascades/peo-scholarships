class Experience < ApplicationRecord

  enum kind: [:employment, :volunteer_experience, :school_activity]
  attribute :kind, :integer, default: :employment

  validates_presence_of :title
  validates_presence_of :started_at
  validates_presence_of :frequency
  validates_numericality_of :total_hours
  validates_presence_of :responsibilities_accomplishments_honors

  belongs_to :application

end
