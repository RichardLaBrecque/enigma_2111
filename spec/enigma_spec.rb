require './lib/lettershift'
require './lib/shiftmaker'
require './lib/keymaker'
require './lib/offsetmaker'
require './lib/lettershift'
require './lib/enigma'
require 'pry'

RSpec.describe Enigma do
  before (:each) do
    @offset = Offsetmaker.new("040895")
    @key = Keymaker.new("02715")
    @shiftmaker = Shiftmaker.new(@key.makekeys, @offset.makekeys)
    @message = LetterShift.new("hello world", @shiftmaker.makekeys )
    @message_2 = LetterShift.new("Hello, World!", @shiftmaker.makekeys)
    @shifted = LetterShift.new("keder, ohulw!", @shiftmaker.makekeys)
    @enigma = Enigma.new


  end
  it 'exists' do
    #binding.pry
  expect(@enigma).to be_a(Enigma)
  end

  it 'can encript a string and return a hash' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"})
  end


  it 'can decrypt when given all information' do
    expected =   {decryption: "hello world", key: "02715", date: "040895"}
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end
end
