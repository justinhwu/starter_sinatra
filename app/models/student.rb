class Student < ActiveRecord::Base
  has_many :student_courses, :dependent => :destroy
  has_many :courses, through: :student_courses
end
