require_relative( '../db/sql_runner' )

class Day

  attr_reader :name, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO days (name)
    VALUES ($1)
    RETURNING id"
    values = [@name]
    day_data = SqlRunner.run(sql, values)
    @id = day_data[0]['id'].to_i
  end


  def delete()
    sql = "DELETE FROM days WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

    #---------CLASS METHODS BELOW-------------#

    def self.all()
      sql = "SELECT * FROM days"
      values = []
      results = SqlRunner.run( sql, values )
      return results.map { |day| Day.new( day ) }
    end

    def self.find( id )
      sql = "SELECT * FROM days
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Day.new(results[0])
    end

    def self.delete_all
      sql = "DELETE FROM days"
      values = []
      SqlRunner.run( sql, values )
    end



end
