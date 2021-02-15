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
      question: existing_answer.application.scholarship.questions.build)
    assert same_application_different_question.valid?
    same_question_different_application = Answer.new(
      body: 'Fake',
      application: applications(:third),
      question: existing_answer.question)
    assert same_question_different_application.valid?
    same_application_and_question = Answer.new(
      body: 'Fake',
      application: existing_answer.application,
      question: existing_answer.question)
    refute same_application_and_question.valid?
  end

  test 'the answer\'s application scholarship is the same as the question\'s scholarship' do
    scholarship = scholarships(:first)
    question = scholarship.questions.first
    application = scholarship.applications.build
    answer = Answer.new(body: 'Fake', question: question, application: application)
    assert answer.valid?
    other_scholarship = scholarships(:second)
    other_scholarship_question = other_scholarship.questions.first
    answer.question = other_scholarship_question
    refute answer.valid?
  end

end
