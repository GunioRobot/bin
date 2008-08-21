#!/usr/bin/env ruby
#== Synopsis
#
# imgmove: Moves images from one location to another based on exif data
#
# = Usage
#
# imgmove [OPTION] ... SRCDIR DSTDIR
# -h --help
#   show help
#
# -s --srcdir
#   Location of images
#
# -d --dstdir
#   Where to put images
#
# -v --version
#   Display current version

BEGIN {$VERBOSE = true}
require 'fileutils'
require 'exifr'
require 'getoptlong'
require 'rdoc/usage'

opts = GetoptLong.new(
      [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
      [ '--version', '-v', GetoptLong::NO_ARGUMENT ],
      [ '--dstdir', '-d', GetoptLong::REQUIRED_ARGUMENT ],
      [ '--srcdir', '-s', GetoptLong::REQUIRED_ARGUMENT ]

    )

version = "0.1"
dstdir = nil 
srcdir = nil
opts.each do |opt, arg|
  case opt
    when '--help'
      RDoc::usage
      exit 1
    when '--dstdir'
      dstdir = arg
    when '--srcdir'
      srcdir = arg
    when '--version'
      puts "#{version}"
      exit 1
  end
end

if ARGV.empty? 
  puts "Missing dir argument. Try --help"
  exit 0
end
=begin
  1. Loop through src directory build array of images
  2. for each file in array cp to dst/exifr_string
  #TODO option for mv rather than cp
=end
puts "#{dstdir}"
puts "#{srcdir}"
