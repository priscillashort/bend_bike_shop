class Bike 

  attr_reader :weight, :model, :price_for_each_model
  
  def initialize(weight,model)
    @weight = weight
    @model = model
    @price_for_each_model = {
      mountain: 20,
      road: 15,
      tricycle: 25
    }
  end
  
  def price
    self.price_for_each_model[self.model]
  end 
    
end