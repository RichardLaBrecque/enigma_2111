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

    @letter = LetterShift.new("A", @shiftmaker.makekeys)
      @message = LetterShift.new("hello world", @shiftmaker.makekeys )
      @message_2 = LetterShift.new("Hello, World!", @shiftmaker.makekeys)
      @shifted = LetterShift.new("keder, ohulw!", @shiftmaker.makekeys)
  end
  it 'exists' do
  expect(@shiftmaker).to be_a(Shiftmaker)
  end

  it 'holds a lower case letter to shift' do
    expect(@letter.string).to eq("a")
  end


  it 'contains a shift hash' do
    expect(@letter.shift_hash).to eq({"A"=>3, "B"=>27, "C"=>73, "D"=>20})
  end

  it 'holds a base letter set' do
    expect(@letter.set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'can shift one letter' do
    expect(@letter.shift).to eq("d")
  end

  it 'can encrypt a message' do
    expect(@message.shift).to eq("keder ohulw")
  end

  it 'can skip commas' do
    expect(@message_2.shift).to eq("keder, ohulw!")
  end

  it 'can unshift using the same keys' do
    expect(@shifted.unshift).to eq("hello, world!")
  end


end
