class ExternalScholarship < ApplicationRecord

  validates :name, presence: true
  validates :amount, presence: true, numericality: true

  def to_s
    name
  end

  belongs_to :application
end
