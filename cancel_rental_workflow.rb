require_relative "bike"
require_relative "customer"
require_relative "rental"
require_relative "time_frame"


class CancelBikeWorkFlow
  
  attr_accessor :rentals

  def initialize
    @rentals = [
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
  end

  def run
    puts "Which rental would you like to cancel?"
    self.rentals.each.with_index{|r,i|puts "#{i}.#{r}"}

  	print "select rental numb:"
  	rental = self.rentals[gets().to_i]
  	puts "you have selected #{rental} #{rental.confirmation_code}"

  	puts "Are you sure you want to cancel this rental?"
		puts "Confirm cancelation, y or n?"
		confirm = gets.chomp

		if confirm == 'y'
    	puts "Cancelation confirmed"
		else
    	puts "Cancelation cancelled"
		end

  end

end
