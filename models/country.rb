require_relative('../db/sql_runner.rb')

class Country

attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO countries
    (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]
    country_data = SqlRunner.run(sql, values)
    @id = country_data.first()['id'].to_i
  end

end
