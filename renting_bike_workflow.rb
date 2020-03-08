require_relative "rental"

class BikeRentingWorkflow

  attr_accessor :customer, :time_frame, :rentable 

	def initialize(customer, time_frame, rentable)
	    @customer = customer
	    @time_frame = time_frame 
	    @rentable = rentable
	end

	def run
	  rental = Rental.new(self.rentable, self.customer, self.time_frame)
	end

end