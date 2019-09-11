def is_prime?(num)
  return false if num < 2

  (2...num).each do |el|
    if num.modulo(el).zero?
      return false
    end
  end
  true
end


def nth_prime(num)
    primes = [] 
    2.step do |el| 
        if is_prime?(el)  
            primes.push(el)
        end
    break if primes.length == num 
    end
return primes[-1]
end

def prime_range(min,max)
    primes = []
    (min..max).each do |num|
      primes.push(num) if is_prime?(num)

       end
 return primes


end



