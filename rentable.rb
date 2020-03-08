module Rentable 

  def change_info(new_info)
		return new_info[:rentable] if new_info.key?(:rentable) else self
	end
		
	def price
		raise NotImplementedError, "The #{self.class} class should implement: price"
	end

	def weight
		raise NotImplementedError, "The #{self.class} class should implement: weight"
	end
			
	def class_description
		raise NotImplementedError, "The #{self.class} class should implement: class_description"
	end
     
end