def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    sum = arr.inject do |acc, el|
        (acc + el)
    end

    sum/(arr.length + 0.0)
end

def repeat(str, num)
    str * num 
end


def yell(str)
    str.upcase + "!"
end


def alternating_case(str)
    answer = []
    str.split(" ").each_with_index do |word, idx|
        if idx.even?
            answer << word.upcase
        else
            answer << word.downcase
        end
    end
    answer.join(" ")
end
