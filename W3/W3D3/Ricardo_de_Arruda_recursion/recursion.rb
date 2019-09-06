

# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).

def sum_to(n)
  return nil if n < 0 
  return 1 if n <= 1
  sum_to(n - 1) + n
end

 # Test Cases
raise unless sum_to(5) == 15
raise unless sum_to(1) == 1
raise unless sum_to(9) == 45
raise unless sum_to(-8) == nil


# Write a function add_numbers(nums_array) that takes in an array of Integers and returns the sum of those numbers. Write this method recursively.

def add_numbers(arr)
  return nil if arr == []
  return arr[0] if arr.length == 1
  arr[0] + add_numbers(arr[1..-1])

end
  # Test Cases
raise unless add_numbers([1,2,3,4]) == 10
raise unless add_numbers([3]) == 3
raise unless add_numbers([-80,34,7]) == -39
raise unless add_numbers([]) == nil



  #Let's write a method that will solve Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!
  def gamma_fnc(n)
    return 1 if n == 1
    gamma_fnc(n - 1) * n
  end

  # Test Cases
# raise unless gamma_fnc(0)  == nil
raise unless gamma_fnc(1) == 1
raise unless gamma_fnc(4) == 6
raise unless gamma_fnc(8) == 5040



  #Write a function ice_cream_shop(flavors, favorite) that takes in an array of ice cream flavors available at the ice cream shop, as well as the user's favorite ice cream flavor. Recursively find out whether or not the shop offers their favorite flavor.

  def ice_cream_shop(arr, str)

  end
  # Test Cases
  ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
  ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
  ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
  ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
  ice_cream_shop([], 'honey lavender')  # => returns false



 # Write a function reverse(string) that takes in a string and returns it reversed.

 def reverse(str)
  return str if str.length <= 1
  reverse(str[1..-1]) + str[0] 

 end
  # Test Cases
raise unless reverse("house") == "esuoh"
raise unless reverse("dog") == "god"
raise unless reverse("atom") == "mota"
raise unless reverse("q") == "q"
raise unless reverse("id") == "di"
raise unless reverse("") == ""