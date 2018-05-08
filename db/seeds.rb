require_relative( "../models/city.rb" )
require_relative( "../models/country.rb" )
require_relative( "../models/visit.rb" )
require("pry-byebug")

City.delete_all()
Country.delete_all()
Visit.delete_all()

country1 = Country.new({
  "name" => "Scotland"
  })
country1.save()


country2 = Country.new({
  "name" => "Italy"
  })
country2.save()

country3 = Country.new({
  "name" => "Spain"
  })
country3.save()


city1 = City.new({
  "name" => "Edinburgh",
  "country_id" => country1.id
  })
city1.save()

city2 = City.new({
  "name" => "Rome",
  "country_id" => country2.id
  })
city2.save()

city3 = City.new({
  "name" => "Malaga",
  "country_id" => country3.id
  })
city3.save()

visit1 = Visit.new({
  "city_name" => "Edinburgh",
  "country_name" => "Scotland",
  "start_date" => "05/08/2018",
  "end_date" => "05/01/2018",
  "review" => "I love Edinburgh, it is beautiful, but needs more sunshine!"
  })
visit1.save()

visit2 = Visit.new({
  "city_name" => "Rome",
  "country_name" => "Italy",
  "start_date" => "01/05/2018",
  "end_date" => "01/06/2018",
  "review" => "I love Rome, it is beautiful!"
  })
visit2.save()
