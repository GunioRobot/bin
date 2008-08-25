#!/usr/bin/env ruby

require 'digest/sha1'
f = File.read("/home/gregf/.irbrc")
sha1 = Digest::SHA1.hexdigest(f)
puts sha1
