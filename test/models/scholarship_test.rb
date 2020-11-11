require 'test_helper'

class ScholarshipTest < ActiveSupport::TestCase

  def new_scholarship
    Scholarship.new(title: 'Fake Scholarship')
  end

  test 'has a required title' do
    s = new_scholarship
    assert s.valid?
    s.title = ''
    refute s.valid?
  end

  test 'has a string representation that is its title' do
    assert_equal scholarships(:first).to_s, scholarships(:first).title
  end

  test 'retains the original title during a title change' do
    s = scholarships(:first)
    original_title = s.title
    s.title = 'CHANGED'
    assert_equal original_title, u.title_was
  end

end
