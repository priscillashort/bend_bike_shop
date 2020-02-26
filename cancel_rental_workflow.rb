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
		conf_code = gets().to_i
		rental = self.rental_database.rentals.select{|r|r.confirmation_code == conf_code}.first
		
    puts "you have selected #{rental}"

  	puts "Are you sure you want to cancel this rental?"
		puts "Confirm cancelation, y or n?"
		confirm = gets.chomp

		if confirm == 'y'
    	puts "Cancelation confirmed"
		else
    	puts "Cancelation cancelled"
    end
    
    #Should remove the rental from the list of rentals

  end

end
