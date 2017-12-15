require_relative( '../db/sql_runner' )

class Burger

  attr_reader :name, :id
  attr_accessor :price, :deal_day

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @price = options['price'].to_i
    @eatery_id = options['eatery_id'].to_i
  end




end
