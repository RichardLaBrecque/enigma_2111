class LetterShift
  attr_reader :string, :shift_hash, :set
  def initialize(string, shift_hash)
    @string = string.downcase
    @message_array = @string.split("")
    @shift_hash = shift_hash
    @set = ("a".."z").to_a << " "
  end
# optional 1 encrypts, (-1) decripts
  def shift(direction = 1)
    keys = @shift_hash.keys
    rotator = @set
    encrypted_array = []
    @message_array.each do |letter|
      if @set.include?(letter)
        original_index = @set.find_index(letter)
        rotated = rotator.rotate(direction * (@shift_hash[keys[0]]))
        encrypted_array << rotated[original_index]
        keys.rotate!
      else
        encrypted_array << letter
      end
    end
    encrypted_array.join
    #binding.pry
  end
  #no longer required, covered by optional argument for shift, (-1) reverses encrypt
  # def unshift
  #   keys = @shift_hash.keys
  #   rotator = @set
  #   encrypted_array = []
  #   @message_array.each do |letter|
  #     if @set.include?(letter)
  #       #Sbinding.pry
  #       original = @set.find_index(letter)
  #       rotated = rotator.rotate(-(@shift_hash[keys[0]]))
  #       encrypted_array << rotated[original]
  #       keys.rotate!
  #     else
  #       encrypted_array << letter
  #     end
  #   end
  #   encrypted_array.join
  # end
end
