# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    new_str = ""
 # aaabbc
    base = 1
    ch = str[0]

    (1..str.length).each do |i|
        if str[i] == ch
            base += 1
        else 
          if base > 1
              temp = base
          else
            temp = ""
          end
            new_str += temp.to_s + ch
            base = 1
            ch = str[i]
        end
    end

    new_str
  end
        

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
