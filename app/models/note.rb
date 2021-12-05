class Note < ApplicationRecord
  belongs_to :application
  belongs_to :author, class_name: 'User'

  validates :body, presence: true, allow_blank: false

  def to_s
    body
  end

end
