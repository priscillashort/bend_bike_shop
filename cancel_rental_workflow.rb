require_relative "rental_database"


class CancelBikeWorkFlow
  
  attr_accessor :rentals, :rental_database

  def initialize(rental_database)
    @rental_database = rental_database
  end

  def run(rental_database, confirmation_code)
    rental_database.remove_rental!(confirmation_code)
  end

end
