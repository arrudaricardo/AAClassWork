# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
    den_num_1 = []
    den_num_2 = []

    (2...num_1 -1).each do |i|
     if (num_1 % i).zero? 
         den_num_1.push(i)
     end
    end

    (2..num_2 -1).each do |i|
      if (num_2 % i).zero?
          den_num_2.push(i)
      end
    end
  (den_num_1 & den_num_2).empty?
end

# 25 (1, 5, 5, 25)
# 12 (1, 2, 3, 4, 6, 12)

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
