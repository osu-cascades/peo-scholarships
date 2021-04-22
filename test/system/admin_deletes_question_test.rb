require 'application_system_test_case'

class AdminDeletesQuestionTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers
  include ActionView::RecordIdentifier

  test 'admin deleting a question that has answers shows an error message' do
    sign_in(users(:admin))
    visit admin_scholarship_path(scholarships(:first))
    click_link 'hide'
    question_with_answers = questions(:first)
    assert question_with_answers.answers.any?
    within "##{dom_id(question_with_answers)}" do
      click_on 'Delete'
    end
    assert_text question_with_answers.prompt
    assert_text 'cannot be deleted'
  end

  test 'admin deleting a question that has no answers succeeds' do
    sign_in(users(:admin))
    visit admin_scholarship_path(scholarships(:second))
    click_link 'hide'
    question_without_answers = questions(:third)
    assert question_without_answers.answers.none?
    within "##{dom_id(question_without_answers)}" do
      click_on 'Delete'
    end
    refute_text question_without_answers.prompt
    assert_text 'Question deleted'
  end

end
