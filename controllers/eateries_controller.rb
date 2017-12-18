require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/eateries.rb' )

get '/eateries' do
  @eateries = Eatery.all()
  erb ( :"eateries/index" )
end

get '/eateries/:id' do
  @eatery = Eatery.find(params['id'].to_i)
  erb( :"eateries/show" )
end
