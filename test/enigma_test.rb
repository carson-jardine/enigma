require_relative 'test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_generate_default_key
    @enigma.stubs(:rand).returns(89631)

    assert_equal "89631", @enigma.default_key
  end

  def test_it_can_generate_default_date
    Date.stubs(:today).returns(Date.new(1994,8,22))

    assert_equal "220894", @enigma.default_date
  end

  def test_it_can_generate_actual_keys
    assert_equal [2, 27, 71, 15], @enigma.generate_keys("02715")
  end

  def test_it_can_square_date
    assert_equal 1672401025, @enigma.date_squared("040895")
  end

  def test_it_can_generate_offsets
    assert_equal [1, 0, 2, 5], @enigma.generate_offsets("040895")
  end

  def test_it_can_generate_shifts
    keys = @enigma.generate_keys("02715")
    offsets = @enigma.generate_offsets("040895")
    assert_equal [3, 27, 73, 20], @enigma.generate_shifts(keys, offsets)
  end

  def test_it_can_generate_encryption
    assert_equal "keder ohulw", @enigma.generate_encryption("hello world", "02715", "040895")
  end

  def test_it_can_generate_encryption_with_special_chr
    assert_equal "keder ohulw!", @enigma.generate_encryption("hello world!", "02715", "040895")
  end

  def test_it_can_encrypt_message_with_key_and_date
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_generate_decryption
    assert_equal "hello world", @enigma.generate_decryption("keder ohulw", "02715", "040895")
  end

  def test_it_can_decrypt_message_with_key_and_date
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_message_with_key_and_default_date
    Date.stubs(:today).returns(Date.new(1995,8,4))

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715")

    Date.stubs(:today).returns(Date.new(2020,9,19))

    expected = {
      encryption: "pib wdmczpu",
      key: "02715",
      date: "190920"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_with_key_and_default_date
    Date.stubs(:today).returns(Date.new(1995,8,4))

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715")
  end

  def test_it_can_encrypt_message_with_default_key_and_default_date
    @enigma.stubs(:rand).returns(2715)
    Date.stubs(:today).returns(Date.new(1995,8,4))

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world")
  end
end
