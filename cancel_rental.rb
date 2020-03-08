require_relative "cancel_rental_workflow"
require_relative "rental_database"
require_relative "inventory"

rental_database = RentalDatabase.fake
inventory = Inventory.fake

cancel_rental_workflow = CancelRentalWorkFlow.new(rental_database, inventory)

puts "Which rental would you like to cancel?"
puts rental_database.rentals

print "select confirmation code:"
confirmation_code = gets.to_i
rental = rental_database.get_rental(confirmation_code)
	
puts "\nyou have selected #{rental}"
puts "Are you sure you want to cancel this rental?"
puts "Confirm cancelation, y or n?"
confirm = gets.chomp

if confirm == 'y'
	puts "Cancelation confirmed"
	cancel_rental_workflow.run(rental_database, confirmation_code)
else
	puts "Cancelation cancelled"
end



puts "remaining rentals:"
puts rental_database.rentals