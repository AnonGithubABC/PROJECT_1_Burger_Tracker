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

get '/burger_deals/daydeals/:day_id' do
  @burger_deal = BurgerDeal.find_all_by_day()
  erb( :"burger_deals/show" )
end
get '/burger_deals/daydeals' do
  @days = Day.all()
  erb( :"burger_deals/daydeals" )
end

get '/burger_deals/burgerdeals/:burger_id' do
  @burger_deal = BurgerDeal.find_all_by_burger()
  erb( :"burger_deals/show" )
end
get '/burger_deals/burgerdeals' do
  @burgers = Burger.all_unique()
  erb( :"burger_deals/burgerdeals" )
end
get '/burger_deals/burgerdeals/:burger_name' do
  @burger_deals = BurgerDeal.find_by_burgername()
  erb( :"burger_deals/burgerdeals" )
end

get '/burger_deals/eaterydeals' do
  @eateries = Eatery.all()
  erb( :"burger_deals/eaterydeals" )
end
get '/burger_deals/eaterydeals/:eatery_id' do
  @eatery_deal = Eatery.find_all_by_eatery()
  erb( :"burger_deals/show" )
end



# get '/burger_deals/eatery/:id' do
#   @burger_deal = BurgerDeal.find_all(params['id'].to_i)
#   erb( :"burger_deals/show" )
# end
#
# get '/burger_deals/burger/:type' do
#   @burger_deal = BurgerDeal.find_all(params['id'].to_i)
#   erb( :"burger_deals/show" )
# end
