require 'application_system_test_case'

class ApplicantViewsSavedApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers
  include ActionView::RecordIdentifier

  test 'applicant views their saved unsubmitted application' do
    application = applications(:second_unsubmitted)
    sign_in application.applicant
    visit scholarships_path
    within "##{dom_id(application.scholarship)}" do
      click_on 'View Application'
    end
    assert_text application.to_s
  end

  test 'applicant sees a link to edit a saved unsubmitted application' do
    application = applications(:second_unsubmitted)
    sign_in application.applicant
    visit scholarship_application_path(application.scholarship, application)
    assert_link 'Edit'
  end

  test 'applicant sees a link to delete a saved unsubmitted application' do
    application = applications(:second_unsubmitted)
    sign_in application.applicant
    visit scholarship_application_path(application.scholarship, application)
    assert_link 'Delete'
  end

  test 'applicant does not see a link to edit a submitted application' do
    application = applications(:first_submitted)
    sign_in application.applicant
    visit scholarship_application_path(application.scholarship, application)
    refute_link 'Edit'
  end

  test 'applicant does not see a link to submit a submitted application' do
    application = applications(:first_submitted)
    sign_in application.applicant
    visit scholarship_application_path(application.scholarship, application)
    refute_link 'Submit'
  end

  test 'applicant does not see a link to delete a submitted application' do
    application = applications(:first_submitted)
    sign_in application.applicant
    visit scholarship_application_path(application.scholarship, application)
    refute_link 'Delete'
  end

  test 'applicant does not see a link to edit a late, unsubmitted application' do
    application = applications(:late)
    sign_in application.applicant
    visit scholarship_application_path(application.scholarship, application)
    refute_link 'Edit'
  end

  test 'applicant does not see a link to submit a late, unsubmitted application' do
    application = applications(:late)
    sign_in application.applicant
    visit scholarship_application_path(application.scholarship, application)
    refute_link 'Submit'
  end

  test 'applicant sees \'Submitted\' badge when application is submitted and no other badges' do
    application = applications(:first_submitted)
    sign_in application.applicant
    visit scholarship_application_path(application.scholarship, application)
    refute_text 'Late'
    refute_text 'In Progress'
    assert_text 'Submitted'
  end

  test 'applicant sees \'Late\' badge when application is late and no other badges' do
    application = applications(:late)
    sign_in application.applicant
    visit scholarship_application_path(application.scholarship, application)
    refute_text 'Submitted'
    refute_text 'In Progress'
    assert_text 'Late'
  end

  test 'applicant sees \'In Progress\' badge when application is in progress and no other badges' do
    application = applications(:second_unsubmitted)
    sign_in application.applicant
    visit scholarship_application_path(application.scholarship, application)
    refute_text 'Submitted'
    refute_text 'Late'
    assert_text 'In Progress'
  end
end
