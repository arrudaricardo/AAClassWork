require_relative "card"

class Board
attr_reader :grid
    def initialize(size)
        raise "size need to be even" if size.odd? || size < 4

        @grid = Array.new(size) {Array.new(size, "")}
    end

  # Should fill the board with a set of shuffled Card pairs
    def populate
      possible_pairs = ('A'..'Z').to_a.shuffle!
      possible_positions = []
      # Card.new(value) => Char
      (0...@grid.length).each do |i|
        (0...@grid.length).each do |j|
          possible_positions << [i, j]
        end
      end
      
      possible_positions.shuffle! # random
      
      (@grid.length ** 2 / 2).times do  
        value = possible_pairs.pop

        pos1 = possible_positions.pop 
        pos2 = possible_positions.pop
        
         @grid[pos1[0]][pos1[1]] = Card.new(value)
         @grid[pos2[0]][pos2[1]] = Card.new(value)

        end
      end
    

    #  should print out a representation of the Board's current state
    #  only show card that are face_up == true
    #   0 1 2 4
    # 0     R
    # 1 R
    # 2
    # 
    def clean_terminal
      if Gem.win_platform?
        system 'cls'
      else
        system 'clean'
      end
    end

    def render(clear = false)
      clean_terminal if clear
      first_line = (0...@grid.length).to_a
      first_line.unshift('X')
      puts first_line.join(' ')

      @grid.each_with_index do |row, idx|
        temp = idx.to_s + " "
        row.each do |card|
          if card.face_up
            temp += card.value + " "
          else
            temp += "  "
          end
        end
        puts temp
      end
    end
      
      # (0...@grid.length).each do |i|  # getting row
      #   #find the card value 
      #   temp = '' # store the card value for that index
      #   temp += i.to_s + " "
      #   (0...@grid.length).each do |j|  # getting the col
      #     # need to know if the value is face_up before printing
      #       card = @grid[i][j] # getting the cards instance
      #       if card.face_up
      #         temp += card.to_s + ' '
      #       else
      #         temp += "  "
      #       end

      #    end
      #   puts temp
      # end

    

    # should return true if all cards have been revealed.
    def won?
      @grid.flatten.all? { |card_instance| card_instance.face_up }
    end

    # should reveal a Card at guessed_pos (unless it's already face-up, in which case the method should do nothing).
    # It should also return the value of the card it revealed (you'll see why later).
    def reveal
      puts "Enter a position in a manner of '1,2'"
      guessed_pos = gets.chomp.split(",").map(&:to_i) 
      row = guessed_pos[0]
      col = guessed_pos[1]
      unless @grid[row][col].face_up # Card check if Card is face_up if it is ... return the value if not do nothing
        @grid[row][col].reveal # gonna change face_up to true
        return @grid[row][col].value
      end
    end

    def reset
      # set all cards to face_up == false
      @grid.each do |sub|
        sub.each { |ele| ele.hide }
      end
    end
    
end


