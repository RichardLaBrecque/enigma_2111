require 'pry'
class Keymaker
  attr_reader :encryption_key
  def initialize(encryption_key)
    @encryption_key = encryption_key.split("")
  end

  def makekeys
    keys = Hash.new
    keys["A"] = @encryption_key[0] +  @encryption_key[1]
    keys["B"] = @encryption_key[1] +  @encryption_key[2]
    keys["C"] = @encryption_key[2] +  @encryption_key[3]
    keys["D"] = @encryption_key[3] +  @encryption_key[4]
    keys
  end
end
