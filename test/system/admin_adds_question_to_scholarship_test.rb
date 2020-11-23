require 'application_system_test_case'

class AdminAddsQuestionToScholarship < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'admin adds question to scholarship' do
    sign_in(users(:admin))
    visit admin_scholarship_questions_path(scholarships(:first))
    click_on 'Add New Question'
    fill_in 'Prompt', with: 'Fake New Question'
    click_button 'Create Question'
    assert_text 'Question added'
    assert_text 'Fake New Question'
  end
end
