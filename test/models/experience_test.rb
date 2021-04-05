require 'test_helper'

class ExperienceTest < ActiveSupport::TestCase

  test 'attributes' do
    experience = Experience.new
    assert_respond_to(experience, :kind)
    assert_respond_to(experience, :title)
    assert_respond_to(experience, :started_at)
    assert_respond_to(experience, :ended_at)
    assert_respond_to(experience, :frequency)
    assert_respond_to(experience, :hours_per_week)
    assert_respond_to(experience, :total_hours)
    assert_respond_to(experience, :responsibilities_accomplishments_honors)
  end

  test 'belongs to an application' do
    assert_respond_to(Experience.new, :application)
  end

  test 'is not valid without a title' do
    experience = experiences(:one)
    assert experience.valid?
    experience.title = nil
    refute experience.valid?
    experience.title = ''
    refute experience.valid?
  end

  test 'is not valid without a started_at' do
    experience = experiences(:one)
    assert experience.valid?
    experience.started_at = nil
    refute experience.valid?
  end

  test 'is not valid without a frequency' do
    experience = experiences(:one)
    assert experience.valid?
    experience.frequency = nil
    refute experience.valid?
  end

  test 'is not valid without a numeric total_hours' do
    experience = experiences(:one)
    assert experience.valid?
    experience.total_hours = nil
    refute experience.valid?
    experience.total_hours = 'NOT NUMERIC'
    refute experience.valid?
  end

  test 'is not valid without responsibilities accomplishments or honors' do
    experience = experiences(:one)
    assert experience.valid?
    experience.responsibilities_accomplishments_honors = nil
    refute experience.valid?
    experience.responsibilities_accomplishments_honors = ''
    refute experience.valid?
  end

end
