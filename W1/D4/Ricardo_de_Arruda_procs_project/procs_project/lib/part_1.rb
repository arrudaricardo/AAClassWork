def my_map(arr, &block)
  ret = []
  arr.each do |el|
    ret << block.call(el)
  end
  ret
end

def my_select(arr, &block)
    ret = []
    arr.each do |ele|
        if block.call(ele)
            ret.push(ele)
        end
    end
    ret
end


def my_count(arr, &block)
  count = 0
  arr.each do |el|
    if block.call(el) 
      count += 1
    end
  end
 count 
end


def my_any?(arr, &block)
    arr.each do |el|
        if block.call(el)
            return true
        end
    end
    false
end

def my_all?(arr, &block)
  arr.each do |el|
    if !block.call(el)
      return false
    end
  end
  true
end


def my_none?(arr, &block)
    arr.each do |el|
      if block.call(el)
      return false
    end
  end
  true  
end