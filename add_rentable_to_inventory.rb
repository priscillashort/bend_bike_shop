require_relative 'add_rentable_to_inventory_workflow'
require_relative 'inventory'

workflow = AddRentableToInventoryWorkflow.new(Inventory.fake)
puts "inventory piror to workflow:\n#{workflow.inventory}\n\n"
workflow.run
puts "\ninventory after workflow:\n#{workflow.inventory}"