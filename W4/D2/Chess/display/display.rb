require_relative "cursor.rb"
require_relative "../board/board.rb"
require 'colorize'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    # loop do
      @cursor.get_input
    # end
  end



end
