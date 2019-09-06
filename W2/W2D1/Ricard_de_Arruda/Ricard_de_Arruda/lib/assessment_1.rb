def my_map!(arr, &prc)
  arr.each_with_index do |el, i|
    arr[i] = prc.call(el)
  end
end


def two?(arr, &prc)
  count = 0
  arr.each do |el|
   if prc.call(el)
    count +=1
   end
   return false if count > 2
  end
  return true if count == 2 else return false
end


def nor_select(arr, prc1, prc2)
  ret = []
  arr.each do |el|
    if !prc1.call(el) && !prc2.call(el)
      ret << el
    end
  end
ret 
end

def array_of_hash_sum(arr)
  ret = 0
  arr.each do |hash|
    hash.each_value do |v|
    ret += v
  end
  end
  ret
end


def slangify(str)
  words= str.split(' ')
  ret = []
  words.each do |word,i|

  vowls = ['a','e', 'i', 'o', 'u']
  temp = ''

    word.split.each do |char, i|
      if vowls.include?(char)
        temp += char
      else
        vowls.delete(char)
      end
    end
    ret << temp

end
  ret.join(' ')
end


def char_counter(str, *arg)
  if arg == []
    count = Hash.new(0)
    str.split('').each {|el| count[el] += 1}
    return count
  end
count = Hash.new
arg.each { |el| count[el] = 0}

str.split("").each do |el|
if arg.include?(el)
  count[el] += 1
end
end
count 
end