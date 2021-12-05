require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  test 'belongs to application' do
    assert_respond_to Note.new, :application
  end

  test 'belongs to author' do
    assert_respond_to Note.new, :author
  end

  test 'has a required body' do
    n = notes(:first)
    assert n.valid?
    n.body = ''
    refute n.valid?
  end

  test 'has a string representation that is its body' do
    assert_equal notes(:first).to_s, notes(:first).body
  end

end
