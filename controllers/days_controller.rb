require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/days.rb' )

get '/days' do
  @days = Day.all()
  erb ( :"days/index" )
end

get '/days/:id' do
  @day = Day.find(params['id'].to_i)
  erb( :"days/show" )
end
