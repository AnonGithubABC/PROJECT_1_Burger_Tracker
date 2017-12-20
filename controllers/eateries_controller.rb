require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/eateries.rb' )

get '/eateries/?' do
  @eateries = Eatery.all()
  erb ( :"eateries/index" )
end

get '/eateries/new' do
  @eateries = Eatery.all
  erb(:"eateries/new")
end

get '/eateries/:id/edit' do
  id = params[:id]
  @eatery = Eatery.find(id)
  erb(:"eateries/edit")
end

# post '/eateries/:id/edit' do
#   id = params[:id]
#   @eatery = Eatery.new(params)
#   @eatery.update()
#   redirect '/eateries'
# end

get '/eateries/:id' do
  id = params[:id]
  @eatery = Eatery.find(id)
  erb( :"eateries/show" )
end

post '/eateries/new' do
  @eatery = Eatery.new(params)
  @eatery.save
  redirect to '/eateries'
end


post '/eateries/:id' do
  id = params[:id]
  @eatery = Eatery.new(params)
  @eatery.update()
  redirect '/eateries'
end

post'/eateries/:id/delete' do
  id = params[:id]
  @eatery = Eatery.find(id)
  @eatery.delete()
  redirect to '/eateries'
end
