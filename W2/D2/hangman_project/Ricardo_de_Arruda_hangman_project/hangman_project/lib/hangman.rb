class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end


  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    ret = []
    @secret_word.split("").each.with_index do |el, i|
      if el == char 
        ret << i
      end
    end
    ret 
  end

  def fill_indices(char, arr)
    arr.each { |i| @guess_word[i] = char }
  end
  
  def try_guess(char)

    if get_matching_indices(char).empty?
      @remaining_incorrect_guesses -= 1
    end
    indices = get_matching_indices(char)
    fill_indices(char, indices)
    get_matching_indices(char).size

    if already_attempted?(char)
      puts "that has already been attempted"
      false
    else
      @attempted_chars.push(char)
      true
    end

  end

  def ask_user_for_guess
    puts 'Enter a char:'
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join == @secret_word
      print 'WIN'
      true
    else
      false
    end  
  end

    def lose?
      if @remaining_incorrect_guesses.zero?
        puts 'LOSE'
         true
      else
         false
      end
    end

    def game_over?
      if self.win? || self.lose?
        puts @secret_word
         true
      else
         false
      end
    end

end
