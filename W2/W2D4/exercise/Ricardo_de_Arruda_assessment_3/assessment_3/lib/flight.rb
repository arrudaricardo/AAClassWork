class Flight

attr_reader :passengers

  def initialize(string, capacity)
    @flight_number = string
    @capacity = capacity
    @passengers = []
  end

  def full?
    if @passengers.length == @capacity
      return true
    else
      return false
    end
  end

  def board_passenger(passenger_inst)
    if passenger_inst.has_flight?(@flight_number) && !self.full?
      @passengers << passenger_inst
    end
  end

  def list_passengers
    @passengers.map do |el|
     el.name 
    end
  end

  def [](index)
   @passengers[index]
  end

  def <<(passenger_instance)
   self.board_passenger(passenger_instance)
  end

end
