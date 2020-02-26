require_relative "renting_bike_workflow"
require_relative "customer"
require_relative "time_frame"
require_relative "bike"

bikes = [nil, Rental.new(
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
)]

puts "Enter Confirmation Code: "
confirmation_code = gets.chomp

rental_match = bikes[confirmation_code]

puts "Rental information:"
puts rental_match.to_s

