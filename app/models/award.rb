class Award < ApplicationRecord

  belongs_to :application
  
  def to_s
    name
  end

end
