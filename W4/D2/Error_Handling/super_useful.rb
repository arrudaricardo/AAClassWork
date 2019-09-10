# PHASE 2
def convert_to_int(str)
  #goal: no error raised 
  # rescue ANY errors and return nil if our argument cannot be converted
  # StandardErrorSubclass which one?
  #  
  begin
    int = Integer(str) 
  rescue StandardError
    return nil
  end 
  int
end


# PHASE 3
class WrongFruit < StandardError
end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit.downcase
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    if maybe_fruit == 'coffee'
      feed_me_a_fruit
    end # we could also use a retry method here. 
    raise WrongFruit.new("Feed me a different one")
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
end  


# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise "Descriptive Error Message" if yrs_known < 5 # standard error implicitly. Couldinstantiate new 
    raise "Get a life and name" if name.length <= 0 || fav_pastime.length <= 0
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


