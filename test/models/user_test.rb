require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def new_user
    User.new(email: 'new_fake_user@example.com',
      password: 'password', password_confirmation: 'password',
      first_name: 'New Fake', last_name: 'User')
  end

  test 'has many applications' do
    assert_respond_to(User.new, :applications)
  end

  test 'has a required first name' do
    u = new_user
    assert u.valid?
    u.first_name = ''
    refute u.valid?
  end

  test 'has a required last name' do
    u = new_user
    assert u.valid?
    u.last_name = ''
    refute u.valid?
  end

  test 'has a default role of applicant' do
    new_user = User.new
    assert_equal new_user.role, 'applicant'
  end

  test 'pre-existing User without defined role has a default role of applicant' do
    assert_equal users(:unknown).role, 'applicant'
  end

  test 'is active by default' do
    assert new_user.active?
  end

  test 'active user is active_for_authentication' do
    u = new_user
    u.active = true
    assert u.active_for_authentication?
  end

  test 'inactive user is not active_for_authentication' do
    u = new_user
    u.active = false
    refute u.active_for_authentication?
  end

  test 'responds to status with active or inactive' do
    u = new_user
    u.active = false
    assert_equal 'inactive', u.status
    u.active = true
    assert_equal 'active', u.status
  end

  test 'has a string representation of first_name last_name' do
    assert_equal users(:admin).to_s, 'Fake Admin'
  end

  test 'has a full name consisting of first_name last_name' do
    assert_equal users(:admin).full_name, 'Fake Admin'
  end

  test 'has a string representation of last_name, first_name' do
    assert_equal users(:admin).last_name_first_name, 'Admin, Fake'
  end

  test 'retains the original full name during a first or last name change' do
    u = users(:admin)
    original_full_name = "#{u.first_name} #{u.last_name}"
    u.first_name = "CHANGED"
    assert_equal original_full_name, u.name_was
  end

  test '#application_for' do
    user = users(:applicant)
    scholarship = scholarships(:first)
    assert_equal applications(:first), user.application_for(scholarship)
  end

  test 'cannot be deleted if it has applications' do
    user_with_application = applications(:first).applicant
    assert_raises ActiveRecord::InvalidForeignKey do
      user_with_application.destroy
    end
  end

  test '#deletable?' do
    user = User.new
    assert user.deletable?
    user.applications << Application.new
    refute user.deletable?
  end

end
