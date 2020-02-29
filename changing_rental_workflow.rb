require_relative "rental"  

class ChangingRentalWorkflow

	attr_accessor :rental, :new_info

	def intialize(rental,new_info)
		@rental = rental
		@new_info = new_info
	end

	def run
		self.rental.change_rental_info(self.new_info)
	end

end