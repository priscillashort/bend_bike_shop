require_relative "bike"
require_relative "customer"
require_relative "rental"
require_relative "time_frame"


class ReturnBikeWorkFlow
  
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
    puts "Which rental would you like to return?"
    self.rentals.each.with_index{|r,i|puts "#{i}.#{r}"}

    print "select rental numb:"
    rental = self.rentals[gets().to_i]
    puts "you have selected #{rental}"

    puts "What time did they return it?"
    print "Enter time (ex: 3:45PM, 8:15AM): "
    rental.calculate_late_fee(gets)
    puts "#{rental.customer} has $#{rental.late_fee} in late fees"

    print "Enter a description of the condition of the bike(s): "
    condition_description = gets

    rental.charge_customer
    puts "Total price: #{rental.bike.price}"
    puts "Including $#{rental.late_fee} in late fees" if rental.is_late
    puts "#{rental.customer}'s was charged on card with number: #{rental.payment_info}"
  end

end

workflow = ReturnBikeWorkFlow.new()
workflow.run()