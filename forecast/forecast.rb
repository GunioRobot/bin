#!/usr/bin/env ruby
require 'rubygems'
require 'weather/service'

service = Weather::Service.new
service.imperial = true 

def mylocal(city)
  locations = service.find_location(city)
  puts "Matching Locations: " + locations.inspect
end

forecast = service.fetch_forecast("USME0249", 5)
puts "Location: %s" % forecast.location_name
puts
puts "Temperature: %s" % forecast.current.temperature
puts "Feels Like: %s" % forecast.current.flik
puts "Windspeed: %s" % forecast.current.wind.speed + " Gust " + forecast.current.wind.gust
puts "Dewpoint: %s" % forecast.current.dewp
puts "Humidity: %s" % forecast.current.hmid
puts "Visibility: %s" % forecast.current.vis
puts 
puts "Tomorrow's High: %s" % forecast.tomorrow.high
puts "Tomorrow's Low: %s" % forecast.tomorrow.low
puts "Tomorrow's Outlook: %s" % forecast.tomorrow.outlook
puts "Tomorrow's PPCP: %s" % forecast.tomorrow.ppcp
puts "Tommorow's Sunrise: %s" % forecast.tomorrow.sunr
puts "Tommorow's Sunset: %s" % forecast.tomorrow.suns
