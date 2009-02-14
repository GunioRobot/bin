#!/usr/bin/env ruby
# Simple script goes through http://www.warlab.com/clips/, grabs all the mp3's
# and attempts to give it slightly better tags (very slightly).

%w{rubygems hpricot open-uri mechanize mp3info fileutils}.each { |lib| require lib } 

@storage = "/home/gregf/music" # Path to store the files in, NO leading /
@verbose = true # Print status
@overwrite = false  # Overwrite existing files?
@tag = true # Mp3's have no tags, attempt to tag best we can?

def say(*args)
  if @verbose
    puts %Q{ #{args} }
  end
end

def savefile(agent, url, loc)
  say "Saving #{url} => #{loc}/#{File.basename url}"
  agent.get(url).save_as("#{loc}/#{File.basename url}")
end

agent = WWW::Mechanize.new
main_url="http://www.warlab.com"
doc = open("http://www.warlab.com/clips/") { |f| Hpricot(f) }
data = []
doc.search("//a[@class='module-title']:not([@target='music'])").each do |url|
  url = url.to_s.match("(/.*\.mp3)")[0]
  data.push(url)
end

say "Starting to leach mp3's"
data.each do |url|
  url = "#{main_url}#{url}"
  unless File.directory?("#{@storage}")
    FileUtils.mkdir_p("#{@storage}")
  end
  
  if @overwrite
    savefile(agent, url, @storage)
  else
    next if File.exists?("#{@storage}/#{File.basename url}")
    savefile(agent, url, @storage)
  end
end

if @tag
  say "Starting tagging process"

  Dir.chdir(@storage)
  filelist = Dir.entries(@storage)
  filelist.each do |file|
    unless File.extname("#{file}") =~ /\.mp3$/i
      next
    end
    nfile = file.split("-")
    if nfile[0].nil?
      nfile[0] = "DZK"
    end
    artist = nfile[0].gsub("_", " ").strip
    unless nfile[1].nil?
      title = nfile[1].gsub("_", " ").gsub(".mp3", "").strip
    end
    track = filelist.index("#{file}")
    say "artist: #{artist}"
    say "title: #{title}"
    say "track: #{track}"
    say "genre: Rap"
    say "\n"
    Mp3Info.open("#{file}") do |mp3|
      mp3.tag.artist = "#{artist}"
      mp3.tag.title = "#{title}"
      mp3.tag.tracknum = track
      mp3.tag.genre_s = "Rap"
    end
  end
end
