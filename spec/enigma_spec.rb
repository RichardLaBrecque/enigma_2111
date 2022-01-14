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
    @enigma = Enigma.new


  end
  it 'exists' do
  expect(@enigma).to be_a(Enigma)
  end

  xit 'can encript a string and return a hash' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"})
  end


  xit 'can decrypt when given all information' do
    expected =   {decryption: "hello world", key: "02715", date: "040895"}
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  xit 'holds a base letter set' do
    expect(@letter.set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  xit 'can shift one letter' do
    expect(@letter.shift).to eq("d")
  end

  xit 'can encrypt a message' do
    expect(@message.shift).to eq("keder ohulw")
  end

  xit 'can skip commas' do
    expect(@message_2.shift).to eq("keder, ohulw!")
  end

  xit 'can unshift using the same keys' do
    expect(@shifted.shift(-1)).to eq("hello, world!")
  end


end
