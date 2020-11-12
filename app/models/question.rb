class Question < ApplicationRecord
  belongs_to :scholarship

  validates :prompt, presence: true

  def to_s
    prompt
  end

end
