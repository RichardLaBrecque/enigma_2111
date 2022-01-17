require_relative 'offsetmaker'
require 'pry'
class Crack
  attr_reader :end, :offset
  def initialize(message, date)
    @message = message.split("")
    @end = @message.last(4)
    @offset = (Offsetmaker.new(date)).makekeys

    binding.pry
  end
end
