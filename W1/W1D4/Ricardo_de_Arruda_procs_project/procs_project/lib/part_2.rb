def reverser(str, &block)
    block.call(str.reverse)
end

def word_changer(str, &block)
    arr = str.split(' ')
    res = []
    arr.each do |word|
        res << block.call(word)
    end
    res.join(' ')
end


def greater_proc_value(num, proc_1, proc_2)
  if  proc_1.call(num) > proc_2.call(num)
    return proc_1.call(num)
  else
    return proc_2.call(num) 
  end
end


def and_selector(arr, proc_1, proc_2)
    arr.select do |el|
        proc_1.call(el) && proc_2.call(el)
    end
end

def alternating_mapper(arr, proc_1, proc_2)
  count = true  
  arr.map do |el|
    if count 
      count = false
      proc_1.call(el)
    else
      count = true
      proc_2.call(el)
    end
  end
end