require_relative( '../db/sql_runner' )

class Burger

  attr_reader :name, :id, :eatery_id
  attr_accessor :price

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @price = options['price'].to_i
    @eatery_id = options['eatery_id'].to_i
  end

  def save()
    sql = "INSERT INTO burgers (name, price, eatery_id)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@name, @price, @eatery_id]
    burger_data = SqlRunner.run(sql, values)
    @id = burger_data[0]['id'].to_i
  end


  def eatery()
    eatery = Eatery.new(@eatery_id)
    return eatery
  end

  def delete()
  sql = "DELETE FROM burgers WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end


  #---------CLASS METHODS BELOW-------------#

  def self.all()
    sql = "SELECT * FROM burgers"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |burger| Burger.new( burger ) }
  end

  def self.find( id )
    sql = "SELECT * FROM burgers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Burger.new(results[0])
  end

  def self.delete_all
    sql = "DELETE FROM burgers"
    values = []
    SqlRunner.run( sql, values )
  end




end
