#!/usr/bin/env ruby
#== Synopsis
#
# imgmove: Moves images from one location to another based on exif data
#
# = Usage
#
# imgmove [OPTION] ... SRCDIR DSTDIR
#
# -h --help
#   show help
#
# -s --srcdir
#   Location of images
#
# -d --dstdir
#   Where to put images
#
# -m --move
#   Move images instead of copy
#
# --verbose
#   Be verbose verbose during copy or move
#
# -v --version
#   Display current version

#BEGIN {$VERBOSE = true}

# Load required gems
%w[rubygems fileutils time exifr getoptlong rdoc/usage find].each { |lib| require lib }

# class: ImageMover
class ImageMover
  
  def initialize(srcdir, dstdir, move, verbose)
    @IMG_EXTENSIONS = [".jpg", ".jpeg", ".tiff"]
    @srcdir = srcdir
    @dstdir = dstdir
    @move = move
    @verbose = verbose
  end

  # find
  # Takes a srcdir and finds all images recursively. Stuffs them into the
  # @images array.
  # Note: Only formats supported by exifr are jpeg and tiff.
  def find
    @images = %w[]
    Find.find(@srcdir) do |path|
      next if File.directory?(path) or path == "."  or path == ".."
      @IMG_EXTENSIONS.each do |ext|
        next if File.extname(path) != "#{ext}"
        @images.push("#{path}")
      end
    end
    return @images
  end

  # copy_or_move
  # Takes a hash fullpath/filename => date creates a dir based of strftime then
  # copies or moves the files from srcdir to dstdir. 
  #
  # It will copy by default unless you pass --move to it. Also takes --verbose
  # to print out the srcdir and dstdir as it works.
  def copy_or_move
    get_exif.each do |file, date|

      date = Time.parse("#{date}")
      
      month = date.strftime("%b")
      day = date.strftime("%a")
      year = date.strftime("%Y")
      hour = date.strftime("%H")
      minute = date.strftime("%M")
      second = date.strftime("%S")

      dir = "#{year}/#{month}"
      extension = File.extname(file)
      img = "img_#{hour}#{minute}#{second}#{extension}"

      unless File.file?("#{file}") && File.readable?("#{file}")
        puts "Error: #{file} is not a regular file or we don't have permissions"
        exit
      end
      
      unless File.directory?("#{@dstdir}/#{dir}")
        FileUtils.mkdir_p("#{@dstdir}/#{dir}", :mode => 0755)
      end

      if @move
          FileUtils.mv("#{file}", "#{@dstdir}/#{dir}/#{img}", :verbose => @verbose)
      else
          FileUtils.cp("#{file}", "#{@dstdir}/#{dir}/#{img}", :verbose => @verbose)
      end
    end
  end

  # get_exif
  # Uses exifr to get the data an image was taking.
  #
  # grabs an array from find(imgdata) and builds an array @exifdata based off
  # the exif data returned from the files.
  #
  # It then mashes the two arrays into a hash @exifdata
  def get_exif
    imgdata = find
    @exif = %w[]
    imgdata.each do |file|
      if File.extname("#{file}") == ".jpg" or File.extname("#{file}") == ".jpeg"
        @exif.push("#{EXIFR::JPEG.new("#{file}").date_time}")
      elsif File.extname("#{file}") == ".tiff"
        @exif.push("#{EXIFR::TIFF.new("#{file}").date_time}")
      else
        puts "EXIFR gem only supports jpeg and tiff images at this time."
        exit
      end
    end
    return @exifdata = Hash[*imgdata.zip(@exif).flatten]
  end

end

opts = GetoptLong.new(
      [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
      [ '--version', '-v', GetoptLong::NO_ARGUMENT ],
      [ '--move', '-m', GetoptLong::NO_ARGUMENT],
      [ '--verbose', GetoptLong::NO_ARGUMENT],
      [ '--dstdir', '-d', GetoptLong::REQUIRED_ARGUMENT ],
      [ '--srcdir', '-s', GetoptLong::REQUIRED_ARGUMENT ]

    )

# if the user forgets to pass -s and -d show him the help
if ARGV.empty?
  RDoc::usage
  exit 1
end

# Set a few default values
version = "0.1"
srcdir = nil
dstdir = nil
move = false
verbose = false
begin
  opts.each do |opt, arg|
    case opt
      when '--help'
        RDoc::usage
        exit 1
      when '--dstdir'
        dstdir = arg
      when '--srcdir'
        srcdir = arg
      when '--move'
        move = true
      when '--verbose'
        verbose = true
      when '--version'
        puts "#{version}"
      else
        gethelp
    end
  end
rescue 
  RDoc::usage
  exit 1
end

# Initiate the ImageMover class and pass some options into it from command line.
image = ImageMover.new(srcdir, dstdir, move, verbose)

# Call copy_or_move on the srcdir and dstdir
image.copy_or_move
