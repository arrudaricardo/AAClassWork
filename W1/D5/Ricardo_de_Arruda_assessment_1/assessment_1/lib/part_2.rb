def element_count(arr)
  hash = Hash.new(0)
  arr.each { |el| hash[el] += 1}
  return hash
end


def char_replace!(str,hash)
hash.each do |k,v|  
  str.gsub!(k,v)
end
return str

end

def product_inject(arr)

arr.inject {|acc, el|  acc * el }

end


