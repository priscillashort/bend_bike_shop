module Rentable 

  def change_info(new_info)
    self.model = new_info[:model] if new_info.key?(:model)
    return self
	end
		
	def price
		raise NotImplementedError, "The #{self.class} class should implement: price_for_each_model"
	end

	def weight
		raise NotImplementedError, "The #{self.class} class should implement: weight_for_each_model"
	end
      
end