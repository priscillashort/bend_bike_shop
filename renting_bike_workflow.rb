require "customer"

class BikeRentingWorkflow

	def initialize

	end


	def run
		puts "What is your first name? "
		first_name = gets

		puts "What is your last name? "
		last_name = gets

		customer = Customer.new(first_name, last_name)
	end

end