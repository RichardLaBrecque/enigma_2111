require './lib/lettershift'
require './lib/shiftmaker'
require './lib/keymaker'
require './lib/offsetmaker'
require './lib/lettershift'
require './lib/crack'
require './lib/enigma'
require 'pry'

RSpec.describe Crack do
  before (:each) do
    @offset = Offsetmaker.new("040895")
    @key = Keymaker.new("02715")
    @shiftmaker = Shiftmaker.new(@key.makekeys, @offset.makekeys)
    @message = LetterShift.new("hello world", @shiftmaker.makekeys )
    @message_2 = LetterShift.new("Hello, World!", @shiftmaker.makekeys)
    @shifted = LetterShift.new("keder, ohulw!", @shiftmaker.makekeys)
    @enigma = Enigma.new
    @crack = Crack.new("vjqtbeaweqihssi", "291018")
  end

  it "exists" do
    expect(@crack).to be_a (Crackrs)
  end

  it 'knows the last 4 of the message' do
    expect(@crack.end).to eq(["h","s","s","i"])
  end
end
