#!/usr/bin/env ruby
require 'rubygems'
require 'weather/service'

service = Weather::Service.new

def mylocal(city)
  locations = service.find_location(city)
  puts "Matching Locations: " + locations.inspect
end

forecast = service.fetch_forecast("USME0249", 5)
puts "Location: %s" % forecast.location_name

puts "Current Temperature: %s" % forecast.current.temperature
puts "Current Windspeed: %s" % forecast.current.wind.speed

puts "Tomorrow's High: %s" % forecast.tomorrow.high
puts "Tomorrow's Outlook: %s" % forecast.tomorrow.outlook
puts "Tomorrow's Wind Direction: %s" % forecast.tomorrow.wind.direction
