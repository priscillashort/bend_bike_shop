
class ReturnBikeWorkFlow
  
  attr_accessor :rental_db

  def initialize(rental_db)
    @rental_db = rental_db
  end

  def run(date, return_time, rental)
    rental.calculate_late_fee(date,return_time)
    rental.charge_customer
    rental_db.remove_rental!(rental.confirmation_code)

  end

end
