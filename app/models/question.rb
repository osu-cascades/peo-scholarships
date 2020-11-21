class Question < ApplicationRecord

  belongs_to :scholarship
  has_many :answers, dependent: :restrict_with_error

  validates :prompt, presence: true

  def to_s
    prompt
  end

  def deletable?
    answers.none?
  end

end
