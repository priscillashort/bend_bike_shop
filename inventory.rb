class Inventory 

  attr_reader :items

  def initialize(items=[])
    @items = items
  end

  def add_item(item)
    items << item
  end

  def get_item_from_inventory(model):
    items.each do |item|
      if item.model == model
        items.delete(item)
        return item
      end
    end
  end
  
end