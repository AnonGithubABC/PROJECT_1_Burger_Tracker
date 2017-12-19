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

get '/burgers/:id/day' do
  id = params[:id]
  @burger = Burger.find(id)
  @days = @burger.days
  erb( :"burgers/days" )
end

get '/burgers/:id/eatery' do
  id = params[:id]
  @burger = Burger.find(id)
  @eateries = @burger.eatery
  erb( :"burgers/eatery" )
end

get '/burgers/:id' do
  id = params[:id]
  @burger = Burger.find(id)
  erb( :"burgers/show" )
end

  # get '/burgers/:name' do
  #   @burger = Burger.find(params['id'].to_i)
  #   erb( :"burgers/show" )
  # end

post '/add_burgers' do
  @burger = Burger.new(params)
  @burger.save
  redirect to '/burgers'
end
