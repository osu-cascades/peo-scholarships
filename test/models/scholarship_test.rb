require 'test_helper'

class ScholarshipTest < ActiveSupport::TestCase

  def new_scholarship
    Scholarship.new(name: 'Fake Scholarship')
  end

  test 'has questions' do
    assert_respond_to(Scholarship.new, :questions)
  end

  test 'has applications' do
    assert_respond_to(Scholarship.new, :applications)
  end

  test 'has a required name' do
    s = new_scholarship
    assert s.valid?
    s.name = ''
    refute s.valid?
  end

  test 'has a string representation that is its name' do
    assert_equal scholarships(:first).to_s, scholarships(:first).name
  end

end
