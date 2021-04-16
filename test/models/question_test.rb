require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test 'belongs to scholarship' do
    assert_respond_to(Question.new, :scholarship)
  end

  test 'has many answers' do
    assert_respond_to(Question.new, :answers)
  end

  test 'has a required prompt' do
    q = questions(:first)
    assert q.valid?
    q.prompt = ''
    refute q.valid?
  end

  test 'has a string representation that is its prompt' do
    assert_equal questions(:first).to_s, questions(:first).prompt
  end

  test 'cannot be deleted if it has answers' do
    question_with_answers = questions(:first)
    assert_empty question_with_answers.errors
    refute question_with_answers.destroy
    refute question_with_answers.destroyed?
    refute_empty question_with_answers.errors
  end

  test '#deletable?' do
    question = Question.new
    assert question.deletable?
    question.answers << Answer.new
    refute question.deletable?
  end

  test 'can not be created, updated, or deleted if its scholarship is visible' do
    question = questions(:first)
    refute question.updatable?
  end

  test 'can be created or updated if its scholarship is not visible' do
    question = questions(:fifth)
    assert question.updatable?
  end

end
