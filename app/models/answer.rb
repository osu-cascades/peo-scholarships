class Answer < ApplicationRecord

  belongs_to :application
  belongs_to :question

  validates :body, presence: true
  validates_uniqueness_of :question_id, scope: :application_id
  validate :question_scholarship_is_application_scholarship

  def to_s
    body
  end

  def question_scholarship_is_application_scholarship
    if application.scholarship != question.scholarship
      errors.add(:base, 'Question scholarship is not the same as the application scholarship')
    end
  end

end
