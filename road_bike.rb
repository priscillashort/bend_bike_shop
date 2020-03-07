require_relative "bike"

class RoadBike < Bike
  #attr_reader :weight, :model
  
  #def initialize(weight, model)
  #  @weight = weight
  #  @model = model
  #end
  
  def price
    15
  end

  def weight
    7
  end

end