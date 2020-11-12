require 'test_helper'

class ScholarshipTest < ActiveSupport::TestCase

  def new_scholarship
    Scholarship.new(name: 'Fake Scholarship')
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

  test 'retains the original name during a name change' do
    s = scholarships(:first)
    original_name = s.name
    s.name = 'CHANGED'
    assert_equal original_name, u.name_was
  end

end
