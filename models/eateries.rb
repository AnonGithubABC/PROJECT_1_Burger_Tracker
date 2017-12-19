require_relative( '../db/sql_runner' )

class Eatery

  attr_reader :name, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO eateries (name)
    VALUES ($1)
    RETURNING id"
    values = [@name]
    eatery_data = SqlRunner.run(sql, values)
    @id = eatery_data[0]['id'].to_i
  end


  def delete()
    sql = "DELETE FROM eateries WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE eateries
    SET (name) = ($1)
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end
  #---------CLASS METHODS BELOW-------------#

  def self.all()
    sql = "SELECT * FROM eateries"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |eatery| Eatery.new( eatery ) }
  end

  def self.find( id )
    sql = "SELECT * FROM eateries
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Eatery.new(results[0])
  end

  def self.delete_all
    sql = "DELETE FROM eateries"
    values = []
    SqlRunner.run( sql, values )
  end

  def self.all_unique()
    sql = "SELECT DISTINCT ON (name) * FROM eateries;"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |eatery| Eatery.new( eatery ) }
  end

end
