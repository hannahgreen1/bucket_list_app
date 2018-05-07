require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/country.rb' )

get '/country' do
  @countries = Country.all()
  erb ( :"country/index" )
end

get '/country/:id' do
  @country = Country.find(params['id'].to_i)
  erb(:"country/show")
end
