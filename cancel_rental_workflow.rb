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

    self.rental_database.cancelable_rentals.each{|r|puts "#{r}"}

  	print "select confirmation code:"
		rental = rental_database.get_rental(gets().to_i)
		
    puts "you have selected #{rental}"

  	puts "Are you sure you want to cancel this rental?"
		puts "Confirm cancelation, y or n?"
		confirm = gets.chomp

		if confirm == 'y'
      puts "Cancelation confirmed"
      rental_database.remove_rental!(rental.confirmation_code)
		else
    	puts "Cancelation cancelled"
    end
    
    #Should remove the rental from the list of rentals
    puts "\n remaining rentals:"
    puts rental_database.rentals

  end

end
