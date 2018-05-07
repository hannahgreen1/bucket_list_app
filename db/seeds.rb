require_relative( "../models/city.rb" )
require_relative( "../models/country.rb" )
require_relative( "../models/visit.rb" )
require("pry-byebug")


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
  "country_id" => country1.id,
  "city_id" => city1.id
  })
visit1.save()

visit2 = Visit.new({
  "country_id" => country2.id,
  "city_id" => city2.id
  })
visit2.save()
