require 'application_system_test_case'

class AdminDownloadsApplicationsExportTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'admin downloads applications as excel from scholarship screen' do
    sign_in(users(:admin))
    visit admin_scholarship_path(scholarships(:first))
    click_on 'Download as Excel'
    # Should not raise exception.
  end

  test 'admin downloads applications as excel from applications list' do
    sign_in(users(:admin))
    visit admin_scholarship_applications_path(scholarships(:first))
    click_on 'Download as Excel'
    # Should not raise exception.
  end

end
