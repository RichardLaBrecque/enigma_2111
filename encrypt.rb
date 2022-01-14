require 'pry'
require_relative 'lib/enigma'
#binding.pry
#ARGV[1] is our new file name
input = File.open(ARGV[0], "r")
encrypt = File.open(ARGV[1], 'w')
  message = input.read
enigma = Enigma.new
hash =  enigma.encrypt(message)
encrypt.write(hash)
encrypt.close
  #binding.pry
  puts "Created #{ARGV[1]} with the key #{hash[:key]} and the date #{hash[:date]}"
