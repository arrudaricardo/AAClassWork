# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.


def union(*arr)
    # arr [["a", "b"][1, 2, 3]]
    new_arr = []

    arr.each do |i|
        new_arr.concat(i)
    end
    
    new_arr
end

p union(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
