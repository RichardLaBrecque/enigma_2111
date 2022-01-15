class Offsetmaker
  attr_reader :date, :encryption_key
  def initialize(date)
    @date = date
    @encryption_key = date.to_i
    @offsets_reversed
  end

  def makekeys
    keys = (("A".."D")).to_a
    offset_hash = Hash.new(0)
    offsetcheck
    @offsets_reversed.each do |offset|
          offset_hash[keys.last] = offset
          keys.rotate!(-1)
        end
    offset_hash
  end

  def offsetcheck
    @offsets_reversed = (@encryption_key * @encryption_key).digits.first(4)
    if @offsets_reversed.count < 4
      until @offsets_reversed.count == 4 do
        @offsets_reversed << 0
      end
    end
  end


end
