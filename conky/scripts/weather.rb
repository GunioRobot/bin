#!/usr/bin/env ruby
require "xmlsimple"
require "open-uri"

config = XmlSimple.xml_in(open('http://www.nws.noaa.gov/data/current_obs/KMLT.xml'), {'KeyAttr' => 'name'})

puts "Sky: #{config['weather']}
Temp: #{config['temp_f']}\xb0F
Dewpoint: #{config['dewpoint_f']}\xb0F
Humidity: #{config['relative_humidity']}%
Windchill: #{config['windchill_f']}\xb0F
Visibility: #{config['visibility_mi']} Miles
Wind: #{config['wind_string']}"

