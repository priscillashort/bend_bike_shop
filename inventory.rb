require_relative 'bike'
require_relative 'kayak'

class Inventory 

  attr_reader :items

  def initialize(items=[])
    @items = items
  end

  def to_s 
    "Inventory with items: #{items.map{|i|i.to_s}}"
  end

  def self.fake
    Inventory.new(
      [
        Bike.new(10,:road),
        Bike.new(12,:mountain),
        Bike.new(5,:mountain),
        Kayak.new(12,:flatwater),
        Kayak.new(20,:whitewater)
      ]
    )
  end

  def add_item(item)
    items << item
  end

  def get_item_from_inventory(model)
    items.each do |item|
      if item.model == model
        items.delete(item)
        return item
      end
    end
    puts "model is not avaible"
  end

end