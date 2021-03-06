require 'application_system_test_case'

class AdminViewsListOfScholarshipsTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers
  include ActionView::RecordIdentifier

  test 'admin views the list of scholarships' do
    sign_in users(:admin)
    visit admin_scholarships_path
    assert_text 'Scholarships'
    assert_text scholarships(:first).name
  end

  test 'admin sees indicator for published, open scholarship' do
    sign_in users(:admin)
    visit admin_scholarships_path
    published_scholarship = scholarships(:first)
    within "##{dom_id(published_scholarship)}" do
      assert_text 'Open'
    end
  end

  test 'admin sees indicator for unpublished scholarship' do
    sign_in users(:admin)
    visit admin_scholarships_path
    unpublished_scholarship = scholarships(:unpublished)
    within "##{dom_id(unpublished_scholarship)}" do
      assert_text 'Not visible'
    end
  end

  test 'admin sees indicator for closed scholarship' do
    sign_in users(:admin)
    visit admin_scholarships_path
    published_scholarship = scholarships(:past_deadline)
    within "##{dom_id(published_scholarship)}" do
      assert_text 'Closed'
    end
  end

  test 'admin does not see links to edit published scholarships from scholarship list' do
    sign_in users(:admin)
    visit admin_scholarship_path(scholarships(:unpublished))
    click_link 'publish'
    visit admin_scholarship_path(scholarships(:unpublished_past_deadline))
    click_link 'publish'
    visit admin_scholarships_path
    refute_link 'Edit'
    assert_text 'Can Not Edit'
  end

end
