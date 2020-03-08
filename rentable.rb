module Rentable 

  def change_info(new_info)
		 if new_info.key?(:rentable)
            new_info[:rentable]
        else
            self
        end

    end
		
	def price
		raise NotImplementedError, "The #{self.class} class should implement: price"
	end

	def weight
		raise NotImplementedError, "The #{self.class} class should implement: weight"
	end
	
	def to_s
		"#{self.class} with model #{class_description}"
	end
      
	def class_description
		raise NotImplementedError, "The #{self.class} class should implement: class_description"
	end
	
end