require_relative "return_rental_workflow"
require_relative "rental_database"

rental_db = RentalDatabase.fake

workflow = ReturnRentalWorkFlow.new(rental_db)

puts "Which rental would you like to return?"
puts rental_db.rentals

print "\nselect rental confirmation number:"
rental = rental_db.get_rental(gets.to_i)
puts "\nyou have selected #{rental}"

puts "\nWhat time did they return it?"
print "Enter time (ex: 3:45PM, 8:15AM): "
return_time = gets
print "Enter date (ex: mm/dd/yy, 02/28/20): "
date = gets

print "\nEnter a description of the condition of the rentable(s): "
condition_description = gets

workflow.run(date, return_time, rental)
puts "\n#{rental.customer} has $#{rental.late_fee} in late fees"
puts "Total price: $#{rental.rentable.price}"
puts "Including $#{rental.late_fee} in late fees" if rental.is_late
puts "#{rental.customer}'s was charged on card with number: #{rental.payment_info}"

