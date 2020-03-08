require_relative 'rental_selection'

class AddRentableToInventoryWorkflow

  include RentalSelection

  attr_reader :inventory

  def initialize(inventory)
    @inventory = inventory
  end

  def run

    begin 

      puts "Enter what kind of item you want to add:"
      print_rentable_types
      rentable_selection = gets.chomp
      selected_rentable_type = rentable_type(rentable_selection)
    
      puts "Enter the model of #{selected_rentable_type} you want to add:"
      print_model_types(selected_rentable_type)
      model_selection = gets.chomp
      selected_model_type = model_type(selected_rentable_type, model_selection)
      selected_model = model(selected_rentable_type, selected_model_type)
    
      rentable = selected_model.new
      inventory.add_item(rentable)
  
    rescue  
      puts "invaild item type!" 
    else
      puts "successful entry!" 
    end 

  end

end