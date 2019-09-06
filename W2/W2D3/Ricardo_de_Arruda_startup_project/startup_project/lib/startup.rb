require "employee"

class Startup
attr_reader :name, :funding, :salaries

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def employees
    @employees
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end

  def >(another_startup)
    self.funding > another_startup.funding
  end

  def hire(name, title)
    if !self.valid_title?(title)
      raise "Title is not valid."
    else
      @employees << Employee.new(name, title)
    end
    end

  def size
    @employees.count
  end

  def pay_employee(employee)
    payment = @salaries[employee.title]
    if self.funding > payment
      employee.pay(payment)
      @funding -= payment
    else
      raise "No enough funding."
    end
  end

  def payday
    @employees.each do |employee|
      self.pay_employee(employee)
    end
  end

  def average_salary
    total = 0
    @employees.each { |employee| total += salaries[employee.title] } 
    total / self.size
  end


    # restaurant workers : chef, manager, waiter, busser
    # salaries for each position: chef + manager + waiter + busser / 4
    # in our particular case --> how many employees in each position?
    # what each element inside @employees? -->  instance
  
    def close
        @employees = []
        @funding = 0
    end

    def acquire(new_startup)
        @funding += new_startup.funding 

        new_startup.salaries.each do |title, amt|
            @salaries[title] = amt if !@salaries.has_key?(title)
        end
        @employees = @employees + new_startup.employees
        new_startup.close
    end
end
