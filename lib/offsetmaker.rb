class Offsetmaker
  attr_reader :date, :encryption_key
  def initialize(date)
    @date = date
    @encryption_key = date.to_i
  end

  def makekeys
    keys = (("A".."D")).to_a
    offsets_reversed = (@encryption_key * @encryption_key).digits.first(4)
    offset_hash = Hash.new(0)
    if offsets_reversed.count < 4
      until offsets_reversed.count == 4 do
        offsets_reversed << 0
      end
    end
    
    offsets_reversed.each do |offset|
      if offset == nil
        offset_hash[keys.last] = 0
        keys.rotate!(-1)
      else
          offset_hash[keys.last] = offset
          keys.rotate!(-1)
      end
    end
    offset_hash

  end


end
