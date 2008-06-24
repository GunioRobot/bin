#!/usr/bin/env ruby

# Sets up your rails up in a git repository, installs haml, shoulda, make_resourceful
# USAGE: $0 some_app_name
#
# Original version found at:
# 
# See http://github.com/foca/utility_scripts/ for the latest version
# Released under a WTFP license (http://sam.zoy.org/wtfpl/)

module Helpers
  LINE = 80

  def announcing(msg)
    print msg
    yield
    print "." * (LINE - msg.size - 6)
    puts "\e[32m[DONE]\e[0m"
  end

  def silent(command)
    system "#{command} &> /dev/null"
  end

  def templates
    { :gitignore => %w[config/database.yml tmp/* log/*.log db/*.sqlite3 db/schema.rb public/stylesheets/*.css] * "\n",
      :routes    => ["ActionController::Routing::Routes.draw do |map|", "end"] * "\n" }
  end

  def git(message)
    silent "git add ."
    silent "git commit -m '#{message}'"
  end

  def piston(repo, dir)
    silent "piston import #{repo} #{dir}"
  end

  def rake(task, args={})
    args = args.map {|name,value| "#{name.to_s.upcase}=#{value}"}.join(" ")
    silent "rake #{task} #{args}"
  end
end

if __FILE__ == $0
  include Helpers

  app_name  = ARGV.first

  announcing "Creating application layout" do
    silent "/usr/bin/rails #{app_name}"
  end

  Dir.chdir(app_name) do
    announcing "Setting up rails app" do
      silent "rm README"
      silent "rm public/index.html"
      silent "rm log/*.log"
      silent "rm public/images/rails.png"
      silent "cp config/database.{,sample.}yml"
      silent "rm -r test"
      File.open("config/routes.rb", "w") {|f| f << templates[:routes] }
    end

    announcing "Creating databases" do
      rake "db:create"
      rake "db:create", :rails_env => "test"
    end

    announcing "Configuring git repo" do
      silent "git init"
      File.open(".gitignore", "w") {|f| f << templates[:gitignore] }
      silent "touch {tmp,log}/.gitignore"
      git "Basic rails app structure"
    end

    announcing "Installing GemsOnrails" do
      silent "gemsonrails"
      git "Froze GemsOnRails plugin"
    end

    announcing "Installing haml" do
      silent "haml --rails ."
    end

    announcing "Installing make_resourceful" do
      piston "git://github.com/jcfischer/make_resourceful.git", "vendor/plugins/make_resourceful"
    end

    announcing "Installing shoulda" do
      piston "git://github.com/thoughtbot/shoulda.git", "vendor/plugins/shoulda"
    end

    announcing "Installing seedfu" do
      piston "git://github.com/mbleigh/seed-fu.git", "vendor/plugins/seedfu"
    end
  end

end
