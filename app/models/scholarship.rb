class Scholarship < ApplicationRecord

  has_many :questions
  has_many :applications

  validates :name, presence: true

  def to_s
    name
  end

end
