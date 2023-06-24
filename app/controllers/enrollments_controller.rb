class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @enrollment   = current_user.enrollments.all
  end 

  def create
    course = Course.find(params[:id])
    course.update(reference_no: SecureRandom.hex(4))
    current_user.courses << course
   
   FinanceService.new.create_invoice(student_id: current_user.student_id, course_code: course.reference_no, price: course.price)
     
    redirect_to course, notice: 'Enrollment successful.'
  end

  def destroy
    course = Course.find(params[:id])
    current_user.courses.delete(course)

    redirect_to course, notice: 'Enrollment removed.'
  end
end
