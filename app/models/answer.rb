class Answer < ApplicationRecord

  belongs_to :application
  belongs_to :question

  validates :body, presence: true

  def to_s
    body
  end

end
