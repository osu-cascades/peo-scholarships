class Scholarship < ApplicationRecord

  has_many :questions, dependent: :destroy
  has_many :applications, dependent: :restrict_with_error

  validates :name, presence: true

  def to_s
    name
  end

end
