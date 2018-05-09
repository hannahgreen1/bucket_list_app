require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/visit.rb' )
require('pry')
get '/visit' do
  @visits = Visit.all()
  @cities = City.all()
  erb ( :"visit/index" )
end


get '/visit/new' do
  erb(:"visit/new")
end

get '/visit/:id' do
  @visit = Visit.find(params['id'].to_i)
  erb(:"visit/show")
end

post '/visit/new' do
  @visit = Visit.new(params)
  @visit.save()
  redirect to (:"/visit")
end

# EDIT
get '/visit/:id/edit' do
  @visit = Visit.find(params[:id])
  erb(:"/visit/edit")
end

# UPDATE existing orders
post '/visit/:id/update' do
  @visit = Visit.new(params)
  @visit.update
  erb(:"/visit/update")
end


# DELETE orders
post '/visit/:id/delete' do
  @visit = Visit.find(params[:id])
  @visit.delete
  redirect to ("/visit")
end
