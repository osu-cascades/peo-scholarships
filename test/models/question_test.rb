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

  test 'retains the original prompt during a prompt change' do
    q = questions(:first)
    original_prompt = q.prompt
    q.prompt = 'CHANGED'
    assert_equal original_prompt, q.prompt_was
  end

end
