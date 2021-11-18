class ExternalScholarship < ApplicationRecord

  belongs_to :application

  validates :name, presence: true
  validates :amount, presence: true, numericality: true

  def to_s
    name
  end

end
