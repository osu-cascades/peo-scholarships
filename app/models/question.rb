class Question < ApplicationRecord

  belongs_to :scholarship
  has_many :answers, dependent: :restrict_with_error

  validates :prompt, presence: true, allow_blank: false
  validates :word_limit, presence: true, allow_blank: false

  def to_s
    prompt
  end

  def deletable?
    answers.none?
  end

  def updatable?
    !self.scholarship.published?
  end

end
