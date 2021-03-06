require_relative('../db/sql_runner.rb')

class City

  attr_accessor :id, :name, :country_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @country_id = options['country_id'].to_i
  end

  def save()
    sql = "INSERT INTO cities
    (name,
    country_id)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@name, @country_id]
    city_data = SqlRunner.run(sql, values)
    @id = city_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE cities
    SET
    (
      name,
      country_id
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@name, @country_id, @id]
      SqlRunner.run( sql, values )
    end

  def self.delete_all()
    sql = "DELETE FROM cities;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM cities
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM cities"
    cities = SqlRunner.run( sql )
    result = cities.map { |city| City.new( city ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM cities WHERE id = $1"
    values = [id]
    city = SqlRunner.run( sql, values )
    result = City.new( city.first )
    return result
  end

  def get_country_name_by_id
     sql = "SELECT * FROM countries WHERE id = $1"
     values = [@country_id]
     result = SqlRunner.run(sql, values).first['name']
     return result
   end

 end
