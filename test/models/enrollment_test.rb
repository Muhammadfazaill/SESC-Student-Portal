require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  setup do
    @user = users(:one) # assuming you have a user fixture named 'one'
    @course = courses(:one) # assuming you have a course fixture named 'one'
    @enrollment = Enrollment.create(user: @user, course: @course)
  end

  test 'should belong to user' do
    assert_equal @user, @enrollment.user
  end

  test 'should belong to course' do
    assert_equal @course, @enrollment.course
  end
end
