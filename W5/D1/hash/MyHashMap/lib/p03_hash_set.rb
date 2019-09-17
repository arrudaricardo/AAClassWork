class HashSet
  attr_reader :count
  

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(key)
    resize! if @count == @num_buckets
    unless self.include?(key)
      @count += 1
      self[key] << key 
    end
  end

  def include?(key)
    self[key].any? {|el| el == key}
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    @store[num.hash % @num_buckets] 
  end

  def num_buckets
    @store.length
  end

  def resize!
     @num_buckets *= 2
    new_store = Array.new(@num_buckets) { Array.new }
    @store.each do |bucket|
      bucket.each do |key|
        new_store[key.hash % @num_buckets] << key
      end
    end
    @store = new_store
  end
end
