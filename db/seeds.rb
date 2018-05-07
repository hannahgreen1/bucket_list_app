require_relative( "../models/city.rb" )
require_relative( "../models/country.rb" )
require_relative( "../models/visit.rb" )
require("pry-byebug")

city1 = City.new({
  "name" => "Edinburgh"
  })

city2 = City.new({
  "name" => "Rome"
  })

city3 = City.new({
  "name" => "Malaga"
  })


country1 = Country.new({
  "name" => "Scotland"
  })

country2 = Country.new({
  "name" => "Italy"
  })

country3 = Country.new({
  "name" => "Spain"
  })
