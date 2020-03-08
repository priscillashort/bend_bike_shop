require_relative "renting_workflow"
require_relative "customer"
require_relative "time_frame"
require_relative "rentable"

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

puts "What model of bike or kayak do you want?"
rentable_model = gets.chomp

rental_model = Rentable.new(50, rentable_model)

rental_workflow = RentingWorkflow.new(customer, rental_time, rental_model)

rental = rental_workflow.run

puts "Rental information:"
puts rental.to_s
puts "Confirm rental, y or n?"
confirm = gets.chomp

if confirm == 'y'
    puts "Rental confirmed"
else
    puts "Rental cancelled"
end



