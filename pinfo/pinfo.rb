#!/usr/bin/env ruby
#== Synopsis
#
# pinfo: Lets you get information from paludis build logs, for use with conky.
#
# = Usage
#
# pinfo [OPTION]
#
# -h --help
#   show help
#
# -s --status
#   Current Status
#
# -p --package
#   Current Package
#
# -c --complete
#   Percentage Complete
#
# -l --lastsync
#   Last Sync
#
# -v --version
#   Display current version

BEGIN {$VERBOSE = true}
require 'getoptlong'
require 'rdoc/usage'

class PaludisInfo
  def initialize
    @LOG_FILE = "/var/log/paludis.log"
    @STATUS   = "finished sync of repository gentoo"
    @ACTIONS  = "clean|uninstall|fetch|install"
    @COMPLETE = "finished #{@ACTIONS} of package"
  end

  def complete
    complete ||= log_reader(@COMPLETE)
    outcome = complete.last.match("[0-9]{1,3} of [0-9]{1,3}").to_s
    outcome = outcome.gsub("of", "")
    outcome = outcome.split(" ")
    100.0*outcome[0].to_i/outcome[1].to_i
  end

  def package
    package ||= log_reader(@COMPLETE)
    outcome = package.last.split(" ")
    outcome[5]
  end

  def status
    status ||= log_reader(@COMPLETE)
    outcome = status.last.match("#{@ACTIONS}").to_s
    adjectivize(outcome)
  end

  def lastsync 
    sync_date ||= log_reader(@STATUS)
    lastline = sync_date.last.gsub("\n", "")
    unixtime = Time.at(lastline.to_i)
    unixtime.strftime("%a, %b %d @ %I:%M%P")
  end

  private

  def log_reader(pattern)
    data = %w[]
    if File.file?(@LOG_FILE) && File.readable?(@LOG_FILE)
      File.open(@LOG_FILE, "r") do |f|
        f.each_line do |line|
          line = line.grep( /#{pattern}/ ) do |line|
            data.push("#{line} ")
          end
        end
      end
    end

    return data
  end
  
  def adjectivize(action)
    case action
    when "install": "installed"
    when "clean": "cleaned"
    when "fetch": "fetched"
    when "uninstall": "uninstalled"
    else "Error will robinson, error!"
    end
  end

end

opts = GetoptLong.new(
      [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
      [ '--version', '-v', GetoptLong::NO_ARGUMENT ],
      [ '--status', '-s', GetoptLong::NO_ARGUMENT ],
      [ '--package', '-p', GetoptLong::NO_ARGUMENT ],
      [ '--complete', '-c', GetoptLong::NO_ARGUMENT ],
      [ '--lastsync', '-l', GetoptLong::NO_ARGUMENT]
)

if ARGV.empty?
  puts "You must pick a option. Try running #{__FILE__} --help"
  exit 1
end

pinfo = PaludisInfo.new
version = "0.1"
opts.each do |opt, arg|
  case opt
    when '--help'
      RDoc::usage
    when '--status'
      puts pinfo.status
    when '--package'
      puts pinfo.package
    when '--complete'
      puts pinfo.complete
    when '--lastsync'
      puts pinfo.lastsync
    when '--version'
      puts "#{version}"
  end
end

