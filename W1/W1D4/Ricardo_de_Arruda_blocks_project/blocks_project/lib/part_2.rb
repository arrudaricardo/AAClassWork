def all_words_capitalized?(arr)
    arr.all? { |word| word.capitalize == word}
end

def no_valid_url?(arr)

    arr.none? do |u|
     u.end_with?('.com', '.net', '.io', '.org') 
    end
end

def any_passing_students?(arr)
    arr.any? do |ele|
        (ele[:grades].sum / ele[:grades].size.to_f) > 75
    end
end