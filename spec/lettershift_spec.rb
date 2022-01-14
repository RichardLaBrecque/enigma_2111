require './lib/lettershift'
require './lib/shiftmaker'
require './lib/keymaker'
require './lib/offsetmaker'
require 'pry'

RSpec.describe LetterShift do
  before (:each) do
    @offset = Offsetmaker.new("040895")
    @key = Keymaker.new("02715")
    @key_hash = @key.makekeys
    @offset_hash = @offset.makekeys
    @shiftmaker = Shiftmaker.new(@key_hash, @offset_hash)

    @letter = LetterShift.new("A")
  end
  it 'exists' do
  expect(@shiftmaker).to be_a(Shiftmaker)
  end

  xit 'holds the hashes from key and offset makers' do
    expect(@shiftmaker.key_hash).to eq({"A"=>02, "B"=>27, "C"=>71, "D"=>15})
    expect(@shiftmaker.offset_hash).to eq({"A"=>1, "B"=>0, "C"=>2, "D"=>5})
  end


xit 'generates a, b, c, d shifts as a hash' do
    expect(@shiftmaker.makekeys).to eq({"A"=>3, "B"=>27, "C"=>73, "D"=>20})
  end
end
