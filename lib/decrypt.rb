require_relative 'enigma'
require 'date'
enigma = Enigma.new

message = File.open(ARGV[0], 'r')
incoming_message = message.read
message.close

key = ARGV[2]

date = ARGV[3]

decrypted_text = enigma.decrypt(incoming_message, key, date)

writer = File.open(ARGV[1], 'w')
output = "Created '#{ARGV[1]}' with the key #{decrypted_text[:key]} and date #{decrypted_text[:date]}"

writer.write(decrypted_text[:decryption])

puts output

writer.close
