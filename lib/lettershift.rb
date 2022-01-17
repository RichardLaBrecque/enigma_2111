class LetterShift
  attr_reader :string, :shift_hash, :set
  def initialize(string, shift_hash)
    @string = string.downcase # i could proably combine all this into a string.downcase.split("") however i feel it will lower my testing % because ill also get rid of some attr_reader stuff
    @message_array = @string.split("")
    @shift_hash = shift_hash
    @set = ("a".."z").to_a << " "
  end
# optional 1 encrypts, (-1) decripts
  def shift(direction = 1)
    keys = @shift_hash.keys #maybe make these attributes? would make method shorter, but not actually change anything useful
    encrypted_array = [] # i am returning an array? maybe .map
    @message_array.each do |letter|
      if @set.include?(letter)
        original_index = @set.find_index(letter)
        rotated = @set.rotate(direction * (@shift_hash[keys[0]]))
        encrypted_array << rotated[original_index]
        keys.rotate!
      else #how would this work with a map? with no accumulator how would i get the commas ect?
        encrypted_array << letter
      end
    end
    encrypted_array.join
  end

end
