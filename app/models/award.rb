class Award < ApplicationRecord

  belongs_to :application
  
  def to_s
    name
  end

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true

end
