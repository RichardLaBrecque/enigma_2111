require 'pry'
class Keymaker
  attr_reader :encryption_key, :key_used
  def initialize(encryption_key)
    @encryption_key = encryption_key.to_s.split("") #
    keycheck
    @key_used = @encryption_key.join #exists for report to runner file
  end

  def makekeys
    set = ("A".."D").to_a
    keys = Hash.new
    set.each do |letter|
      keys[letter] = (@encryption_key[0] +  @encryption_key[1]).to_i
      @encryption_key.rotate!
    end
    keys

  end

  def keycheck #basically .rjust(5, "0")
    if @encryption_key.count < 5
      until @encryption_key.count == 5 do
        @encryption_key.unshift("0")
      end
    end
  end
end
