require_relative "cursor.rb"
require_relative "../Board/board.rb"
require 'colorize'

class Display

  def initialize
    @cursor = Cursor.new([0, 0], Board.new)
  end

  def render
    loop do
      @cursor.get_input
    end
  end



end