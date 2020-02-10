# Bike

class Bike

  STANDARD_WEIGHT = 200 # lbs

  attr_accessor :id, :color, :price, :weight, :pannier

  def initialize(id, color, price, weight = STANDARD_WEIGHT)
    @id = id
    @color = color
    @price = price
    @weight = weight
    @pannier = Pannier.new
  end

  def add_cargo(item)
    self.pannier.add(item)
  end

  def remove_cargo(item)
    self.pannier.remove(item)
  end

  def pannier_remaining_capacity
    pannier.remaining_capacity
  end

end

class Pannier

  attr_accessor :capacity, :contents

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @contents = []
  end

  def add(item)
    self.contents << item
  end

  def remove(item)
    self.contents.remove(item)
  end

  def remaining_capacity
    self.capacity - self.contents.size
  end

end

class Rental

  def initialize(bike)
    @bike = bike
  end

end