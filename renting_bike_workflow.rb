require_relative "rental"

class BikeRentingWorkflow

  attr_accessor :customer, :time_frame, :model,:rental_database, :inventory

	def initialize(customer, time_frame, model ,rental_database,inventory)
	    @customer = customer
	    @time_frame = time_frame 
			@model = model
			@rental_database = rental_database
			@inventory = inventory
	end

	def run
		bike = inventory.get_item_from_inventory(model)
		rental = Rental.new(bike, self.customer, self.time_frame)
		rental_database.add_rental(
			Rental.new(bike, self.customer, self.time_frame)
		)
		rental
	end

end