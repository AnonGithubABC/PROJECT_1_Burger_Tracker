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
  @burgers = Burger.all
  erb(:"burgers/new")
end

get '/burgers/:id' do
  @burger = Burger.find(params['id'].to_i)
  erb( :"burgers/show" )
end

post '/add_burgers' do
  @burger = Burger.new(params)
  @burger.save
  redirect to '/burgers'
end
