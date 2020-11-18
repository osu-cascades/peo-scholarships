require 'application_system_test_case'

class AdminDeletesScholarship < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers
  include ActionView::RecordIdentifier

  test 'admin deletes a scholarship' do
    sign_in(users(:admin))
    visit admin_scholarships_path
    scholarship_to_delete = scholarships(:third)
    within "##{dom_id(scholarship_to_delete)}" do
      click_on 'Delete'
    end
    assert_text 'Scholarship deleted'
    refute_text scholarships(:third).name
  end
end
