require_relative("employee.rb")

class Manager < Employee
  attr_accessor :employees # Quick Fix
  def initialize(employees, name, title, salary, boss)
    @employees = employees
    # super # please work
    super(name, title, salary, boss)
  end

  def bonus(multiplier) 
    total_salary = employees.map(&:salary).sum
    total_salary * multiplier
  end

end


ned = Manager.new([], "Ned", "Founder", 10**6, nil)
darren = Manager.new([], "Darren", "Manager", 78_000, ned) 
david = Employee.new("David", "TA", 10 ^ 4, darren)
shawna = Employee.new("Shawna", "TA", 12 * 10 ^ 3, darren)
ned.employees = [david, shawna]
darren.employees = [darren]

p ned.bonus(5) #== 500_000
p darren.bonus(4) == 88_000
p david.bonus(3) == 30_000