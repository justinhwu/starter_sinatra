class CourseController < Sinatra::Base
  set :views, "app/views/course"
  set :method_override, true

  get '/courses' do
    @courses = Course.all
    erb :index
  end

  get '/courses/new' do
    erb :new
  end

  get '/courses/:id' do
    @course = Course.find(params[:id])
    erb :show
  end


  post '/courses' do
    course = params["course"]
    @course = Course.find_or_create_by(name: course['name'],
                              subject: course['subject'],
                              course_number: course['course_number'],
                              description: course['description'],
                              instructor_id: params['instructor']['id']
                              )
    redirect "/courses/#{@course.id}"
  end

  get '/courses/:id/edit' do
    @course = Course.find(params[:id])
    erb :edit
  end

  patch '/courses/:id' do
    course = params["course"]
    @course = Course.find(params[:id])
    @course.update(name: course['name'],
                   subject: course['subject'],
                   course_number: course['course_number'],
                   description: course['description'],
                   instructor_id: params['instructor']['id']
                   )
    redirect "/courses/#{@course.id}"
  end

  delete '/courses/:id' do
    @course = Course.find(params[:id])
    @course.destroy

    redirect "/courses"
  end

end
