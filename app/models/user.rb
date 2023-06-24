class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_one :profile
         accepts_nested_attributes_for :profile
         has_many :enrollments
         has_many :courses, through: :enrollments


   after_create :create_finance_account
  

  private
   
   def create_finance_account
    student_id = 'c' + DateTime.now.strftime('%H%M%S')
    FinanceService.new.create_library_account(student_id)
    response = FinanceService.new.create_account( student_id, name)
    self.update(:student_id => student_id)
   end
end
