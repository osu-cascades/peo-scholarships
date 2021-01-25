require 'application_system_test_case'

class AdminViewsListOfScholarshipsTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers
  include ActionView::RecordIdentifier

  test 'admin creates a scholarship' do
    sign_in(users(:admin))
    visit admin_scholarships_path
    assert_text 'Scholarships'
    assert_text scholarships(:first).name
  end

  test 'admin sees indicator for published scholarship' do
    sign_in(users(:admin))
    visit admin_scholarships_path
    published_scholarship = scholarships(:first)
    within "##{dom_id(published_scholarship)}" do
      assert_text 'Published'
    end
  end

  test 'admin sees indicator for unpublished scholarship' do
    sign_in(users(:admin))
    visit admin_scholarships_path
    unpublished_scholarship = scholarships(:unpublished)
    within "##{dom_id(unpublished_scholarship)}" do
      assert_text 'Not visible'
    end
  end

end
