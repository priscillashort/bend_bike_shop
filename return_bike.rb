require_relative "return_bike_workflow"
require_relative "rental_database"
require_relative "inventory"

rental_database = RentalDatabase.fake
inventory = Inventory.fake

workflow = ReturnBikeWorkFlow.new(rental_database,inventory)

workflow.run