class AddRentableToInventoryWorkflow

  attr_reader :inventory

  def initialize(inventory)
    @inventory = inventory
  end

  def run
    puts "Enter what kind of item you want to add:\n1.Bike\n2.Kayak"
    rentable_type = gets
    puts "enter the model:"
    if rentable_type == 1
      inventory.add(
        Bike.new(3,gets)
      )
    elsif rentable_type == 2
      inventory.add(
        Bike.new(3,gets)
      )
    else
      puts "invaild item type!"
    end
  end

end