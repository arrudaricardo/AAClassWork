class Employee
  attr_accessor :name, :title, :salary, :boss # not all should be accesible
  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier) 
    @salary * multiplier
  end

  # boss instance method
  
end