# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
   def span
    return nil if self.empty? else self.max - self.min 
   end

   def average
    return nil if self.empty? else self.sum.to_f / self.length.to_f 
   end

   def median
    if self.empty?
      nil
      elsif self.length.odd?
        self.sort!
        self[self.length / 2]
      else
        self.sort!  
       (self[self.length/2] + self[self.length/2 - 1 ]) / 2.0
      end
   end

   def counts
    count = Hash.new(0)
    self.each do |el|
      count[el] += 1
    end
  count
   end

end
class Array
    def my_count(*n)
      count = 0
        self.each { |el| count += 1 if n.include?(el) }
      count
    end

    def my_index(*n)
    self.find.with_index { |el, i| return i if n.include?(el)}
    end

    def my_uniq
      res = []

      self.each { |el| res.push(el) if !res.include?(el) }

      res
    end

    def my_transpose
    res = []
        (0...self.length).each do |i1|
            temp = []
            (0...self.length).each do |i2|
                temp.push(self[i2][i1])
            end
            res.push(temp)
        end
      
        res
    end
end
