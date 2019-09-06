def hipsterfy(word)
    (word.length - 1).downto(0).each do |i|
        if "aeiou".include?(word[i])
            word[i] = ""
            break
        end
    end
    word        

end

def vowel_counts(str)
    hash = Hash.new(0)
    str.downcase.each_char do |char|
        if "aeiou".include?(char)
            hash[char] += 1
        end
    end
    hash
end

def caesar_cipher(str, num)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    answer = ""
    str.each_char do |char|
        if alpha.include?(char)
            answer += alpha[(alpha.index(char) + num) % alpha.length]
        else
            answer += char
        end
    end
    answer
end