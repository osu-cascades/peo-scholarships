require 'test_helper'

class ScholarshipTest < ActiveSupport::TestCase

  def new_scholarship
    Scholarship.new(name: 'Fake Scholarship')
  end

  test 'has questions' do
    assert_respond_to(Scholarship.new, :questions)
  end

  test 'has applications' do
    assert_respond_to(Scholarship.new, :applications)
  end

  test 'has a required name' do
    s = new_scholarship
    assert s.valid?
    s.name = ''
    refute s.valid?
  end

  test 'is not published by default' do
    s = new_scholarship
    refute s.published?
  end

  test 'has a string representation that is its name' do
    assert_equal scholarships(:first).to_s, scholarships(:first).name
  end

  test 'deleting a scholarship deletes all of its questions' do
    scholarship = scholarships(:with_questions_but_no_applications)
    questions = scholarship.questions
    assert scholarship.questions.any?
    scholarship.destroy
    assert scholarship.destroyed?
    assert_empty scholarship.questions
  end

  test 'cannot be deleted if its questions have answers' do
    scholarship = scholarships(:first)
    assert_empty scholarship.errors
    refute scholarship.destroy
    refute scholarship.destroyed?
    skip # See https://stackoverflow.com/questions/64941365/how-to-incorporate-a-rails-restrict-with-error-message-in-a-parents-parent
  end

  test 'cannot be deleted when applications exist' do
    scholarship_with_application = scholarships(:second)
    assert_empty scholarship_with_application.errors
    assert_empty scholarship_with_application.questions.collect(&:answers).flatten
    refute scholarship_with_application.destroy
    refute scholarship_with_application.destroyed?
  end

end
