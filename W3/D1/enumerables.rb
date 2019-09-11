
class Array

  def my_each
    2.times do 
      for el in self 
        puts el
      end
    end
  end
# calls my_each twice on the array, printing all the numbers twice.
# [1, 2, 3].my_each
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3

# p return_value  # => [1, 2, 3]


  def my_select(&prc)
    ret = []
    self.each{|ele|ret << ele if prc.call(ele)}
    ret
  end

a = [1, 2, 3]
raise unless a.my_select { |num| num > 1 } == [2, 3]
raise unless a.my_select { |num| num == 4 } == []

  def my_reject(&prc)
    ret = []
    self.each{|ele|ret << ele unless prc.call(ele)}
    ret
  end


a = [1, 2, 3]
raise unless a.my_reject { |num| num > 1 } == [1]
raise unless a.my_reject { |num| num == 4 } == [1, 2, 3]

def my_any?(&prc)
  self.each {|el| return true if prc.call(el)}
  false
end

def my_all?(&prc)
  self.each {|el| return false unless prc.call(el)}
  true 
end

a = [1, 2, 3]
raise unless a.my_any? { |num| num > 1 } == true
raise unless a.my_any? { |num| num == 4 } == false
raise unless a.my_all? { |num| num > 1 } ==  false
raise "my_all failed" unless a.my_all? { |num| num < 4 } == true

# def my_flatten
#     $arr = []
#     helper(self)
#     $arr
# end

# def helper(el)
#     el.each do |var|
#         unless var.class == Array
#             $arr << var
#         else
#             helper(var)
#         end
#     end
# end

# [1, 2, 3, [4, [5, 6]], [[[7]], 8]]
# [1,2,3] [4] [5,6] [7] [8]
def my_flatten
    arr = []
    self.each do |var|
        unless var.class == Array
            arr << var
        else
            arr += var.my_flatten
        end
    end
    arr
end

# def my_flatten
#     return [] if self.empty?
    
# end


# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten 
raise unless [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten == [1, 2, 3, 4, 5, 6, 7, 8]

def my_zip(*args)
    arr = []
    (0...self.length).each do |i|
        temp = []
        (0...args.length).each do |i2|
            if args[i2] != nil
                temp << args[i2][i]
            else
                temp << nil
            end
        end
        temp.unshift(self[i])
        arr << temp
    end
    arr
end



# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) 
# p a.my_zip([1,2], [8])
# p [1, 2].my_zip(a, b)
# raise unless [1, 2, 3].my_zip(a, b) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# raise unless a.my_zip([1,2], [8]) == [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# raise unless [1, 2].my_zip(a, b) == [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)
# raise unless [1, 2].my_zip(a, b, c, d)    == [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


def my_rotate(num = 1)
  alpha = ("a".."z").to_a
  self.map do |el|
    alpha[(alpha.index(el) + num) % self.length]
  end

end


# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

def my_join(str = "")
    ret = ""
    self.each do |el|
        if el == self[-1]
            ret += el
        else
            ret += el + str
        end
    end
    ret
end

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"
def my_reverse
    rev_arr = []
    self.each do |el|
        rev_arr.unshift(el)
    end
    rev_arr
end


# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

end

