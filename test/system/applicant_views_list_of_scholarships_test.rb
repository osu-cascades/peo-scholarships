require 'application_system_test_case'

class ApplicantViewsListOfScholarshipsTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers
  include ActionView::RecordIdentifier

  test 'applicant sees published scholarships' do
    sign_in(users(:applicant))
    visit scholarships_path
    assert_text scholarships(:first).name
  end

  test 'applicant does not see unpublished scholarships' do
    sign_in(users(:applicant))
    visit scholarships_path
    assert_text 'Scholarships'
    refute_text scholarships(:unpublished).name
  end

  test 'applicant does not see link to begin new application after the deadline' do
    sign_in(users(:applicant))
    closed_scholarship = scholarships(:past_deadline)
    visit scholarships_path
    assert_text closed_scholarship.name
    within "##{dom_id(closed_scholarship)}" do
      refute_link 'Begin New Application'
      refute_link 'View Application'
      assert_text 'Applications are closed'
    end
  end

  test 'applicant does see a link to begin a new application an open scholarship' do
    open_scholarship = scholarships(:second)
    sign_in(users(:second_applicant))
    visit scholarships_path
    assert_text open_scholarship.name
    within "##{dom_id(open_scholarship)}" do
      assert_link 'Begin New Application'
    end
  end

  test 'applicant sees a link to view a saved but unsubmitted application' do
    unsubmitted_application = applications(:second)
    sign_in(unsubmitted_application.applicant)
    visit scholarships_path
    assert_text unsubmitted_application.scholarship.name
    within "##{dom_id(unsubmitted_application.scholarship)}" do
      assert_link 'View Application'
    end
  end

  test 'applicant sees a link to view a submitted application' do
    submitted_application = applications(:first)
    sign_in(submitted_application.applicant)
    visit scholarships_path
    assert_text submitted_application.scholarship.name
    within "##{dom_id(submitted_application.scholarship)}" do
      assert_link 'View Application'
    end
  end

end
