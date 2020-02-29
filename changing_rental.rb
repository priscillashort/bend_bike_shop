require_relative "changing_rental_workflow"
require_relative "rental"
require_relative "customer"
require_relative "time_frame"
require_relative "bike"

bikes = [nil, Rental.new(Bike.new(5,:mountain), Customer.new("Joe","Shmow","JoeTheShmow@fake.com",1234567890,555444333),
  TimeFrame.new("02/18/20","02/18/20","11:30AM","3:45PM")),
Rental.new(  Bike.new(10,:road), Customer.new("Moe","Shmow","MoeTheShmow@fake.com",1234567890,555444333),
  TimeFrame.new("02/18/20","02/20/20","1:00AM","10:30AM")),
Rental.new(  Bike.new(15,:tricycle), Customer.new("Poe","Shmow","PoeTheShmow@fake.com",1234567890,555444333),
  TimeFrame.new("02/18/20","02/19/20","12:15PM","4:00PM"))]

puts "Enter Confirmation Code: "
confirmation_code = gets.to_i

rental_match = bikes[confirmation_code - 1]

puts "Rental information: "
puts rental_match.to_s

puts "How would you like to change your rental?"

new_info = {}

begin
  puts "1: Change Customer Information"
  puts "2: Change Bike Information"
  puts "3: Change Time Information"
  puts "4: Finished"
  

  
  info_to_change = gets.to_i
  
  
  if info_to_change != 4
    case info_to_change
    when 1
      puts "What Would You Like to Change: "
      puts "1: First Name"
      puts "2: Last Name"
      puts "3: Email Address"
      customer_info_to_change = gets.to_i
    
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
    
    when 2
      puts "What Bike Model Would You Like to Rent?"
      puts "1: Mountain Bike"
      puts "2: Road Bike"
      puts "3: Tricycle"
      bike_info_to_change = gets.to_i
    
      case bike_info_to_change
      when 1
        new_info[:model] = :mountain
        puts "Bike Model Updated to Mountain Bike!"
      when 2
        new_info[:model] = :road
        puts "Bike Model Updated to Road Bike!"
      when 3
        new_info[:model] = :tricycle
        puts "Bike Model Updated to Tricycle Bike!"
      else
        puts "Option Not Available"
      end
    
    when 3
      puts "What Scheduling Information Would You Like To Change:"
      puts "1: Start Date"
      puts "2: End Date"
      puts "3: Start Time"
      puts "4: End Time"
      time_frame_info_to_change = gets.to_i
    
      case time_frame_info_to_change
      when 1
        puts "Enter New Start Date (XX/XX/XX): "
        new_info[:start_date] = gets.chomp
      when 2
        puts "Enter New End Date (XX/XX/XX): "
        new_info[:end_date] = gets.chomp
      when 3
        puts "Enter New Start Time (XX:XXAM or XX:XXPM): "
        new_info[:start_time] = gets.chomp
      when 4
        puts "Enter New End Time (XX:XXAM or XX:XXPM): "
        new_info[:end_time] = gets.chomp
      else
        puts "Option Not Available"
    
      end
      
    else
      puts "Option Not Available"
    
    end
  
  end

end while info_to_change != 4

changing_rental_workflow = ChangingRentalWorkflow.new(rental_match, new_info)

rental = changing_rental_workflow.run

puts rental.to_s