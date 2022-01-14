class Offsetmaker
  attr_reader :date, :encryption_key
  def initialize(date)
    @date = date
    @encryption_key = date.to_i
  end

  def makekeys

    square = @encryption_key * @encryption_key
    binding.pry
    keys = Hash.new
    keys["A"] = (@encryption_key[0] +  @encryption_key[1]).to_i
    keys["B"] = (@encryption_key[1] +  @encryption_key[2]).to_i
    keys["C"] = (@encryption_key[2] +  @encryption_key[3]).to_i
    keys["D"] = (@encryption_key[3] +  @encryption_key[4]).to_i
    keys
  end


end
