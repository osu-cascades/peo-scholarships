require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase

  test 'belongs to an applicant' do
    assert_respond_to(Application.new, :applicant)
  end

  test 'belongs to a scholarship' do
    assert_respond_to(Application.new, :scholarship)
  end

end
