require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  setup do
    @course1 = courses(:one) # assuming you have a course fixture named 'one'
    @course2 = courses(:two) # assuming you have a course fixture named 'two'
  end

  test 'should search courses by title' do
    assert_equal [@course1], Course.search(@course1.title)
    assert_equal [@course2], Course.search(@course2.title)
    assert_equal Course.all.to_a, Course.search(nil)
  end
end
