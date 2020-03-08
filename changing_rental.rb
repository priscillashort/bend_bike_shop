require_relative "changing_rental_workflow"
require_relative "rental"
require_relative "customer"
require_relative "time_frame"
require_relative "rental_database"
require_relative "rental_selection"

include RentalSelection

rental_db = RentalDatabase.fake

puts rental_db.rentals

puts "Enter the Confirmation Code of the rental you want to change: "
confirmation_code = gets.to_i

rental_match = rental_db.get_rental(confirmation_code)

puts "Rental information: "
puts rental_match.to_s

puts "How would you like to change your rental?"

new_info = {}

begin
  puts "1: Change Customer Information"
  puts "2: Change Rental Type Information"
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
      puts "What type of rental do you want?"
      print_rentable_types
      rentable_selection = gets.chomp
      selected_rentable_type = rentable_type(rentable_selection)
  
      puts "What model of #{selected_rentable_type} do you want?"
      print_model_types(selected_rentable_type)
      model_selection = gets.chomp
      selected_model_type = model_type(selected_rentable_type, model_selection)
      selected_model = model(selected_rentable_type, selected_model_type)
  
      new_info[:rentable] = selected_model.new

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