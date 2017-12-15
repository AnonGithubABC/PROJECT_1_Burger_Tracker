require_relative( '../db/sql_runner' )

class BurgerDeals

  attr_reader :id
  attr_accessor :deal_name, :price, :deal_day

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @deal_name = options['deal_name']
    @savings = options['price'].to_i
    @deal_day = options['deal_day']
    @eatery_id = options['eatery_id'].to_i
    @burger_id = options['eatery_id'].to_i
  end




end
