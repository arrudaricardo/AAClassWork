class Board
    attr_reader :size
    def initialize(num)
        @grid = Array.new(num){ Array.new(num){:N} }
        @size = @grid.size ** 2

    end
  
    def [](array)

        @grid[array[0]][array[1]]
    end

    def []=(pos, value) #pos is an array
        
        @grid[pos[0]][pos[1]] = value
    end

    def num_ships
        counter= 0
        @grid.each { |arr1| arr1.each { |ele| counter += 1 if ele == :S } }
        counter 
    end

end
