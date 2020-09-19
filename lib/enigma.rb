class Enigma
  #maybe move both key and date to module since they're both generating default values? Generatable?
  def default_key
    sprintf('%05d', rand(10 ** 5))
  end

  def default_date
    Date.today.strftime("%d%m%y")
  end

  def generate_key(key)
    key.split('').each_cons(2).map do |pair|
      pair.join.to_i
    end
  end

  def generate_offset(date)
    date_squared(date).digits.reverse[-4..-1]
  end

  def date_squared(date)
    date.to_i ** 2
  end

  def encrypt(message, key = default_key, date = default_date)
  end
end
