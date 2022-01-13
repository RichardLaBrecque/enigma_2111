require './lib/offsetmaker'
require 'pry'

RSpec.describe Offsetmaker do
  before (:each) do
    @offset_hash = Offsetmaker.new("12345")
  end
  it 'exists' do
  expect(@offset_hash).to be_a(Offsetmaker)
  end

  xit 'holds the starting key as an array' do
    expect(@key_hash.encryption_key).to eq(["1", "2", "3", "4" ,"5"])
  end

  xit 'generates a, b, c, d keys as a hash' do
    expect(@key_hash.makekeys).to eq({"A"=>"12", "B"=>"23", "C"=>"34", "D"=>"45"})
  end
end
