require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/burger_deals_controller')
require_relative('controllers/burgers_controller')
require_relative('controllers/days_controller')
require_relative('controllers/eateries_controller')

get '/' do
  erb( :index )
end
