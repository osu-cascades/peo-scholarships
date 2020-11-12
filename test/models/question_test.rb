require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test 'has a required prompt' do
    q = questions(:first)
    assert q.valid?
    q.prompt = ''
    refute q.valid?
  end

  test 'has a string representation that is its prompt' do
    assert_equal questions(:first).to_s, questions(:first).prompt
  end

end
