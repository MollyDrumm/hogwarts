require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')

also_reload('./models/*')

# HOME
get '/' do
  @houses = House.all()
  erb( :home )
end

# INDEX
get '/students' do
  @students = Student.all()
  erb( :index )
end

# NEW
get '/students/new' do
  @students = Student.new( params )
  @houses = House.all()
  erb( :new )
end

# SHOW
get '/students/:id' do
  @student = Student.find( params['id'] )
  erb( :show )
end

# CREATE
post '/students' do
  puts params
  @student = Student.new(params)
  @student.save()
  erb( :create )
end

# EDIT
get '/students/:id/edit' do
  @student = Student.find(params['id'])
  @houses = House.all()
  erb( :edit )
end

# UPDATE
post '/students/:id' do
  p params
  student = Student.new( params )
  student.update()
  redirect to "students/" + params['id']
end

# DESTROY
post '/students/:id/delete' do
  @student = Student.find( params['id'] )
  @student.delete()
  redirect to "students"
end
