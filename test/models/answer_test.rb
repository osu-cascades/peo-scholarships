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

  test 'only one answer per question per application' do
    existing_answer = answers(:first)
    same_application_different_question = Answer.new(
      body: 'Fake',
      application: existing_answer.application,
      question: Question.new)
    assert same_application_different_question.valid?
    same_question_different_application = Answer.new(
      body: 'Fake',
      application: Application.new,
      question: existing_answer.question)
    assert same_question_different_application.valid?
    same_application_and_question = Answer.new(
      body: 'Fake',
      application: existing_answer.application,
      question: existing_answer.question)
    refute same_application_and_question.valid?
  end

end
