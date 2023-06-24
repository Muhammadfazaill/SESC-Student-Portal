require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.create(email: 'test@example.com', password: 'password') 
    # The create method will also trigger the create_finance_account method.
    @profile = profiles(:one) # assuming you have a profile fixture named 'one'
    @course = courses(:one) # assuming you have a course fixture named 'one'
    @enrollment = Enrollment.create(user: @user, course: @course)
  end

  test 'should have one profile' do
    assert_equal @profile, @user.profile
  end

  test 'should have many enrollments' do
    assert_includes @user.enrollments, @enrollment
  end

  test 'should have many courses' do
    assert_includes @user.courses, @course
  end

  test 'should have a finance account after creation' do
    assert_not_nil @user.student_id
    assert @user.student_id.start_with?('c')
  end
end
