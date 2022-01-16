require './lib/offsetmaker'
require 'pry'

RSpec.describe Offsetmaker do
  before (:each) do
    @offset_hash = Offsetmaker.new("040895")
    @offset_hash_2 = Offsetmaker.new("00000")
    @offset_3 = Offsetmaker.start("040895")
  end
  it 'exists' do
  expect(@offset_hash).to be_a(Offsetmaker)
  end

  it 'holds the starting key as an array' do
    expect(@offset_hash.encryption_key).to eq(40895)
  end

  it 'generates a, b, c, d keys as a hash' do
    expect(@offset_hash.makekeys).to eq({"A"=>1, "B"=>0, "C"=>2, "D"=>5})
    expect(@offset_hash_2.makekeys).to eq({"A"=>0, "B"=>0, "C"=>0, "D"=>0})
  end

  # it 'has a class method' do
  #   expect(@offset_3).to eq({"A"=>1, "B"=>0, "C"=>2, "D"=>5})
  # end
end
