require 'pry'
require_relative 'keymaker'
require_relative 'offsetmaker'
require_relative 'shiftmaker'
require_relative 'lettershift'
class Enigma
  def initialize
    @encryption
    @decryption
    @key
    @date
  end

  def encrypt(message, key = rand(99999), date = (Date.today.strftime"%d%m%y").to_s)
    key_set = Keymaker.new(key.to_s)
    offset = Offsetmaker.new(date)
    shiftmaker = Shiftmaker.new(key_set.makekeys, offset.makekeys)
    message = LetterShift.new(message, shiftmaker.makekeys)
    encrypted = message.shift
    final = {encryption: encrypted, key: key, date: date}
    final

  end

  def decrypt(message, key, date = (Date.today.strftime"%d%m%y").to_s)
    key_set = Keymaker.new(key)
    offset = Offsetmaker.new(date)
    shiftmaker = Shiftmaker.new(key_set.makekeys, offset.makekeys)
    message = LetterShift.new(message, shiftmaker.makekeys)
    decrypted = message.shift(-1)
    final = {decryption: decrypted, key: key, date: date}
    final
  end

end
