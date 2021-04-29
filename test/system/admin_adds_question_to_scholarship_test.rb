require 'application_system_test_case'

class AdminAddsQuestionToScholarshipTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'admin adds question to scholarship' do
    sign_in users(:admin)
    visit admin_scholarship_path(scholarships(:first))
    click_link 'hide'
    click_on 'Add New Question'
    fill_in 'Prompt', with: 'Fake New Question'
    fill_in 'Word Limit', with: '100'
    click_button 'Create Question'
    assert_text 'Question added'
    assert_text 'Fake New Question'
    assert_text '100'
  end
end
