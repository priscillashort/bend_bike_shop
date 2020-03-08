require_relative "rental"

class RentingWorkflow

attr_accessor :customer, :time_frame, :rentable, :rental_database, :inventory

	def initialize(customer, time_frame, rentable, rental_database, inventory)
	  @customer = customer
	  @time_frame = time_frame 
		@rentable = rentable
		@rental_database = rental_database
		@inventory = inventory
	end

	def run
	  @rentable = inventory.get_item_from_inventory(self.rentable)
		rental = Rental.new(self.rentable, self.customer, self.time_frame)
		rental_database.add_rental(rental)
		rental
	end

end