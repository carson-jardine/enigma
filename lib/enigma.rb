require 'date'
require_relative 'generatable'
require_relative 'defaultable'

class Enigma
  include Generatable
  include Defaultable

  def date_squared(date)
    date.to_i ** 2
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def encrypt(message, key = default_key, date = default_date)
    encrypted = generate_encryption(message, key, date)
    {
      encryption: encrypted,
      key: key,
      date: date
    }
  end

  def decrypt(ciphertext, key = default_key, date = default_date)
    decrypted = generate_decryption(ciphertext, key, date)
    {
      decryption: decrypted,
      key: key,
      date: date
    }
  end
end
