class AddRentableToInventoryWorkflow

  attr_reader :inventory
  
  def initialize(inventory)
    @inventory = inventory
  end
end