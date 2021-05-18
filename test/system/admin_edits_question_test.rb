require 'application_system_test_case'

class AdminEditsQuestionTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'admin edits question in scholarship' do
    sign_in users(:admin)
    visit admin_scholarship_path(scholarships(:with_questions_but_no_applications))
    click_link 'hide'
    within('#questions_table') do
      click_on 'Edit'
    end
    fill_in 'Prompt', with: 'Fake Edited Question'
    fill_in 'Word Limit', with: '200'
    click_button 'Update Question'
    assert_text 'Question updated.'
    assert_text 'Fake Edited Question'
    assert_text '200'
  end

  test 'admin can not remove prompt from question' do
    sign_in users(:admin)
    visit admin_scholarship_path(scholarships(:with_questions_but_no_applications))
    click_link 'hide'
    within('#questions_table') do
      click_on 'Edit'
    end
    fill_in 'Prompt', with: ''
    click_button 'Update Question'
    assert_text 'Prompt can\'t be blank'
  end

  test 'admin can not remove word limit from question' do
    sign_in users(:admin)
    visit admin_scholarship_path(scholarships(:with_questions_but_no_applications))
    click_link 'hide'
    within('#questions_table') do
      click_on 'Edit'
    end
    fill_in 'Word Limit', with: ''
    click_button 'Update Question'
    assert_text 'Word limit can\'t be blank'
  end

end
