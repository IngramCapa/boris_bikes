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

  def initialize(max_bikes = 10)
    @bike_rack = [Bike.new]
    @max_bikes = max_bikes
    @existing_bikes = @bike_rack.length
  end

end

class Bike
  attr_accessor :working, :health, :in_use
  def initialize
    @working = true
    @health = 10
    @in_use = false
  end

  def broken?
    @health > 4 ? false : true
  end
end

class Staff
end