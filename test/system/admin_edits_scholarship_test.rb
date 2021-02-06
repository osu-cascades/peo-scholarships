require 'application_system_test_case'

class AdminEditsScholarshipTest < ApplicationSystemTestCase

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

  test 'admin changes an existing scholarship deadline to a date in the past fails' do
    sign_in(users(:admin))
    visit edit_admin_scholarship_path(scholarships(:first))
    fill_in 'Application deadline', with: Date.yesterday.to_s
    click_button 'Update Scholarship'
    refute_text 'Scholarship updated'
    assert_text 'error'
    assert_text "can't be in the past"
  end

  test 'admin edits a scholarship with a deadline in the past succeeds' do
    sign_in(users(:admin))
    visit edit_admin_scholarship_path(scholarships(:past_deadline))
    fill_in 'Name', with: 'Edited Fake Scholarship'
    click_button 'Update Scholarship'
    assert_text 'Scholarship updated'
    assert_text 'Edited Fake Scholarship'
  end

end
