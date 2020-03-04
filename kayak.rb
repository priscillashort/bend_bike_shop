class Kayak 

  attr_reader :weight, :model, :price_for_each_model
  
  def initialize(weight,model)
    @weight = weight
    @model = model
    @price_for_each_model = {
      flatwater: 20,
      whitewater: 15
    }

    @weight_for_each_model = {
      flatwater: 10,
      whitewater: 7
    }

  end
  
  def price
    self.price_for_each_model[self.model]
  end 

  def change_info(new_info)
    @model = new_info[:model] if new_info.key?(:model)
    return self
  end
    
end