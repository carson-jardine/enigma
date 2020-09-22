module Generatable

  def generate_keys(key)
    key.split('').each_cons(2).map do |pair|
      pair.join.to_i
    end
  end

  def generate_offsets(date)
    date_squared(date).digits.reverse[-4..-1]
  end

  def generate_shifts(key, offsets)
    key.zip(offsets).map(&:sum)
  end

  def shifts(key, date)
    generate_shifts(generate_keys(key), generate_offsets(date))
  end

  def generate_encryption(message, key = default_key, date = default_date)
    message.downcase.split('').map.with_index do |chr, index|
      if character_set.include?(chr)
        character_set.rotate(shifts(key, date)[index % 4])[character_set.index(chr)]
      else
        chr
      end
    end.join
  end

  def generate_decryption(ciphertext, key, date)
    ciphertext.downcase.split('').map.with_index do |chr, index|
      if character_set.include?(chr)
        character_set.rotate(-shifts(key, date)[index % 4])[character_set.index(chr)]
      else
        chr
      end
    end.join
  end
end
