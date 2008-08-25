#!/usr/bin/env ruby
require 'rubygems'
require 'weather/service'

service = Weather::Service.new
service.imperial = true 

def mylocal(city)
  locations = service.find_location(city)
  puts "Matching Locations: " + locations.inspect
end

forecast = service.fetch_forecast("USME0249", 2)
puts "Location: %s" % forecast.location_name
puts
puts "Temperature: %s" % forecast.current.temperature
puts "Feels Like: %s" % forecast.current.flik
puts "Windspeed: %s" % forecast.current.wind.speed + " Gust " + forecast.current.wind.gust
puts "Dewpoint: %s" % forecast.current.dewp
puts "Humidity: %s" % forecast.current.hmid
puts "Visibility: %s" % forecast.current.vis
puts 
puts "Tommorow:"
puts
puts "High: %s" % forecast.tomorrow.high
puts "Low: %s" % forecast.tomorrow.low
puts "Outlook: %s" % forecast.tomorrow.outlook
puts "Chance of Precipitation: %s" % forecast.tomorrow.ppcp
puts "Sunrise: %s" % forecast.tomorrow.sunrise
puts "Sunset: %s" % forecast.tomorrow.sunset
puts ""
