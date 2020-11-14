class Answer < ApplicationRecord

  belongs_to :application
  belongs_to :question

  validates :body, presence: true
  validates_uniqueness_of :question_id, scope: :application_id

  def to_s
    body
  end

end
