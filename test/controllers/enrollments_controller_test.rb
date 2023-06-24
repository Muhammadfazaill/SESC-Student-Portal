require 'test_helper'

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one) # assuming you have a users fixture and 'one' is a user in that
    @course = courses(:one) # assuming you have a courses fixture and 'one' is a course in that
    sign_in @user
  end

  test 'should get index' do
    get enrollments_url
    assert_response :success
    assert_equal @user.enrollments.all, assigns(:enrollment)
  end

  test 'should create enrollment' do
    assert_difference('@user.courses.count', 1) do
      post enrollments_url, params: { id: @course.id }
    end
    assert_redirected_to course_path(@course)
    assert_equal 'Enrollment successful.', flash[:notice]
  end

  test 'should destroy enrollment' do
    @user.courses << @course
    assert_difference('@user.courses.count', -1) do
      delete enrollment_url(@course)
    end
    assert_redirected_to course_path(@course)
    assert_equal 'Enrollment removed.', flash[:notice]
  end
end
