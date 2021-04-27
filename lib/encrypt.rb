require_relative 'enigma'
require 'date'
enigma = Enigma.new

handle = File.open(ARGV[0], 'r')

incoming_message = handle.read

handle.close

encrypted_text = enigma.encrypt(incoming_message)

writer = File.open(ARGV[1], 'w')
output = "Created '#{ARGV[1]}' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"

writer.write(encrypted_text)

puts output

writer.close
