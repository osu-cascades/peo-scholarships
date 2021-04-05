require 'test_helper'

class SubmitApplicationTest < ActiveSupport::TestCase

  test 'it involves an application, experiences and awards' do
    application = applications(:second_unsubmitted)
    experiences = []
    awards = []
    SubmitApplication.new(application, experiences, awards)
  end
end
