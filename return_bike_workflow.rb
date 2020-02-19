require_relative "bike"
require_relative "customer"
require_relative "rental"
require_relative "time_frame"

rentals = [
  Rental.new(
    Bike.new(5,:mnt_bike),
    Customer.new("Joe","Shmow","JoeTheShmow@fake.com",1234567890,555444333),
    TimeFrame.new("02/18/20","02/18/20","11:30AM","3:45PM")
  ),
  Rental.new(
    Bike.new(10,:road_bike),
    Customer.new("Moe","Shmow","MoeTheShmow@fake.com",1234567890,555444333),
    TimeFrame.new("02/18/20","02/20/20","1:00AM","10:30AM")
  ),
  Rental.new(
    Bike.new(15,:tricycle),
    Customer.new("Poe","Shmow","PoeTheShmow@fake.com",1234567890,555444333),
    TimeFrame.new("02/18/20","02/19/20","12:15PM","4:00PM")
  )
]


puts "Which rental would you like to return?"
rentals.each.with_index{|r,i|puts "#{i}.#{r}"}
print "select rental numb:"
rental = rentals[gets().to_i]
puts "you have selected #{rental}"
puts "What time did they return it?"
print "Enter time:"
rental.calculate_late_fee(gets)
puts "#{rental.customer} was charged #{rental.late_fee} in late fees"