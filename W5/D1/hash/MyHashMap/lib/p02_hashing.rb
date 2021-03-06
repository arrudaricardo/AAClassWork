class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.each_with_index.inject(0) do |half, (el,i)|
      (el.hash + i.hash) ^ half
    end
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.sort.sort_by(&:hash).hash
  end
end
