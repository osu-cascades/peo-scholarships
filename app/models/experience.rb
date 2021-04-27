class Experience < ApplicationRecord

  enum kind: [:employment, :volunteer_experience, :school_activity]
  attribute :kind, :integer, default: :employment

  def to_s
    title
  end

  belongs_to :application

end
