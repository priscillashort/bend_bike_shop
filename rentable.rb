module Rentable 

  def change_info(new_info)
		return new_info[:rentable] if new_info.key?(:rentable) else self
	end
		
	def price
		raise NotImplementedError, "The #{self.class} class should implement: price_for_each_model"
	end

	def weight
		raise NotImplementedError, "The #{self.class} class should implement: weight_for_each_model"
	end
      
end