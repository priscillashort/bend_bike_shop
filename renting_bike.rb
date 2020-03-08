require_relative "renting_bike_workflow"
require_relative "customer"
require_relative "time_frame"
require_relative "model_config"

include RentalType

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

puts "What time do you want to end your rental?"
end_time = gets.chomp

rental_time = TimeFrame.new(start_date, end_date, start_time, end_time)

puts "What type of rental do you want?"
	rentable_type_config.keys.each_with_index do |k, i|
  puts "#{i + 1}. #{k}\n"
end
rental_type_slection = gets.chomp
rentable_type = rentable_type_config.keys[rental_type_slection.to_i - 1]
rentable_type_model_config = rentable_type_config[rentable_type]

puts "What model of #{rentable_type} do you want?"
rentable_type_model_config.keys.each_with_index do |k, i|
  puts "#{i + 1}. #{k}\n"
end
model_selection = gets.chomp
model_type = rentable_type_model_config.keys[model_selection.to_i - 1]
model = rentable_type_model_config[model_type]

rentable = model.new

bike_rental_workflow = BikeRentingWorkflow.new(customer, rental_time, rentable)

rental = bike_rental_workflow.run

puts "Rental information:"
puts rental.to_s
puts "Confirm rental, y or n?"
confirm = gets.chomp

if confirm == 'y'
    puts "Rental confirmed"
else
    puts "Rental cancelled"
end



