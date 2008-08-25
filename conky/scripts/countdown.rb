#!/usr/bin/ruby

# by Brian Carper
# http://briancarper.net
#
# Doesn't get much simpler than this.

require 'date'

puts (Date.civil(2006,12,22) - Date.today).to_s + " days left"
