require 'application_system_test_case'

class AdminPublishesScholarshipTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'admin publishes an unpublished scholarship' do
    sign_in(users(:admin))
    visit admin_scholarship_path(scholarships(:unpublished))
    click_on 'publish'
    assert_text 'Scholarship published'
    assert_text 'is published and visible'
    refute_link 'publish'
  end

  test 'admin unpublishes a published scholarship' do
    sign_in(users(:admin))
    visit admin_scholarship_path(scholarships(:with_questions_but_no_applications))
    click_on 'hide'
    assert_text 'Scholarship unpublished'
    assert_text 'is not visible'
    refute_link 'hide'
  end

end
