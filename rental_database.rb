require_relative "bike"
require_relative "kayak"
require_relative "customer"
require_relative "rental"
require_relative "time_frame"

class RentalDatabase

	attr_reader :rentals

	def initialize(rentals)
		@rentals = rentals
	end

	def self.fake
		RentalDatabase.new(
			[
      Rental.new(
        Bike.new(5,:mountain),
        Customer.new("Joe","Shmow","JoeTheShmow@fake.com",1234567890,555444333),
        TimeFrame.new("02/27/20","02/27/20","11:30AM","3:45PM")
      ),
      Rental.new(
        Bike.new(10,:road),
        Customer.new("Moe","Shmow","MoeTheShmow@fake.com",1234567890,555444333),
        TimeFrame.new("03/10/20","03/20/20","4:00PM","10:30AM")
      ),
			Rental.new(
        Kayak.new(7,:whitewater),
        Customer.new("Poe","Shmow","PoeTheShmow@fake.com",1234567890,555444333),
        TimeFrame.new("02/29/20","03/01/20","12:15PM","4:00PM")
      ),
      Rental.new(
        Bike.new(15,:tricycle),
        Customer.new("Poe","Shmow","PoeTheShmow@fake.com",1234567890,555444333),
        TimeFrame.new("02/27/20","03/19/20","12:15PM","4:00PM")
			),
			Rental.new(
        Bike.new(15,:road),
        Customer.new("Poe","Shmow","PoeTheShmow@fake.com",1234567890,555444333),
        TimeFrame.new("03/1/20","03/2/20","12:15PM","4:00PM")
			),
			Rental.new(
        Bike.new(15,:mountain),
        Customer.new("Poe","Shmow","PoeTheShmow@fake.com",1234567890,555444333),
        TimeFrame.new("02/29/20","03/01/20","12:15PM","4:00PM")
      ),
			Rental.new(
        Kayak.new(10,:flatwater),
        Customer.new("Poe","Shmow","PoeTheShmow@fake.com",1234567890,555444333),
        TimeFrame.new("02/29/20","03/01/20","12:15PM","4:00PM")
      )
    	]
		)
  end
  
  def add_rental(rental)
    rentals << rental
  end


	def get_rental(conf_code)
		rentals.each{|r| return r if r.confirmation_code==conf_code}
	end

	def cancelable_rentals
		rentals.select{|r| r.cancelable?}
	end

  def remove_rental!(conf_code)
		rentals.reject!{|r|r.confirmation_code == conf_code}
  end
  

end
