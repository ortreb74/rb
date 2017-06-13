#!/usr/bin/env ruby

EFL_VERSION = "0.00.01"
############################################ options
require 'ostruct'
require 'optparse'

class OptionParse  
  # Return a structure describing the options.
  #
  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new    
    options.verbose = false

    opts = OptionParser.new do |opts|
      opts.banner = "Usage: toBeWritten.rb"
	  opts.separator "toBeWritten"
 
      opts.separator ""
      opts.separator "Options communes :"

      opts.on_tail("-h", "--help", "Affiche ce message") do
        puts opts
        exit!(0)
      end 

      opts.on_tail("-v", "--version", "Affiche la version") do
        puts EFL_VERSION
        exit!(0)
      end
	  
      opts.on_tail("-V", "--verbose", "Affiche des messages supplémentaires") do
        options.verbose = true
      end	  
	  
      opts.on_tail("-d", "--debug", "Dump des structures de données internes") do
        options.debug = true
      end	  	  
    end

    opts.parse!(args)
    options
  end
end

# gestion de la ligne de commande
options = OptionParse.parse(ARGV)
$verbose  = options.verbose
$debug = options.debug

nb=ARGV[0].to_i

command_line = "cat /u/ext-pdonzel/.bash_history | tail -#{nb}"

puts command_line if $verbose

lines=IO.popen(command_line).readlines

puts lines if $debug

f=File.open("s.sh", 'w')
f.puts "#!/bin/bash"

lines.each { |command| f.puts command}

f.close

system("chmod u+x s.sh")


