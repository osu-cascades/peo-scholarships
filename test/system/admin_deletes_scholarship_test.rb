require 'application_system_test_case'

class AdminDeletesScholarship < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers
  include ActionView::RecordIdentifier

  test 'admin deletes a scholarship with no questions' do
    sign_in(users(:admin))
    visit admin_scholarships_path
    scholarship_to_delete = scholarships(:third)
    within "##{dom_id(scholarship_to_delete)}" do
      click_on 'Delete'
    end
    assert_text 'Scholarship deleted'
    refute_text scholarships(:third).name
  end

  test 'admin deletes a scholarship with questions that have no answers' do
    sign_in(users(:admin))
    visit admin_scholarships_path
    scholarship_to_delete = scholarships(:with_questions_but_no_applications)
    within "##{dom_id(scholarship_to_delete)}" do
      click_on 'Delete'
    end
    assert_text 'Scholarship deleted'
    refute_text scholarships(:with_questions_but_no_applications).name
  end

  test 'admin tries to delete a scholarship with questions that have answers' do
    sign_in(users(:admin))
    visit admin_scholarships_path
    scholarship_to_delete = scholarships(:first)
    within "##{dom_id(scholarship_to_delete)}" do
      click_on 'Delete'
    end
    assert_text 'Could not delete scholarship'
    assert_text scholarships(:first).name
  end

end
