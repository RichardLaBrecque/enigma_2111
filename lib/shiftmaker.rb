require 'pry'
class Shiftmaker
  attr_reader :key_hash, :offset_hash
  def initialize(key_hash, offset_hash)
    @key_hash = key_hash
    @offset_hash = offset_hash
  end

  def makekeys
    offsets = Hash.new
    @key_hash.each do |key, key_value|
      @offset_hash.each do |offset, offset_value|
        if offset == key
          offsets[key] = (key_value + offset_value)
        end
      end
    end
    offsets
  end
end
