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
confirmation_code = (gets.chomp).to_i

rental_match = bikes[confirmation_code]

puts "Rental information: "
puts rental_match.to_s

puts "How would you like to change your rental?"

puts "1: Change Customer Information"
#puts "2: Change Bike Information"
#puts "3: Change Time Information"
info_to_change = (gets.chomp).to_i

new_info = {}

case info_to_change
when 1
  puts "What Would You Like to Change: "
  puts "1: First Name"
  puts "2: Last Name"
  puts "3: Email Address"
  customer_info_to_change = (gets.chomp).to_i

  case customer_info_to_change  
  when 1
    puts "Enter New First Name: "
    new_info[:first_name] = gets.chomp
  when 2
    puts "Enter New Last Name: "
    new_info[:last_name] = gets.chomp
  when 3
    puts "Enter New Email Address: "
    new_info[:email] = gets.chomp
  else
    puts "Option Not Available"
  end
else
  puts "Option Not Available"
end

rental_match.change_customer_info(new_info)
rental_match.to_s