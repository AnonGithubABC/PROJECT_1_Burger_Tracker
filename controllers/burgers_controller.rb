require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/burger_deals.rb' )
require_relative( '../models/days.rb' )
require_relative( '../models/burgers.rb' )


get '/burgers' do
  @burgers = Burger.all()
  erb ( :"burgers/index" )
end

get '/burgers/new' do
  @eateries = Eatery.all
  @burgers = Burger.all
  erb(:"burgers/new")
end

get '/burgers/:id' do
  id = params[:id]
  @burger = Burger.find(id)
  erb( :"burgers/show" )
end

get '/burgers/:id/edit' do
  id = params[:id]
  @burger = Burger.find(id)
  erb(:"burgers/edit")
end

post '/burgers/:id/edit' do
  id = params[:id]
  @burger = Burger.new(params)
  @burger.update()
  redirect '/burgers'
end


post '/burgers/new' do
  @burger = Burger.new(params)
  @burger.save
  redirect to '/burgers'
end

post'/burgers/:id/delete' do
  id = params[:id]
  @burger = Burger.find(id)
  @burger.delete()
  redirect to '/burgers'
end
