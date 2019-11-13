class Customer
  attr_reader :budget, :rented_bike, :rental_time

  def initialize
    @budget
    @rented_bike = []
    @rental_time
  end

end

class DockingStation
  attr_reader :bike_rack, :max_bikes, :existing_bikes

  def initialize
    @bike_rack = [Bike.new]
    @max_bikes = 10
    @existing_bikes = @bike_rack.length
  end

end

class Bike
  attr_reader :working, :health, :in_use
  def initialize
    @working = true
    @health = 10
    @in_use = false
  end
end

class Staff
end