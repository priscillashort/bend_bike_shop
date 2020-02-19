require_relative "customer"
require_relative "time_frame"

class BikeRentingWorkflow

	def initialize

	end


	def run
		puts "What is your first name? "
		first_name = gets

		puts "What is your last name? "
		last_name = gets

		customer = Customer.new(first_name, last_name)

		puts "What date do you want to start your rental?"
		start_date = gets

		puts "What date do you want to end your rental?"
		end_date = gets

		puts "What time do you want to start your rental?"
		start_time = gets

		puts "What time do you want to end yoor rental?"
		end_time = gets

		rental_time = TimeFrame.new(start_date, end_date, start_time, end_time)


	end

end