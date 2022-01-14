require './lib/shiftmaker'
require './lib/keymaker'
require './lib/offsetmaker'
require pry

RSpec.describe Shiftmaker do
  before (:each) do
    @offset_hash = Offsetmaker.new("040895")
    @key_hash = Keymaker.new("02715")
    @offset = Offsetmaker.new(@key_hash, @offset_hash)
  end
  it 'exists' do
  expect(@offset_hash).to be_a(Offsetmaker)
  end

  xit 'holds the starting key as an array' do
    expect(@offset_hash.encryption_key).to eq(40895)
  end

  xit 'generates a, b, c, d keys as a hash' do
    expect(@offset_hash.makekeys).to eq({"A"=>1, "B"=>0, "C"=>2, "D"=>5})
    expect(@offset_hash_2.makekeys).to eq({"A"=>0, "B"=>0, "C"=>0, "D"=>0})
  end
end
