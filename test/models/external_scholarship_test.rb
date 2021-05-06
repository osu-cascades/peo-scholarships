require 'test_helper'

class ExternalScholarshipTest < ActiveSupport::TestCase

  test 'attributes' do
    ex_scholarship = ExternalScholarship.new
    assert_respond_to(ex_scholarship, :name)
    assert_respond_to(ex_scholarship, :amount)
  end
end
