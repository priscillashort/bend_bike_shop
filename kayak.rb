require_relative "rentable"

class Kayak 
  include Rentable

  attr_reader :weight, :model
  
  def initialize(weight,model)
    @weight = weight
    @model = model
  end
  
  def price_for_each_model
    {
      flatwater: 20,
      whitewater: 15
    }
  end

  def weight_for_each_model
    {
      flatwater: 10,
      whitewater: 7
    }
  end
    
end