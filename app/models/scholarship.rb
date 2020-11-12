class Scholarship < ApplicationRecord

  has_many :questions
  has_many :applications

end
