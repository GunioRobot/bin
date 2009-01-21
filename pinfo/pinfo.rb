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
    status = log_reader(@COMPLETE)
    outcome = status.last.match("[0-9]{1,3} of [0-9]{1,3}").to_s
    outcome = outcome.gsub("of", "")
    outcome = outcome.split(" ")
    puts 100.0*outcome[0].to_i/outcome[1].to_i
  end

  def package
    status = log_reader(@COMPLETE)
    outcome = status.last.split(" ")
    puts outcome[5]
  end

  def status
    status = log_reader(@COMPLETE)
    outcome = status.last.match("#{@ACTIONS}").to_s
    puts adjectivize(outcome)
  end

  def lastsync 
    sync_date = log_reader(@STATUS)
    lastline = sync_date.last.gsub("\n", "")
    unixtime = Time.at(lastline.to_i)
    puts unixtime.strftime("%a, %b %d @ %I:%M%P")
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

pinfo = PaludisInfo.new
version = "0.1"
opts.each do |opt, arg|
  case opt
    when '--help'
      RDoc::usage
      exit 1
    when '--status'
      pinfo.status
    when '--package'
      pinfo.package
    when '--complete'
      pinfo.complete
    when '--lastsync'
      pinfo.lastsync
    when '--version'
      puts "#{version}"
      exit 1
  end
end
