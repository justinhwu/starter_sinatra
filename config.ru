require_relative './config/environment'

run ApplicationController
use StudentController
use CourseController
use InstructorController
