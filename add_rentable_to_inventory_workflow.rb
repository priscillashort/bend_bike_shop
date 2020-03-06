class AddRentableToInventoryWorkflow

  attr_reader :inventory

  def initialize(inventory)
    @inventory = inventory
  end

  def run
    puts "Enter what kind of item you want to add:\nBike\nKayak"
    rentable_type = gets.downcase.strip
    puts "enter weight:"
    weight = gets.to_i
    puts "enter the model:"
    if rentable_type == 'bike'
      inventory.add_item(Bike.new(weight,gets.strip))
      puts "successful entry!"
    elsif rentable_type == 'kayak'
      inventory.add_item(Kayak.new(weight,gets.strip))
      puts "successful entry!"
    else
      puts "invaild item type!"
    end
  end

end