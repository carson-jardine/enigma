require 'date'
class Enigma
  #maybe move both key and date to module since they're both generating default values? Generatable?

  def default_key
    sprintf('%05d', rand(10 ** 5))
  end

  def default_date
    Date.today.strftime("%d%m%y")
  end

  def generate_keys(key)
    key.split('').each_cons(2).map do |pair|
      pair.join.to_i
    end
  end

  def generate_offsets(date)
    date_squared(date).digits.reverse[-4..-1]
  end

  def date_squared(date)
    date.to_i ** 2
  end

  def generate_shifts(keys, offsets)
    keys.flat_map.with_index do |key, key_idx|
      offsets.map.with_index do |offset, offset_idx|
        key + offset if key_idx == offset_idx
      end
    end.compact
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

  def generate_encryption(message, key = default_key, date = default_date)
    shifts = generate_shifts(generate_keys(key), generate_offsets(date))
    message.downcase.split('').map.with_index do |chr, index|
      if character_set.include?(chr)
        character_set.rotate(shifts[index % 4])[character_set.index(chr)]
      else
        chr
      end
    end.join
  end

  def decrypt(ciphertext, key = default_key, date = default_date)
    decrypted = generate_decryption(ciphertext, key, date)
    {
      decryption: decrypted,
      key: key,
      date: date
    }
  end

  def generate_decryption(ciphertext, key, date)
    shifts = generate_shifts(generate_keys(key), generate_offsets(date))
    ciphertext.downcase.split('').map.with_index do |chr, index|
      if character_set.include?(chr)
        character_set.rotate(-shifts[index % 4])[character_set.index(chr)]
      else
        chr
      end
    end.join
  end
end
