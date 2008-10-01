#!/usr/bin/env ruby

string = %w[]
require 'open-uri'
open("http://www.ipchicken.com/") { |fm|
  string = fm.read
  @myip = string.scan(/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/).uniq.join("\n")
}

puts @myip
