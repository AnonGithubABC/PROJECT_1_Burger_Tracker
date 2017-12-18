require_relative( '../db/sql_runner' )

class BurgerDeal

  attr_reader :id
  attr_accessor :deal_name, :day_id, :burger_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @deal_name = options['deal_name']
    @day_id = options['day_id'].to_i
    @burger_id = options['burger_id'].to_i
  end

  def save()
    sql = "INSERT INTO burger_deals (deal_name, day_id, burger_id)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@deal_name, @day_id, @burger_id]
    burger_deal_data = SqlRunner.run(sql, values)
    @id = burger_deal_data[0]['id'].to_i
  end


  def day()
    sql = "SELECT * FROM days
    WHERE id = $1"
    values = [@day_id]
    results = SqlRunner.run( sql, values )
    return Day.new( results.first )
  end

  def burger()
    sql = "SELECT * FROM burgers
    WHERE id = $1"
    values = [@burger_id]
    results = SqlRunner.run( sql, values )
    return Burger.new( results.first )
  end



  def delete()
    sql = "DELETE FROM burger_deals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  #---------CLASS METHODS BELOW-------------#

  def self.all()
    sql = "SELECT * FROM burger_deals"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |burger_deal| BurgerDeal.new( burger_deal ) }
  end

  def self.find( id )
    sql = "SELECT * FROM burger_deals
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return BurgerDeal.new(results[0])
  end

  def self.delete_all
    sql = "DELETE FROM burger_deals"
    values = []
    SqlRunner.run( sql, values )
  end

  def self.find_all_by_day(id)
    sql = "SELECT * FROM burger_deals WHERE day_id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return results.map { |burger_deal| BurgerDeal.new(burger_deal)}
  end


  def self.find_by_burgername(burgername_to_find)
    sql = "SELECT * FROM burgers WHERE name = $1"
    values = [burgername_to_find]
    results = SqlRunner.run( sql, values )
    return results.map { |burger_deal| BurgerDeal.new(burger_deal)}
  end

  def self.find_by_eateryname(eateryname_to_find)
    sql = "SELECT * FROM eateries where name = name"
    values = [eateryname_to_find]
    results = SqlRunner.run( sql, values )
    return results.map { |burger_deal| BurgerDeal.new(burger_deal)}
  end
end
