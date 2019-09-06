def palindrome?(str)
  new_string = ''
  str.each_char do |char|
    new_string = char + new_string
  end
  str == new_string
end


def substrings(str)
  ret = [] 
  str.each_char.with_index do |char1, i1|
    str.each_char.with_index do |char2, i2|
      if i1 <= i2
        ret.push(str[i1..i2]) 
      end
    end
  end
ret
end

def palindrome_substrings(str)
    substrings(str).select { |el| el.length > 1 && palindrome?(el) }
end
