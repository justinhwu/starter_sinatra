class InstructorController < Sinatra::Base
  set :views, "app/views/instructor"
  set :method_override, true

  get '/instructors' do
    @instructors = Instructor.all
    erb :index
  end

  get '/instructors/new' do
    erb :new
  end

  get '/instructors/:id' do
    @instructor = Instructor.find(params[:id])
    erb :show
  end


  post '/instructors' do
    instructor = params["instructor"]
    @instructor = Instructor.find_or_create_by(first_name: instructor['first_name'],
                                               last_name: instructor['last_name'],
                                              )
    redirect "/instructors/#{@instructor.id}"
  end

  get '/instructors/:id/edit' do
    @instructor = Instructor.find(params[:id])
    erb :edit
  end

  patch '/instructors/:id' do
    instructor = params["instructor"]
    @instructor = Instructor.find(params[:id])
    @instructor.update(first_name: instructor['first_name'],
                       last_name: instructor['last_name'],
                       )
    redirect "/instructors/#{@instructor.id}"
  end

  delete '/instructors/:id' do
    @instructor = Instructor.find(params[:id])
    @instructor.destroy

    redirect "/instructors"
  end



end
