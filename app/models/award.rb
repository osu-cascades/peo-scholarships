class Award < ApplicationRecord

  belongs_to :application
  validates :name, presence: true, allow_blank: false
  validates :awarded_date, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false

  def to_s
    name
  end

end
