require 'pry'
require_relative 'keymaker'
require_relative 'offsetmaker'
require_relative 'shiftmaker'
require_relative 'lettershift'
require 'Date'
class Enigma

  def encrypt(message, key = rand(99999), date = (Date.today.strftime"%d%m%y").to_s)
    key_set = Keymaker.new(key) #class methods?
    offset = Offsetmaker.new(date)
    shiftmaker = Shiftmaker.new(key_set.makekeys, offset.makekeys)
    message = LetterShift.new(message, shiftmaker.makekeys)
    encrypted = message.shift
    final = {encryption: encrypted, key: key_set.key_used, date: date}
    final

  end

  def decrypt(message, key = rand(99999), date = (Date.today.strftime"%d%m%y").to_s)
    key_set = Keymaker.new(key)
    offset = Offsetmaker.new(date)
    shiftmaker = Shiftmaker.new(key_set.makekeys, offset.makekeys)
    message = LetterShift.new(message, shiftmaker.makekeys)
    decrypted = message.shift(-1) #-1 the only differnce between encrypt and decrypt  could proably helper or module the rest away
    final = {decryption: decrypted, key: key_set.key_used, date: date}
    final
  end

  # def crack(message, date = (Date.today.strftime"%d%m%y").to_s)
  #   offset = Offsetmaker.new(date)
  #   crackset = Crack.new(message, date)
  # end

end
