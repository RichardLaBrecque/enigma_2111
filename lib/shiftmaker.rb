require 'pry'
class Shiftmaker
  attr_reader :key_hash, :offset_hash
  def initialize(key_hash, offset_hash)
    @key_hash = key_hash
    @offset_hash = offset_hash
  end

  def makekeys #i named EVERYTHING makekeys, probably should chnage this, or module, so similar but so different
    shifts = Hash.new
    @key_hash.each do |key, key_value|
      @offset_hash.each do |offset, offset_value|
        if offset == key
          shifts[key] = (key_value + offset_value)
        end
      end
    end
    shifts
  end
end
