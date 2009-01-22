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
  # Set some common strings
  def initialize
    @LOG_FILE = "/var/log/paludis.log"
    @STATUS   = "finished sync of repository gentoo"
    @ACTIONS  = "clean|uninstall|fetch|install"
    @COMPLETE = "finished #{@ACTIONS} of package"
  end

  # pinfo.complete
  # prints the percentage complete out of all packages to be compiled.
  def complete
    complete ||= log_reader(@COMPLETE)
    outcome = complete.last.match("[0-9]{1,3} of [0-9]{1,3}").to_s
    outcome = outcome.gsub("of", "")
    outcome = outcome.split(" ")
    outcome = 100.0*outcome[0].to_i/outcome[1].to_i
  end

  # pinfo.package
  # Prints the current working package.
  def package
    package ||= log_reader(@COMPLETE)
    outcome = package.last.split(" ")
    outcome[5]
  end

  # pinfo.status
  # Prints the current action for a package, installed, cleaned, fetched,
  # uninstalled
  def status
    status ||= log_reader(@COMPLETE)
    outcome = status.last.match("#{@ACTIONS}").to_s
    adjectivize(outcome)
  end

  # pinfo.lastsync
  # Prints the date and time of the last portage sync.
  def lastsync 
    sync_date ||= log_reader(@STATUS)
    lastline = sync_date.last.gsub("\n", "")
    unixtime = Time.at(lastline.to_i)
    unixtime.strftime("%a, %b %d @ %I:%M%P")
  end

  # pinfo.gethelp
  # Displays the output of the --help option.
  def gethelp
    system("#{__FILE__} --help")
  end

  private
  
  # private log_reader
  # Opens the logfile specified above, allowing it to grep for patterns used to
  # pull out each methods requested information.
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
  
  # private adjectivize
  # Besides the cool or terrible name it just aliases some actions to there
  # adjective form.
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

# Options for pinfo
opts = GetoptLong.new(
      [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
      [ '--version', '-v', GetoptLong::NO_ARGUMENT ],
      [ '--status', '-s', GetoptLong::NO_ARGUMENT ],
      [ '--package', '-p', GetoptLong::NO_ARGUMENT ],
      [ '--complete', '-c', GetoptLong::NO_ARGUMENT ],
      [ '--lastsync', '-l', GetoptLong::NO_ARGUMENT]
)

# Initialize PaludsInfo class
pinfo ||= PaludisInfo.new

version ||= "pinfo version: 0.2"

# If no options were passed print the help.
if ARGV.empty?
  pinfo.gethelp
end

# Call pinfo action for whatever was chosen.
# If we hit a problem try running --help instead.
begin
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
      else
        pinfo.gethelp
    end
  end
rescue GetoptLong::InvalidOption
  pinfo.gethelp
end


