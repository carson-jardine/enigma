require_relative 'enigma'

message = File.open(ARGV[0], 'r')

incoming_text = message.read

message.close
enigma = Enigma.new
encrypted_text = enigma.encrypt(incoming_text)
