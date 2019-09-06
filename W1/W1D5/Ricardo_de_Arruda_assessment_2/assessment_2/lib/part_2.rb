def proper_factors(num)
arr = []
(1...num).each do |el|
  arr.push(el) if num.modulo(el).zero?
end
return arr
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
num == aliquot_sum(num)
end

def ideal_numbers(num)
  ret = []
  # while ret.length < num
  6.step do |el|
     ret.push(el) if perfect_number?(el)
     break if ret.length == num
  end
  ret
end

