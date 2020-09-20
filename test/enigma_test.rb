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

  def test_it_can_encrypt_message_with_key_and_date
    # skip
    expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end
end

# encrypt a message with a key and date
# @enigma.encrypt("hello world", "02715", "040895")
#=>
#   {
#     encryption: "keder ohulw",
#     key: "02715",
#     date: "040895"
#   }

# decrypt a message with a key and date
 # @enigma.decrypt("keder ohulw", "02715", "040895")
#=>
#   {
#     decryption: "hello world",
#     key: "02715",
#     date: "040895"
#   }

# encrypt a message with a key (uses today's date)
# @encrypted = enigma.encrypt("hello world", "02715")
#=> # encryption hash here

#decrypt a message with a key (uses today's date)
 # @enigma.decrypt(encrypted[:encryption], "02715")
#=> # decryption hash here

# encrypt a message (generates random key and uses today's date)
# @enigma.encrypt("hello world")
#=> # encryption hash here
