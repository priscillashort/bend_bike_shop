require_relative "bike"

class Tricycle < Bike
  #attr_reader :weight, :model
  
  #def initialize(weight, model)
  #  @weight = weight
  #  @model = model
  #end
  
  def price
    25
  end

  def weight
    12
  end

end