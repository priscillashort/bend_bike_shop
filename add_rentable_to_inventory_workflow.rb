class AddRentableToInventoryWorkflow

  attr_reader :inventory

  def initialize(inventory)
    @inventory = inventory
  end

  def run
    puts "Enter what kind of item you want to add:\nBike\nKayak"
    rentable_type = gets
    puts "enter the model:"
    if rentable_type.downcase.strip == 'bike'
      inventory.add_item(Bike.new(3,gets))
    elsif rentable_type.downcase.strip == 'kayak'
      inventory.add_item(Kayak.new(6,gets))
    else
      puts "invaild item type!"
    end
    puts inventory.items
  end

end