# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)

    def prime?(num)
        return false if num < 2

        (2...num).each do |n|
            if num % n == 0
                return false
            end
        end

        true
    end

    if prime?(num)
        return num
    end

    (num.downto(2)).each do |i|
        if prime?(i) && num % i == 0
            return i
        end
    end
end

def unique_chars?(str)
  result = Hash.new(0)
  str.each_char { |char|
   result[char] += 1
  }

  result.each do |k, v|
    if result[k] > 1
      return false 
    end
  end
    true
end

def dupe_indices(arr)
    result = Hash.new { Array.new() }

    arr.each_with_index do |e, i|
        result[e] = result[e].push(i)
    end

    result.select do |k, v|
        v.length > 1
    end

end

def ana_array(arr_1, arr_2)
   return false if arr_1.length != arr_2.length

    arr_1.each_with_index do |el, idx|
        if !arr_2.include?(el)
            return false
        end
        arr_2.delete_at(arr_2.index(el))
    end
  true
end
