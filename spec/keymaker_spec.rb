require './lib/keymaker'
require 'pry'

RSpec.describe Keymaker do
  before (:each) do
    @key_hash = Keymaker.new("02715")
    @key_hash_2 = Keymaker.new("00123")
    @key_hash_3 = Keymaker.new("00000")
    @key_hash_4 = Keymaker.new("0")
  end
  it 'exists' do
  expect(@key_hash).to be_a(Keymaker)
  end

  it 'holds the starting key as an array' do
    expect(@key_hash.encryption_key).to eq(["0", "2", "7", "1" ,"5"])
    expect(@key_hash.key).to eq("02715")
  end

  it 'generates a, b, c, d keys as a hash' do
    expect(@key_hash.makekeys).to eq({"A"=>02, "B"=>27, "C"=>71, "D"=>15})
    expect(@key_hash_2.makekeys).to eq({"A"=>00, "B"=>01, "C"=>12, "D"=>23})
    expect(@key_hash_3.makekeys).to eq({"A"=>0, "B"=>0, "C"=>0, "D"=>0})
    #
  end

  it "can handle a single digit input" do
    expect(@key_hash_4.makekeys).to eq({"A"=>0, "B"=>0, "C"=>0, "D"=>0})
  end
  it 'can report key used after correction' do
    expect(@key_hash_4.key_used).to eq("00000")
  end
end
