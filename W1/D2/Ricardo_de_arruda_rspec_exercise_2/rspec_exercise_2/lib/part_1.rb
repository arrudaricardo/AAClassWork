def partition(arr, int)
    s1, s2 = [], []
    arr.each do |el|
        if el < int
            s1 << el
        else
            s2 << el
        end
    end
    [s1, s2]

end

def merge(hash1, hash2)
    answer = Hash.new
    hash2.each { |k, v| answer[k] = v }
    hash1.each do |k, v|
        if !answer.has_key?(k)
            answer[k] = v
        end
    end
    answer

end

def censor(str, arr)
    arr2 = str.split
    arr2.each do |word|
        arr.each do |curse|
            if word.downcase == curse.downcase
                word.gsub!(/[aeiouAEIOU]/, '*')
            end
        end
    end 
    arr2.join(" ")
end

def power_of_two?(num)
    answer = []
    num.times { |i| answer << 2 ** i}
    answer.include?(num)
end