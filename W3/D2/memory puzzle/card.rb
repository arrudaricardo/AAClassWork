class Card

    attr_reader :value, :face_up

    def initialize(value)
        @value = value
        @face_up = false
    end

    def hide
      @face_up = false
    end

    def reveal
      @face_up = true
    end

    def to_s  # to string # convert to @value to string 
      "#{@value}"
    end

    def ==(another_card)
     another_card.to_s == to_s
    end
    
end