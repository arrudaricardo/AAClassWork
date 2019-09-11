def my_reject(arr, &prc)
  ret = []
  arr.each do |el|
    ret.push(el) if !proc.call(el) 
  end
ret 
end

def my_one?(arr, &prc)

true_tracker = 0
arr.each do |el|
   true_tracker += 1 if proc.call(el)
end
if true_tracker != 1
    return false 
end
 return true 
end


def hash_select(hash, &prc)
  ret = {}
  hash.each do |k,v|
    if prc.call(k,v)
        ret[k] = v
    end
  end
  ret
end

def xor_select(arr, prc_1, prc_2)
ret = []

arr.each do |el|
 ret.push(el) if prc_1.call(el) ^ prc_2.call(el)

end
ret
end

def proc_count(num, arr)
 count = 0
 arr.each do |prc|
  if prc.call(num)
  count += 1
 end
end
count
end