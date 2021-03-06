require_relative "renting_workflow"
require_relative "customer"
require_relative "time_frame"
require_relative "rentable"
require_relative "inventory"
require_relative "rental_database"
require_relative "rental_selection"

include RentalSelection

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

inventory = Inventory.fake
puts "Available Inventory:"
puts inventory
puts

puts "What type of rental do you want?"
print_rentable_types
rentable_selection = gets.chomp
selected_rentable_type = rentable_type(rentable_selection)

puts "What model of #{selected_rentable_type} do you want?"
print_model_types(selected_rentable_type)
model_selection = gets.chomp
selected_model_type = model_type(selected_rentable_type, model_selection)
selected_model = model(selected_rentable_type, selected_model_type)

rentable = selected_model.new

rental_workflow = RentingWorkflow.new(customer, rental_time, rentable, RentalDatabase.fake, inventory)

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



