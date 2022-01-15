require 'pry'
class Keymaker
  attr_reader :encryption_key, :key
  def initialize(encryption_key)
    @key = encryption_key
    @encryption_key = @key.split("")
  end

  def makekeys
    keys = Hash.new
    keycheck
    keys["A"] = (@encryption_key[0] +  @encryption_key[1]).to_i
    keys["B"] = (@encryption_key[1] +  @encryption_key[2]).to_i
    keys["C"] = (@encryption_key[2] +  @encryption_key[3]).to_i
    keys["D"] = (@encryption_key[3] +  @encryption_key[4]).to_i
    keys

  end

  def keycheck
    if @encryption_key.count < 5
      until @encryption_key.count == 5 do
        encryption_key.unshift("0")
      end
    end
  end
end
