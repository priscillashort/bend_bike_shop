require_relative 'road_bike'
require_relative 'mountain_bike'
require_relative 'tricycle'
require_relative 'flatwater_kayak'
require_relative 'whitewater_kayak'

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
        RoadBike.new,
        MountainBike.new,
        MountainBike.new,
        FlatwaterKayak.new,
        WhitewaterKayak.new
      ]
    )
  end

  def add_item(item)
    items << item
  end

  def get_item_from_inventory(rentable)
    items.each do |item|
      if item.class == rentable.class
        items.delete(item)
        return item
      end
    end
    puts "model is not avaible"
  end

end