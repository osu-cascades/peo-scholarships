require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

  test 'belongs to application' do
    assert_respond_to Answer.new, :application
  end

  test 'belongs to question' do
    assert_respond_to Answer.new, :question
  end

  test 'has a required body' do
    a = answers(:first)
    assert a.valid?
    a.body = ''
    refute a.valid?
  end

  test 'has a string representation that is its body' do
    assert_equal answers(:first).to_s, answers(:first).body
  end

end
