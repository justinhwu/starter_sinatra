class StudentController < Sinatra::Base
  set :views, "app/views/student"
  set :method_override, true

  get '/students' do
    @students = Student.all
    erb :index
  end

  get '/students/new' do
    erb :new
  end

  get '/students/:id' do
    @student = Student.find(params[:id])
    erb :show
  end


  post '/students' do
    student = params["student"]
    @student = Student.find_or_create_by(first_name: student['first_name'],
                              last_name: student['last_name'],
                              year: student['year'],
                              address: student['address'],
                              email: student['email'],
                              phone_number: student['phone_number']
                              )
    course_ids = params['id']
    course_ids.each do |join|
      StudentCourse.create(student_id: @student[:id], course_id: join)
    end

    redirect "/students/#{@student.id}"
  end

  get '/students/:id/edit' do
    @student = Student.find(params[:id])
    erb :edit
  end

  patch '/students/:id' do

    student = params["student"]
    @student = Student.find(params[:id])
    @student.update(first_name: student['first_name'],
                    last_name: student['last_name'],
                    year: student['year'],
                    address: student['address'],
                    email: student['email'],
                    phone_number: student['phone_number']
                    )
    course_ids = params['course']['id']
    course_ids.each do |join|
      StudentCourse.find_or_create_by(student_id: @student[:id], course_id: join)
    end

    redirect "/students/#{@student.id}"
  end

  delete '/students/:id' do
    @student = Student.find(params[:id])
    @student.destroy

    redirect "/students"
  end

end
