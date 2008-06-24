#!/usr/bin/env ruby
require 'dbi'
require 'sha1'

def crypted_salt(login)
  return Digest::SHA1.hexdigest("--" + Time.now.to_s + "--" + login + "--")
end

def crypted_password(salt, password)
  return Digest::SHA1.hexdigest("--" + salt + "--" + password + "--")
end

def created_at
  return Time.now.strftime("%Y-%m-%d %H:%M:%S")
end

debug = false

puts "This is create a admin user!\n\n"
puts "Username:" 
  user = gets.chomp.to_s
puts "Password:" 
  password = gets.chomp.to_s
puts "Email:" 
  email = gets.chomp.to_s

salt = crypted_salt(user)
pass = crypted_password(salt, password)
time_of_creation = created_at

begin
  dbh = DBI.connect("DBI:Mysql:blog_development:gecko.lizardhost.co.uk", "dbuser", "dbpass")
  sql = "insert into users (login, email, crypted_password, salt, created_at, admin) values (?, ?, ?, ?, ?, ?)"
  
  dbh.prepare(sql) do |sth|
    sth.execute(user, email, salt, pass, created_at, 1)
  end
rescue DBI::DatabaseError => e
     puts "An error occurred"
     puts "Error code: #{e.err}"
     puts "Error message: #{e.errstr}"
ensure
     # disconnect from server
     dbh.disconnect if dbh
end

if debug
  values = ["Created At" => time_of_creation, "Crypted Password" => pass, "Salt" => salt, "Email" => email, "Login" => user].to_yaml
  puts "\n\n\nOutput:\n"
  puts values
end
