require 'application_system_test_case'

class AdminDeletesUserTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers
  include ActionView::RecordIdentifier

  test 'admin deleting a user that has applications shows an error message' do
    sign_in(users(:admin))
    visit users_path
    user_with_application = users(:applicant)
    assert user_with_application.applications.any?
    within "##{dom_id(user_with_application)}" do
      click_on 'Delete'
    end
    assert_text user_with_application.full_name
    assert_text 'cannot be deleted'
  end

  test 'admin deleting a user that has no applications succeeds' do
    sign_in(users(:admin))
    visit users_path
    user_without_application = users(:member)
    assert user_without_application.applications.none?
    within "##{dom_id(user_without_application)}" do
      click_on 'Delete'
    end
    refute_text user_without_application.full_name
    assert_text 'successfully deleted'
  end

end
