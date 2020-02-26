require_relative "bike"
require_relative "customer"
require_relative "rental"
require_relative "time_frame"
require_relative "rental_database"


class CancelBikeWorkFlow
  
  attr_accessor :rentals, :rental_database

  def initialize(rental_database)
    @rental_database = rental_database
  end

  def run
    puts "Which rental would you like to cancel?"

    puts rental_database.cancelable_rentals

  	print "select confirmation code:"
		rental = rental_database.get_rental(gets().to_i)
		
    puts "\nyou have selected #{rental}"

  	puts "\nAre you sure you want to cancel this rental?"
		puts "Confirm cancelation, y or n?"
		confirm = gets.chomp

		if confirm == 'y'
      puts "Cancelation confirmed"
      rental_database.remove_rental!(rental.confirmation_code)
		else
    	puts "Cancelation cancelled"
    end
    
    puts "\nremaining rentals:"
    puts rental_database.rentals

  end

end
