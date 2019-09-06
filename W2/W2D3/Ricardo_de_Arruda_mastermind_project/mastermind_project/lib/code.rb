class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? { |el| POSSIBLE_PEGS.keys.include?(el.upcase) }
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map(&:upcase)
    else
      raise 
    end
  end

  def pegs
    @pegs
  end

  def self.random(len)
    Code.new(Array.new(len){ POSSIBLE_PEGS.keys.sample})
  end

  def self.from_string(pegs)
    Code.new(pegs.split('')) #[abcd] --> [a b c d]
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    (0...guess.length).count { |idx| self[idx] == guess[idx] }
  end

  def num_near_matches(guess)
    
    # [1, 2, 3, 4]
    # hash[el] += count
    # if count != 0 --> num near match --> count --> res
    
    # res - num_exact_matches(guess)
    hash = Hash.new(0) #<-- duplicate hash version of @pegs
    @pegs.each { |char| hash[char] += 1 }
    count = 0
    (0...guess.length).each do |idx|
      if @pegs[idx] != guess[idx] && hash[guess[idx]] > 0  
        count += 1
        hash[guess[idx]] -= 1
      end
    end
      
    count
  end

  def ==(another_code)
    self.num_exact_matches(another_code) == self.length && self.length == another_code.length
  end
end
