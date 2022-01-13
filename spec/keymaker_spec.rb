require './lib/keymaker'
require 'pry'

RSpec.describe Keymaker do
  before (:each) do
    @key_hash = Keymaker.new("12345")
  end
  it 'exists' do
  expect(@key_hash).to be_a(Keymaker)
  end

  it 'holds the starting key as an array' do
    expect(@key_hash.encryption_key).to eq(["1", "2", "3", "4" ,"5"])
  end

  it 'generates a, b, c, d keys as a hash' do
    expect(@key_hash.makekeys).to eq({"A"=>"12", "B"=>"23", "C"=>"34", "D"=>"45"})
  end
end
