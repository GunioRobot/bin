#!/usr/bin/env ruby
# Distributed under the terms of the GNU General Public License v2
# Copyright (c) 2009 Greg Fitzgerald <netzdamon@gmail.com>
# vim: set sw=2 sts=2 et tw=80 :

# Load required gems
%w[rubygems fileutils configatron].each { |lib| require lib }
TIME = Time.now # Do not touch. 

#
# Edit these
# 
# database hostname, use ~/.my.cnf for mysql user/pass
# Example ~/.my.cnf
# [client]
# user=backups
# password=your_password_here
configatron.hostname = "gregf.org"
# Where we store the backups
configatron.backup = "/storage/mysql_backups"
# user/group that that owns configatron.backup
configatron.user = "gregf"
configatron.group = "gregf"
# File format database-0518.tar.bz2
configatron.file_format = "#{TIME.strftime("%H%M")}"
# Directory format /backups/05.07.09/
configatron.directory_format = "#{TIME.strftime("%m.%d.%Y")}"
# Take a wild guess
configatron.verbose = true
# you can list databases to backup here or make an empty array to backup
# everything.
configatron.databases = %w[] 
# mysqldump options
configatron.dump_options = "--compress --add-locks"
# Do we archive the databases and cleanup?
configatron.archive = true
# These don't have to be absolutes if you know they are in your running path.
# You can also set ENV["PATH"] some where above these lines.
configatron.mysql = "/usr/bin/mysql" 
configatron.mysqldump = "/usr/bin/mysqldump"
# Program for compression
configatron.compress = "/bin/tar"
configatron.compress_options = "-cjpf"
configatron.compress_extension = "tar.bz2"

#
# Don't touch
#
#TODO Chmod files/direcotries recursively
#TODO Cleanup old backups from script, subtract time

# Make sure directory exist if not create it
def check_directory(dir)
  unless File.directory?(dir)
    FileUtils.mkdir_p(dir, :verbose => configatron.verbose)
  end
end

# Chown backup directory after backups
def fix_permissions(location)
  say "Fixing Permissions:"
  FileUtils.chown_R(configatron.user, configatron.group, location, :verbose => configatron.verbose)
end

# If we can't change to the backups directory fail
def writeable(location)
  unless File.writable_real?(location)
    $stderr.puts "Don't have read/write permissions on #{location}"
    exit 1 
  end
end

# Grab list of all databases
def database_list
  databases = []
  list = %x[#{configatron.mysql} -h #{configatron.hostname} -Bse 'SHOW DATABASES']
  list.each do |db|
    databases.push(db.gsub("\n", ""))
  end
  return databases
end

# Grab list of tables for a specified database
def tables_list(db)
  tables = []
  list = %x[#{configatron.mysql} -h #{configatron.hostname} #{db} -Bse 'SHOW TABLES']
  list.each do |table|
    tables.push(table.gsub("\n", ""))
  end
  return tables
end

# Dump tables to databasename/tablename.sql
def dump_tables(db_list)
  say "Dumping Tables:"
  db_list.each do |db|
    check_directory("#{configatron.backup}/#{configatron.directory_format}/#{db}")
    tables = tables_list("#{db}")
    tables.each do |table|
      say("Now Dumping #{db}/#{table}.sql", true)
      %x[#{configatron.mysqldump} #{configatron.dump_options} -h #{configatron.hostname} #{db} #{table} > #{configatron.backup}/#{configatron.directory_format}/#{db}/#{table}.sql]
    end
  end
end

# Clean up database directories after we archive
def cleanup
  if Dir.chdir("#{configatron.backup}/#{configatron.directory_format}")
    say "Cleaning Directories:"
    list = Dir["*"]
    list.each do |dir|
      if File.directory?(dir)
        say("rm -rf #{dir}", true)
        FileUtils.remove_entry_secure(dir, force = false)   
      end
    end
  else
    $stderr.puts "Error changing directory to #{configatron.backup}/#{configatron.directory_format}"
    exit 1
  end
end

# Archive the databases
def archive_databases
  say "Archiving databases:"
  if Dir.chdir("#{configatron.backup}/#{configatron.directory_format}") 
    configatron.databases.each do |dir|
      archive = "#{dir}-#{configatron.file_format}.#{configatron.compress.extension}"
      say("#{configatron.compress} #{configatron.compress_options} #{archive}", true)
      %x[#{configatron.compress} #{configatron.compress_options} #{archive} #{dir}]
    end
  else
    $stderr.puts "Error changing direcotry to #{configatron.backup}/#{configatron.directory_format}"
    exit 1
  end
end

# Print a status update if verbose is true, can set tab = true if you want to
# tab input.
def say(msg, tab=false)
  if configatron.verbose
    if tab
      $stdout.puts "\t#{msg}"
    else
      $stdout.puts "#{msg}"
    end
  end
end

# Main loop
def main
  check_directory(configatron.backup)
  writeable(configatron.backup)
  if configatron.databases.empty?
    dump_tables(database_list)
  else
    dump_tables(configatron.databases)
  end
  if configatron.archive
    archive_databases
    cleanup
  end
  fix_permissions(configatron.backup)
end

main

