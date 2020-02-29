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

    @weight_for_each_model = {
      mountain: 10,
      road: 7,
      tricycle: 12
    }

  end
  
  def price
    self.price_for_each_model[self.model]
  end 

  def change_info(new_info)
    @model = new_info[:model] if new_info.key?(:model)
  end
    
end