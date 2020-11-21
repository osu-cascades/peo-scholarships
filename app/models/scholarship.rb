class Scholarship < ApplicationRecord

  has_many :questions, dependent: :destroy
  has_many :applications

  validates :name, presence: true

  def to_s
    name
  end

end
