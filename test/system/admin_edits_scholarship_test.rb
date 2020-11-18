require 'application_system_test_case'

class AdminEditsScholarship < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'admin edits an existing scholarship' do
    sign_in(users(:admin))
    visit admin_scholarships_path
    click_on 'Edit', match: :first
    fill_in 'Name', with: 'Edited Fake Scholarship'
    click_button 'Update Scholarship'
    assert_text 'Scholarship updated'
    assert_text 'Edited Fake Scholarship'
  end
end
