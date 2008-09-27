#!/usr/bin/ruby -w
require 'find'
dir = "/home/gregf/.xchat2/scrollback/"
Dir.chdir(dir)
files = Dir['**/*']
string = ''
for f in files
  Find.find(f) do |path|
    if FileTest.directory?(path)
      Find.prune
    end
    fullpath = File.expand_path("#{path}")
    File.open("#{fullpath}", "r") { |fm|
      string = fm.read
      #@result = string.scan(/(http:\/\/\w+:\w+@members\.videosz\.com)/i).uniq.join("\n")
      @result = string.scan(/(http:\/\/\w+:\w+@#{ARGV})/i).uniq.join("\n")
      if @result.empty?
        next
      else
        puts "#{fullpath} : \n" +  @result
      end
    }
  end
end
