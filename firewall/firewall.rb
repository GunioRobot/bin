#!/usr/bin/ruby -w

#== Synopsis
#
# firewall: Sets hackers on fire and other cool shit.
#
# = Usage
#
# firewall [OPTION] ... (start|stop|restart)
#
# -h --help
#   show help
#
# -v --version
#   Display current version
#
# --start
#   Fire up the firewall
#
# --stop
#   Toss water on firewall
#
# --restart
#   Toss water with gasoline on firewall

require 'rubygems'
require 'configatron'
require 'getoptlong'
require 'rdoc/usage'

#
# Edit these
# 
C = configatron
C.iptables = "/sbin/iptables"
C.ports.open = %w[22 80]
C.interface.int = "eth0"
C.interface.ext = "eth1"
C.version = "0.1"

opts = GetoptLong.new(
      [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
      [ '--version', '-v', GetoptLong::NO_ARGUMENT ],
      [ '--start', GetoptLong::NO_ARGUMENT ],
      [ '--stop', GetoptLong::NO_ARGUMENT ]
    )

class Firewall
  def start
    puts "starting..."
    proc_settings
  end

  def stop
    puts "stop"
  end

  def restart
    puts "restart"
  end

  def proc_settings
    ipv4_settings = {
      '/proc/sys/net/ipv4/tcp_max_syn_backlog' => "4096",
      '/proc/sys/net/ipv4/tcp_syn_retries' => "4",
      '/proc/sys/net/ipv4/tcp_retries2' => "7",
      '/proc/sys/net/ipv4/ipfrag_time' => "60"
      #'/proc/sys/net/ipv4/netfilter/ip_conntrack_max' => "500000"
    }

    ipv4_settings.each do |path, value|
      system("echo #{value} > #{path}")
    end
  end
end

#
# Get a firewall
#
fw = Firewall.new

opts = GetoptLong.new(
      [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
      [ '--version', '-v', GetoptLong::NO_ARGUMENT ],
      [ '--start', GetoptLong::NO_ARGUMENT ],
      [ '--stop', GetoptLong::NO_ARGUMENT ],
      [ '--restart', GetoptLong::NO_ARGUMENT ]
    )

opts.each do |opt, arg|
  case opt
    when '--help'
      RDoc::usage
      exit 1
    when '--version'
      puts C.version 
      exit 1
    when '--start'
      fw.start
      exit 1
    when '--stop'
      fw.stop
      exit 1
    when '--restart'
      fw.restart
      exit 1
  end
end

if ARGV.empty?
  RDoc::usage
  exit 1
end

# vim: set sw=2 sts=2 et tw=80 :
