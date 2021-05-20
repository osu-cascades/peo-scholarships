require 'test_helper'

class ExternalScholarshipTest < ActiveSupport::TestCase

  test 'attributes' do
    ex_scholarship = ExternalScholarship.new
    assert_respond_to(ex_scholarship, :name)
    assert_respond_to(ex_scholarship, :amount)
  end

  test 'belongs to an application' do
    assert_respond_to(ExternalScholarship.new, :application)
  end

  test 'has a string representation' do
    ex_scholarship = external_scholarships(:one)
    assert_equal "#{ex_scholarship.name}", ex_scholarship.to_s
  end

  test 'is not valid without a name' do
    external_scholarship = external_scholarships(:one)
    assert external_scholarship.valid?
    external_scholarship.name = nil
    refute external_scholarship.valid?
    external_scholarship.name = ''
    refute external_scholarship.valid?
  end

  test 'is not valid without a numeric amount' do
    external_scholarship = external_scholarships(:one)
    assert external_scholarship.valid?
    external_scholarship.amount = nil
    refute external_scholarship.valid?
    external_scholarship.amount = 'NOT NUMERIC'
    refute external_scholarship.valid?
  end

end
