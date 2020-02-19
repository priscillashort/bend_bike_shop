require_relative "Rental"

class BikeRentingWorkflow

  attr_accessor :customer, :time_frame, :bike 

	def initialize(customer, time_frame, bike)
    @customer = customer
    @time_frame = time_frame 
    @bike = bike
	end

	def run
	  rental = Rental.new(self.customer, self.time_frame, self.bike)
	end

end