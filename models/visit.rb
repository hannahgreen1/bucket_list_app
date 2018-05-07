require_relative('../db/sql_runner.rb')

class Visit

  attr_accessor :city_name, :country_name, :id, :start_date, :end_date, :review

  def initialize(options)
    @id = options['id'].to_i
    @city_name = options['city_name']
    @country_name = options['country_name']
    @start_date = options['start_date'].to_i
    @end_date = options['end_date'].to_i
    @review = options['review']
  end

  def save()
    sql = "INSERT INTO visits
    (city_name,
      country_name,
      start_date,
      end_date, review)
    VALUES
      ($1, $2, $3, $4, $5)
    RETURNING id"
      values = [@city_name, @country_name, @start_date, @end_date, @review]
      visit_data = SqlRunner.run(sql, values)
      @id = visit_data.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM visits;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM visits
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM visits"
    visits = SqlRunner.run( sql )
    result = visits.map { |visit| Visit.new( visit ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM visits WHERE id = $1"
    values = [id]
    visit = SqlRunner.run( sql, values )
    p visit
    result = Visit.new( visit.first )
    return result
  end
end
