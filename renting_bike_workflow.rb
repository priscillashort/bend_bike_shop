require_relative "customer"
require_relative "time_frame"
require_relative "bike"

class BikeRentingWorkflow

	def initialize

	end


	def run
		puts "What is your first name? "
		first_name = gets.chomp

		puts "What is your last name? "
		last_name = gets.chomp

		customer = Customer.new(first_name, last_name)

		puts "What date do you want to start your rental?"
		start_date = gets.chomp

		puts "What date do you want to end your rental?"
		end_date = gets.chomp

		puts "What time do you want to start your rental?"
		start_time = gets.chomp

		puts "What time do you want to end yoor rental?"
		end_time = gets.chomp

		rental_time = TimeFrame.new(start_date, end_date, start_time, end_time)

		puts "What model of bike do you want?"
		bike_model = gets.chomp

		rental_bike = Bike.new(1, bike_model, 50)

		puts "You've selected a bike rental for #{first_name} #{last_name}"
		puts "Rental of model #{bike_model}"
		puts "Starts on #{start_date} at #{start_time} and ends on #{end_date} at #{end_time}"
		puts "Confirm rental, y or n?"
		confirm = gets.chomp

	end

end