class Award < ApplicationRecord

  belongs_to :application

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  
  def to_s
    name
  end

end
