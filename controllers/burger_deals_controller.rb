require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/burgers.rb' )
require_relative( '../models/eateries.rb' )
require_relative( '../models/eateries.rb' )

get '/burger_deals' do
  @burger_deals = BurgerDeal.all()
  erb ( :"burger_deals/index" )
end

get '/days/:id' do
  @burger_deal = BurgerDeal.find(params['id'].to_i)
  erb( :"burger_deals/show" )
end
