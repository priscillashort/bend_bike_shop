require_relative "rentable"

class Bike 
  include Rentable

  attr_reader :weight, :model
  
  def initialize(weight,model)
    @weight = weight
    @model = model
  end
  
  def price_for_each_model
    {
      mountain: 20,
      road: 15,
      tricycle: 25
    }
  end

  def weight_for_each_model
    {
      mountain: 10,
      road: 7,
      tricycle: 12
    }
  end

end