
class RentalDatabase

	def initialize(rentals)
		@rentals = rentals
	end

	def self.fake
		RentalDatabase.new(
			[
      Rental.new(
        Bike.new(5,:mountain),
        Customer.new("Joe","Shmow","JoeTheShmow@fake.com",1234567890,555444333),
        TimeFrame.new("02/18/20","02/18/20","11:30AM","3:45PM")
      ),
      Rental.new(
        Bike.new(10,:road),
        Customer.new("Moe","Shmow","MoeTheShmow@fake.com",1234567890,555444333),
        TimeFrame.new("02/18/20","02/20/20","1:00AM","10:30AM")
      ),
      Rental.new(
        Bike.new(15,:tricycle),
        Customer.new("Poe","Shmow","PoeTheShmow@fake.com",1234567890,555444333),
        TimeFrame.new("02/18/20","02/19/20","12:15PM","4:00PM")
      )
    	]
		)
	end

	def all_rentals
		@rentals
	end

	def cancelable_rentals
		@rentals.select{|r| r.cancelable}
	end

end
