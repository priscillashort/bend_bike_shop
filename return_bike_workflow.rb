
class ReturnBikeWorkFlow
  
  attr_accessor :rental_db

  def initialize(rental_db)
    @rental_db = rental_db
  end

  def run
    puts "Which rental would you like to return?"
    puts rental_db.rentals

    print "\nselect rental confirmation number:"
    rental = rental_db.get_rental(gets.to_i)
    puts "\nyou have selected #{rental}"

    puts "\nWhat time did they return it?"
    print "Enter time (ex: 3:45PM, 8:15AM): "
    return_time = gets
    print "Enter date (ex: mm/dd/yy, 02/28/20): "
    rental.calculate_late_fee(gets,return_time)
    puts "\n#{rental.customer} has $#{rental.late_fee} in late fees"

    print "\nEnter a description of the condition of the returned item(s): "
    condition_description = gets

    rental.charge_customer
    puts "\nTotal price: #{rental.rentable.price}"
    puts "Including $#{rental.late_fee} in late fees" if rental.is_late
    puts "#{rental.customer}'s was charged on card with number: #{rental.payment_info}"

    rental_db.remove_rental!(rental.confirmation_code)

  end

end
