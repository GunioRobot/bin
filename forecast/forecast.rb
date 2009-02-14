#!/usr/bin/env ruby
require 'rubygems'
require 'weather/service'

service = Weather::Service.new
service.imperial = true #Set false for metric

forecast = service.fetch_forecast("USME0249", 2)
puts "\sTemperature: %s" % forecast.current.temperature
puts "\sFeels Like: %s" % forecast.current.flik
puts "\sWindspeed: %s" % forecast.current.wind.speed + " Gust " + forecast.current.wind.gust
puts "\sDewpoint: %s" % forecast.current.dewp
puts "\sHumidity: %s" % forecast.current.hmid
puts "\sVisibility: %s" % forecast.current.vis
puts "\sOutlook: %s" % forecast.current.outlook
puts
puts "\sTomorrow:"
puts
puts "\sHigh: %s" % forecast.tomorrow.high
puts "\sLow: %s" % forecast.tomorrow.low
puts "\sOutlook: %s" % forecast.tomorrow.outlook
puts "\sChance of Precipitation: %s" % forecast.tomorrow.ppcp
