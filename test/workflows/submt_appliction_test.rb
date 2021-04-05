require 'test_helper'

class SubmitApplicationTest < ActiveSupport::TestCase

  test 'it involves an application, experiences and awards' do
    application = applications(:second_unsubmitted)
    experiences = []
    awards = []
    SubmitApplication.new(application, experiences, awards)
  end

  test 'an invalid application fails' do
    application = Application.new(name: 'Incomplete and Invalid')
    workflow = SubmitApplication.new(application)
    refute workflow.run
  end

  test 'a valid application with no experiences or awards succeeds' do
    application = applications(:second_unsubmitted)
    experiences = []
    awards = []
    workflow = SubmitApplication.new(application, experiences, awards)
    assert(workflow.run)
  end

end
