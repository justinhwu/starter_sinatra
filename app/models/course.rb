class Course < ActiveRecord::Base
  has_many :student_courses, :dependent => :destroy
  has_many :students, through: :student_courses
  belongs_to :instructor
end
