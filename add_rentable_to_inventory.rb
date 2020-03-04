require_relative 'add_rentable_to_inventory_workflow'
require_relative 'inventory'

workflow = AddRentableToInventoryWorkflow.new(Inventory.fake)
workflow.run