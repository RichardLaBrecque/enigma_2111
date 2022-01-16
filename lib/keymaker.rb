require 'pry'
class Keymaker
  attr_reader :encryption_key, :key_used
  def initialize(encryption_key)
    @encryption_key = encryption_key.to_s.split("")
    keycheck
    @key_used = @encryption_key.join
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

  def keycheck
    if @encryption_key.count < 5
      until @encryption_key.count == 5 do
        @encryption_key.unshift("0")
      end
    end
  end
  #sort out this class method later
   # def self.start(encryption_key)
   #   keys = Keymaker.new(encryption_key)
   #   keys.makekeys
   # end
end
