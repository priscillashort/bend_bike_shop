require_relative "rental_database"

class CancelRentalWorkFlow
  
  attr_accessor :inventory, :rental_database

  def initialize(rental_database,inventory)
    @rental_database = rental_database
    @inventory = inventory
  end

  def run(rental_database, confirmation_code)
    rental_database.remove_rental!(confirmation_code)

  end

end
