require_relative 'enigma'

message = File.open(ARGV[0], 'r')

incoming_text = message.read
message.close

enigma = Enigma.new
encrypted_text = enigma.encrypt(incoming_text)

writer = File.open(ARGV[1], 'w')
writer.write(encrypted_text[:encryption])

puts "Created '#{ARGV[1]}' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
