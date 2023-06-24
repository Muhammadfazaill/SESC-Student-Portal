class Course < ApplicationRecord
  has_many :enrollments
  has_many :users, through: :enrollments
  

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end

  
end
