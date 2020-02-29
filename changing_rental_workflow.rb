require_relative "rental"  

class ChangingRentalWorkflow

	attr_accessor :rental, :new_info

	def initialize(rental, new_info)
		@rental = rental
		@new_info = new_info
	end

	def run
		rental.change_rental_info(new_info)
	end

end