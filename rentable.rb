module Rentable 

  def price
    price_for_each_model[self.model]
  end 
  
  def change_info(new_info)
    self.model = new_info[:model] if new_info.key?(:model)
    return self
	end
		
	def price_for_each_model
		raise NotImplementedError, "The #{self.class} class should implement: price_for_each_model"
	end

	def weight_for_each_model
		raise NotImplementedError, "The #{self.class} class should implement: weight_for_each_model"
	end

	def to_s
		"#{self.class} with model #{model}"
	end
      
end