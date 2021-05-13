require 'test_helper'

class ScholarshipTest < ActiveSupport::TestCase

  def new_scholarship
    Scholarship.new(name: 'Fake Scholarship', application_deadline: 90.days.from_now.to_date)
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

  test 'has a required application deadline' do
    s = new_scholarship
    assert s.valid?
    s.application_deadline = nil
    refute s.valid?
  end

  test 'must have an application_deadline in the future' do
    s = new_scholarship
    assert s.valid?
    s.application_deadline = Date.yesterday
    refute s.valid?
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
    refute scholarship_with_application.destroy
    refute scholarship_with_application.destroyed?
  end

  # closed?

  test 'is closed if it is not published' do
    assert scholarships(:unpublished).closed?
  end

  test 'is closed if it is published but the application deadline is in the past' do
    assert scholarships(:past_deadline).closed?
  end

  # open?

  test 'is not open if it is not published' do
    refute scholarships(:unpublished).open?
  end

  test 'is not open if it is published but the application deadline is in the past' do
    refute scholarships(:past_deadline).open?
  end

  test 'is open if it is published and the application deadline is in the future' do
    assert scholarships(:first).open?
  end

  test 'is open if it is published and the application deadline is the current date' do
    scholarship = scholarships(:first)
    scholarship.application_deadline = Date.current
    assert scholarships(:first).open?
  end

  # status

  test "is 'Not visible' if it is not published, regardless of the application deadline" do
    scholarship = scholarships(:unpublished)
    scholarship.application_deadline = 2.days.from_now
    assert_equal scholarship.status, 'Not visible'
    scholarship.application_deadline = 2.days.ago
    assert_equal scholarship.status, 'Not visible'
  end

  test "is 'Closed' if it is published and has a past application deadline" do
    scholarship = scholarships(:past_deadline)
    assert_equal scholarship.status, 'Closed'
  end

  test "is 'Open' if it is published and has a future application deadline" do
    scholarship = scholarships(:first)
    assert_equal scholarship.status, 'Open'
  end

  test 'not updatable when visible' do
    scholarship = scholarships(:first)
    admin = users(:admin)
    refute scholarship.updatable_by? admin
  end

  test 'not updatable by non-admin, even when non-visible' do
    scholarship = scholarships(:unpublished)
    applicant = users(:applicant)
    refute scholarship.updatable_by? applicant
  end

  test 'updatable by admin when non-visible' do
    scholarship = scholarships(:unpublished)
    admin = users(:admin)
    assert scholarship.updatable_by? admin
  end

end
