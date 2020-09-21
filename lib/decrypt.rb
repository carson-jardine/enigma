require_relative 'enigma'

message = File.open(ARGV[0], 'r')

incoming_text = message.read

message.close

enigma = Enigma.new

decrypted_text = enigma.decrypt(incoming_text, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], 'w')

writer.write(decrypted_text[:decryption])

puts "Created '#{ARGV[1]}' with the key #{decrypted_text[:key]} and date #{decrypted_text[:date]}"
