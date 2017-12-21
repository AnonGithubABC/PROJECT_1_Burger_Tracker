require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/burgers.rb' )
require_relative( '../models/eateries.rb' )
require_relative( '../models/eateries.rb' )


#Deals by burger

get '/burger_deals/burgerdeals' do
  @burgers = Burger.all_unique()
  erb( :"burger_deals/burgerdeals" )
end
get '/burger_deals/deals_by_burger/:burger_name' do
  @name = params["burger_name"]
  @burger_deals = BurgerDeal.find_all_by_burger_name(@name)
  erb( :"burger_deals/list_deals" )
end

#Deals by Day

get '/burger_deals/daydeals' do
  @days = Day.all()
  erb( :"burger_deals/daydeals" )
end
get '/burger_deals/deals_by_day/:day_name' do
  @name = params["day_name"]
  @burger_deals = BurgerDeal.find_all_by_day_name(@name)
  erb( :"burger_deals/list_deals" )
end

#Deals by eatery

get '/burger_deals/eaterydeals' do
  @eateries = Eatery.all_unique()
  erb( :"burger_deals/eaterydeals" )
end

get '/burger_deals/deals_by_eatery/:eatery_name' do
  @name = params["eatery_name"]
  @burger_deals = BurgerDeal.find_all_by_eatery_name(@name)
  erb( :"burger_deals/list_deals" )
end


#---------------------- RESTFUL ROUTES --------------------------#

#INDEX
get '/burger_deals' do
  @burger_deals = BurgerDeal.all()
  erb ( :"burger_deals/index" )
end

#NEW
get '/burger_deals/new' do
  @days = Day.all
  @burgers = Burger.all
  erb(:"burger_deals/new")
end

# CREATE
post '/burger_deals/new' do
  @burger_deal = BurgerDeal.new(params)
  @burger_deal.save
  redirect to '/burger_deals'
end

# SHOW
get '/burger_deals/:id' do
  id = params[:id]
  @burger_deal = BurgerDeal.find(id)
  erb( :"burger_deals/show" )
end

# EDIT
get '/burger_deals/:id/edit' do
  id = params[:id]
  @burger_deal = BurgerDeal.find(id)
  @days = Day.all
  erb(:"burger_deals/edit")
end

# UPDATE
post '/burger_deals/:id' do
  id = params[:id]
  @burger_deal = BurgerDeal.new(params)
  @burger_deal.update()
  redirect '/burger_deals'
end

# DELETE
post '/burger_deals/:id/delete' do
  id = params[:id]
  @burger_deal = BurgerDeal.find(id)
  @burger_deal.delete()
  redirect to '/burger_deals'
end
