def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject do |ele|
        ele["age"] < 3
    end
end

def count_positive_subarrays(arr)
    arr.count { |num| num.sum > 0 } 
end

def aba_translate(str)
  vowls = 'aeiou'
  arr = []
  str.each_char do |char| 
      if vowls.include?(char) || vowls.include?(char.downcase)   
      arr.push(char + 'b' + char)
      else
        arr.push(char)
      end
    end
      arr.join
end

def aba_array(arr)
 arr.map do |el|
  aba_translate(el)
 end
end
