require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase

  test 'belongs to an applicant' do
    assert_respond_to(Application.new, :applicant)
  end

  test 'belongs to a scholarship' do
    assert_respond_to(Application.new, :scholarship)
  end

  test 'has many answers' do
    assert_respond_to(Application.new, :answers)
  end

  test 'only one application per scholarship per applicant' do
    existing_application = applications(:first)
    same_applicant_different_scholarship = Application.new(
      applicant: existing_application.applicant,
      scholarship: Scholarship.new(name: 'Fake'))
    assert same_applicant_different_scholarship.valid?
    same_scholarship_different_applicant = Application.new(
      applicant: User.new,
      scholarship: existing_application.scholarship)
    assert same_scholarship_different_applicant.valid?
    same_applicant_and_scholarship = Application.new(
      applicant: existing_application.applicant,
      scholarship: existing_application.scholarship)
    refute same_applicant_and_scholarship.valid?
  end

  test 'has a string representation including scholarship and applicant name' do
    application = applications(:first)
    applicant_name = application.applicant.full_name
    scholarship_name = application.scholarship.name
    assert_equal "#{scholarship_name} application by #{applicant_name}", application.to_s
  end

  test 'deleting an application deletes all of its answers' do
    application = applications(:first)
    answers = application.answers
    assert application.answers.any?
    application.destroy
    assert application.destroyed?
    assert_empty application.answers
  end

end

