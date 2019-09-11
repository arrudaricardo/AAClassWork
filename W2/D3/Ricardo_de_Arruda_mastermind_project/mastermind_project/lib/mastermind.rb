require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(tags)
    puts "exact matches : #{@secret_code.num_exact_matches(tags)}"
    puts "near matches : #{@secret_code.num_near_matches(tags)}"
  end

  def ask_user_for_guess
    puts "Enter a code"
    input = gets.chomp
    print_matches(Code.from_string(input))
    Code.from_string(input) == @secret_code
  end
end
