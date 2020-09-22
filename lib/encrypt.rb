require_relative 'enigma'

message = File.open(ARGV[0], 'r')

incoming_text = message.read
message.close

enigma = Enigma.new
cipheredtext = enigma.encrypt(incoming_text)

writer = File.open(ARGV[1], 'w')
writer.write(cipheredtext[:encryption])

puts "Created '#{ARGV[1]}' with the key #{cipheredtext[:key]} and date #{cipheredtext[:date]}"
